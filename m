From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 23:01:32 +0300
Subject: [Buildroot] [PATCH 2/2] postgresql: fix ZIC configure variable
	assignment
In-Reply-To: <b782d1949e86cb4f2479ffac8fc47dffda0d1b9f.1443556892.git.baruch@tkos.co.il>
References: <b782d1949e86cb4f2479ffac8fc47dffda0d1b9f.1443556892.git.baruch@tkos.co.il>
Message-ID: <7faff32466eadac25bc783c3f81f5f2e5f353815.1443556892.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'ZIC=$$(ZIC)' assignment is seen as 'ZIC=$(ZIC)' by the shell, that
interprets that as command substitution causing an error like:

/bin/sh: ZIC: command not found

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2bad6b4d0547..e710e928d901 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -50,7 +50,7 @@ POSTGRESQL_DEPENDENCIES += tzdata
 POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
 else
 POSTGRESQL_DEPENDENCIES += host-zic
-POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
+POSTGRESQL_CONF_ENV += ZIC="$(ZIC)"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.5.3
