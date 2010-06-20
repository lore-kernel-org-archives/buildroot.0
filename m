From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jun 2010 19:51:23 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
	infrastructure for building the Linux kernel
In-Reply-To: <20100620153508.4e7e2a28@surf> (Thomas Petazzoni's message of
	"Sun, 20 Jun 2010 15:35:08 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87bpb8b0ld.fsf@macbook.be.48ers.dk> <20100619161327.3748f49c@surf>
	<87hbkyajnf.fsf@macbook.be.48ers.dk> <20100620153508.4e7e2a28@surf>
Message-ID: <878w69a8ys.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Well, "stable" has different meanings to different people. When I think
 >> of stable in regard to kernels, I think of the stable at kernel.org
 >> releases (E.G. 2.6.x.y).

 Thomas> Ah, I see. For me, 2.6.x versions are also stable versions, by
 Thomas> oppposition with -rc versions. But ok, I've changed this.

Ok - Notice that there isn't anything stopping people from using a -rc
version (and there shouldn't be) - E.G.

http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.35-rc3.tar.bz2

 >> The point is that it isn't consistent. We don't do this for
 >> uclibc/busybox, and you don't do it for defconfigs in the kernel tree
 >> (which often are also slightly outdated).

 Thomas> Ok, I got rid of it.

Thanks.

 >> Does this mean that the existing advanced linux support is broken on
 >> ARM/uImage when using a modular kernel? - There it looks like it just
 >> calls 'make uImage'. I always use a nonmodular kernel, so I never
 >> noticed.

 Thomas> The current advanced thing does "make modules ; make modules_install"
 Thomas> when CONFIG_MODULES is enabled.

Ok, that makes sense.

 Thomas> make uImage
 Thomas> make modules
 >> 
 >> Probably better to do make; make <format> (where format is uImage/zImage/bzImage/..)

 Thomas> Isn't this what I'm doing already ?

No, you were doing:

+# Compilation
+$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured
+	@$(call MESSAGE,"Compiling kernel")
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D)
+ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) uImage
+endif
+	$(Q)touch $@

E.G. just make (followed by make uImage if uImage is selected).

I guess we should do:

make <format>
if modules:
   make modules
   make modules-install

-- 
Bye, Peter Korsgaard
