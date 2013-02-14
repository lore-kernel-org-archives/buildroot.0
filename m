From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 14:50:18 +0100
Subject: [Buildroot] [PATCH] libcurl: re-enable on non-MMU platforms
In-Reply-To: <20130214144713.632dcc63@skate>
References: <20130214144713.632dcc63@skate>
Message-ID: <1360849818-30031-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 9229b82d6326ea425a258b91a9f0157ef6b223b7 ('libcurl: needs MMU'),
the libcurl package was disabled on non-MMU systems, due to the usage
of the fork() function in the library.

However, a deeper inspection reveals that fork() is only used in the
implementation of NTLM, an obscure, undocumented, Microsoft specific
authentication method that apparently isn't common anymore. See
http://curl.haxx.se/docs/manpage.html#--ntlm.

Therefore, this commit re-enables libcurl on non-MMU systems by
explicitly disabling the NTLM support. If someone ever needs NTLM
support in Buildroot's libcurl package, it will always be time to add
a libcurl sub-option to enable it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/Config.in  |    1 -
 package/libcurl/libcurl.mk |    8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 10ee0e4..1d6d08e 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBCURL
 	bool "libcurl"
-	depends on BR2_USE_MMU # Uses fork()
 	help
 	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
 	  and Dict servers, using any of the supported protocols.
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 38ca854..a631953 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -10,7 +10,13 @@ LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
-LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
+
+# We disable NTLM support because it uses fork(), which doesn't work
+# on non-MMU platforms. Moreover, this authentication method is
+# probably almost never used. See
+# http://curl.haxx.se/docs/manpage.html#--ntlm.
+LIBCURL_CONF_OPT = --disable-verbose --disable-manual \
+	--enable-hidden-symbols --disable-ntlm-wb
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
1.7.9.5
