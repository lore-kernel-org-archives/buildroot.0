From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Jun 2013 10:26:28 +0000 (UTC)
Subject: [Buildroot] [Bug 6326] Dropbear: Add options to allow better config
 for different target devices (e.g. routers)
In-Reply-To: <bug-6326-163@https.bugs.busybox.net/>
References: <bug-6326-163@https.bugs.busybox.net/>
Message-ID: <20130623102628.51DEB9AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6326

--- Comment #2 from Maddes <mail@maddes.net> 2013-06-23 10:24:40 UTC ---
#1 not a hacky target
It is not about hacked/closed firmwares: I built Dropbear for an older DD-Wrt
based router from Buffalo, which is an open firmware and allows access to the
Linux console and config, with support from Buffalo.
I *do* want to keep the official firmware with its feature, but the included
Dropbear is years old and SSH is available from WAN. Therefore a newer Dropbear
build is necessary to close security gaps.
The file system layout/design of the firmware consists of a read-only root plus
mount points for the writable flash partition and optional USB devices.
Even if I use `mount -o bind` to overlay the original files, the paths are
still not the same as the default ones in options.h.
I hope this explanation will get the focus back to the feature/patch itself.


#2 patch for new options to adopt paths
The current make file already "fixes" the XAUTH_COMMAND define in options.h,
but that fix must not be correct for all builds/targets.
Providing a config option for this makes the buildroot default change
transparent and flexible for the builder.
So the current make file already shows that adopting paths to the build/target
is indeed needed for normal usage.

But the XAUTH_COMMAND define is not the only path which has to be adopted for a
build/target. Therefore the other new options are required too.


#3 global patch dir
Of course the global patch dir can always be used to change anything.
But patches are intended for custom features and others that incorporate real
code changes.
Flexible configuration settings like these should be generally available and
hold in config files.


I see two ways to go:
a) builder-unfriendly
   Get rid of the "XAUTH_COMMAND" fix, and leave it *all* to the builder to
patch paths in options.h.
   A short sentence (either via Config.in or in dropbear.mk) about using the
global patch dir would avoid support requests.
   Builders will have to deal with multiple patch files via
BR2_GLOBAL_PATCH_DIR, incl. rebasing all for changes in Dropbear and/or
buildroot.
b) builder-friendly
   Apply the patch of this ticket to allow different paths for different builds
via config files.
   Builders can use the normal buildroot way of storing configurations.

Kind Regards
Maddes

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
