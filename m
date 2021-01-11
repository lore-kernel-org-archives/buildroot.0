From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 11 Jan 2021 15:45:51 -0800
Subject: [Buildroot] Host tar 1.32 build issues
Message-ID: <CAGt4E5srq1hg4T1YoKX9UUCTJ96DdnNL1XFrYvsgpWjM_KM1EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I noticed that host tar is no longer locked to 1.29 and has been
bumped to 1.32. The only problem is that the host tar build requires
tar in CPIO format, and that 1.32 does not exist as CPIO archive on
the official server. As per http://mirror.sergal.org/gnu/tar/, tar
1.31 is the latest that has a CPIO archive. 1.32 and 1.33 do not.

Naturally, that currently causes the build to fail if
BR2_FORCE_HOST_BUILD is enabled.

I don't know if the absence of CPIO archives is temporary or
permanent. It might be better to use tar-latest.cpio.gz as the host
tar version to prevent this issue from happening again in the future.

-HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
+HOST_TAR_SOURCE = tar-latest.cpio.gz

I tried this out and, while it would be nice, it doesn't seem to be
possible to do it this way, because the directory inside the tar-ball
is the actual version number. It would try to use
"build/host-tar-last/tar-last/*" which doesn't exist, and the build
still fails.

The only way I have been able to get past the problem was to
reintroduce the host specific TAR variables that were removed and to
hard-code them to 1.31 (rather than 1.29 as it was before).

What's your take on this?

Thanks,
-Markus
