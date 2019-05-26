From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:08:53 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/postgresql:
 security bump to version 11.3
Message-ID: <20190526091607.ADFD38E152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2568bf88eb8ce7f6949443be28c27e0d9666bf25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

CVE-2019-10129: Memory disclosure in partition routing

Prior to this release, a user running PostgreSQL 11 can read arbitrary bytes
of server memory by executing a purpose-crafted INSERT statement to a
partitioned table.

CVE-2019-10130: Selectivity estimators bypass row security policies

PostgreSQL maintains statistics for tables by sampling data available in
columns; this data is consulted during the query planning process.  Prior to
this release, a user able to execute SQL queries with permissions to read a
given column could craft a leaky operator that could read whatever data had
been sampled from that column.  If this happened to include values from rows
that the user is forbidden to see by a row security policy, the user could
effectively bypass the policy.  This is fixed by only allowing a
non-leakproof operator to use this data if there are no relevant row
security policies for the table.

For more details, see the release notes:
https://www.postgresql.org/about/news/1939/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5ea93e24cb84cea76a977df05f6cd166d4693575)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 8 ++++----
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index c4d7ab55bb..ba6e02d4d8 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,7 +1,7 @@
-# From https://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2.md5
-md5 19d43be679cb0d55363feb8926af3a0f  postgresql-11.2.tar.bz2
-# From https://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2.sha256
-sha256 2676b9ce09c21978032070b6794696e0aa5a476e3d21d60afc036dc0a9c09405  postgresql-11.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.3/postgresql-11.3.tar.bz2.md5
+md5 c2a729b754b8de86a969c86ec25db076  postgresql-11.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.3/postgresql-11.3.tar.bz2.sha256
+sha256 2a85e082fc225944821dfd23990e32dfcd2284c19060864b0ad4ca537d30522d  postgresql-11.3.tar.bz2
 
 # License file, Locally calculated
 sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 8f01460109..cd71bf468d 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 11.2
+POSTGRESQL_VERSION = 11.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
