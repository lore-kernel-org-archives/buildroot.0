From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Dec 2010 11:57:45 +0100
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101205115745.0e86c054@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

Here is a review of your patches, comments below. Next time, it'd be
great if you could post the patches together with the pull request. I
know you have posted some earlier versions of them in the past, but
it's good to see them with every pull request, IMO, as it makes the
review process easier.

On Sat,  4 Dec 2010 17:52:01 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

>       m4: version bump to 1.4.15

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       xz: version bump to 5.0.0

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       u-boot: version bump to 2010.09

I already carry this change in my for-2011.02/boards-cleanup branch, as
I said previously. I don't care which one gets merged, either you or me
will fix his patch series depending on which one goes in first. Is this
ok for you ?

>       rsh-redone: new package for rsh/rlogin clients

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       whetstone: new benchmark package

I really don't like the override of the .stamp_extracted step, but
since the software packaging is strange and we don't have support for
such packaging in the infrastructure for the moment:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       dhrystone: new benchmark package

Same thing here for the override of the .stamp_extracted step, but for
the same reason:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       lsuio: new UIO helper package

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       pax-utils: new package

Here, I'm sorry but I don't like the cleverness of your
_PAX_UTILS_INSTALL_TARGET_CMDS and _PAX_UTILS_UNINSTALL_TARGET_CMDS.
Could you please make this :

+define HOST_PAX_UTILS_INSTALL_CMDS
+       $(MAKE) -C $(@D) install DESTDIR=$(HOST_DIR)
+endef
+define PAX_UTILS_INSTALL_TARGET_CMDS
+       $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+endef

And ditto for the uninstall thing ? (The list of files to remove can be
shared using a variable, though).

I know you're going to say that it's more lines, it's stupid and so on,
but I really thing it's more straightforward to read written this way.

Moreover, pax-utils requires LARGEFILE support, so you have to do the
usual stuff in the Config.in file:

diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index 76eab6f..d676ca7 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PAX_UTILS
        bool "pax-utils"
+       depends on BR2_LARGEFILE
        help
          ELF related utils to make scripting of ELFs easier
 
          http://hardened.gentoo.org/pax-utils.xml
+
+comment "pax-utils requires a toolchain with LARGEFILE support"
+       depends on !BR2_LARGEFILE

>       busybox: unify duplicated build steps

I'd very much prefer something like:

BUSYBOX_MAKE_OPTS =                       \
	CC="$(TARGET_CC)"                 \
	ARCH=$(KERNEL_ARCH)               \
	PREFIX="$(TARGET_DIR)"            \
	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
	CROSS_COMPILE="$(TARGET_CROSS)"   \
	CONFIG_PREFIX="$(TARGET_DIR)"

And then:

define BUSYBOX_BUILD_CMDS
	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D)
endef

define BUSYBOX_INSTALL_BINARY
	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
endef

I know it's a little bit more code, but it's how we do it in other
packages, so I'd prefer to be consistent.

>       busybox: let buildroot handle stripping

I'm obviously ok on the principle, but we'll have to keep updating the
patch directory and patch name everytime we bump busybox (which happens
quite often). Considering the simple change, wouldn't a $(SED) call
directly in busybox.mk be more future-proof ? Or better, get this patch
merged into Busybox. Anyway, this can be decided later, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       linux: support unpacked source trees

This is a useful feature, but we want to introduce it globally for all
packages, not only for the Linux kernel. This needs some thoughts on
what it should look like, how it should be presented to users, how it
should work.

Could you remove this patch from the patch set, but keep the idea
around ?

>       linux: drop LDFLAGS override

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       linux: add shorter shortcuts

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       linux: set a few more initramfs opts for newer kernels

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       toolchain: add a USE_MMU build option

It doesn't work, the uClibc define is __ARCH_USE_MMU__ and not
__UCLIBC_USE_MMU_. This commit will have to be changed when my
toolchain-improvements patch set goes in, but maybe your patch series
will go first (I don't care). Whichever happens, either you or me will
have to fix something :-)

Once the __ARCH_USE_MMU__ thing is fixed, you get my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       portmap: add nommu support

Just curious: why was portmap compiled PIE ? Have you pushed the
patches upstream ?

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       portmap: respect target CFLAGS

Why not after $(MAKE), like CC= ?

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       portmap: fix clean target to actually clean

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       irda-utils: new package for IrDA devices

I know Peter wants a short description + author in each patch. Your
patches are fairly obvious, but that's the rule :)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       libpcap: update static handling

Could you use LIBPCAP_MAKE_OPT instead ?

>       tcpdump: add patch for nommu systems

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       debugging: do not require no stripping

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       initial support for Blackfin processors

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       gdb: add support for Blackfin gdbserver

You already had my Acked-by on that one.

>       toolchain-external: allow vendor-controlled defaults

I think this could be done with the "toolchain profile" mechanism I
proposed in the toolchain-improvements patch set I posted this morning.
Could you remove this patch for this patch series, so that we can
handle this later ? Thanks!

>       add support for common ABI options (for FLAT)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       TARGET_CFLAGS: convert to kbuild-y style

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>       target-finalize: punt config scripts too

No. What if a package really wants to install a binary called
foobar-config that must be kept on the target ? I know it's unlikely,
but I'd prefer not to have this policy at the global level. Just do
what other packages do: add a post install hook that removes the
pcap-config file.

I tested the Blackfin support (well only the build part of it, since I
don't have hardware to test), and I had a few issues with the default
Busybox configuration:

 * shadow password not supported by the C library shipped in the
   Blackfin toolchain. So either shadow password support should be
   disabled in Busybox, or internal Busybox shadow functions should be
   used.

 * ash is selected, but doesn't not work on !MMU. hush should be
   selected instead.

 * swaponoff does not build.

Maybe package/busybox/busybox.mk should tune the busybox config file to
adjust these options, so that the default Busybox build works for the
user ? Or should we ship a completely different busybox configuration
file for !MMU systems ?

Another (unrelated) question: when using the Blackfin toolchains, I
found out that the linker needs zlib installed on the host, but it
isn't the case with the other toolchains I have. What feature of ld
requires zlib ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
