From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2016 23:00:35 +0100
Subject: [Buildroot] [PATCH] libnspr: only enable thumb if
	BR2_ARM_INSTRUCTIONS_THUMB2
In-Reply-To: <1453240207-27367-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 19 Jan 2016 22:50:07 +0100")
References: <1453240207-27367-1-git-send-email-arnout@mind.be>
Message-ID: <87k2n51b7g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > libnspr currently passes --enable-thumb2 if the CPU has thumb
 > instructions. This option will pass -mthumb to the compiler. However,
 > if an external multilib toolchain is used that has a thumb-specific
 > variant (e.g. Sourcery), it will try to use that one. But we only copy
 > a single variant to the sysroot, so the build will fail with:

 > .../arm-none-linux-gnueabi/bin/ld: cannot find crti.o: No such file or directory
 > ...
 > collect2: error: ld returned 1 exit status
 > ../../config/rules.mk:303: recipe for target 'libnspr4.so' failed

 > In order to fix this, only enable thumb2 when we are really using
 > thumb2. Note that it is still necessary to pass this option, cfr.
 > http://autobuild.buildroot.org/results/d7323831372050e425a34f5104a46d8cbd6be214

 > We could have chosen to still enable thumb2 with the internal toolchain.
 > However, that would mean we create a discrepancy between the result of
 > building with the same (buildroot) toolchain when it is used as an
 > internal one or as an external one. To avoid potentially surprising
 > results, just stick to the option chosen for the rest of the rootfs.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Build-tested with various combinations of thumb, thumb2, floating point,
 > and external toolchains. I didn't test with an internal toolchain but
 > what could go wrong there? :-)

 > Changes v2: added missing build failure output to commit message
 > ---
 >  package/libnspr/libnspr.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
 > index 8e58986..c9bfa0c 100644
 > --- a/package/libnspr/libnspr.mk
 > +++ b/package/libnspr/libnspr.mk
 > @@ -50,7 +50,7 @@ LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIBRARY= install
 >  endif
 
 >  ifeq ($(BR2_arm),y)
 > -ifeq ($(BR2_ARM_CPU_HAS_THUMB2),y)
 > +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2),y)
 >  LIBNSPR_CONF_OPTS += --enable-thumb2

Thanks. The conclusion was that --enable-thumb2 just caused it to pass
-mthumb in CFLAGS (and --disable-thumb2 to pass -marm), right?

What should we do for classic ARM cores in thumb1 mode? There we afaik
also want to use --enable-thumb2, but it could potentially break in
future if the option is changed to do something more than this.

-- 
Bye, Peter Korsgaard
