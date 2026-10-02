Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748ABCA5FE3
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0FE60B24;
	Fri,  2 Oct 2026 10:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDRxburfGACY; Fri,  2 Oct 2026 10:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1421B60873
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937181;
	b=RUBAZOyIGm8JutZzv6AEa+pnqnTdk4Tp1Mqz5DWuPtKDhFr9NS92pA3yd+oAHVGdIFqm
	 oIlRjEibqIc+PBZaX0UAj3wP71XdgzjZkfaGo/WGKuuPVmS8OtefeF0J9JusCHRb65gCV
	 psofnnf9Q6uHlmJDHUO8+3XYRBZkICisOg6h+hDW+5pQeGPpSPPSlz/4WTfeJqH9JEgRy
	 pj0fEiM+CP/X9i6wMH4iDBqyd0omUhIPrkFmGMK17fScmGEmUH+vi90HctGiJtNFl02Hu
	 NhrOle6wpNsH6ucUDHZI3JIgt65dI/2ChAZ2T5UG/AAq+Bp5XfKyskfIGONA9dSbIbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FfmKNealzQZSmgdbCI+xoShfcfWhEBrFymrbnjT7Udc=;
	b=c6cZ1NEO8+imDMvbRhO8nZ1rfi7LDJeFclOiB+ytdmCKJ/zdDjx1Vevzb11cSqDhYRzU
	 3Gf7LsNBbMRfyIl7Gf4149ObBge8pEgLVcPHTQPtckMoNFUB3F71BnR9j977RcKoapDfp
	 +E0IbW5F0qPtP+023azso6HkmmPKeVS5HdTPHoK09hHuqsVSR24z5xJZF/QcPWTmbObY2
	 d8jrezY9259YdYCmr0pMoN18rp/tkGJecxrqct2aAgwzLEjD+CCpIc86dlofP1a/gKSyi
	 SlwvkQU1WziAvT5FkwdmRZRKrFHvogKzek2sQpu18JlQgikHFUtZ2ifJUKBsHbOMAzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937181;
	bh=FfmKNealzQZSmgdbCI+xoShfcfWhEBrFymrbnjT7Udc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=shVINU51XA3xvsN+1XDct1ysY+AYCjlydQiaNMPudmnEczHbMnUirsILbuO1JKmeb
	 i9aBMdxZs3ZyKh8P5xUqAo5/AIUvI99O/iwlaSNEeZXc8ekxLFrxE8ss6eZiti8Gq2
	 fuzu5ODCqdRMlQ4EKwaTCpHEn4ClgCDcHizcs5e2pd6EITU7e+GDrcev7D5sij6sOd
	 6umPoXIfe7XjB3PDmMBC3xlwLD2Dxz2RHpwC2H32v8VbnjdbeVSnbRIRCO/Xz1ijyU
	 l8jdrG+M0pBsNsPfNFzh6X4tEafPPHQ9TW2g4OZBAVGdV+geIxcIyWABJPMY0w+Wff
	 njcyTcYYd5TrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1421B60873;
	Fri,  2 Oct 2026 10:33:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3267334D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AED36607A3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5gK6-VQM8Cv for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:32:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7E1FA6061C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937177;
 b=iPXmkRaqglMjXz9U9RsIDvV1a+V9UbTldQ/OsyVrCHV0G7sNaW82Go66jovg/CqhLXRT
 T83m13gtpfocEMhKIZBZbyfqNlvD5iJcV8tkR3Vq3bHkro3UhDB5x8DXveagMKBsq/sxS
 gEd/YVAyMnou/17OfUIl1NFnWu0cYuJ0IqtoAq1foCfTOsz8QreXqk76hvt/K2Qw4HxHy
 IBQU5vs1vObVwAGTGQQJmqgEnfwqM1v1kPP5NO0XG9Mg4c3BYx0iUOHcx1pHChVKBOFar
 OniW7hxs4ZFiuhduiGflsB0r4fd54F6ShGthBMtrRS3x8UvT99Smr4mjHY2fMXtM2tA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937177;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=2uVar/Yw1+uUYIm7BhgekP3BaOtCzewr51afvCS9dS8=;
 b=m2ZZdzAi+KQMT7ezXWYOqMLg6ZI5ZxiE1aoj5nu9+rab9ut76Ypqcdz8shgGIHNes0u/
 Ytgc0y4CHe2lMbYwIMluPTGXlBxVOLn0MUXBMOwzu0Dxs73BwoxBSJnx0IxdDf+JuowW8
 CJfTr3faPIR5IDVrP5T/FZgC2fQ93TlWyOX84EemyrDgL7F1Lm+yHXRaUSBLt21lOnJes
 FupGxAJarHy//w+VKgOjZ02y7HM9ljeScPJUcHE/Vkxd6ViqkcAbfOuVE+ZzV9KT+J901
 X/mkl4DGP+5YxErGTuAFyC/c2I6vjSpQWkH6AtpB9aRveSP8QSaX/jB48bepT4piRzQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WOaOKC2g; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E1FA6061C
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:55 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a11603310fso3576365e9.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937174; x=1791541974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2uVar/Yw1+uUYIm7BhgekP3BaOtCzewr51afvCS9dS8=;
 b=EpLqUDU21zdxKDtzIWuBSEpHMPn4wOZAyZUEr4XQWVmzGMCxAmWzlMYLUw/KsPTGWX
 n2dtEM4dCYwCvFE+5VEEnFxHb5DbdN4fXSNDk/UXnX9vqBAqarYjF8iphO4pv9aG+XXt
 UTkNKaQr9ukiff+BVrCPWlGkP1keFEt+nLzn8H+FcS/8Ov8RDsOUL1yxDCIdABsvABpm
 lGQ9OpBtbhB1L4N0rX462H27Tc/JHJgQ+xHP1x7HfCF520CTsihttlddcG35srZ6yjGq
 bTHEanBIVdVmUIEFQ8dTaGf4fetgSNZOY1riGn6un4dFnBtyPvQP3SFvyORW4JVXpllf
 PPVQ==
