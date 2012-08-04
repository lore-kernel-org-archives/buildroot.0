From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 23:43:54 +0200
Subject: [Buildroot] [git commit] sudo: fix main executable permissions
Message-ID: <20120804214853.4B96497018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sudo executable is installed without the setuid bit set, which prevents
sudo from working.

This patch adds a post-install hook to fix the permissions of the sudo
executable.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sudo/sudo.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9b0ebed..15e06fa 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -14,4 +14,8 @@ SUDO_CONF_OPT = \
 		--without-interfaces \
 		--without-pam
 
+define SUDO_PERMISSIONS
+/usr/bin/sudo			 f 4755	0 0 - - - - -
+endef
+
 $(eval $(autotools-package))
