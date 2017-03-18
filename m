From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:10:19 +0100
Subject: [Buildroot] [git commit] fakeroot: depend on acl
Message-ID: <20170318131148.BB3467FED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a222446b4614a38b4042df54b68b69b96939708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent versions of fakeroot have grown support for acl. We don't really
need this since we don't use acls in Buildroot. However, it turns out
that "cp -a" does something funky with acls, with the result that
fakeroot without acl support looses the ownership and permissions on
the copied file. "cp -a" may be (is even likely to be) used in a
BR2_ROOTFS_POST_FAKEROOT_SCRIPT, so we need to support this.

Note that host-acl itself depends on host-attr, so this pulls in two
extra packages in each build. The impact on build time is about 10s.

Cc: Andreas Naumann <dev@andin.de>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fakeroot/fakeroot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 168cd13..731b06a 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -7,6 +7,8 @@
 FAKEROOT_VERSION = 1.20.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
+
+HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
 # For now these are process capabilities (faked) rather than file
 # so they're of no real use
