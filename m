From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Oct 2015 20:43:23 +0000 (UTC)
Subject: [Buildroot] [Bug 8421] util-linux installs systemd files in
	output/target/home/
In-Reply-To: <bug-8421-163@https.bugs.busybox.net/>
References: <bug-8421-163@https.bugs.busybox.net/>
Message-ID: <20151022204323.593BB80E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8421

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> 2015-10-22 20:43:23 UTC ---
Hi,

I've committed a fix to disable systemd support in util-linux. You must have
ended up with the problem by rebuilding util-linux after building systemd,
because system depends on util-linux, so it gets built before systemd and will
not be able to find the systemd .pc files.

We cannot enable systemd support as that would cause a circular dependency.

commit 762b64daa2fd1424053754ed55d0f9704ccc2405
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Thu Oct 22 22:36:50 2015 +0200

    util-linux: disable systemd support

    Fixes (works around) #8421

    Util-linux has optional systemd support, but we cannot enable it as systemd
    depends on util-linux, so that would create a circular dependency.

    The systemd unit directory location detection also fails as pkg-config
    0.9.12+ prefixes all directory variables with the sysroot, and the
configure
    script expects to see the target location, so disable that as well for good
    measure.

    The systemd support doesn't seem to add much, so it isn't a big loss.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
