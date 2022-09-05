Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C129CECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 19:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28946409E7;
	Mon,  5 Sep 2022 19:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28946409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoWMZ8TE0XAn; Mon,  5 Sep 2022 19:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB1ED409DD;
	Mon,  5 Sep 2022 19:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB1ED409DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 543CF1BF37E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C72260FA2
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C72260FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gr8XrucMkCUU for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 19:47:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69A3560F57
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 19:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A3560F57
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A97C288251; Mon,  5 Sep 2022 19:32:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Sep 2022 21:46:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f73718ce5efe2cfda8bd3c8fc7cc72e30b2b10f1
X-Git-Newrev: 7713f6dd98946ffecc11b0a91a444fb639d45d7b
X-Patchwork-Hint: ignore
Message-Id: <20220905193239.A97C288251@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minidlna: security bump to version
 1.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7713f6dd98946ffecc11b0a91a444fb639d45d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Improved DNS rebinding attack protection.
- Fixed a potential crash in SSDP request parsing.
- Drop patch (already in version)

https://sourceforge.net/projects/minidlna/files/minidlna/1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ttp-Protect-against-DNS-rebinding-attacks.patch | 66 ----------------------
 package/minidlna/minidlna.hash                     |  6 +-
 package/minidlna/minidlna.mk                       |  5 +-
 3 files changed, 4 insertions(+), 73 deletions(-)

diff --git a/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch b/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
deleted file mode 100644
index 6d601f53b9..0000000000
--- a/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From c21208508dbc131712281ec5340687e5ae89e940 Mon Sep 17 00:00:00 2001
-From: Justin Maggard <jmaggard@arlo.com>
-Date: Wed, 9 Feb 2022 18:32:50 -0800
-Subject: [PATCH] upnphttp: Protect against DNS rebinding attacks
-
-Validate HTTP requests to protect against DNS rebinding.
-
-[Retrieved from:
-https://sourceforge.net/p/minidlna/git/ci/c21208508dbc131712281ec5340687e5ae89e940/]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- upnphttp.c | 17 +++++++++++++++++
- upnphttp.h |  2 ++
- 2 files changed, 19 insertions(+)
-
-diff --git a/upnphttp.c b/upnphttp.c
-index c8b5e99..62db89a 100644
---- a/upnphttp.c
-+++ b/upnphttp.c
-@@ -273,6 +273,11 @@ ParseHttpHeaders(struct upnphttp * h)
- 				p = colon + 1;
- 				while(isspace(*p))
- 					p++;
-+				n = 0;
-+				while(p[n] >= ' ')
-+					n++;
-+				h->req_Host = p;
-+				h->req_HostLen = n;
- 				for(n = 0; n < n_lan_addr; n++)
- 				{
- 					for(i = 0; lan_addr[n].str[i]; i++)
-@@ -909,6 +914,18 @@ ProcessHttpQuery_upnphttp(struct upnphttp * h)
- 	}
- 
- 	DPRINTF(E_DEBUG, L_HTTP, "HTTP REQUEST: %.*s\n", h->req_buflen, h->req_buf);
-+	if(h->req_Host && h->req_HostLen > 0) {
-+		const char *ptr = h->req_Host;
-+		DPRINTF(E_MAXDEBUG, L_HTTP, "Host: %.*s\n", h->req_HostLen, h->req_Host);
-+		for(i = 0; i < h->req_HostLen; i++) {
-+			if(*ptr != ':' && *ptr != '.' && (*ptr > '9' || *ptr < '0')) {
-+				DPRINTF(E_ERROR, L_HTTP, "DNS rebinding attack suspected (Host: %.*s)", h->req_HostLen, h->req_Host);
-+				Send404(h);/* 403 */
-+				return;
-+			}
-+			ptr++;
-+		}
-+	}
- 	if(strcmp("POST", HttpCommand) == 0)
- 	{
- 		h->req_command = EPost;
-diff --git a/upnphttp.h b/upnphttp.h
-index e28a943..57eb2bb 100644
---- a/upnphttp.h
-+++ b/upnphttp.h
-@@ -89,6 +89,8 @@ struct upnphttp {
- 	struct client_cache_s * req_client;
- 	const char * req_soapAction;
- 	int req_soapActionLen;
-+	const char * req_Host;        /* Host: header */
-+	int req_HostLen;
- 	const char * req_Callback;	/* For SUBSCRIBE */
- 	int req_CallbackLen;
- 	const char * req_NT;
--- 
-2.34.1
-
diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
index 175fe67304..e55e5473d3 100644
--- a/package/minidlna/minidlna.hash
+++ b/package/minidlna/minidlna.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/minidlna/files/minidlna/1.3.0/
-sha1  6563a881884879b2aef52611934e08bb42985964  minidlna-1.3.0.tar.gz
+# From https://sourceforge.net/projects/minidlna/files/minidlna/1.3.2/
+sha1  71750adadc34490d52f0b9a930c2731a47f9772d  minidlna-1.3.2.tar.gz
 # Locally computed
-sha256  47d9b06b4c48801a4c1112ec23d24782728b5495e95ec2195bbe5c81bc2d3c63  minidlna-1.3.0.tar.gz
+sha256  222ce45a1a60c3ce3de17527955d38e5ff7a4592d61db39577e6bf88e0ae1cb0  minidlna-1.3.2.tar.gz
 sha256  79146b7f558e56510b9a714ff75318c05ab93aeccfd6597497b9bce212cf92ea  COPYING
 sha256  94876d7886116e176e702b4902bd9f19731a6883db5f229ac2a7058a22aa6529  LICENCE.miniupnpd
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 01ee8d0028..6ca72d9240 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.3.0
+MINIDLNA_VERSION = 1.3.2
 MINIDLNA_SITE = https://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
@@ -12,9 +12,6 @@ MINIDLNA_CPE_ID_VENDOR = readymedia_project
 MINIDLNA_CPE_ID_PRODUCT = readymedia
 MINIDLNA_SELINUX_MODULES = minidlna
 
-# 0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
-MINIDLNA_IGNORE_CVES += CVE-2022-26505
-
 MINIDLNA_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	ffmpeg flac libvorbis libogg libid3tag libexif jpeg sqlite \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
