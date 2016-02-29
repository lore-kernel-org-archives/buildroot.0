From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:45:55 +0100
Subject: [Buildroot] [git commit] package/systemd: add --enable/disable-lz4
Message-ID: <20160302202759.4C4B280203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3734336b59f78051194bfda930f64e75b3f576aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 3 ++-
 package/systemd/systemd.mk | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b7eca3a..afa598b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -56,7 +56,8 @@ config BR2_PACKAGE_SYSTEMD
 	  The selection of other packages will enable some features:
 
 	  - acl package will add support for multi-seat.
-	  - xz package will add compression support in journal and coredump.
+	  - xz and/or l4 packages will add compression support in
+	    journal and coredump.
 	  - libgcrypt package will add support for journal sealing and
 	    DNSSEC verification in resolved.
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3dffbc9..16c4d52 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -87,6 +87,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+SYSTEMD_DEPENDENCIES += lz4
+SYSTEMD_CONF_OPTS += --enable-lz4
+else
+SYSTEMD_CONF_OPTS += --disable-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
 SYSTEMD_CONF_OPTS += --enable-xz
