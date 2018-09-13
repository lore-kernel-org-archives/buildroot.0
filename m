From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Sep 2018 12:23:42 +0000
Subject: [Buildroot] [Bug 11346] qt5base-5.11.1 Assertion failed: ret == 0
 after getentropy() inside fillBuffer() on arm
In-Reply-To: <bug-11346-163@https.bugs.busybox.net/>
References: <bug-11346-163@https.bugs.busybox.net/>
Message-ID: <bug-11346-163-LYK4TtcEoc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11346

--- Comment #4 from Philipp Richter <richterphilipp.pops@gmail.com> ---
(In reply to Peter Seiderer from comment #3)

I've tried that in the past but there's still too much missing or partially
implemented in mainline for it to work. I'm keeping an eye on
http://linux-meson.com/doku.php for S805, meson8b to see the progress. But then
again newer boards have a higher priority which is understandable.

I found out that on archlinux arm for qt5base they have :
-no-reduce-relocations
-no-feature-getentropy

enabled in the the configure options by default.

See:
https://github.com/archlinuxarm/PKGBUILDs/blob/master/extra/qt5-base/PKGBUILD

So I added -no-feature-getentropy to the custom configure options in buildroot
like this:

BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS="-no-feature-getentropy"

And it's all well now, working with latest qt5base.

No issue on Raspberry Pi btw so the culprit is of course the old kernel.

I'm not sure where to go with this now, it's an edge case of my particular
setup.

Maybe having an explicit config option appear on the qt5base package for
getentropy() might be useful for people restricted by an old kernel version ?

Or a hint on a wiki might be enough.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
