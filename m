Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD38ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF70405A2;
	Sun,  4 Sep 2022 21:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF70405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7-ViMvbvVnP; Sun,  4 Sep 2022 21:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABA1D4052C;
	Sun,  4 Sep 2022 21:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA1D4052C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEE91BF35E
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DD034085F
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 21:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DD034085F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcZerdKkid_K for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 21:04:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A34B140302
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A34B140302
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 21:04:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b16so8959181wru.7
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 14:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=A5s1jlHcfzljN2RCMCmq5gMDlFSrEutxMG6L4zSHzFI=;
 b=mA71qfm0VACT29M29uehssD1bbMD15elMrl1fJTk1DSRfRc8QaC6pIbHaV92UhDwtE
 KcwPMMAH8CN8f7RZ4kolpqhp5ucnxOnDGg8E2zF1699qIX2L2AXw8bdTgWoIj3uow4V2
 eGQK/MAwyFSP7N9gV14EjAmwEiNg6TrZOH0vdouCCIcL7PJDwjiev6kLSivPvg0fn4vZ
 Sxb3xS0I+XLnbzm9BVERFZeROTCtDe0TlRMEtPGtExqOcDOM7/I3uKkS0WjyZ5Mr3lao
 JUp09CcKgZGMm3NjgS0zvQdXfYuCi8nBgosDD4hcJFyuDt9xDCW9swjJL5G/aooPbDne
 QL8Q==
X-Gm-Message-State: ACgBeo1vY7HMV8vgK5OckZtmSpDPn1vFUgit2hT7UzByGnCT2AGTfCLg
 WgQeJUQRzzSH5iu7CpFfhJv9D8RCZOA=
X-Google-Smtp-Source: AA6agR6njPtV9NtH7PJgOHD8wRJDHT9lKX8qFlanqXp3qzzh4UWrcBi1NWI/PyIPaoIdhSWFgKHK/w==
X-Received: by 2002:a05:6000:682:b0:226:e78d:2d7a with SMTP id
 bo2-20020a056000068200b00226e78d2d7amr13830420wrb.103.1662325494601; 
 Sun, 04 Sep 2022 14:04:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d58cc000000b00228933481dbsm921914wrf.47.2022.09.04.14.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:04:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 23:04:48 +0200
Message-Id: <20220904210448.211963-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=A5s1jlHcfzljN2RCMCmq5gMDlFSrEutxMG6L4zSHzFI=;
 b=d6ugH3tAMGXIigGA6YpO55XciYHShD+kQddKUSRrrQf94vThEai8P43uvd6aeCVEAs
 oiSfo5kebLZ9Ky8BZYBSL5ESD2Rvtn/foLBFWIlT4ByUobORZGj2r1GH25hw/DFDA8qU
 Y/aJfMhozCJbE6xVSL+caTgLNOMty1TSLgssNwFUs6NaWK4IRBTNSwqp4cF6VjrKOtQI
 l+7iVNITcKYfJ/wZfc60AZ8aDQyiBRkemUo5wTWepw9l2zxZK5Q76fy/C7HQ3yNJQxKP
 MasGtoP/WQifg0ABWNgjlr7p7JQ0whlH7hWdm4MGjaZaSv/jNi2xWl7fm1BrXNx81wQ5
 zT6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d6ugH3tA
Subject: [Buildroot] [PATCH 1/1] package/minidlna: security bump to version
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Improved DNS rebinding attack protection.
- Fixed a potential crash in SSDP request parsing.
- Drop patch (already in version)

https://sourceforge.net/projects/minidlna/files/minidlna/1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rotect-against-DNS-rebinding-attacks.patch | 66 -------------------
 package/minidlna/minidlna.hash                |  6 +-
 package/minidlna/minidlna.mk                  |  5 +-
 3 files changed, 4 insertions(+), 73 deletions(-)
 delete mode 100644 package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