X-Gm-Message-State: AFuF++n/AOix6j/gcF0Xn1GPk36kwiiZtZhcJo+cIOq+ogm1j5bIb4rN
 DO+v/V0dVBfQxTipYbpIAXmquk3ER93JBa1pMx2Z4AYxNkJ+jU5OYB7j9AWQrqSRi5ubMVQXxaK
 i49Jn8I0=
X-Gm-Gg: AYBFou00IAIX91sLxzjAoS4BGLYgzn474cSFttstoGLVa7gRi6cNCdyrfLgSrRPnsTf
 AM+W4+LP7nObsALFkWX8WyRd9ygbyRfvjyL70TV/wrmv/kS2EIiVzfTnQZcNQ1CRnGlTAdyJzln
 rdBWMQpt1QSsYTNrp5trU9zas+xdNMA4izHBJZzyziiYk3UV/dkLcmIQbN2QeGh0825FpN24uEw
 oQIxDpY9MjID5b6wvRU4SLX4yd8qKu0P+U3E8bcMMp91YFKfViV9FOWfvPoxbXMpw+EsFGRmIOA
 iD4XXbY0Ovy2pUtq/UGBTm0rSwYeGsHp6Qr8MfEYrk0R5oW13/asF5mRBibCONAWkGj2R582BF1
 6no4/tn6phcnGORLRVt/nfcBIw4jouGVGgoyq2nsgvi4VXBxgss8VO4B6UTGGODXT9M/fq6t36p
 G4ucNP4VNIFxPDFOOgf6Qc84zvNqDVR5fPeNBPDaipOr9+6QgsVKrcmTkFeWEiEmZ6BhW8oRpt/
 ST5qXNNw+1hyaesJyh8rxmjD5gFDQEiUYciG98QdLZyA+Hi4iz8
X-Received: by 2002:a05:600c:474e:b0:49f:bd3c:bc1b with SMTP id
 5b1f17b1804b1-4a02759b67emr45785175e9.22.1790937173878; 
 Fri, 02 Oct 2026 03:32:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380f04f8sm4572704f8f.9.2026.10.02.03.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:53 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:32:50 +0200
Message-ID: <20261002103252.77142-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922210450.2669612-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/flutter-engine: fix build with
 pango >= 1.58.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit c3aa6774563d20901fd1370f51ef105180665b54 bumped pango
> to 1.58.0 causing a build error with flutter-engine
> 
> ../../flutter/shell/platform/linux/fl_accessible_text_field.cc:9:1:
>  error: redefinition of 'glib_autoptr_clear_PangoContext'
>     9 | G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)
> 
> ../../flutter/shell/platform/linux/fl_accessible_text_field.cc:60:3:
>  error: 'cleanup' argument is not a function
>    60 |   g_autoptr(PangoContext) context = get_pango_context(self);
> 
> with this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_FLUTTER_ENGINE=y
> BR2_PACKAGE_LIBGTK3=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  .../0005-Fix-building-on-Pango-1.58.0.patch   | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
> 
> diff --git a/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
> new file mode 100644
> index 0000000000..9bb475187b
> --- /dev/null
> +++ b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
> @@ -0,0 +1,33 @@
> +From f1c316430713ae7d526f8abc1621b09958aef281 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Mon, 21 Sep 2026 22:06:06 +0200
> +Subject: [PATCH] Fix building on Pango 1.58.0
> +
> +This version added the autoptr macros which we no longer need to define.
> +
> +Upstream: https://github.com/flutter/flutter/pull/193119
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + .../flutter/shell/platform/linux/fl_accessible_text_field.cc  | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
> +index e99b123bbfd..f7955a32f07 100644
> +--- a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
> ++++ b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
> +@@ -6,7 +6,11 @@
> + #include "flutter/shell/platform/linux/public/flutter_linux/fl_standard_message_codec.h"
> + #include "flutter/shell/platform/linux/public/flutter_linux/fl_value.h"
> + 
> ++// PangoContext g_autoptr macro weren't added until 1.58.0. Add them manually.
> ++// https://gitlab.gnome.org/GNOME/pango/-/commit/223b147
> ++#if !PANGO_VERSION_CHECK(1, 58, 0)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)
> ++#endif
> + // PangoLayout g_autoptr macro weren't added until 1.49.4. Add them manually.
> + // https://gitlab.gnome.org/GNOME/pango/-/commit/0b84e14
> + #if !PANGO_VERSION_CHECK(1, 49, 4)
> +-- 
> +2.47.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
