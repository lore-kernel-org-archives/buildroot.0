From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 10 Jul 2007 20:24:09 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs $(MAKE)
	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <f0528b5b0707100451h758a3c44w8e1ba12dacd591bf@mail.gmail.com>
References: <20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
	<05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
	<20070709082550.GA19774@aon.at> <20070709092108.GA20627@aon.at>
	<20070709122041.GA30238@real.realitydiluted.com>
	<f0528b5b0707090641j2bd8c39ap101012d7716ba67b@mail.gmail.com>
	<20070709163358.GA23895@aon.at>
	<f0528b5b0707100451h758a3c44w8e1ba12dacd591bf@mail.gmail.com>
Message-ID: <20070710182409.GA2880@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 10, 2007 at 01:51:52PM +0200, Julien Letessier wrote:

>Again, IMO very few (~10) packages will need to be fixed, so I'd prefer
>patching the packages themselves. Besides, most of them *are* fixed already.

I looked a little bit and it merely sounds like we could perhaps get
away with drop flags from TARGET_CONFIGURE_OPTS and pass (let's say)
TARGET_CONFIGURE_FLAGS to properly behaving packages and do obscure
workarounds for the few remaining packages that don't get their act
straight.
>
>If the only flag problem is the -O* problem, fixing the cross-compiler might
>be an option... except that GCC (especially the 4.2 branch) has a lot of
>regressions with -Os. Even though no bad code will be generated (AFAIK),
>some sources will crash the compiler, others will take any non-reasonable
>amount of time/memory to compile. E.g. xf86ScanPci.c in the X server
>requires >5GB of memory and about forever to compile on my build host with
>-Os (for no apparent reason).

heh, glad that i don't do X11 ;)
Still, can you please file a bug in gcc.gnu.org/bugzilla with the
preprocessed source of that file? TIA
>
>Besides, there are other flags to take care of... once we've started a list
>of flags to 'force' gcc to use, this will never be over. Why not forcing the
>compiler to use -mcpu=$(SUBARCH), -g, ad lib.

I occasionally do this to raise my blood pressure and to start endless
cursing about broken stuff, yea :/

A first step would be to explicitely do
Index: package/Makefile.in
===================================================================
--- package/Makefile.in (revision 19057)
+++ package/Makefile.in (working copy)
@@ -29,6 +29,22 @@
 #TARGET_LDFLAGS=-Wl,$(BR2_SYSROOT)
 endif
 
+CC_TARGET_TUNE_:=$(strip $(subst ",,BR2_GCC_TARGET_TUNE))
+#"))
+CC_TARGET_ARCH_:=$(strip $(subst ",,BR2_GCC_TARGET_ARCH))
+#"))
+CC_TARGET_ABI_:=$(strip $(subst ",,BR2_GCC_TARGET_ABI))
+#"))
+ifneq ($(CC_TARGET_TUNE_),)
+TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
+endif
+ifneq ($(CC_TARGET_ARCH_),)
+TARGET_CFLAGS+=-march=$(CC_TARGET_ARCH_)
+endif
+ifneq ($(CC_TARGET_ABI_),)
+TARGET_CFLAGS+=-mabi=$(CC_TARGET_ABI_)
+endif
+
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 ifeq ($(BR2_x86_64),y)
 TARGET_CFLAGS+=-fPIC -DPIC


but i recently changed the cross-compiler to default to this, so it's
really superfluous. An approach that would be even more evil (the above
will not catch folks on a compatible host) would be to make the
cross-compiler accept -fuxored-up-package and pass that ;)
