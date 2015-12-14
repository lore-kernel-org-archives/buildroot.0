From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Dec 2015 23:36:55 +0100
Subject: [Buildroot] [PATCH v2] cxxtest: new package
In-Reply-To: <1448546706-31297-1-git-send-email-Abhishek.Singh@imgtec.com>
References: <1448546706-31297-1-git-send-email-Abhishek.Singh@imgtec.com>
Message-ID: <20151214223655.GE4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Abhishek, All,

Sorry for the delay, I'm now looking at your patch...

On 2015-11-26 19:35 +0530, Abhishek Singh spake thusly:
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Reviewed-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
> Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
> ---
> changes v1 -> v2:
> 	- remove dependency on host-python
> 	- add comments in mk file
[--SNIP--]
> diff --git a/package/cxxtest/cxxtest.mk b/package/cxxtest/cxxtest.mk
> new file mode 100644
> index 0000000..cc29608
> --- /dev/null
> +++ b/package/cxxtest/cxxtest.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# cxxtest
> +#
> +################################################################################
> +
> +CXXTEST_VERSION = 4.4
> +CXXTEST_SOURCE = cxxtest-$(CXXTEST_VERSION).tar.gz
> +CXXTEST_SITE = http://sourceforge.net/projects/cxxtest/files/cxxtest/$(CXXTEST_VERSION)

SF.net is getting a bad reputation these days, and there is an official
Github repository with the latest 4.4 release:
    https://github.com/CxxTest/cxxtest

Can we use Github instead?

> +CXXTEST_LICENSE = LGPLv3
> +CXXTEST_LICENSE_FILES = COPYING
> +CXXTEST_INSTALL_STAGING = YES
> +CXXTEST_INSTALL_TARGET = NO
> +CXXTEST_DEPENDENCIES = host-cxxtest
> +HOST_CXXTEST_SETUP_TYPE = setuptools
> +HOST_CXXTEST_SUBDIR = python
> +
> +# Copy CxxTest header files to staging directory
> +define CXXTEST_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/cxxtest
> +	cp $(@D)/cxxtest/* $(STAGING_DIR)/usr/include/cxxtest
> +endef
> +
> +# CxxTest uses python infrastructure as the build system. cxxtestgen is
> +# a script which is used to process header files to generate C++ source files.
> +# Compiling test runner requires CxxTest header files which are installed in
> +# the staging directory.

OK, I think we need a bit more info about all tis, as I am not sure I
understand. Let me try to reformulate from what I understood:

  - cxxtest is made of twoo parts:
    - a tool to parse header files (supposedly from a project)
    - a set of header files

  - the tool is built as a host package, so it can be used natively

  - the headers set is installed in staging

Then the use-case is for a user to use the csstest tool to parse his own
headers, that will supposedly generate a test harness, which is then
cross-compiled and run on the target. Right?

Could you expand a bit on the explanations, please?

Regards,
Yann E. MORIN.

> +$(eval $(generic-package))
> +$(eval $(host-python-package))
> -- 
> 2.6.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
