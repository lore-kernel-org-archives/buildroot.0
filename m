From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 19 Jan 2017 16:08:39 +0100
Subject: [Buildroot] [PATCH 1/1] added new package pigpio
In-Reply-To: <20170119144844.9128-2-vas@vas.io>
References: <20170119144844.9128-1-vas@vas.io>
 <20170119144844.9128-2-vas@vas.io>
Message-ID: <CAGm1_kv3Y_Ku-10v+NCaJvnBFpFs9PK7fiDHcEMmjzKLfNS1kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vassil,

On Thu, Jan 19, 2017 at 3:48 PM, Vassil Kolarov <vas@vas.io> wrote:
> Signed-off-by: Vassil Kolarov <vas@vas.io>
> ---
>  package/Config.in                      |  2 ++
>  package/pigpio/0001-Makefile.patch     | 36 ++++++++++++++++++++++++++++++++++
>  package/pigpio/Config.in               |  6 ++++++
>  package/pigpio/pigpio.mk               | 20 +++++++++++++++++++
>  package/python-pigpio/Config.in        | 12 ++++++++++++
>  package/python-pigpio/python-pigpio.mk | 13 ++++++++++++
>  6 files changed, 89 insertions(+)
>  create mode 100644 package/pigpio/0001-Makefile.patch
>  create mode 100644 package/pigpio/Config.in
>  create mode 100644 package/pigpio/pigpio.mk
>  create mode 100644 package/python-pigpio/Config.in
>  create mode 100644 package/python-pigpio/python-pigpio.mk

You should either make two patches: one for pigpio and one for
python-pigpio or try to integrate python installation into pigpio
recipe.

> diff --git a/package/Config.in b/package/Config.in
> index 8c8c33e..c6ec24e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1075,6 +1075,8 @@ menu "Hardware handling"
>         source "package/neardal/Config.in"
>         source "package/owfs/Config.in"
>         source "package/pcsc-lite/Config.in"
> +       source "package/pigpio/Config.in"
> +       source "package/python-pigpio/Config.in"
>         source "package/tslib/Config.in"
>         source "package/urg/Config.in"
>         source "package/wiringpi/Config.in"
> diff --git a/package/pigpio/0001-Makefile.patch b/package/pigpio/0001-Makefile.patch
> new file mode 100644
> index 0000000..e4848de
> --- /dev/null
> +++ b/package/pigpio/0001-Makefile.patch
> @@ -0,0 +1,36 @@
> +diff --git a/Makefile b/Makefile
> +index 2341cf9..af0632a 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -90,13 +90,13 @@ install:   $(ALL)
> +       install -m 0755 pig2vcd           $(DESTDIR)$(bindir)
> +       install -m 0755 pigpiod           $(DESTDIR)$(bindir)
> +       install -m 0755 pigs              $(DESTDIR)$(bindir)
> +-      if which python2; then python2 setup.py install; fi
> +-      if which python3; then python3 setup.py install; fi
> ++      #if which python2; then python2 setup.py install --home=$(DESTDIR); fi
> ++      #if which python3; then python3 setup.py install --home=$(DESTDIR); fi
> +       install -m 0755 -d                $(DESTDIR)$(mandir)/man1
> +       install -m 0644 *.1               $(DESTDIR)$(mandir)/man1
> +       install -m 0755 -d                $(DESTDIR)$(mandir)/man3
> +       install -m 0644 *.3               $(DESTDIR)$(mandir)/man3
> +-      ldconfig
> ++      #ldconfig
> +
> + uninstall:
> +       rm -f $(DESTDIR)$(includedir)/pigpio.h
> +@@ -108,11 +108,11 @@ uninstall:
> +       rm -f $(DESTDIR)$(bindir)/pig2vcd
> +       rm -f $(DESTDIR)$(bindir)/pigpiod
> +       rm -f $(DESTDIR)$(bindir)/pigs
> +-      if which python2; then python2 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> +-      if which python3; then python3 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> ++      #if which python2; then python2 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> ++      #if which python3; then python3 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> +       rm -f $(DESTDIR)$(mandir)/man1/pig*.1
> +       rm -f $(DESTDIR)$(mandir)/man3/pig*.3
> +-      ldconfig
> ++      #ldconfig
> +
> + $(LIB1):      $(OBJ1)
> +       $(SHLIB) -o $(LIB1) $(OBJ1)
> diff --git a/package/pigpio/Config.in b/package/pigpio/Config.in
> new file mode 100644
> index 0000000..3eeb0a7
> --- /dev/null
> +++ b/package/pigpio/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PIGPIO
> +       bool "pigpio"
> +       help
> +         PIGPIO daemon.
> +
> +         https://github.com/joan2937/pigpio
> diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
> new file mode 100644
> index 0000000..6fe261b
> --- /dev/null
> +++ b/package/pigpio/pigpio.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# pigpio
> +#
> +################################################################################
> +
> +PIGPIO_VERSION = 4862a16c9f76f9b2096055c98ef4fbc480dc1878
> +PIGPIO_SITE = $(call github,joan2937,pigpio,$(PIGPIO_VERSION))
> +PIGPIO_LICENSE = Unlicense
> +PIGPIO_LICENSE_FILES = UNLICENCE
> +
> +define PIGPIO_BUILD_CMDS
> +       $(MAKE) $(TARGET_CONFIGURE_OPTS) VC_DIR=$(STAGING_DIR)/usr -C $(@D) -j4

You don't need -j4 because Buildroot takes care of this itself

> +endef
> +
> +define PIGPIO_INSTALL_TARGET_CMDS
> +       $(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/python-pigpio/Config.in b/package/python-pigpio/Config.in
> new file mode 100644
> index 0000000..c60f47d
> --- /dev/null
> +++ b/package/python-pigpio/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PYTHON_PIGPIO
> +       bool "python-pigpio"
> +       depends on BR2_PACKAGE_PIGPIO

s/depends/select

> +        select BR2_PACKAGE_LIBFFI

libffi will be installed with python automatically

> +        select BR2_PACKAGE_PYTHON

according to setup.py this package should be both Py2 and Py3 compatible

> +        select BR2_PACKAGE_PYTHON_SSL
> +        select BR2_PACKAGE_PYTHON_HASHLIB

Where will this functionality be used in code?

Yegor

> +       help
> +         Python module for communicating with PIGPIO daemon.
> +
> +         https://github.com/joan2937/pigpio
> diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
> new file mode 100644
> index 0000000..06f5aa1
> --- /dev/null
> +++ b/package/python-pigpio/python-pigpio.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-pigpio
> +#
> +################################################################################
> +
> +PYTHON_PIGPIO_VERSION = 4862a16c9f76f9b2096055c98ef4fbc480dc1878
> +PYTHON_PIGPIO_SITE = $(call github,joan2937,pigpio,$(PIGPIO_VERSION))
> +PYTHON_PIGPIO_LICENSE = unlicense.org
> +PYTHON_PIGPIO_LICENSE_FILES = UNLICENCE
> +PYTHON_PIGPIO_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 2.9.3
>
