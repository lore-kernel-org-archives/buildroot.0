From: Abhishek Singh <abhishek.singh@imgtec.com>
Date: Mon, 7 Dec 2015 11:24:56 +0530
Subject: [Buildroot] [PATCH v2] cxxtest: new package
In-Reply-To: <1448546706-31297-1-git-send-email-Abhishek.Singh@imgtec.com>
References: <1448546706-31297-1-git-send-email-Abhishek.Singh@imgtec.com>
Message-ID: <56651F30.9000704@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please treat this as a polite reminder for this pending patch.


On Thursday 26 November 2015 07:35 PM, Abhishek Singh wrote:
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Reviewed-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
> Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
> ---
> changes v1 -> v2:
> 	- remove dependency on host-python
> 	- add comments in mk file
> ---
>   package/Config.in            |  1 +
>   package/cxxtest/Config.in    | 10 ++++++++++
>   package/cxxtest/cxxtest.hash |  2 ++
>   package/cxxtest/cxxtest.mk   | 30 ++++++++++++++++++++++++++++++
>   4 files changed, 43 insertions(+)
>   create mode 100644 package/cxxtest/Config.in
>   create mode 100644 package/cxxtest/cxxtest.hash
>   create mode 100644 package/cxxtest/cxxtest.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index bdc3063..6e71d25 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -116,6 +116,7 @@ menu "Development tools"
>   	source "package/cmake/Config.in"
>   	source "package/cppunit/Config.in"
>   	source "package/cvs/Config.in"
> +	source "package/cxxtest/Config.in"
>   if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>   	source "package/diffutils/Config.in"
>   	source "package/dos2unix/Config.in"
> diff --git a/package/cxxtest/Config.in b/package/cxxtest/Config.in
> new file mode 100644
> index 0000000..7512e4b
> --- /dev/null
> +++ b/package/cxxtest/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_CXXTEST
> +	bool "cxxtest"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  CxxTest is a unit testing framework for C++
> +
> +	  http://cxxtest.com/
> +
> +comment "cxxtest needs toolchain with C++ support"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/cxxtest/cxxtest.hash b/package/cxxtest/cxxtest.hash
> new file mode 100644
> index 0000000..f552e80
> --- /dev/null
> +++ b/package/cxxtest/cxxtest.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8	cxxtest-4.4.tar.gz
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
> +
> +$(eval $(generic-package))
> +$(eval $(host-python-package))
