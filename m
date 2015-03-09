From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Mar 2015 22:42:04 +0100
Subject: [Buildroot] [PATCH 1/2] target-finalize: generate all *.pyc
In-Reply-To: <20150309185405.5f312f1b@free-electrons.com>
References: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
 <20150309185405.5f312f1b@free-electrons.com>
Message-ID: <54FE13AC.6060208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/15 18:54, Thomas Petazzoni wrote:
> Dear Samuel Martin,
> 
> On Mon,  9 Mar 2015 17:24:23 +0100, Samuel Martin wrote:
>> This patch generates all *.pyc files from *.py located in
>> <target>/usr/python*/site-packages, before stripping the rootfs.
>>
>> This prevents modules from packages that do not compile the *.py
>> files from disappearing.
>>
>> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  Makefile | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index af043a3..ec0b923 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -564,6 +564,11 @@ $(TARGETS_ROOTFS): target-finalize
>>  
>>  target-finalize: $(TARGETS)
>>  	@$(call MESSAGE,"Finalizing target directory")
>> +ifneq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)

 It should also be conditional on !BR2_PACKAGE_PYTHON_PY_ONLY

>> +	PYTHONPATH="$(PYTHON_PATH)" \
>> +		$(HOST_DIR)/usr/bin/python -c "import compileall; \
>> +			compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages')"

 I believe the canonical way to call compileall from the command line is using
the -m option:

	$(HOST_DIR)/usr/bin/python -m compileall \
		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages

>> +endif
> 
> Why not, but then don't we want to do something in the Python package
> infra, and in the Python 2/3 packages themselves to avoid spending time
> biulding the .pyc files?

 compileall will check timestamps to avoid recompiling unnecessarily. So you
just have the tree walk to consider, which I think is a minor issue.


> Also, using TARGET_FINALIZE_HOOKS would be nicer. But there is the
> issue that the hook is the same between python and python3, so we
> wouldn't know where to put it.

 In fact, we already have a PYTHON_FINALIZE_TARGET (and similar for PYTHON3)
that does the removal of the .py files, so the compileall should be added there.
And that immediately handles the BR2_PACKAGE_PYTHON_PY_ONLY condition as well.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
