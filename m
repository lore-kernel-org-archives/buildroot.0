From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon,  3 Nov 2014 09:42:35 -0300
Subject: [Buildroot] [RFC/PATCH] target permissions
Message-ID: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

This patch solves the variablity on target permissions on different
hosts/repos. We should never depend on the umask at any time now.

The default umask was chosen to be 022 since some packages install
binaries on the target rootfs with plain mkdir/cp, so a more permissive
one like 000 would make those binaries world-writable. The --chmod on
rsync behaves similarly to having this same umask.

For the overlay, exceptions to this permission set should be specified
as a device table. The one possible regression I can think of if if
someone uses a pre-build script to set correct permissions on the
overlay before building: those permissions will be reset to 644/755 just
before image creation.

However, if that's not the case I think everything should run smoothly.
Custom permissions set by package makefiles should be respected (unless
overlayed).

Guido Mart?nez (1):
  Makefile: guarantee reproducible permissions

 Makefile                         | 7 ++++---
 support/scripts/shell-wrapper.sh | 5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100755 support/scripts/shell-wrapper.sh

-- 
2.1.1
