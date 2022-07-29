Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6073C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 11:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACF983F7A;
	Fri, 29 Jul 2022 11:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACF983F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ow5sR1OXjhYC; Fri, 29 Jul 2022 11:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75FB283E6A;
	Fri, 29 Jul 2022 11:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75FB283E6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83E041BF279
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F8D440B60
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F8D440B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XU9n5EYoGSja for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 11:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FFC40154
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52FFC40154
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:42:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h8so5697348wrw.1
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 04:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rAUHNbEUIJ+shw3H7QPSrvtSJCnGG4xO95n3LuhWJe4=;
 b=UgxxajmbF0eb1+frSAZ4xRHTiSl9dyp6UqG5aw0XEubrWBlZgTZTsDfoCmO36uKl7i
 SO4ht1YKmr9weOlKVrxXKK0F/qZIo4BAkBDVk0KSfqTevfZun70Pb8bf5wDm2exTPj6R
 OrwEoaJCuiTwmen2gamHv1CWUnyOaR+wHmIo6GDUW4c8oe00Am7cAjBZaTeVTRwpgXRy
 ZnoFfgR8OTYEh2YoeT+4+x4nWJQC9T1qVwFIvzi47hLHg8jpqtVNTJi1hCZ0VYx/XCWh
 nXT79GEwUJruZlR4UmdiLdBnzsuJ/VrtY84SL2fo4nNwJF1gTYktP/reEYZeMOe62PBn
 T7jg==
X-Gm-Message-State: ACgBeo3K6Ow3AEtYCxegKuNabT96ZfhJJ774dobfzyB7rjkjC3qc89Sj
 L9p7FAFmD2mmFxNYEyMjBZzoNA5w6Go=
X-Google-Smtp-Source: AA6agR43U0HKFzSc4f0exDYJGXZZ0udUHUFEQEjORzpZfH63dbP2HZfrkEjjeghiLZUwFfyTK1Xx3g==
X-Received: by 2002:adf:e310:0:b0:21e:3e46:81f8 with SMTP id
 b16-20020adfe310000000b0021e3e4681f8mr2075256wrj.188.1659094953242; 
 Fri, 29 Jul 2022 04:42:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d50d2000000b0021e9fafa601sm3578224wrt.22.2022.07.29.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 04:42:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 13:41:37 +0200
Message-Id: <20220729114137.7774-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rAUHNbEUIJ+shw3H7QPSrvtSJCnGG4xO95n3LuhWJe4=;
 b=QF0P26MYYJV+3IY/5S8gFqWXK1kFv3BtxpRKRCR+VODsDcrfmGxIflfBHi9MGJjcI+
 09xFkdHs29FWkD7XxmKp51VFkMvrnjwDA4b/mBY8RaJj7LKfVMD/UZfwYOqQjZ/JLCtz
 f+BMu4M4MmkPQ+l+amvhgFWZYPIrEyxIxVUP28dAjLQgw1CBe3VqMFSj/IhVOrIigvQE
 lX+rGqXmd6UHVoQrH2RYdGWtGCHakKNztTYs26hlUIZ4sl5/H0jXdCTEL/+KZvWdf5r3
 3iXFF7lNUXdiVLISnZ+DJfMDthNEBRIlWFLhU50FqdJuiJ6rftnu/B7+aruxjN9eiXeR
 1Kvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QF0P26MY
Subject: [Buildroot] [PATCH 1/1] package/pkg-autotools: fix runtime path
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 505b5a6cdd337c2fd5965aa875a1a53419d62ed1 wrongly stated that "a
configure script bundled with a package may be generated with an older
version of Autotools, that may not yet support the --runstatedir option.
This will give an "Unsupported arguments" warning and the option will be
ignored.". Indeed, this will raise the following build failure with
attr, libtirpc, readline, etc.:

configure: error: unrecognized option: `--runstatedir=/run'

So to support configure scripts using older version, the variable is set
directly instead of using the --runstatedir argument.

Fixes:
 - http://autobuild.buildroot.org/results/c853f14773d875be30e32ae24daf80e181fef34e
 - http://autobuild.buildroot.org/results/045211cd66cf78c3d89d2d8ac41ec4edf0b0ee58
 - http://autobuild.buildroot.org/results/8c5160eef99de2f1f72f33d5e5ea94d417855b2c

This reverts commit 505b5a6cdd337c2fd5965aa875a1a53419d62ed1.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 548f69cbb8..b6224b349d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
-		--runstatedir=/run \
+		runstatedir=/run \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
