From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Dec 2009 21:32:07 +0100
Subject: [Buildroot] Failure building default config for ARM integrator
In-Reply-To: <hgb3r7$88l$2@ger.gmane.org> (Grant Edwards's message of "Wed, 16
	Dec 2009 17:02:31 +0000 (UTC)")
References: <hgb3r7$88l$2@ger.gmane.org>
Message-ID: <87k4wm64oo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> I'm trying to build the default config for the ARM integrator
 Grant> target.  [It's the same architecture as my board, and it's
 Grant> supported by Qemu, so it's a useful testbed.] It fails when it
 Grant> tries to build U-Boot.  I don't really care about building
 Grant> U-Boot, so I could just deselect it.

 Grant> However, if it's considered a bug when a "defconfig" target
 Grant> doesn't "just build", then I'll try to fix it and submit a
 Grant> patch.  Is this something that needs to be fixed, or is it
 Grant> normal?

No, it's a bug.

 Grant>  $ git clone git://git.buildroot.net/buildroot
 
 Grant>  $ cd buildroot
  
 Grant>  $ make integrator926_defconfig

 Grant>  make[1]: Entering directory `/home/grante/buildroot-git/buildroot/output/build/u-boot-2009.08'
 Grant>  make[1]: *** No rule to make target `integrator926_config'.  Stop.

So u-boot doesn't have an integrator926 configuration.

It has:

git grep -A10 integrator v2009.08 -- Makefile
v2009.08:Makefile-ap922_XA10_config     \
v2009.08:Makefile-ap7_config            \
v2009.08:Makefile-ap720t_config         \
v2009.08:Makefile-ap920t_config         \
v2009.08:Makefile-ap926ejs_config               \
v2009.08:Makefile-ap946es_config: unconfig
v2009.08:Makefile:      @board/armltd/integrator/split_by_variant.sh ap $@
v2009.08:Makefile-
v2009.08:Makefile:integratorcp_config   \
v2009.08:Makefile-cp_config             \
v2009.08:Makefile-cp920t_config         \
v2009.08:Makefile-cp926ejs_config               \
v2009.08:Makefile-cp946es_config                \
v2009.08:Makefile-cp1136_config         \
v2009.08:Makefile-cp966_config          \
v2009.08:Makefile-cp922_config          \
v2009.08:Makefile-cp922_XA10_config     \
v2009.08:Makefile-cp1026_config: unconfig

I don't remember what the difference is between the ap and cp
baseboards, but I guess the right config is something like cp926ejs_config

The setting to change is BR2_TARGET_UBOOT_BOARDNAME.

-- 
Bye, Peter Korsgaard
