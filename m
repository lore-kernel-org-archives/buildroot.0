From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 15:32:05 +0000 (UTC)
Subject: [Buildroot] [Bug 7358] rpi-userland: linking with bcm_host doesn't
 give vc_dispmanx_* functions
In-Reply-To: <bug-7358-163@https.bugs.busybox.net/>
References: <bug-7358-163@https.bugs.busybox.net/>
Message-ID: <20140903153205.9BA5B9D5DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7358

--- Comment #2 from Maarten ter Huurne <maarten@treewalker.org> 2014-09-03 15:32:05 UTC ---
Created attachment 5582
  --> https://bugs.busybox.net/attachment.cgi?id=5582
SDL2 package work-in-progress for buildroot 2014.05

I am also working on an SDL2 package for buildroot targeting the Raspberry Pi.
I haven't migrated it to 2014.08 yet though. My focus is only on the
framebuffer (fbcon + EGL), not the other video drivers.

The current state is that fbcon works, but not perfectly: SWSURFACE works fine,
HWSURFACE with double buffering does not seem to flip at the right time:
overpainting is visible while double buffering should eliminate that. My guess
is that this is a problem in the kernel fb driver, but I haven't verified that
yet.

I tried one GL ES application so far and it didn't run. The compilation of the
GL ES and EGL code in SDL2 did work though.

Please have a look at the patch that makes SDL2 use pkg-config for the EGL
compile flags instead of using the hardcoded paths to /opt. I think this might
fix the issue you're running into.

Note that the Raspberry Pi support in SDL2's configure requires "raspberry" as
the vendor in the system identifier (host triple), I added an override for that
in "sdl2.mk".

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
