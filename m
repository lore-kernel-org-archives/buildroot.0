From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 11:02:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/kmod: fix build with python 3.8
In-Reply-To: <20191020193818.85518-1-james.hilliard1@gmail.com>
References: <20191020193818.85518-1-james.hilliard1@gmail.com>
Message-ID: <20191022110246.560fdb5d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Oct 2019 13:38:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +KMOD_CONF_ENV += \
> +	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
> +endif

For kmod, the problem is the same as libselinux, just not the same
option is used. libselinux is passing "-z defs", while kmod is passing
--no-undefined, but they are exactly the same option.

So, for kmod, I believe the proper fix is:

diff --git a/Makefile.am b/Makefile.am
index c5c2f06..8e9c90d 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -173,7 +173,7 @@ CPYTHON_MODULE_CFLAGS = \
        $(AM_CFLAGS) -DCPYTHON_COMPILING_IN_PYPY=0 \
        $(PYTHON_NOWARN) $(PYTHON_CFLAGS) \
        -fvisibility=default
-CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared
+CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared -Wl,-z,undefs
 
 if BUILD_PYTHON
 pkgpyexec_LTLIBRARIES = \

Indeed, kmod globally uses -Wl,--no-undefined when linking, but
specifically for building the Python extension, we want to disable that
and allow undefined symbols to exist, so we override it with
-Wl,-z,undefs.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
