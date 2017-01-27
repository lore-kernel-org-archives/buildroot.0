From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 20:21:19 +1300
Subject: [Buildroot] [git commit] sngrep: fix error if gnutls and openssl
	are both enabled
Message-ID: <20170127072421.067837FA9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5391ca453eb21c5dba9a0a6252b4f4eb995247b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnutls and openssl support can't be enabled at the same time in
sngrep. Prefer openssl if available, otherwise use gnutls.

Fixes:

  http://autobuild.buildroot.net/results/7c775b1faf7be90fb4acd3653600f7b6b48aa86f/

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas:
 - regroup CONF_OPTS lines
 - add an 'else' clause to explicitly disable gnutls and openssl when
   none are available
 - add a reference to the autobuilder failure]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sngrep/sngrep.mk | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index f504771..b4b91c9 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -14,18 +14,15 @@ SNGREP_DEPENDENCIES = libpcap ncurses
 # our ncurses wchar support is not properly detected
 SNGREP_CONF_OPTS += --disable-unicode
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SNGREP_DEPENDENCIES += gnutls
-SNGREP_CONF_OPTS += --with-gnutls
-else
-SNGREP_CONF_OPTS += --without-gnutls
-endif
-
+# openssl and gnutls can't be enabled at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SNGREP_DEPENDENCIES += openssl
-SNGREP_CONF_OPTS += --with-openssl
+SNGREP_CONF_OPTS += --with-openssl --without-gnutls
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SNGREP_DEPENDENCIES += gnutls
+SNGREP_CONF_OPTS += --with-gnutls --without-openssl
 else
-SNGREP_CONF_OPTS += --without-openssl
+SNGREP_CONF_OPTS += --without-gnutls --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
