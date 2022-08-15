Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A940DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E40B6003C;
	Mon, 15 Aug 2022 16:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E40B6003C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03V0vko5lwe8; Mon, 15 Aug 2022 16:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB356068D;
	Mon, 15 Aug 2022 16:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DB356068D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6798C1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F6936003C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F6936003C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8SK4NUN4_s8 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED303605E8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED303605E8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:48:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j1so9724423wrw.1
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=f6Tq+BmWRI7XSB1A4Ldc+nAHAUw7Eh/FHvCloS/h040=;
 b=ArjNpqQ1glXl2MTyZNOfgYGbevMiy4JpEmehpp8mMgu4CiYH5SQm5wVKGZXvQBELvx
 SHTYXFzTDbMF0TxmVv3hFL/KePXOUEu9smp5UkDv7yQ/rxRkMt3Rf8MjPacwb645UUd5
 QlR3FNzQy+hnNbCtZ0oGzrxcacvDh1gbGljYOaYAv8l+XFXLaxVZC9kv6pIKN8WDGZ1o
 z/+Vs7vfyzJcgSm5rOocIClr7xHCnIH/fEUHk3ZXrNTiIIF/O5x1s0ww2SkpgrP0XNlV
 QwIoifaAWXQXCWaR5PROwPNmnXR4kzjXUlacd4G4kFVWCsgv/XRvePVeMDRPu27ZON3i
 ZJ5g==
X-Gm-Message-State: ACgBeo23JcUNpDmWMK4rcnhL1wi9sU3wm32xtz8gBhtNlICz+Gvv6MfX
 omthNYFKUOWK8NjOLnXeOpgAp00ti8I=
X-Google-Smtp-Source: AA6agR53mpfQtEHP3e+LDoYNgV/wPwHrMnkrEvUKcYWCWuYx6ydp/iNR4TfW/wrDXgupBlb3JHI7Kg==
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr9179033wry.549.1660582096895; 
 Mon, 15 Aug 2022 09:48:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0016e6c61061147635.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:16e6:c610:6114:7635])
 by smtp.gmail.com with ESMTPSA id
 w5-20020adfee45000000b0020e6ce4dabdsm7563497wro.103.2022.08.15.09.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 09:48:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 18:48:10 +0200
Message-Id: <20220815164811.93697-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=f6Tq+BmWRI7XSB1A4Ldc+nAHAUw7Eh/FHvCloS/h040=;
 b=nTzGFgM+QAxxuKBp/FskGLXqksVT9fLYWKfz811I3on9A8pPLo+3LbhsKV6geprclj
 Ss0BOkUe/3hL358vqyrZEICn4CEYH7mLtTE+SUrT4s/L7n9I8isOqHGoz0o76MzvQsmq
 7V77OCk6/+168K+EXiyELswYPpUztFFhKYQb1MD4O0oDlENihL2QU5MWrCZa7Jknqzmv
 YzGa3biRhsdFW62RqJTBxb4Ok47ONuEcuX/emIQ2iMbagBDREuV4aPX2qIrwnlaSvrXl
 hHBXSnID6EDTdx7cxFqwolKQa+ZauZyYTGjhZUjRTJw+Hfm98EC987VlWW6Yjcu9Xlkv
 zM7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nTzGFgM+
Subject: [Buildroot] [PATCH/next 1/2] package/lshw: add sqlite optional
 dependency
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
 package/lshw/lshw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index c6c1ac671d..46fd654afd 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -28,6 +28,13 @@ LSHW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	LIBS=$(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+LSHW_DEPENDENCIES += host-pkgconf sqlite
+LSHW_MAKE_OPTS += SQLITE=1
+else
+LSHW_MAKE_OPTS += SQLITE=0
+endif
+
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
 		$(LSHW_MAKE_OPTS) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
