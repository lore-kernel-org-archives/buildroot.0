From: Abhishek Singh <abhishek.singh@imgtec.com>
Date: Wed, 16 Dec 2015 18:36:23 +0530
Subject: [Buildroot] [PATCH v2] cxxtest: new package
In-Reply-To: <20151214223655.GE4152@free.fr>
References: <1448546706-31297-1-git-send-email-Abhishek.Singh@imgtec.com>
 <20151214223655.GE4152@free.fr>
Message-ID: <567161CF.2060709@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,


On Tuesday 15 December 2015 04:06 AM, Yann E. MORIN wrote:
> Abhishek, All,
>
> Sorry for the delay, I'm now looking at your patch...
>
> On 2015-11-26 19:35 +0530, Abhishek Singh spake thusly:
>> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>> Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
>> Reviewed-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
>> Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
>> ---
>> changes v1 -> v2:
>> 	- remove dependency on host-python
>> 	- add comments in mk file
> [--SNIP--]
>> diff --git a/package/cxxtest/cxxtest.mk b/package/cxxtest/cxxtest.mk
>> new file mode 100644
>> index 0000000..cc29608
>> --- /dev/null
>> +++ b/package/cxxtest/cxxtest.mk
>> @@ -0,0 +1,30 @@
>> +################################################################################
>> +#
>> +# cxxtest
>> +#
>> +################################################################################
>> +
>> +CXXTEST_VERSION = 4.4
>> +CXXTEST_SOURCE = cxxtest-$(CXXTEST_VERSION).tar.gz
>> +CXXTEST_SITE = http://sourceforge.net/projects/cxxtest/files/cxxtest/$(CXXTEST_VERSION)
> SF.net is getting a bad reputation these days, and there is an official
> Github repository with the latest 4.4 release:
>      https://github.com/CxxTest/cxxtest
>
> Can we use Github instead?

Yes, I will change it.

>> +CXXTEST_LICENSE = LGPLv3
>> +CXXTEST_LICENSE_FILES = COPYING
>> +CXXTEST_INSTALL_STAGING = YES
>> +CXXTEST_INSTALL_TARGET = NO
>> +CXXTEST_DEPENDENCIES = host-cxxtest
>> +HOST_CXXTEST_SETUP_TYPE = setuptools
>> +HOST_CXXTEST_SUBDIR = python
>> +
>> +# Copy CxxTest header files to staging directory
>> +define CXXTEST_INSTALL_STAGING_CMDS
>> +	mkdir -p $(STAGING_DIR)/usr/include/cxxtest
>> +	cp $(@D)/cxxtest/* $(STAGING_DIR)/usr/include/cxxtest
>> +endef
>> +
>> +# CxxTest uses python infrastructure as the build system. cxxtestgen is
>> +# a script which is used to process header files to generate C++ source files.
>> +# Compiling test runner requires CxxTest header files which are installed in
>> +# the staging directory.
> OK, I think we need a bit more info about all tis, as I am not sure I
> understand. Let me try to reformulate from what I understood:
>
>    - cxxtest is made of twoo parts:
>      - a tool to parse header files (supposedly from a project)
>      - a set of header files
>
>    - the tool is built as a host package, so it can be used natively
>
>    - the headers set is installed in staging
>
> Then the use-case is for a user to use the csstest tool to parse his own
> headers, that will supposedly generate a test harness, which is then
> cross-compiled and run on the target. Right?
>
> Could you expand a bit on the explanations, please?
>
> Regards,
> Yann E. MORIN.

What you understood is correct. I am planning to add following comments in next patch. Please tell, does it explains what you expect?

"CxxTest uses python infrastructure as the build system. It consists of two parts:

1. cxxtestgen tool to process tests defined in header files to generate C++ source files. cxxtestgen is built as a host package, so that it can be used natively.

2. A set of header files which are installed in staging directory. This will be used to cross-compile test harness to generate executable which will run on target."

>> +$(eval $(generic-package))
>> +$(eval $(host-python-package))
>> -- 
>> 2.6.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Abhishek
