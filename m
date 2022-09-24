Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B49C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 17:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61D7A41D19;
	Sat, 24 Sep 2022 17:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61D7A41D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vqy9WhK3-ImH; Sat, 24 Sep 2022 17:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3570F417AA;
	Sat, 24 Sep 2022 17:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3570F417AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D98B1BF215
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 17:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54C54417AA
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 17:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C54417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22VEv5ZTtGE3 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 17:34:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D954A41758
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D954A41758
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 17:34:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g3so4348969wrq.13
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 10:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=mNNW8arXhbNJbZS5ziJE4BK/u0oFSJceWpaGuu90XuU=;
 b=Fd6wUKALPiIlV3lsRcPe25Ql3qIARlrugUnisJaSW6RWpaV7I73XX4owQSqy98vM0u
 B07ZXmnrkRpWy1gRn69ZhO3khcPRgtaFxdbrFDm/W2VTgjxAP6CwXdwAQSFfvnV82ij6
 2/KZYmCC5lhiV8Hua+/FWM8gML4CiM0D6Eszn4D29+9GQZKtPlB1RuKbu7AH29fKsDLb
 0Z/Nq6qUtwD3sqsnYRFIuCUHGYkFo28qCM2LZOsDdhwAFkMeHrVVXmck3GZDFwBnvaUM
 kyl+CIpqHZYib8WEe/azOyEVlXlwmSYB1yt93spvTwQCRN6SgSVpODsWET++GuzEJVVl
 GA5A==
X-Gm-Message-State: ACrzQf33g7C9vew3YxsKr/WDxbmlL9holVF2LTCyP9Fwa+H+zUgWrfbC
 GFChqMR3oHuxVr7J7IYTj8OgkPDP8Nk=
X-Google-Smtp-Source: AMsMyM5/9rr4oQZREAfhdF1igSe43/QMYu/L07lEBLN1RsRRZLfhkhW+D8XFtO87oGbuCaouPZ+0RQ==
X-Received: by 2002:adf:d1ec:0:b0:228:d9ea:cbd2 with SMTP id
 g12-20020adfd1ec000000b00228d9eacbd2mr8679109wrd.609.1664040858612; 
 Sat, 24 Sep 2022 10:34:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003a5f3f5883dsm6217059wmq.17.2022.09.24.10.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 10:34:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 19:34:14 +0200
Message-Id: <20220924173414.5970-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=mNNW8arXhbNJbZS5ziJE4BK/u0oFSJceWpaGuu90XuU=;
 b=TQeWPgFZw91eJTjalPRcrWHuqfsGIxgzc423sFAijXwHT5A1ZCMdhTyUkVNeYlIbQD
 5UGTMQEhz0omYtfquboDfVlxl1dC9P4cH0AQlkKoIELcEO4BrFGAqWkMmKHLIEPzVYr8
 gujz1QVgGX9BRaj/D6PXcSmD9VgZ2PFoaDBRCyK//dTjqVs5SUDM24ZYb93Nf4hZbwYZ
 EG9V5Ijwmn4+5gltY7KTf0nnH9jSlqADMP9m/y80xW1YrFkInOO75C7GSC6bMDTH78Dm
 g8J81IKP3sRNNp8uqwymXyp57Lc6vNvyDXVuJLUkVrHVBAk9mESrxLdGPy58YW462n87
 FqtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TQeWPgFZ
Subject: [Buildroot] [PATCH 1/1] package/tinyproxy: fix CVE-2022-40468
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tinyproxy commit 84f203f and earlier does not process HTTP request lines
in the process_request() function and is using uninitialized buffers.
This vulnerability allows attackers to access sensitive information at
system runtime.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...up-in-error-page-in-invalid-requests.patch | 32 +++++++++++++++++++
 package/tinyproxy/tinyproxy.mk                |  3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch

diff --git a/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch b/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
new file mode 100644
index 0000000000..da9c21a41a
--- /dev/null
+++ b/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
@@ -0,0 +1,32 @@
+From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 8 Sep 2022 15:18:04 +0000
+Subject: [PATCH] prevent junk from showing up in error page in invalid
+ requests
+
+fixes #457
+
+[Retrieved from:
+https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/reqs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index bce69819..45db118d 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
+                 goto fail;
+         }
+ 
++        /* zero-terminate the strings so they don't contain junk in error page */
++        request->method[0] = url[0] = request->protocol[0] = 0;
++
+         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
+                       request->method, url, request->protocol);
++
+         if (ret == 2 && !strcasecmp (request->method, "GET")) {
+                 request->protocol[0] = 0;
+ 
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 6b5a3f9625..e91a886888 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -11,4 +11,7 @@ TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VENDOR = tinyproxy_project
 
+# 0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
+TINYPROXY_IGNORE_CVES += CVE-2022-40468
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
