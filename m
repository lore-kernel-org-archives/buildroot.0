From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:44:51 +0200
Subject: [Buildroot] [git commit] package/postgresql: fix snprintf()
	detection
Message-ID: <20160522194458.1B8E5807E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02c43157ab09f6fe4078fd1145fc9d403d66c089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.busybox.net/buildroot/commit/package/postgresql/postgresql.mk?id=3d3f70b567718ae308b5704ddd7d107c4849309e
forced postgresql not to use its own snprintf() implementation which
needs libm. This fix got broken after this upstream commit

http://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=ce486056ecd28050f367894a2b5aad3656d37511#patch1

changed the variable name from
  pgac_cv_snprintf_long_long_int_format
to
  pgac_cv_snprintf_long_long_int_modifier

leading to problems in the rsyslog package while detecting postgresql
support.

Fixes
http://autobuild.buildroot.net/results/1cd/1cda32983fdf9522e4a9d48cc1304cc1451771a9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3572821..584ab47 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -12,7 +12,7 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
-		      pgac_cv_snprintf_long_long_int_format="%lld" \
+		      pgac_cv_snprintf_long_long_int_modifier="%lld" \
 		      pgac_cv_snprintf_size_t_support=yes
 POSTGRESQL_CONF_OPTS = --disable-rpath
 
