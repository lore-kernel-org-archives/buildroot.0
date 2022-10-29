Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1244C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84BB4403FB;
	Sat, 29 Oct 2022 08:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84BB4403FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZY8aXyDoFc-a; Sat, 29 Oct 2022 08:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D828D40496;
	Sat, 29 Oct 2022 08:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D828D40496
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA3181BF348
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE91408EB
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE91408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ja6ZEJRu7OHz for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:56:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6172C408C4
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6172C408C4
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:56:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k8so9389343wrh.1
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hoh8Vn3My3zCrLW2R0UhA5ULjzSVDcx6Mi3j0h6jQS8=;
 b=K483TDw8Xn45UhWXPwQYIU5GEHJtLCNZjpgNQMf/UeOwjXwvBRLFgf0E8c4KrwIQQx
 X8KAxmsJBc/AJ4RhKi6HzfFDOcMYXMMznjUEg+SztGZ9IRLd711meZbK/VlLdiNF+ekr
 g13AEsl4RoMH+0oV6pNXE3nQgvNyA76ksW5u2Q+L/+ydKI69oGgONrRL5o3aIrXcQg/U
 OUUu+pccCikMYOsbTGSbSkEPu1QhcU/5S/hZf8BZU0V4ZP+n9uemOIcet4mcLxGtSOZw
 /WBVV2ttqvpCO2fR7pBESJqkWDflaolNPZBQlZBDy0rl0AGESiDfrU23LanzHuVtWfl+
 awMA==
X-Gm-Message-State: ACrzQf1ynpngNCMLFQjzY8sVfTh0IYCWmsDllvnas2pBzWcDJHgBjvW/
 4VLYp0AYXEuLdXn2KSyeK0+f7QPn1Qg=
X-Google-Smtp-Source: AMsMyM7xyVqsjanLj3GPu6PNrh0RLsPapZfihHvwM1imWSuE+gNkN7IiLfzG1i2JdDJdrCoUb9j3xQ==
X-Received: by 2002:adf:e3c1:0:b0:236:6d5d:ffa2 with SMTP id
 k1-20020adfe3c1000000b002366d5dffa2mr1825228wrm.557.1667033786250; 
 Sat, 29 Oct 2022 01:56:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bg21-20020a05600c3c9500b003b49bd61b19sm1039324wmb.15.2022.10.29.01.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:56:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 10:56:22 +0200
Message-Id: <20221029085622.104382-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hoh8Vn3My3zCrLW2R0UhA5ULjzSVDcx6Mi3j0h6jQS8=;
 b=X46JzqkuNQjxxMvdJ7yX8TUizUB23x04ddDHoV5FyzMBchqSV87zqOWMF1Cy6q92d4
 UuC9jl2ICz7i7GUKhGqedc6JFuiS0ywv/T1WTLWxQZRIMFz3RPwo7SvdYd3mi2UzunSA
 Qy5NrbxC3A37wwJ4dpp1GxR0iK3C5pnD2BiuJQf6awdHhWCwnSgcDER+1oK6FfFrJmZ3
 EuDnFs2PsG5Qa9nC55NA/iZsE2i8V1HYoyRiqZMuvR2BkXaVqekDpCltHoRs4q2tcFUn
 yY3bEW3EfWiug2YtJxrNwlibHMRH47+8sbA1AJIydFtVAlDdDanf5JiqG+M/uDKtieH+
 r0wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X46Jzqku
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: bump to version 1.0.6
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

ndisc6: print NAT64 prefix if present.
rdnssd: fix timeout calculation.

https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS;h=d9e87a5307ae7f50355ba2eaac1171c6c4ff9c47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ndisc6/ndisc6.hash | 2 +-
 package/ndisc6/ndisc6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index d76e831208..e258382c53 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  36932f9fc47e2844abcda7550fa1343b3af4b4208dfb61e0c9d9224aad5df351  ndisc6-1.0.5.tar.bz2
+sha256  a713210e9be1f15cfa0809f4c2728b00cd5f25881d7585126986982055453cfb  ndisc6-1.0.6.tar.bz2
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index ff6439e310..23734ca7d7 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.5
+NDISC6_VERSION = 1.0.6
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
