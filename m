From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:34:26 +0200
Subject: [Buildroot] [git commit] package/bird: make RIP optional
Message-ID: <20190928213049.0DCDE8287D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=722b977af96e9758d5d478300b08688b6a72aabb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 529fef57f6f46201ba16349b49c0a65ceccc4c25 ("package/bird: add
optional protocols") we added options to conditionally enable
different protocol support. However, disabling the RIP support was not
working, so it remained forcefully enabled, and there was no
BR2_PACKAGE_BIRD_RIP option.

However, since the bump to 2.0.6 in commit
b9f43ade0fbce38b803214c167df52ca7fd3ee03, this issue has been fixed,
so we can introduce the BR2_PACKAGE_BIRD_RIP option, and make it
really optional.

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bird/Config.in | 5 +++++
 package/bird/bird.mk   | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index 22c39f8488..c2951c74c3 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -67,6 +67,11 @@ config BR2_PACKAGE_BIRD_RADV
 	help
 	  Enable RAdv protocol.
 
+config BR2_PACKAGE_BIRD_RIP
+	bool "rip"
+	help
+	  Enable RIP protocol.
+
 config BR2_PACKAGE_BIRD_STATIC
 	bool "static"
 	help
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 267968afb1..46c868ac30 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -17,9 +17,7 @@ else
 BIRD_CONF_OPTS += --disable-client
 endif
 
-# BUG: RIP is mandatory for now
 BIRD_PROTOCOLS = \
-	rip \
 	$(if $(BR2_PACKAGE_BIRD_BFD),bfd) \
 	$(if $(BR2_PACKAGE_BIRD_BABEL),babel) \
 	$(if $(BR2_PACKAGE_BIRD_BGP),bgp) \
