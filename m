From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 20:06:55 +0100
Subject: [Buildroot] [PATCH v4 13/18] python2: generate reproducible .pyc
In-Reply-To: <20161123230539.4762ebcd@free-electrons.com>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-14-git-send-email-jezz@sysmic.org>
 <20161123230539.4762ebcd@free-electrons.com>
Message-ID: <7d9c3a88-ce81-fb52-9200-5380ad818f79@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-11-16 23:05, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 23 Nov 2016 13:58:52 +0100, J?r?me Pouiller wrote:
>> .pyc files contain modification time of .py source. In order to make
>> build reproducible, we fix modification time of all .py before to
>> compile .pyc files.
> 
> "before to compile" -> "before compiling".
> 
>> diff --git a/package/python/python.mk b/package/python/python.mk
>> index cc65376..c17b267 100644
>> --- a/package/python/python.mk
>> +++ b/package/python/python.mk
>> @@ -226,10 +226,18 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
>>  $(eval $(autotools-package))
>>  $(eval $(host-autotools-package))
>>  
>> +ifeq ($(BR2_REPRODUCIBLE),y)
>> +define PYTHON_FIX_TIME
>> +find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
>> +		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
>> +endef
>> +PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_FIX_TIME
>> +endif
>> +
>>  define PYTHON_CREATE_PYC_FILES
>>  	PYTHONPATH="$(PYTHON_PATH)" \
> 
> It would make more sense to just do:
> 
> 	$(PYTHON_FIX_TIME)
> 
> here, rather than registering it as a PYTHON_TARGET_FINALIZE_HOOKS.

 No. It iterates over all python files in $(TARGET_DIR), not just the ones
installed by this package, so it really should be a TARGET_FINALIZE_HOOK.


 Regards,
 Arnout



> Also, maybe it should be named PYTHON_SET_PY_FILES_TIME.
> 
>>  	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
>> -		support/scripts/pycompile.py \
>> +		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
> 
> Why do we need to force?
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
