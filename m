From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:20:05 +0100
Subject: [Buildroot] [git commit] package/git: add optional support for pcre2
Message-ID: <20171201205335.7D7E27FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c2a54a542d703609fa851195d6984b765d21314
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Renamed --with-libpcre to --with-libpcre1. Currently --with-libpcre
activates pcre1 support but this can change in the future to pcre2:
https://github.com/git/git/blob/df7fd961a9d9ba60840ffc0868d36cc3db2aec74/configure.ac#L258

Please note that we cannot use --with-/--without because it will lead
to an error reported by configure, for example

    --with-libpcre1 --without-libpcre2

will produce

configure: error: Only supply one of --with-libpcre1 or --with-libpcre2!

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 181e742..6269dc5 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -19,9 +19,12 @@ else
 GIT_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+GIT_DEPENDENCIES += pcre2
+GIT_CONF_OPTS += --with-libpcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 GIT_DEPENDENCIES += pcre
-GIT_CONF_OPTS += --with-libpcre
+GIT_CONF_OPTS += --with-libpcre1
 GIT_MAKE_OPTS += NO_LIBPCRE1_JIT=1
 else
 GIT_CONF_OPTS += --without-libpcre
