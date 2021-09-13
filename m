Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354BCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 045C660FA0
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 045C660FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDEF380EC5;
	Mon, 13 Sep 2021 21:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wV3eoQ2ho-ej; Mon, 13 Sep 2021 21:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 237E980E83;
	Mon, 13 Sep 2021 21:06:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A597E1BF318
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7785640299
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYJHbpUMQ6h7 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68D52402E3
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567054;
 bh=H7rxI8o1gF1eIp/IgHkPZ4WJPXztFaM0dg2CM/pPJpc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=dyGWhxSjXWyUd3HCuvIhXxI4+TWlE3Zh9LCrhOksMHhnhgemIEt+Waoe67uXk+37T
 DG1zt9BS6VZvqJYgHV8g2iMvRzR91a7STzgneHC6n2gpbX7EVvoLM9OjocedsRyds6
 EmA/PYsfPrxfAcVcEg0XWgtUd9Je9lNOjmdnfVRM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MzQg6-1nCCM93UEC-00vPhp for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:13 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:07 +0200
Message-Id: <20210913210412.24042-9-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mi8pY8fQ6A+UM+qldBdBXWKhbINc5iip7VOj/9HqZdkIbWv2aFo
 g5WGnaa4en0t4UL97oMrfI+tZjczZfydy9Tmn9SQOfIDkuFa3jaIpvkD9hQsjyzjUG8/oWM
 Ez/2a40dT7aQ4OkF940ij/0Hq7X23ZEUSFkhh7p3/EwnK5lPLzZLf9M41ZIS/GBC83JDavW
 cQiiXjp9fmmp4R1AXVbKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BXsHS0tXyFI=:TpjWLKFeHfgWDeVCkaD8Vm
 93g9AmKSbQIRJ6Z0ZPjEiWyRpMTXffGYELrqDop49B9vN8F3gxMDwM3u+yvLPr+mgGGGwfrnu
 9H861skOlBZ87tn3VydNxw8+CMgoyKHrFkTa1r4NoyzE/e/xEkAnQAVnipN/hGc5G0BqvH7Ym
 wPOxD1W7kjpN1DkMREhpYTpbGOjlEvo9hIqrR41qB0IqSUzPUmVOomsWSFilDV7rtcgAn59a4
 NXT7KwRgwWOynSu4GD+3tG4YCVztyCda32Lw2OaGdi/Kk2ZR9AGbrhCv8b5Qg5UROLm8wOX8G
 m/bFoHKVfGxyAUQ7PEz15cOfYIwQl1LUX4nB7Y3DehQsgUHDtt5dk33iYtqt+f7yz3rVIPY8B
 7/DVAg39cFi+LbUA2+DrlZ1jruYdp/6Awto/fXYJOfM5GYdYQyZTiTtcNIw0l8DsaVhhvKrZp
 DCEiGnifRYKpwVPyBnFU1cC7zqChVyIolcwTzgBdKJlodwiwjwWoyEIkcfeQBQ45SpGacYN2s
 CExRV34Wiw0wULx7FswEhxw91UFoAovrHBBm2mlvqO2rm6wfFjXhgsFCUqFw5gsCA+K8h2TUy
 rblcT+FmFXtZVBI8uoTAdbgzsQVh+4YFqcAYWpDflPMngsZW9UCtx+ZO8sk1d+laUU2JEFq6Z
 1LqkNu6xHqgRH3XNurxCQopKP2hy9f545MFb+FB7CB/IUtjNEOUSQR768zDbLwKnDdsyIAfQv
 YVze0yQp0LFpPc3fZn0qq/jFlxePPEuqbAl9gOgk+8jh4pnDgxMofIntFQ2vReex8IZt+nQSi
 akUVTUkS7r/Xb387cE1WjLA/sep9nNpLrEG9BlFV0ZzxKCF/9R6O2XxFTESucRnZ02fEyG/+b
 1C5A7tjBZoIx+iwkUl67Z7OYtzekp8aBmybbVJEiNbnNxo6WBzGLz/5pio+GTkVHMegXaYBIx
 fO8udKnwihA9hI+QpGshvWZEadDBAe8wc9++fhxrrIjStawqbh4adQsgVN38Da5EgplRZf476
 AZy1lfFRBo5l3TrP5gHp566uIBAhA6A6hIyoOYpsYjeS1kRWt+ZWKA8hERw50keXusUnyMfRv
 tknb6NXWmusqHI=
Subject: [Buildroot] [PATCH v1 08/13] package/gst1-vaapi: bump version to
 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 10986d3c82..b0c19fc600 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.4.tar.xz.sha256sum
-sha256  92db98af86f3150d429c9ab17e88d2364f9c07a140c8f445ed739e8f10252aea  gstreamer-vaapi-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.5.tar.xz.sha256sum
+sha256  4a460fb95559f41444eb24864ad2d9e37922b6eea941510310319fc3e0ba727b  gstreamer-vaapi-1.18.5.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 411a326956..497c6df0d3 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.18.4
+GST1_VAAPI_VERSION = 1.18.5
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
