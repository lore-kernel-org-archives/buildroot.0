From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 17 Jun 2014 13:21:47 +0800
Subject: [Buildroot] [PATCH 0/7 v3] Enable a buildroot-based petitboot
	bootloader
In-Reply-To: <1402982507.183937.570365596242.0.gpush@pablo>
Message-ID: <1402982507.183937.570365596242.0.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The following series allows us to build a petitboot-based bootloader
using buildroot.

Petitboot is a kexec-based bootloader; by plumbing together a few linux
utilities, we can implement a bootloader in userspace, using standard
Linux drivers for hardware support. There's a bit of background of
petitboot in my recent linux.conf.au talk:

 http://mirror.linux.org.au/linux.conf.au/2014/Thursday/89-Petitboot_doing_interesting_things_in_your_bootloader_-_Jeremy_Kerr.mp4
 
And the project homepage:

 https://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html

My primary target here is powerpc machines (and this series adds a
defconfig to do a powerpc petitboot build), but I've also been able to
get most of petitboot working when built as an EFI stub on x86 machines
(we still need some platform-specific bits in petitboot for proper
configuration persistence).

While most of this series is fairly straightforward, there are a few
items that might need a little more attention:

 - At the moment, I'm using my local repo for petitboot sources; it may
   be better to wait until everything is merged upstream. Upstream is
   still active, and I don't think this should take long.

 - We add wide-char support for ncurses; this seems to be working okay,
   but could do with a little review.

 - I still need a couple of tweaks to the target system (/etc/locale and
   /etc/inittab). At the moment, I'm carrying a change that introduces
   an overlay for these two files, but that's not suitable for upstream
   use:

     http://git.ozlabs.org/?p=buildroot;a=commitdiff;h=582c47a4
   
   Is there any way I can provide updates to these files? The changes
   aren't board-specific; they're due to petitboot expecting to own
   the default consoles for UIs. Or is there a better way to do this?

This series is also available in my git tree, at:

  git://git.ozlabs.org/~jk/buildroot/

- in the petitboot branch. Note that that branch includes the overlay
too, which isn't intended for upstream.

Also, I'd like to give a big thanks to the buildroot developers; being
able to re-roll an entire system with one command has made petitboot
development *significantly* easier. Also, thanks to Thomas for the nudge
to send these changes upstream!

Please let me know if you have questions/comments/etc.

Changes since v2:

 - petitboot: is now autoreconfable, so drop the custom autoconf 
   tomfoolery

 - powerpc-utils, kexec-lite: Update upstream versions

 - petitboot: use updated UDEV configuration options

 - resync with package/Config.in changes

 - drop already-merged changes

Changes since v1, based on feedback:

 - drobbear: we only want a config option to disable the server,
   instead of both client and server

 - ncurses: use NCURSES_LIBS-y

 - busybox: fix HOOK_DIR glob expansion

 - powerpc-utils, kexec-lite, petitboot: update upstream versions

 - petitboot: add dependencies

 - all: unified headers, now using full git SHAs

 - dtc: Added patch to update to 1.4.0

Cheers,


Jeremy

---
Jeremy Kerr (7):
      package/busybox: Add facility for DHCP hooks
      package/dropbear: Add separate configuration option for dropbear server
      package/ncurses: Allow building wide char support
      package/powerpc-utils: Add powerpc hardware utilities
      package/kexec-lite: Add a package for the kexec-lite tools
      package/petitboot: Add petitboot, the userspace bootloader
      Add powerpc64 petitboot defconfig
