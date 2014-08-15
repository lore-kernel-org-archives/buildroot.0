From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Aug 2014 13:52:21 +0000 (UTC)
Subject: [Buildroot] [Bug 7322] libgomp dependency issue with imagemagick
In-Reply-To: <bug-7322-163@https.bugs.busybox.net/>
References: <bug-7322-163@https.bugs.busybox.net/>
Message-ID: <20140815135221.5A14F9D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7322

--- Comment #4 from Samuel Martin <s.martin49@gmail.com> 2014-08-15 13:52:21 UTC ---
I agree about disabling OpenMP support for imagemagick for the release.

However, for the long-term solution, I would perfer having a knob and a check
for external toolchain.

Having a knob allows to avoid relying on the package's build-system black
magics, so one excatly knows how a package is configure/built, so what is put
in its image.
E.g. OpenCV can takes benefit from OpenMP but it is disabled
(http://git.buildroot.net/buildroot/commit/package/opencv/opencv.mk?id=2abfd50aefdc89cf1b858c6c965a5e7d94a413b4),
mostly because of the magics that is done at configure time:
- if you don't ask for OpenMP support (default) or force ot be off, then it is
disabled;
- if you ask for OpenMP support:
  - if OpenMP is found, then it is enabled;
  - if OpenMP is not found, then it is disabled.

So, in the OpenCV case, if we don't have a knob, we should always ask for
OpenMP support on the configure cmdline to get it only if available.

This is completely missleading for the buildroot user, that will see
"-DWITH_OPENMP=ON" in the package/opencv.mk file, but he/she won't get OpenMP
support without any warning (unless he/she carefully read the build logs) if
its toolchain does not have it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
