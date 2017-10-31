From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Oct 2017 19:36:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: add optional support for pcre2
In-Reply-To: <20171031183657.27406-1-bernd.kuhls@t-online.de>
References: <20171031183657.27406-1-bernd.kuhls@t-online.de>
Message-ID: <20171031183657.27406-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Renamed --with-libpcre to --with-libpcre1. Currently --with-libpcre
activates pcre1 support but this can change in the future to pcre2:
https://github.com/git/git/blob/df7fd961a9d9ba60840ffc0868d36cc3db2aec74/configure.ac#L258

Please note that we cannot use --with-/--without because it will lead
to an error reported by configure, for example

    --with-libpcre1 --without-libpcre2

will produce

configure: error: Only supply one of --with-libpcre1 or --with-libpcre2!

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed bug when "--with-libpcre1 --without-libpcre2" is used

 package/git/git.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 181e7421e2..6269dc570e 100644
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
-- 
2.11.0
