From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 14:56:47 +0200
Subject: [Buildroot] [PATCH v1] dtc: Add set-ldshared.patch
In-Reply-To: <f1e71e0d-6728-78d1-0431-c1e2846ab885@infradead.org>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
 <f1e71e0d-6728-78d1-0431-c1e2846ab885@infradead.org>
Message-ID: <20180728145647.70ac1d52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Jul 2018 15:23:28 -0700, Geoff Levand wrote:
> Fixes pylibfdt cross compile errors.
> 
> http://autobuild.buildroot.net/?reason=%dtc-1.4.7

Are you sure your patch is fixing the host-dtc build issues ?

I am seeing two different build issues:

 - One for host-dtc, which looks like this:

	 INSTALL-PYLIB
pylibfdt/libfdt_wrap.c: In function 'SWIG_Python_NewShadowInstance':
pylibfdt/libfdt_wrap.c:2483:65: error: declaration of 'swig_this' shadows a global declaration [-Werror=shadow]
 SWIG_Python_NewShadowInstance(SwigPyClientData *data, PyObject *swig_this)
                                                                 ^
pylibfdt/libfdt_wrap.c:2224:18: error: shadowed declaration is here [-Werror=shadow]
 static PyObject *swig_this = NULL;

 - One for dtc, which looks like this:

	 LD fdtoverlay
/usr/bin/ld: build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 8)
/usr/bin/ld: build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 8)
build/temp.linux-x86_64-2.7/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/dtc-1.4.7/libfdt/fdt.o: error adding symbols: File in wrong format

Your patch probably fixes the "dtc" issue, but I'm not sure it fixes the host-dtc issue.

> diff --git a/package/dtc/set-ldshared.patch b/package/dtc/set-ldshared.patch
> new file mode 100644
> index 0000000000..09220da359
> --- /dev/null
> +++ b/package/dtc/set-ldshared.patch
> @@ -0,0 +1,13 @@

Patches should be Git formatted, have a description and a Signed-off-by.

> +diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> +index 9507d3d..c2ac8e9 100644
> +--- a/pylibfdt/Makefile.pylibfdt
> ++++ b/pylibfdt/Makefile.pylibfdt
> +@@ -8,7 +8,7 @@ PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
> + define run_setup
> + 	SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)"
> + 	VERSION="$(dtc_version)"
> +-	$(PYLIBFDT_objdir)/setup.py --quiet $(2)
> ++	LDSHARED="$(CC) -shared" $(PYLIBFDT_objdir)/setup.py --quiet $(2)

Do we know why it was working before, and why it fails since the dtc update ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
