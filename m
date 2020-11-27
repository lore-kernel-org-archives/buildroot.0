From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2020 17:51:08 +0100
Subject: [Buildroot] [git commit] package/minidlna: security bump version to
 1.3.0
Message-ID: <20201127163737.1E70D86666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30f6776c79d2e2cebd61bcef805ea4e1cfaa8055
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://sourceforge.net/p/minidlna/git/ci/master/tree/NEWS

Fixes CVE-2020-28926 & CVE-2020-12695.

Removed patch 0001 which was applied upstream:
https://sourceforge.net/p/minidlna/git/ci/b5e75ff7d160a02632cab416ff0af66504c7db8b/

Removed patch 0002 which was not applied upstream, upstream applied
a different fix for CVE-2020-12695:
https://sourceforge.net/p/minidlna/git/ci/06ee114731612462eb1eb1266f0431ccf59269d2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/0001-fix-build-with-gcc-10.patch  |  49 --------
 ....c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch | 133 ---------------------
 package/minidlna/minidlna.hash                     |   7 +-
 package/minidlna/minidlna.mk                       |   2 +-
 4 files changed, 4 insertions(+), 187 deletions(-)

diff --git a/package/minidlna/0001-fix-build-with-gcc-10.patch b/package/minidlna/0001-fix-build-with-gcc-10.patch
deleted file mode 100644
index 521d17f0ca..0000000000
--- a/package/minidlna/0001-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 90e88764f0fb3d981cd0c3cfd07d63323cc64090 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 1 Sep 2020 22:55:24 +0200
-Subject: [PATCH] fix build with gcc 10
-
-Define setjmp_buffer as static to avoid the following build failure with
-gcc 10 (which defaults to -fno-common):
-
-/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: image_utils.o:(.bss+0x0): multiple definition of `setjmp_buffer'; metadata.o:(.bss+0x0): first defined here
-collect2: error: ld returned 1 exit status
-
-Fixes:
- - http://autobuild.buildroot.org/results/8754bb4f7d749f999d5f8ddfec587470ceec4476
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- image_utils.c | 2 +-
- metadata.c    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/image_utils.c b/image_utils.c
-index 24cfd08..e8d9635 100644
---- a/image_utils.c
-+++ b/image_utils.c
-@@ -190,7 +190,7 @@ jpeg_memory_src(j_decompress_ptr cinfo, const unsigned char * buffer, size_t buf
- 	src->pub.bytes_in_buffer = bufsize;
- }
- 
--jmp_buf setjmp_buffer;
-+static jmp_buf setjmp_buffer;
- /* Don't exit on error like libjpeg likes to do */
- static void
- libjpeg_error_handler(j_common_ptr cinfo)
-diff --git a/metadata.c b/metadata.c
-index 9cd86dc..4781db7 100644
---- a/metadata.c
-+++ b/metadata.c
-@@ -502,7 +502,7 @@ GetAudioMetadata(const char *path, const char *name)
- }
- 
- /* For libjpeg error handling */
--jmp_buf setjmp_buffer;
-+static jmp_buf setjmp_buffer;
- static void
- libjpeg_error_handler(j_common_ptr cinfo)
- {
--- 
-2.28.0
-
diff --git a/package/minidlna/0002-upnphttp.c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch b/package/minidlna/0002-upnphttp.c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch
deleted file mode 100644
index 7406ce2e9e..0000000000
--- a/package/minidlna/0002-upnphttp.c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 51bfbee51fd0376b5a66c944134af3e9972d8592 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 6 Sep 2020 11:22:48 +0200
-Subject: [PATCH] upnphttp.c: fix CallStranger a.k.a. CVE-2020-12695
-
-Import CheckCallback function from miniupnpd source code:
-https://github.com/miniupnp/miniupnp/commit/0d9634658860c3c8c209e466cc0ef7002bad3b0a
-
-IPv6 code was kept even if minidlna does not support it currently.
-
-This code is licensed under BSD-3-Clause like minidlna.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://sourceforge.net/p/minidlna/support-requests/71]
----
- upnphttp.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++------
- 1 file changed, 82 insertions(+), 10 deletions(-)
-
-diff --git a/upnphttp.c b/upnphttp.c
-index 974434e..3be793e 100644
---- a/upnphttp.c
-+++ b/upnphttp.c
-@@ -742,6 +742,70 @@ check_event(struct upnphttp *h)
- 	return type;
- }
- 
-+/**
-+ * returns 0 if the callback header value is not valid
-+ * 1 if it is valid.
-+ */
-+static int
-+checkCallbackURL(struct upnphttp * h)
-+{
-+	char addrstr[48];
-+	int ipv6;
-+	const char * p;
-+	int i;
-+
-+	if(!h->req_Callback || h->req_CallbackLen < 8)
-+		return 0;
-+	if(memcmp(h->req_Callback, "http://", 7) != 0)
-+		return 0;
-+	ipv6 = 0;
-+	i = 0;
-+	p = h->req_Callback + 7;
-+	if(*p == '[') {
-+		p++;
-+		ipv6 = 1;
-+		while(*p != ']' && i < (sizeof(addrstr)-1)
-+		      && p < (h->req_Callback + h->req_CallbackLen))
-+			addrstr[i++] = *(p++);
-+	} else {
-+		while(*p != '/' && *p != ':' && i < (sizeof(addrstr)-1)
-+		      && p < (h->req_Callback + h->req_CallbackLen))
-+			addrstr[i++] = *(p++);
-+	}
-+	addrstr[i] = '\0';
-+	if(ipv6) {
-+		struct in6_addr addr;
-+		if(inet_pton(AF_INET6, addrstr, &addr) <= 0)
-+			return 0;
-+#ifdef ENABLE_IPV6
-+		if(!h->ipv6
-+		  || (0!=memcmp(&addr, &(h->clientaddr_v6), sizeof(struct in6_addr))))
-+			return 0;
-+#else
-+		return 0;
-+#endif
-+	} else {
-+		struct in_addr addr;
-+		if(inet_pton(AF_INET, addrstr, &addr) <= 0)
-+			return 0;
-+#ifdef ENABLE_IPV6
-+		if(h->ipv6) {
-+			if(!IN6_IS_ADDR_V4MAPPED(&(h->clientaddr_v6)))
-+				return 0;
-+			if(0!=memcmp(&addr, ((const char *)&(h->clientaddr_v6) + 12), 4))
-+				return 0;
-+		} else {
-+			if(0!=memcmp(&addr, &(h->clientaddr), sizeof(struct in_addr)))
-+				return 0;
-+		}
-+#else
-+		if(0!=memcmp(&addr, &(h->clientaddr), sizeof(struct in_addr)))
-+			return 0;
-+#endif
-+	}
-+	return 1;
-+}
-+
- static void
- ProcessHTTPSubscribe_upnphttp(struct upnphttp * h, const char * path)
- {
-@@ -759,17 +823,25 @@ ProcessHTTPSubscribe_upnphttp(struct upnphttp * h, const char * path)
- 		 * - respond HTTP/x.x 200 OK 
- 		 * - Send the initial event message */
- 		/* Server:, SID:; Timeout: Second-(xx|infinite) */
--		sid = upnpevents_addSubscriber(path, h->req_Callback,
--		                               h->req_CallbackLen, h->req_Timeout);
--		h->respflags = FLAG_TIMEOUT;
--		if (sid)
--		{
--			DPRINTF(E_DEBUG, L_HTTP, "generated sid=%s\n", sid);
--			h->respflags |= FLAG_SID;
--			h->req_SID = sid;
--			h->req_SIDLen = strlen(sid);
-+		/* Check that the callback URL is on the same IP as
-+		 * the request, and not on the internet, nor on ourself (DOS attack ?) */
-+		if(checkCallbackURL(h)) {
-+			sid = upnpevents_addSubscriber(path, h->req_Callback,
-+				                       h->req_CallbackLen, h->req_Timeout);
-+			h->respflags = FLAG_TIMEOUT;
-+			if (sid)
-+			{
-+				DPRINTF(E_DEBUG, L_HTTP, "generated sid=%s\n", sid);
-+				h->respflags |= FLAG_SID;
-+				h->req_SID = sid;
-+				h->req_SIDLen = strlen(sid);
-+			}
-+			BuildResp_upnphttp(h, 0, 0);
-+		} else {
-+			DPRINTF(E_WARN, L_HTTP, "Invalid Callback in SUBSCRIBE %.*s",
-+	       		       h->req_CallbackLen, h->req_Callback);
-+			BuildResp2_upnphttp(h, 412, "Precondition Failed", 0, 0);
- 		}
--		BuildResp_upnphttp(h, 0, 0);
- 	}
- 	else if (type == E_RENEW)
- 	{
--- 
-2.28.0
-
diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
index 608970b1c3..175fe67304 100644
--- a/package/minidlna/minidlna.hash
+++ b/package/minidlna/minidlna.hash
@@ -1,7 +1,6 @@
-# From https://sourceforge.net/projects/minidlna/files/minidlna/1.2.1/
-md5 a968d3d84971322471cabda3669cc0f8  minidlna-1.2.1.tar.gz
-sha1 79d0032c7055aefd4c8e5178bc86fbf258d449d2  minidlna-1.2.1.tar.gz
+# From https://sourceforge.net/projects/minidlna/files/minidlna/1.3.0/
+sha1  6563a881884879b2aef52611934e08bb42985964  minidlna-1.3.0.tar.gz
 # Locally computed
-sha256  67388ba23ab0c7033557a32084804f796aa2a796db7bb2b770fb76ac2a742eec  minidlna-1.2.1.tar.gz
+sha256  47d9b06b4c48801a4c1112ec23d24782728b5495e95ec2195bbe5c81bc2d3c63  minidlna-1.3.0.tar.gz
 sha256  79146b7f558e56510b9a714ff75318c05ab93aeccfd6597497b9bce212cf92ea  COPYING
 sha256  94876d7886116e176e702b4902bd9f19731a6883db5f229ac2a7058a22aa6529  LICENCE.miniupnpd
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index c66e97b073..0bb3dd3502 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.2.1
+MINIDLNA_VERSION = 1.3.0
 MINIDLNA_SITE = https://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
