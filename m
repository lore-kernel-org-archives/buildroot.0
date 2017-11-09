From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 9 Nov 2017 09:05:24 +0100
Subject: [Buildroot] [PATCH 1/1] add sunxi-mali mainline kernel
In-Reply-To: <35a55788-8cf6-2f65-e110-dfc467fad8cd@mind.be>
References: <1509920353-23438-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171108102753.nisqsfaibybjul4x@flea.lan>
 <35a55788-8cf6-2f65-e110-dfc467fad8cd@mind.be>
Message-ID: <20171109080524.irywhbolqtlowcxf@flea.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Nov 09, 2017 at 12:05:23AM +0100, Arnout Vandecappelle wrote:
> >> +++ b/package/sunxi-mali-driver-mainline/Config.in
> >> @@ -0,0 +1,9 @@
> >> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
> >> +	depends on !BR2_LINUX_KERNEL
> >> +
> >> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
> >> +	bool "sunxi-mali-driver-mainline"
> >> +	depends on BR2_LINUX_KERNEL
> >> +	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
> >> +	help
> >> +	  Sunxi Mali Kernel space driver
> 
>  Please also mention in the help text what the kernel requirements
> are (>= 4.12 I think?)

At least as far back as 4.4, but I haven't tried with anything older.

> >> +
> >> +SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
> >> +
> >> +SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
> >> +	KDIR=$(LINUX_DIR) \
> >> +	USING_UMP=0 \
> >> +	BUILD=release \
> >> +	USING_DVFS=1 \
> >> +	USING_DEVFREQ=1 \
> >> +	CROSS_COMPILE=$(TARGET_CROSS)
> >> +
> >> +define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
> >> +	$(APPLY_PATCHES) $(@D)/r6p2 $(@D)/patches \*.patch
> 
>  Maxime, WTF? Why is this maintained as patches and not as a proper history?
> 
>  If it's for rebasing, you can maintain separate branches for the
> upstream-tracking and the modified stuff. If it is because the same patches need
> to be applied to different upstream versions, you can do it in different
> branches and use subtree merge. This applying of patches is really not user
> friendly IMO.

So, while I'm really not happy about the current code, I haven't found
better yet.

The idea is that we have various versions coming from ARM as
tarballs. On this various versions, the changes needed are the same
(but obviously the code to apply it on isn't), and maintaining two
sets of changes (through git commits or something else) would be very
inefficient and wouldn't scale.

So I went for the same set of patches that we apply on whatever
version is currently being built. Like I was saying, I'm not really
happy about it either so I'm definitely open to suggestions. We
discussed it with Thomas quite some time ago and it's the only
solution that stuck.

I didn't know about the git subtrees, but as far as I can see, you
need to have a git upstream, and it's doing a complete merge, so
whenever you would merge the r6p2 changes to the r6p0 version, it
would also bring the rest of the r6p2 code with it, or am I missing
something?

> Giulio, the proper way to do this is in a POST_PATCH_HOOK. Otherwise, if you
> rebuild it, it will also be patched again (which will fail).

We also have a build.sh script that abstracts all this away.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171109/3307a6c9/attachment.asc>
