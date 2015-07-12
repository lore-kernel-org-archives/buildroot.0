From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 12:43:29 +0200
Subject: [Buildroot] [git commit] c-icap: disable Perl support
Message-ID: <20150712105115.939E77FCAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec154fa413c991290a5661cc9bfc679ef997440
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Perl support in c-icap does not build properly, because it queries
the system-installed Perl for cflags/ldflags, which returns things
like -I/usr/local/include causing build failures since those are
invalid paths when cross-compiling.

Since there is no easy way to fix that without changing c-icap
configure.in, let's disable the Perl support for now, until someone is
interested enough to fix this up.

Fixes:

  http://autobuild.buildroot.org/results/f60/f6011ab8211589fe8e1e8932db9f8be81768d3e6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 51c0f5f..0f42b6c 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -14,6 +14,7 @@ C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
 	--with-process-mutexes=posix \
 	--without-ldap \
+	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
 
@@ -31,13 +32,6 @@ else
 C_ICAP_CONF_OPTS += --without-bzip2
 endif
 
-ifeq ($(BR2_PACKAGE_PERL),y)
-C_ICAP_CONF_OPTS += --with-perl
-C_ICAP_DEPENDENCIES += perl
-else
-C_ICAP_CONF_OPTS += --without-perl
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 C_ICAP_CONF_OPTS += --with-zlib
 C_ICAP_DEPENDENCIES += zlib
