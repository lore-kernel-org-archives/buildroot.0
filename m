Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AF5C64ED8
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 562E840590;
	Thu, 23 Feb 2023 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 562E840590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezOnYui0B4zu; Thu, 23 Feb 2023 22:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F6F740436;
	Thu, 23 Feb 2023 22:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F6F740436
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 011C21BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF01481BC6
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF01481BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNVIhnAfj9Up for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:25:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FB0981B04
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FB0981B04
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:25:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so774591wmb.3
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 14:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SiyykjHJ7IzPN5Yt9sgaXqBS5kckzoH0vHM+X0xDcxk=;
 b=hrDbxtQVBaoKrHJaIHI7KeYGQn9yJofnh1kXstRW7n7Ic/VYqleE7lagVivtJn3ICT
 DXlmP/x3FbxY37vxMGmlgJGrovnObGeTECCWTVWA0IB0kM/DqIDn3/TAOua63pFqkMYw
 WqXw8APjGHj16s66VUmJGpyglrxv6rL1721BlVYCpL5IirDrJ82yNkSYDIcjkuTO2tgI
 Aklqm+XzEsMjh6PBYh9Yjn2KE9b69NYRGy6SiLnP9AfUeW4VRvlkA5XY62EY8NxOVtdT
 6vGE3QkZNWTA6eGNoHzyXIKlCyp+QOV1HZa6oVvMZI4gq5/clrfUDRKUqv6qIJEi4vBY
 ihwA==
X-Gm-Message-State: AO0yUKUTqPpo11a6VwsYe0ntT/CV0YuzBdvUfCe3nbYyu979nXuITozl
 khOGEwBhGo8Fzy97IGf8p3Q79FXwMj4=
X-Google-Smtp-Source: AK7set/b2F9E0bmQTSS/TUEzCJxo6JRHZDA9Hoimm+MEHJ7Uy0k5SAc3J2QEHbAtDl7T80xAxOqYcw==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id
 i48-20020a05600c4b3000b003e2147fac1amr8167695wmp.21.1677191144281; 
 Thu, 23 Feb 2023 14:25:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay31-20020a05600c1e1f00b003e209186c07sm689831wmb.19.2023.02.23.14.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 14:25:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:25:39 +0100
Message-Id: <20230223222539.294264-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SiyykjHJ7IzPN5Yt9sgaXqBS5kckzoH0vHM+X0xDcxk=;
 b=nHrkyAm01FDdseJJqu5S2wEJ2OkbjLiB+EoHU4n0B7oF2raa3OY0wyWblPnwNHkT+L
 5Sivs1cvMmGKTLhVI1oefUR49uthk8r1pj7OP1yEsRs51QyypP/7ZGyBAt3fyfUV1Fpr
 SWw56KyvQPjYlThqmuoROoKzrL0E7m3cx4791Gm7uPX/OfIY2znqWyREFkYhWQLG6rXp
 1zM7LTFVYgZx4VxRdVzy+4hEWV9qM1pQzyvlIEn1jp/usJptOCUxHxUC/VZOJXYMwb2/
 qvQ2ruUgW3uFY+95ZtL1MJa78H2rk+bVD2sO2J2E0jColdT0emcO9WqPhnql6d73lGcQ
 lL5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nHrkyAm0
Subject: [Buildroot] [PATCH 1/1] package/libmad: force arm mode instead of
 Thumb mode
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

Fix the following build failure:

/tmp/ccv8mDeW.s:93: Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/92a3f19b4fa12a7724f9e3d99284da4ad2beecb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmad/libmad.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 684b8a2261..5555bf5a36 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -32,6 +32,13 @@ LIBMAD_IGNORE_CVES += CVE-2017-8374
 # is able to properly behave in the face of a missing C++ compiler.
 LIBMAD_AUTORECONF = YES
 
+# libmad has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBMAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 define LIBMAD_INSTALL_STAGING_PC
 	$(INSTALL) -D package/libmad/mad.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
