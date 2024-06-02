Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E6EC27C44
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3CF820E2;
	Sun,  2 Jun 2024 20:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dzWfpwGzAS3; Sun,  2 Jun 2024 20:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BEE8356E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29BEE8356E;
	Sun,  2 Jun 2024 20:40:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16E381BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 157A681F35
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BU84V97x-745 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D48381F19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D48381F19
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D48381F19
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4213ce259c1so1652415e9.3
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360794; x=1717965594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KjeBcrt5mhqrhNXs58GPuWdUZSR/WmabG7UEviHQ1Ac=;
 b=EntrFUXAGZUHm2sWGOWJHq5+2zO0VGXNDhFv93rCCV2JCHeBbPtIHg3ZBMBW446Goy
 smeaTFQt3vH1OLeiweIqjKhg0+UM0K1lQUYXA7p/ggnQ6Tm7h5nogCOBfrQVcOQCRZVl
 +ztSYstptKEfSVvArg31ElpanbzICGpOk7KAsHWVo4UzL1asg2Rk5OS9gxxVS6Gpw/bu
 FeV9gsSVekO7YaxCPslu1GR1OFQFe2ao0ErDI1SYFw5yewDu7tGHewB1eXvxsYI14k5R
 jSmyp2Y4DNmGy6MDhVF2QqR0wdx+g8vr/ZeijK2wwRdAyK9d8wnJc2O8A/3//9ZOjJ44
 3/Pw==
X-Gm-Message-State: AOJu0Yw8aH38mIuDyV9wkUlzBlDNxOq2QSvWq7em/ENXF8IQywPcnoS2
 pZqJuOq12B/O6C8fO2YjKraoIkhPgOkHKoeYfV8uXmmPUzqh3nr6xKDAIg==
X-Google-Smtp-Source: AGHT+IGyBnIWeh9qda8NVhfWEKaffJsh3r/BZFu3wMgXkEkn8pQfK/o6l3xkYP/1js0yHhC70dWJ9A==
X-Received: by 2002:a05:600c:4753:b0:420:1551:96ab with SMTP id
 5b1f17b1804b1-4212e05e7e8mr68493945e9.10.1717360793792; 
 Sun, 02 Jun 2024 13:39:53 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:53 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:38 +0200
Message-ID: <b4b24cc398a14b24ae7419d8242d0348e0374096.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360794; x=1717965594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjeBcrt5mhqrhNXs58GPuWdUZSR/WmabG7UEviHQ1Ac=;
 b=FV2MW/TlX7Pb3Kh6Et43bmvg6uHcwuwzPbxg8oUj906I9lRfuq79ATnd1+h27uZuqb
 QH3jiKSkCcaqz3Ts5A5PV6cPIWa5Ajo5VyHtaMpPmIH6YDzjzGePi5wufFqj18f5RK7i
 7Y0YXblg56/KbZMqv28lTAQGA2Werh+LGXFLf5IDKIfOjSbAWuGeaRwXsJWyIfdM6tCl
 /Uz8YoWSS3TYXOxRnwYATKaTecLEGz3P6DU/+mv9qQJsC6V4QeMLLJJomGyQV9rYYrzs
 D5w+fCkMFzg0x8JxKG2/srFA87CuX7Xkm+Kzr0L2y8Vp2hFI5QHnVCyh0fc0qTh3TPs4
 SK4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FV2MW/Tl
Subject: [Buildroot] [PATCH 02/16] package/pkg-generic: split long,
 unreadable DOWNLOAD line
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Note: when \ is used for line continuation, make replaces all leading
blanks on continuation lines, with a single space. This causes the
second and following parameters to contain a single leading space, and
the last one a single trailing space:

    FOO = $(info ARG1="$(1)" ARG2="$(2)")
    all:
        @:$(call FOO, \
            blark, \
            bleark \
        )

    $ make
    ARG1=" blark" ARG2=" bleark "

So, this split must come *after* the change in the API of DOWNLOAD,
otherwise it would try to expand $($(2)_PKGDIR) into $( PKGNAME_PKG_DIR)
which would yield an empty string, causing mkdir to whine.
---
 package/pkg-generic.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index da02cb2d32..8f1e6dc8e5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -182,7 +182,12 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
+	$(if $($(PKG)_MAIN_DOWNLOAD), \
+		$(call DOWNLOAD, \
+			$($(PKG)_MAIN_DOWNLOAD), \
+			$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)) \
+		) \
+	)
 	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
