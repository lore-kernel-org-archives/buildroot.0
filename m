From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 23:02:01 +0100
Subject: [Buildroot] [git commit] libcurl: re-enable on non-MMU platforms
Message-ID: <20130217221226.3A81A9AB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e32c29a09849b71cb20c964880b9be671132b7b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
