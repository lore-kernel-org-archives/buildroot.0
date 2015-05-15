From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 20:23:51 +0200
Subject: [Buildroot] [PATCH 4/6] postgresql: mark as not available for
	static linking
In-Reply-To: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431714233-24324-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

postgresql currently does not build in BR2_STATIC_LIBS=y
configurations, and since there is little interest in using such a big
piece of software in statically linked configuration, this commit
makes postgresql depends on !BR2_STATIC_LIBS.

Fixes:

  http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 4c53703..e9b8f48 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # fork()
+	# fails to build in a pure static linking scenario, and
+	# postgresql is unlikely to be used in a pure statically
+	# linked environment.
+	depends on !BR2_STATIC_LIBS
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
@@ -13,3 +17,6 @@ config BR2_PACKAGE_POSTGRESQL
 	  archives with pg_dump and pg_restore.
 
 	  http://www.postgresql.org
+
+comment "postgresql needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.1.0
