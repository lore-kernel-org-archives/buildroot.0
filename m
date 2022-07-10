Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF06FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 18:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AA7C4036A;
	Sun, 10 Jul 2022 18:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA7C4036A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBp_3_eEhq1W; Sun, 10 Jul 2022 18:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51D5F4015D;
	Sun, 10 Jul 2022 18:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D5F4015D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 734041BF405
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 18:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 458E641499
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 18:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458E641499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwYvD4WOYVTw for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 18:03:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD1A410E8
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFD1A410E8
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 18:03:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v16so4376042wrd.13
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 11:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6+ap4bfm25H20rVe7iTP2mj/IP2N1BDbRM7G09kMLI=;
 b=P2RdLojoeyS9YcHUwtarrmo6T8hqTGydYEgh/gJWLx5TMDdFn6WTF3OVlVnecooWPi
 t9t4tHhtM/rpmjiP60DzwrT1ApZlmhzO1rzPEgoD88NXBNkXNDAVpkV99wOccNJyjURO
 V4q0TzltM7UB1aCoe13rJrudXRmV5jaGvSkPajiGN/wIEZeaAa5UFLZ19GQOG0UvDaO7
 4je7LqaeCgU8XjxAsZ5CjQwBZuy2gc4G+fnNamNgwesOOsmZXNUBtAyfnsCtqFIBJO9f
 FfcvrMUmzwyULLr1CpNtOsEyCgQ7id5ZCCBckSUPlrJz/L2LyqY8D4s02qqMyhLkVikY
 YxdA==
X-Gm-Message-State: AJIora+7ZbP9NWPjxHbnhbZoa4i1IxT7+DZlCMiK3ItJusJNDJm++kjQ
 xXhLCvS3k09x/1ygK11eUA2mpRNuJAo=
X-Google-Smtp-Source: AGRyM1vAwW6V1R3DkzRbwFkoMDcrK13jbp9MVA9AM9vyL51HVn6mdeOC3AQ+0jkfLgnAMl3inTXbIA==
X-Received: by 2002:adf:dd0d:0:b0:21d:666b:298e with SMTP id
 a13-20020adfdd0d000000b0021d666b298emr13614728wrm.412.1657476187831; 
 Sun, 10 Jul 2022 11:03:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6604000000b0021d650e4df4sm3996669wru.87.2022.07.10.11.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:03:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 20:00:11 +0200
Message-Id: <20220710180011.461082-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6+ap4bfm25H20rVe7iTP2mj/IP2N1BDbRM7G09kMLI=;
 b=ZLjOfL4ie1sVq8OAa583l5REK2/EVFHwCJmbXd1q7MNjXSZv5a2Tixlp6FFIyYRq5b
 8sUSq7HK2+trQ5UWqIOWUhxpveO/Kdc3pBtBYR+icLOQdl5BgZ0TVlJYQ4eI7HcuoOC4
 W6oFdDBWR886EYybtsgfdolAubrHhccCyL1Z0Hkl70/ZNzu0VKgd86W9nbo19kYKS4vm
 zLX4QcN+p3wuukSPNbcWQJclevWbS4lGgJYJn08T7BdfvBbc4JVNElbekZwm8QUcNB2m
 hx5CisAcb8xqUPPuopCCShHIu8fQyLth4ftSxtDLslQGMAqEomMe8VbQv/E1tKffCqzX
 9B1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZLjOfL4i
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.5.13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 4bdfd74b20..3b5bbee23d 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20220103T215446Z/pool/main/w/whois/whois_5.5.11.dsc
-sha256  966281eb8301c14a1acc17e46c70061f73179d80e370aef43065c22f0947fb87  whois_5.5.11.tar.xz
+# From http://snapshot.debian.org/archive/debian/20220408T031931Z/pool/main/w/whois/whois_5.5.13.dsc
+sha256  62e613f116d5635aea6684238db00b030a6602ffc79462e4a0a8e62cb184b5d7  whois_5.5.13.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 4f74a61d74..29ee92680e 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.11
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20220103T215446Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.13
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20220408T031931Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
