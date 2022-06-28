Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8214CC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 18:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFBBA405FD;
	Tue, 28 Jun 2022 18:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFBBA405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mpRukT3hCQ1h; Tue, 28 Jun 2022 18:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C67264054B;
	Tue, 28 Jun 2022 18:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C67264054B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B28C31BF5DB
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A69F4194E
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A69F4194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZB1TKi9vtsQ for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 18:35:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F23441947
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F23441947
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 18:35:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v193-20020a1cacca000000b003a051f41541so1765439wme.5
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 11:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlPyT2B+Kjcd6AVq2CB9UnTArBpjB2pQqtAHTr9yFoY=;
 b=xod6JbT6uiilD+bhmdfZOhYSG1y0DyXJXsWi0/kL8xcnJeQbROWpUpBcG2YPPLfKnF
 MaE188yaxvKQK/yzrI/jAS1DAwuS02nLBwna8sGZQTZhbGI//hOJJK19KkJw0cI7W9sm
 x7GcJXKA+Eo5wpK7rOzXNtxqDkebkCUUb1x5sghRIbht4QUyyDgQUpTD4JarbDjms61Q
 4mU3Lu9cMji9KfOSbkH0u/vrY8Bell++BPXc9108gt5SMPzUHg9LOFLwdmEhbtsGeq/A
 N5z++wkod1QcQb6kwcyz8hN8AItb3haxbGhhT2Fv5fc7S0+SvCnQ2d3ffLfjxls4/+5m
 kC7A==
X-Gm-Message-State: AJIora/08Y0zXt6aURSdVO8m+hZSDlZ7nlFXt0L0IW55DnMDipsRClTF
 xNAke0e7JwEXLiFs7saS2liauyegmHo=
X-Google-Smtp-Source: AGRyM1uRHqaOce9LM2GW3qD9WHH9mpaj50+KEeGMpdCuArfdd089xWOwATaPlKAczl/Rs6cNccbt9Q==
X-Received: by 2002:a7b:cb82:0:b0:39e:f9cf:12b7 with SMTP id
 m2-20020a7bcb82000000b0039ef9cf12b7mr1083480wmi.135.1656441353229; 
 Tue, 28 Jun 2022 11:35:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1c4c15000000b0039c871d3191sm426509wmf.3.2022.06.28.11.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:35:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 20:32:11 +0200
Message-Id: <20220628183213.2838372-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlPyT2B+Kjcd6AVq2CB9UnTArBpjB2pQqtAHTr9yFoY=;
 b=OMuldeMiGOI3EO4SRDd4pdfgnXER4UnC65bfjk3VdcpH9NtjP3f26g87muQ5UFoTXu
 HTKsfE+fm8ljmWUedCbp2JIuF15sqhi3MiTzqxW3x6NuyqQ/TvBRGcoYRuW7pr7qFllG
 JZ5wbyySs5ycMudDlcOYE2A2tmZgqYXJNUKwwK05vgrKoc/MaDrATZD2QgeevRSUtLZ0
 /OrCWAH6F86/odCRyoKQobmAmAFfSPS3Ekbtxv3Nx4QeRugLmxaBU4KIwDdLzCJUruxq
 jmhxVKekCp2jtJ1QWjPVIcVIxfrAl1MFe2JaNrWKANEw59m66NkWRAxwCqjZGJJU60WQ
 zwpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OMuldeMi
Subject: [Buildroot] [PATCH 1/3] package/libsamplerate: use --{dis,
 en}able-alsa
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

Commit 5b679d7806767206f2c7bd7ff69b412bebb504f8 forgot to set
--{dis,en}able-alsa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsamplerate/libsamplerate.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 146d57d15e..9d6b6a5ca5 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -15,6 +15,9 @@ LIBSAMPLERATE_CPE_ID_VENDOR = libsamplerate_project
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBSAMPLERATE_DEPENDENCIES += alsa-lib
+LIBSAMPLERATE_CONF_OPTS += --enable-alsa
+else
+LIBSAMPLERATE_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
