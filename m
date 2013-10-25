From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Oct 2013 01:41:02 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyusb: new package
In-Reply-To: <1382742930-11510-1-git-send-email-wzab01@gmail.com>
References: <CAMduVEegwCNSu2cBGbTOjUhBUtD5kv1F14eViyj+y9M29wwngQ@mail.gmail.com>
 <1382742325-11435-1-git-send-email-wzab01@gmail.com>
 <OF7CA7B8E3.5FD89345-ON86257C0F.0052857B-86257C0F.0054D5D3@rockwellcollins.com>
 <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382742930-11510-1-git-send-email-wzab01@gmail.com>
Message-ID: <526B018E.9080206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Wojciech,

  A few minor nits and one major issue.

On 26/10/13 01:15, Wojciech M. Zabolotny wrote:
> I have considered remarks provided by Ryan Barnett and Thomas De Schampheleire.
> I hope that now the package definition is correct.

  Comments like this should not appear in the git history. You can do 
that by putting them below the Signed-off-by line, separated with --- on 
a line on its own. The part below the --- line is removed when the patch 
is committed with git am.

  Also, when sending an update, it is customary to add v2 to the subject 
so people can see which version is the latest one. You can do that by 
calling
git send-email -v2 # Since git 1.8.x
or
git send-email --subject-prefix='PATCH v2'

>
> Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
> ---
>   package/Config.in                    |  1 +
>   package/python-pyusb/Config.in       | 10 ++++++++++
>   package/python-pyusb/python-pyusb.mk | 37 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 48 insertions(+)
>   create mode 100644 package/python-pyusb/Config.in
>   create mode 100644 package/python-pyusb/python-pyusb.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 0e6f86c..40dba0c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -400,6 +400,7 @@ source "package/python-protobuf/Config.in"
>   source "package/python-pygame/Config.in"
>   source "package/python-pyparsing/Config.in"
>   source "package/python-pyro/Config.in"
> +source "package/python-pyusb/Config.in"
>   source "package/python-pyzmq/Config.in"
>   source "package/python-serial/Config.in"
>   source "package/python-setuptools/Config.in"
> diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
> new file mode 100644
> index 0000000..3a1242a
> --- /dev/null
> +++ b/package/python-pyusb/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_PYUSB
> +	bool "python-pyusb"
> +	depends on BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_LIBUSB

  libusb depends on threads so you should have

	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb

and

comment "python-pyusb needs a toolchain w/ threads"
	depends on BR2_PACKAGE_PYTHON
         depends on !BR2_TOOLCHAIN_HAS_THREADS

> +	help
> +	  The PyUSB module provides for Python easy access to the host
> +	  machine's Universal Serial Bus (USB) system.
> +	

  Empty lines should be really empty, not contain spaces.

> +	  http://sourceforge.net/apps/trac/pyusb/
> +

  Spurious empty line.

> diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
> new file mode 100644
> index 0000000..80609af
> --- /dev/null
> +++ b/package/python-pyusb/python-pyusb.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# python-pyusb
> +#
> +################################################################################
> +
> +PYTHON_PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
> +PYTHON_PYUSB_SITE = http://github.com/walac/pyusb/tarball/$(PYTHON_PYUSB_VERSION)
> +PYTHON_PYUSB_LICENSE = BSD-3c
> +PYTHON_PYUSB_LICENSE_FILES = LICENSE
> +
> +PYTHON_PYUSB_DEPENDENCIES = python libusb

  libusb is only a runtime dependency, so it doesn't need to be added to 
the dependencies list.

  Otherwise, looks good :-)

  Regards,
  Arnout

> +
> +# Copied from python-pyparsing, based on python-pygame
> +define PYTHON_PYUSB_BUILD_CMDS
> +	(cd $(@D);                                              \
> +	 CC="$(TARGET_CC)"                                      \
> +	 CFLAGS="$(TARGET_CFLAGS)"                              \
> +	 LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
> +	 CROSS_COMPILING=yes                                    \
> +	 _python_sysroot=$(STAGING_DIR)                         \
> +	 _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
> +	 _python_prefix=/usr                                    \
> +	 _python_exec_prefix=/usr                               \
> +	 $(HOST_DIR)/usr/bin/python setup.py build              \
> +	)
> +endef
> +
> +# Copied from python-pyparsing, based on python-pygame
> +define PYTHON_PYUSB_INSTALL_TARGET_CMDS
> +	(cd $(@D);                                              \
> +	 $(HOST_DIR)/usr/bin/python setup.py install            \
> +	                            --prefix=$(TARGET_DIR)/usr  \
> +	)
> +endef
> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
