Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6149C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 842B281B23;
	Sat, 15 Jan 2022 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fhqdrw6r1jEb; Sat, 15 Jan 2022 20:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D75DA81B10;
	Sat, 15 Jan 2022 20:04:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE281BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C9DC40249
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgmqLfYb-e9g for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:03:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71C2D40185
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:03:34 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id k15so47510238edk.13
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=drd0TlFtyILXo6qJvG8zjRVFmjBbVIgkg6HEgrIHDUs=;
 b=V23EL3UvEJSurK7FxABcQz71hR88SeVQz1wJaIfQEPMLhXcW6DlWbjG27udgVyTroO
 O0DWBpLLfDlFygCRrWiK5HsxdBo/++BYN8C6GmkoPJC+fG8ak/RX4YJO/OgbehorgWFe
 4lAjFJ0sc5j27Ko/aIUlR0WH08J1pk0GPX1vKSIZhGJoLK+2jKcyS+CYWKJdLwHmLkx3
 h4QsVVqNI+msXvcVVYG5cwDIwM7sdZeVWDrUzgVmxTIpxtPUPrwtd2ShGngPDF9c91o0
 5bjK2k5oWIMLHjdKzOXKF4tFerySndnPOURuSLanJkuBtN2L8qZO1WbI2oexvq7MkswD
 qx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=drd0TlFtyILXo6qJvG8zjRVFmjBbVIgkg6HEgrIHDUs=;
 b=icH0Sj1vwMSq2pcl5y2WYqifpEhfSmbp3Rx5f/C6FX/QmxILKqom9h4FEwiVfiXEof
 vEq3wmbgeoeZOkeGtpBxqn5b6/KEpaCbWoh6OcgKrgTNXWUTu5iAK6mQ5aN8PRNdkOAc
 FYzs9GsGr6TAVQ/eDQylGtU6a8o+4T10ha2D2AjKVjWMaosshR6k2IKIYy15/1IfZonC
 CadRL0kZZu7q7B76Jf8Kie3+BQJsPViF0bR/umsvKZWID1inSVUBXidyLamAbAA6gvu7
 A++mKdQ78MYKJGzP5O8H5ao0sXXx5LsvaB4CKG2MKuO9RX3alOzUYOUz4svA0m2rI0LY
 kJ+Q==
X-Gm-Message-State: AOAM532BT0eA6vo5nWTrut0UNM/kv5Ku73vSaLg6zMIG+qm6MVMNdgyg
 Y54DHFyUSzgYSquNWEXw6b9baGL4LOs=
X-Google-Smtp-Source: ABdhPJxkLIEy9IFoV7GAMPAfL6HMKNwvH1iO959sQueFwXFvBOZTSRebT2zKlrYHbeIya/sYE6gSkg==
X-Received: by 2002:a17:907:1c84:: with SMTP id
 nb4mr11411906ejc.564.1642277012610; 
 Sat, 15 Jan 2022 12:03:32 -0800 (PST)
Received: from localhost (ptr-5gw9tzn82s1glqex1i.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:ad4b:62a2:fdc7:acc6])
 by smtp.gmail.com with ESMTPSA id 24sm2837173eje.52.2022.01.15.12.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 12:03:32 -0800 (PST)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 21:03:01 +0100
Message-Id: <20220115200306.14037-4-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115200306.14037-1-patrickdepinguin@gmail.com>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 3/7] core: introduce BR2_KERNEL_ARCH_OVERRIDE
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
Cc: romain.naour@gmail.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

There are cases where a 64-bit architecture is running a 64-bit kernel but
32-bit userspace. Examples include:
    * aarch64 architecture, with aarch64 kernel and 32-bit (ARM) userspace
    * x86_64 architecture, with x86_64 kernel and 32-bit (i386) userspace

In Buildroot, the ARCH/BR2_ARCH and NORMALIZED_ARCH variables will refer to
the 32-bit architecture, but the kernel needs to be built with the 64-bit
architecture.

Make it possible to define the correct architecture to be used for the
kernel, in a new config option 'BR2_KERNEL_ARCH_OVERRIDE'. The user is
expected to know the valid values.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile       |  4 ++++
 arch/Config.in | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Makefile b/Makefile
index c130eb61c6..85b91338a5 100644
--- a/Makefile
+++ b/Makefile
@@ -438,7 +438,11 @@ QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
 NORMALIZED_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
+ifeq ($(call qstrip,$(BR2_KERNEL_ARCH_OVERRIDE)),)
 KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
+else
+KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH_OVERRIDE))
+endif
 
 ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
diff --git a/arch/Config.in b/arch/Config.in
index edf337f13e..6d8e2dfd7f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -331,6 +331,21 @@ config BR2_ARCH
 config BR2_KERNEL_ARCH
 	string
 
+config BR2_KERNEL_ARCH_OVERRIDE
+	string "Kernel architecture override"
+	help
+	  Normally, the correct kernel architecture value is derived
+	  from the selected architecture, and you should keep this
+	  option empty.
+	  However, there are cases where you may want to enter a custom
+	  value, for example when using a 64-bit architecture but
+	  running userspace in 32-bit mode.
+	  As an example, in case of an x86_64 processor where you want
+	  32-bit userspace, BR2_ARCH will be 'i386'/'i486'/'i686' and
+	  BR2_KERNEL_ARCH_OVERRIDE should be set to 'x86_64'. Note that
+	  in this example you will also need a multilib toolchain and
+	  pass '-m32' via BR2_TARGET_OPTIMIZATION.
+
 config BR2_ENDIAN
 	string
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
