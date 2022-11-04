Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68102C43217
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 23:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2FD0611A7;
	Fri,  4 Nov 2022 23:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2FD0611A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73UbVTkrestI; Fri,  4 Nov 2022 23:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD3C61177;
	Fri,  4 Nov 2022 23:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD3C61177
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 000CF1BF31A
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF89B82254
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF89B82254
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HX9lfeTjeiPy for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 23:57:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2755382253
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2755382253
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 23:57:38 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id l127so6747095oia.8
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 16:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEKLcHtsIch5bbwayScESbjuy2xsXk8y84bHvyPXVrM=;
 b=wPyBCWIE5GHioGr+LLdNGY+WF3O9J9ENb1v9W8/i2eOerWQJFhbfcYKBK5qTq0P5SQ
 oRy89xs/AlnogvG0VIvlEKC/q922UF8uxgH9BSWbyryRugxsbd+JOOoWvfp1zvl3fRkl
 4RAUpCZGEdLna+vzL3PAxxG87iHDN2BaALzQ0jRoy3sJeJ5mKq3Hz5fJjceDirHnMGH5
 iXA+uj65zXPtFp7F2Co1yKE4Ajb22XhuZG1ghHcvR1/5y48TGEddIkbxMcTmf8LliVO4
 XPEhRmhWJJ239Gcw34xl5iJXGmgP9b9C4sNG5hDPfaH+QyhAYmkGBwFvkcNLB/aOGLRz
 fojg==
X-Gm-Message-State: ACrzQf1Ssbh7zI/GIieiowPLb4/PKOx4gmGApd7hLkgTScNI1ZgJ2Ekd
 CWzfP6/WDKmgBofMBq8q0bia0zd2gvU=
X-Google-Smtp-Source: AMsMyM44c7OydjYgPXvepprsrabFwCPKn2HGvNGKSpG4e2Eb2f17lWYA6z722KKnYAHdcElGuacwkA==
X-Received: by 2002:a05:6808:3092:b0:35a:722:b5af with SMTP id
 bl18-20020a056808309200b0035a0722b5afmr17093113oib.222.1667606257029; 
 Fri, 04 Nov 2022 16:57:37 -0700 (PDT)
Received: from casantos.remote.csb (177.204.173.152.dynamic.adsl.gvt.net.br.
 [177.204.173.152]) by smtp.gmail.com with ESMTPSA id
 k131-20020aca3d89000000b003549db40f38sm165638oia.46.2022.11.04.16.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 16:57:36 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 20:57:27 -0300
Message-Id: <20221104235727.587650-4-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221104235727.587650-1-unixmania@gmail.com>
References: <20221104235727.587650-1-unixmania@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEKLcHtsIch5bbwayScESbjuy2xsXk8y84bHvyPXVrM=;
 b=OmQM+WZONOfNBpXlZrcKKKEvQL8kVtFkgFVyP4X2APfjwxMPlvrnI+HyysgqowzpyE
 gHX1B9J98g2fqugjvqiAB1F3Mf2YnQXEtwZqk6yEu5TaT32lI/b2aIHN0E8ho7puhpx4
 nCG3eo8JSL5kZjh88ie7In8u+oZmDUSMlpb6wHRBYS8Qf8UkxYscdpVWLcKJorS7K6un
 ypgY5UZMXT+0j0/Ybv7brwQ8LzBhiEmwGWyl1BUe7BLeOI1RLVnnagcOjxPP/FkHfQ1v
 1RhkXH83lj12M/dDCUFAKxwAfuzjF+23xjoVJtW5/jMCQtzdVmWU980aWJYQoCUq4ZkW
 3+Jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OmQM+WZO
Subject: [Buildroot] [PATCH 3/3] package/qemu: add option to enable guest
 agent
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

It requires --enable-system or --enable-tools to be built, so add a
hidden boolean, BR2_PACKAGE_QEMU_HAS_SYSTEM_OR_TOOLS, to control it.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/Config.in | 15 +++++++++++++++
 package/qemu/qemu.mk   |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 9e0cbd4acf..dd8b3d3491 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -122,6 +122,10 @@ config BR2_PACKAGE_QEMU_HAS_EMULS
 	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
 	select BR2_PACKAGE_QEMU_FDT
 
+config BR2_PACKAGE_QEMU_HAS_SYSTEM_OR_TOOLS
+	def_bool y
+	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != "" || BR2_PACKAGE_QEMU_TOOLS
+
 if BR2_PACKAGE_QEMU_HAS_EMULS
 
 comment "Frontends"
@@ -158,4 +162,15 @@ config BR2_PACKAGE_QEMU_TOOLS
 	  Say 'y' here to include tools packaged with QEMU
 	  (e.g. qemu-img).
 
+config BR2_PACKAGE_QEMU_GUEST_AGENT
+	bool "Enable guest agent"
+	depends on BR2_PACKAGE_QEMU_HAS_SYSTEM_OR_TOOLS
+	help
+	  Say 'y' here to include an agent to run on guests, which
+	  communicates with the host over a virtio-serial channel
+	  named "org.qemu.guest_agent.0".
+
+comment "Guest agent needs systems emulation or tools"
+	depends on !BR2_PACKAGE_QEMU_HAS_SYSTEM_OR_TOOLS
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a991d49993..d9bdfe0e84 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -90,6 +90,12 @@ else
 QEMU_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_GUEST_AGENT),y)
+QEMU_OPTS += --enable-guest-agent
+else
+QEMU_OPTS += --disable-guest-agent
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
 QEMU_OPTS += --enable-fuse --enable-fuse-lseek
 QEMU_DEPENDENCIES += libfuse3
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
