From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Nov 2020 23:00:27 +0000
Subject: [Buildroot] [Bug 13291] BR2_DL_DIR is ignored when creating
 defconfig
In-Reply-To: <bug-13291-163@https.bugs.busybox.net/>
References: <bug-13291-163@https.bugs.busybox.net/>
Message-ID: <bug-13291-163-brvTVZGxpQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13291

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Lance Fredrickson from comment #3)
> For various projects I set BR2_DL_DIR using menuconfig to point to a
> central directory for source packages.

I find it dubious that it is used as-is.

For example, in a team of many developpers, each working on their
own machines, with their own usernames and filesystem layouts, surely
a common BR2_DL_DIR does not make sense.

For a CI (or any similar build farm), then the CI setup is already
taking care of making the shared BR2_DL_DIR mounted (or otherwise
available) at that known central directory. It only makes sense that
that CI setup also exports BR2_DL_DIR in the environment too. Doing
so also ensures that no legacy is stored in a defconfig, so that old
commits can still be built in a newer CI setup (e.g. one where the
central directory was moved).

> Is that commit talking about when BR2_DL_DIR is 'set' as an environment
> variable or as a value you 'set' in a config using menuconfig?

This was about not saving the Kconfig (menuconfig) variable. The environment
variable had never been saved into the saved defconfig.

> However, I would assume if it's left configurable in the menuconfig
> that it would be preserved in a minimalized version of that config.

I believe that this is mostly a historical accident that this is
configurable in the menuconfig. Such site-local settings are not really
configuration defining the target filesystem; rather, they settings that
drive and control how the build is performed, not its output. As such
they should not be part of the configuration.

However, I've reverted that patch now, with commit 1482ef6bb8.

Thanks for the report.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
