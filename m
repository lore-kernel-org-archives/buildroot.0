From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Jan 2017 22:18:46 +0100
Subject: [Buildroot] [PATCH 1/1] New package - pigpio
In-Reply-To: <20170119150621.10390-2-vas@vas.io>
References: <20170119150621.10390-1-vas@vas.io>
 <20170119150621.10390-2-vas@vas.io>
Message-ID: <3f7dc3de-8bb6-45a1-db53-9906cc0887f1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vassil,

Thanks for this contribution, here is my review bellow:

Le 19/01/2017 ? 16:06, Vassil Kolarov a ?crit :
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
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8c8c33e..c6ec24e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1075,6 +1075,8 @@ menu "Hardware handling"
>  	source "package/neardal/Config.in"
>  	source "package/owfs/Config.in"
>  	source "package/pcsc-lite/Config.in"
> +	source "package/pigpio/Config.in"
> +	source "package/python-pigpio/Config.in"

You're adding two packages in one patch.
We prefer a first patch adding pigpio and a second adding python-pigpio.

Also move python-pigpio in "External python modules" menu.

>  	source "package/tslib/Config.in"
>  	source "package/urg/Config.in"
>  	source "package/wiringpi/Config.in"
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

Missing patch description and Sob line

see: http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches


> +@@ -90,13 +90,13 @@ install:	$(ALL)
> + 	install -m 0755 pig2vcd           $(DESTDIR)$(bindir)
> + 	install -m 0755 pigpiod           $(DESTDIR)$(bindir)
> + 	install -m 0755 pigs              $(DESTDIR)$(bindir)
> +-	if which python2; then python2 setup.py install; fi
> +-	if which python3; then python3 setup.py install; fi
> ++	#if which python2; then python2 setup.py install --home=$(DESTDIR); fi
> ++	#if which python3; then python3 setup.py install --home=$(DESTDIR); fi
> + 	install -m 0755 -d                $(DESTDIR)$(mandir)/man1
> + 	install -m 0644 *.1               $(DESTDIR)$(mandir)/man1
> + 	install -m 0755 -d                $(DESTDIR)$(mandir)/man3
> + 	install -m 0644 *.3               $(DESTDIR)$(mandir)/man3
> +-	ldconfig
> ++	#ldconfig
> + 
> + uninstall:
> + 	rm -f $(DESTDIR)$(includedir)/pigpio.h
> +@@ -108,11 +108,11 @@ uninstall:
> + 	rm -f $(DESTDIR)$(bindir)/pig2vcd
> + 	rm -f $(DESTDIR)$(bindir)/pigpiod
> + 	rm -f $(DESTDIR)$(bindir)/pigs
> +-	if which python2; then python2 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> +-	if which python3; then python3 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> ++	#if which python2; then python2 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> ++	#if which python3; then python3 setup.py install --record /tmp/pigpio >/dev/null; xargs rm -f < /tmp/pigpio >/dev/null; fi
> + 	rm -f $(DESTDIR)$(mandir)/man1/pig*.1
> + 	rm -f $(DESTDIR)$(mandir)/man3/pig*.3
> +-	ldconfig
> ++	#ldconfig
> + 
> + $(LIB1):	$(OBJ1)
> + 	$(SHLIB) -o $(LIB1) $(OBJ1)
> diff --git a/package/pigpio/Config.in b/package/pigpio/Config.in
> new file mode 100644
> index 0000000..3eeb0a7
> --- /dev/null
> +++ b/package/pigpio/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PIGPIO
> +	bool "pigpio"

- Since pigpio is destined to be used by a rasberry-pi, the package must be at
least depends on BR2_arm.
- fork() is used, pigpio must depends on BR2_USE_MMU.
- The libpigpio.so library is unconditionally built, pigpio must depends on
!BR2_STATIC_LIBS.
- pigpio link against pthread it must depends on BR2_TOOLCHAIN_HAS_THREADS

> +	help
> +	  PIGPIO daemon.
> +
> +	  https://github.com/joan2937/pigpio

Also add a comment when one of the package dependency is missing.

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
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) VC_DIR=$(STAGING_DIR)/usr -C $(@D) -j4

Don't add -j4, Buildroot do it for you when you use $(MAKE)

- pigpio build and install the libpigpio.so library and some header files,
PIGPIO_INSTALL_STAGING = YES should be added.
- /usr/local is used as default prefix, you can try with /usr to install pigs in
/usr/bin directly.

> +endef
> +
> +define PIGPIO_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
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
> +	bool "python-pigpio"
> +	depends on BR2_PACKAGE_PIGPIO
> +        select BR2_PACKAGE_LIBFFI
> +        select BR2_PACKAGE_PYTHON

It should depends on BR2_PACKAGE_PYTHON
Is it python2 only ?

> +        select BR2_PACKAGE_PYTHON_SSL
> +        select BR2_PACKAGE_PYTHON_HASHLIB

should be indented with one tab (http://nightly.buildroot.org/#_config_files)

> +
> +	help
> +	  Python module for communicating with PIGPIO daemon.
> +
> +	  https://github.com/joan2937/pigpio

Also add a comment when one of the package dependency is missing.

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

You can keep Unlicense here I think.

Best regards,
Romain

> +PYTHON_PIGPIO_LICENSE_FILES = UNLICENCE
> +PYTHON_PIGPIO_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> 
