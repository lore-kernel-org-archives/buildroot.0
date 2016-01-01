From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jan 2016 21:52:34 +0100
Subject: [Buildroot] [PATCH v4] cxxtest: new package
In-Reply-To: <1450430834-15568-1-git-send-email-Abhishek.Singh@imgtec.com>
 (Abhishek Singh's message of "Fri, 18 Dec 2015 14:57:14 +0530")
References: <1450430834-15568-1-git-send-email-Abhishek.Singh@imgtec.com>
Message-ID: <874mexqay5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Abhishek" == Abhishek Singh <Abhishek.Singh@imgtec.com> writes:

 > Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
 > Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
 > Reviewed-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
 > Reviewed-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
 > ---
 > changes v3 -> v4:
 > 	- remove CXXTEST_SOURCE (suggested by Jerzy Grzegorek)

 > changes v2 -> v3:
 > 	- change source download path (suggested by Yann E. Morin)
 > 	- modify comment (suggested by Yann E. Morin)

 > changes v1 -> v2:
 > 	- remove dependency on host-python (suggested by Thomas Petazzoni)
 > 	- add comments in mk file (suggested by Thomas Petazzoni)
 > ---
 >  package/Config.in            |  1 +
 >  package/cxxtest/Config.in    | 10 ++++++++++
 >  package/cxxtest/cxxtest.hash |  2 ++
 >  package/cxxtest/cxxtest.mk   | 30 ++++++++++++++++++++++++++++++
 >  4 files changed, 43 insertions(+)
 >  create mode 100644 package/cxxtest/Config.in
 >  create mode 100644 package/cxxtest/cxxtest.hash
 >  create mode 100644 package/cxxtest/cxxtest.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 1eea89b..d9015c8 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -118,6 +118,7 @@ menu "Development tools"
 >  	source "package/cmake/Config.in"
 >  	source "package/cppunit/Config.in"
 >  	source "package/cvs/Config.in"
 > +	source "package/cxxtest/Config.in"
 >  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 >  	source "package/diffutils/Config.in"
 >  	source "package/dos2unix/Config.in"
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

The format is <pkg> needs a toolchain w/ <option>"

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
 > index 0000000..22ebd78
 > --- /dev/null
 > +++ b/package/cxxtest/cxxtest.mk
 > @@ -0,0 +1,30 @@
 > +#######################################################################################
 > +#
 > +# cxxtest
 > +#
 > +#######################################################################################
 > +
 > +CXXTEST_VERSION = 4.4
 > +CXXTEST_SITE = https://github.com/CxxTest/cxxtest/releases/download/$(CXXTEST_VERSION)
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

We normally use $(INSTALL) instead of mkdir / cp, so I changed this to
be:

$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/cxxtest
$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/cxxtest $(@D)/cxxtest/*

It is a little odd to install .cpp files to include/cxxtest, but Ok - I
guess that's just how cxxtest is supposed to work (and also how
E.G. Debian installs it).

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
