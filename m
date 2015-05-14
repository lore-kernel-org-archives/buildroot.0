From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 May 2015 11:00:44 +0200
Subject: [Buildroot] [git commit] postgresql: avoid AC_TRY_RUN when testing
	snprintf()
Message-ID: <20150514090228.E263E81E17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d3f70b567718ae308b5704ddd7d107c4849309e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few snprintf() compatibility tests in config/c-library.m4 use AC_TRY_RUN
that doesn't work for cross compilation. As a result configure.in decides to
build a bundled implementation of snprintf(). This implementation calls
isnan(), but -lm is missing. This breaks link with libpq.so. Preseed the
correct values to make the configure script happy, and fix rsyslog build.

Fixes:
http://autobuild.buildroot.net/results/e76/e769982e3131581b38698c109c9bc5215e3d5b11/
http://autobuild.buildroot.net/results/2b9/2b9d3edc8341675455bc3b74d1e84c8c0c24c521/
http://autobuild.buildroot.net/results/2a8/2a80357237ed7225823a008b5ff02bab01269814/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 1a6aa88..eda547c 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -11,7 +11,9 @@ POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
-POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes
+POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
+		      pgac_cv_snprintf_long_long_int_format="%lld" \
+		      pgac_cv_snprintf_size_t_support=yes
 POSTGRESQL_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
