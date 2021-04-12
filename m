From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Apr 2021 22:22:36 +0200
Subject: [Buildroot] Missing .pyc files in target filesystem
In-Reply-To: <007101d72fd5$a67676c0$f3636440$@gmail.com>
References: <003801d72fcf$28780910$79681b30$@gmail.com>
 <c7681c66-e513-380e-cba3-8b9b2f6b98fa@mind.be>
 <007101d72fd5$a67676c0$f3636440$@gmail.com>
Message-ID: <de925ef6-7c7f-94ef-2c6f-57d40dcec656@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2021 21:54, swirsky at gmail.com wrote:
> Thanks, Arnout.  We were in fact using the symbols
> 
> BR2_PACKAGE_PYTHON3_PYC_ONLY
> BR2_PACKAGE_PYTHON3_PY_PYC

 Ah, too bad :-)


> 
> When I typed it into my email, I left off the 3. I checked my config. The
> last build I tried had
> 
> BR2_PACKAGE_PYTHON3_PYC_ONLY
> 
> And we got .py files in the target filesystem

 The code that generates the pyc files is the following:

define PYTHON3_CREATE_PYC_FILES
        $(PYTHON3_FIX_TIME)
        PYTHONPATH="$(PYTHON3_PATH)" \
        $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
                $(TOPDIR)/support/scripts/pycompile.py \
                $(if $(VERBOSE),--verbose) \
                --strip-root $(TARGET_DIR) \
                $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
endef

 So apparently pycompile doesn't find the .py files?

 You can try building with "make V=1" and see if pycompile reports anything.

 I've just tried the BR2_PACKAGE_PYTHON3_PYC_ONLY locally and I got only .pyc
(and .whl) files.

 It's really surprising you have .py files at all, because the following is also
there:

ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
define PYTHON3_REMOVE_PY_FILES
        find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' \
                $(if $(strip $(KEEP_PYTHON_PY_FILES)),-not \( $(call
finddirclauses,$(TARGET_DIR),$(KEEP_PYTHON_PY_FILES)) \) ) \
                -print0 | \
                xargs -0 --no-run-if-empty rm -f
endef
PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
endif


 Regards,
 Arnout


> 
> 
> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be> 
> Sent: Monday, April 12, 2021 12:50 PM
> To: swirsky at gmail.com; buildroot at busybox.net
> Subject: Re: [Buildroot] Missing .pyc files in target filesystem
> 
> 
> 
> On 12/04/2021 21:08, swirsky at gmail.com wrote:
>> We?re not getting python .pyc files for the Python packages in the 
>> target filesystem /usr/lib/python3.8/ and I can?t figure out why, 
>> despite several days of looking at this.
>>
>> ?
>>
>> We?re on Buildroot 2020.02.03 and I?ve tried both
>>
>> ?
>>
>> ??????? BR2_PACKAGE_PYTHON_PYC_ONLY=y
>>
>> ?
>>
>> ??????? BR2_PACKAGE_PYTHON_PY_PYC=y
>>
> 
>  How did you generate this config? The symbols are
> 
> BR2_PACKAGE_PYTHON3_PYC_ONLY
> BR2_PACKAGE_PYTHON3_PY_PYC
> 
> when you're using python3. Setting the python2 configuration will not affect
> python3 - and in fact, those python2 symbols should be removed when any
> kconfig target is run.
> 
> 
>  Regards,
>  Arnout
> 
>> ?
>>
>> in the config. I only see .py files.
>>
>> ?
>>
>> Any ideas on how to debug this? What?s the thing in buildroot that 
>> creates the .pyc files?
>>
>> ?
>>
>> Thanks!
>>
>> ?
>>
>> ?
>>
>> ?
>>
>> ?
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
