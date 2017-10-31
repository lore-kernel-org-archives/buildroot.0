From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Oct 2017 09:16:25 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: add optional support for pcre2
In-Reply-To: <20171031081625.13343-1-bernd.kuhls@t-online.de>
References: <20171031081625.13343-1-bernd.kuhls@t-online.de>
Message-ID: <20171031081625.13343-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Renamed --with-libpcre to --with-libpcre1. Currently --with-libpcre
activates pcre1 support but this can change in the future to pcre2:
https://github.com/git/git/blob/df7fd961a9d9ba60840ffc0868d36cc3db2aec74/configure.ac#L258

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/git/git.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 181e7421e2..c797e5fcc6 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -19,12 +19,15 @@ else
 GIT_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+GIT_DEPENDENCIES += pcre2
+GIT_CONF_OPTS += --without-libpcre1 --with-libpcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 GIT_DEPENDENCIES += pcre
-GIT_CONF_OPTS += --with-libpcre
+GIT_CONF_OPTS += --with-libpcre1 --without-libpcre2
 GIT_MAKE_OPTS += NO_LIBPCRE1_JIT=1
 else
-GIT_CONF_OPTS += --without-libpcre
+GIT_CONF_OPTS += --without-libpcre1 --without-libpcre2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-- 
2.11.0
