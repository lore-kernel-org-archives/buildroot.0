Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DDDC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E37E4277D;
	Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isb-_9Ia4tnE; Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2EAD42784
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2EAD42784;
	Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA0071BF95D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D544A61562
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ7kwfQGiBYv for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F23F76152F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F23F76152F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F23F76152F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35f0aeff7a8so568773f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779963; x=1718384763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KjeBcrt5mhqrhNXs58GPuWdUZSR/WmabG7UEviHQ1Ac=;
 b=nl1md6jDe2hY5KFZgweCd0HBlY+xXgMLy2TIO/OMD5aop6bNnXYphJMV3auKBY2dB1
 q8W0p2OB1O7afhlGV602HdLykEHIh2SjcPBXRAeJQx46vKJ2xfYQz5LQX4AJxJ8XfBQF
 EUZQT6Y9w6sx+rg+Au/6WSecG75GZZTawhM1JyR+k2yoSfW23HgBaTC8joLAn77ZwydU
 vzLSa7v1H38V7IHVzoJXkvOpwbirdxRh2Cisr6KZ4KAgaasezG1i3cq4QNyoNgAokarr
 uQF2w9pt0XgUthqBe5oi68ndjnEbTdpLTD5it2M9Ut299XyF1l+yxdjEFeDUVsSoA7Ri
 laYg==
X-Gm-Message-State: AOJu0YxZB70Me2YrUTRd1Gx4E299kjdIc8Gh8kT1lIZPU5gBtzMA46d4
 /MJK8oMwxdM8pOAwhtr2eNlz8W4sv0l7RTUB012WYwNl1fCORmG8CtOmsQ==
X-Google-Smtp-Source: AGHT+IGd/R0HUOPU2Lu4BupbDXXkqtDZRm104yduHxDLBDhn5cl+IbEqGjJIDRyNdOBMIKHhb1KZdA==
X-Received: by 2002:a5d:52c2:0:b0:35f:6bd:e5bd with SMTP id
 ffacd0b85a97d-35f06bde69fmr1770026f8f.28.1717779962741; 
 Fri, 07 Jun 2024 10:06:02 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:02 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:43 +0200
Message-ID: <fe4a5ef4d16e7e449732a9aaf3368c0eccb39239.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779963; x=1718384763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjeBcrt5mhqrhNXs58GPuWdUZSR/WmabG7UEviHQ1Ac=;
 b=Nxj/TYm8y+fC2SxLdgZB3qcHidH/7LAqtzZ68jVeTyJ8xSQkNVusaqcPRkCG12ytRf
 WBMJuz5IVDQVjlODVGZsphB7vLUMDt7tGVsZHHDYGMDPwslNY3NkQsmqtHle+DwjMhU8
 Bt8Pn9WQMZpHKk95GA9KPc+AL7PWt4hPWkt5zEU+yFd0w8A1fE9TKdaCOJCjrPZ14nNZ
 DCC3C1bzW+nHxNQeAmI3CTaxWXkYXEqWX/fUSF1wWI/bcSHZo8u3b2U6qo18VuKN3ic4
 BNRldvXRwrv3TEyyEkGbCC2TSgALKnZOHl5krA4br+3MDjc/nq529AfwKnNxYBlZ/HZz
 EyxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nxj/TYm8
Subject: [Buildroot] [PATCH 02/20 v2] package/pkg-generic: split long,
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
