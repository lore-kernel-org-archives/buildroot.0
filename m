Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5E9E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 18:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F16060826;
	Mon,  6 Jan 2025 18:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgABIMkJ98ft; Mon,  6 Jan 2025 18:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894896088D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 894896088D;
	Mon,  6 Jan 2025 18:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92433DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 18:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A11DB81209
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 18:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFtjDZ0PV42A for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 18:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF0858120D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF0858120D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF0858120D
 for <buildroot@busybox.net>; Mon,  6 Jan 2025 18:20:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso101919135e9.2
 for <buildroot@busybox.net>; Mon, 06 Jan 2025 10:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736187624; x=1736792424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DyDOvOumwcwiPqEPifLqlexEBsMIk+h2JQuC7gm2yI=;
 b=fy+dG7LF4oL71raZcUw73Rf/rbRcdVWGg9vAwumf1r46AhiyhnSNm2w/uX4VP/OINf
 gH3+10UMMIkrHXvqkiWyQ4DZc9iISnU2aaEUlEGh+FvJcdtR+yd3FfkCZzUsBDI2ez4j
 JchWBw4eIhekxwwsdPxN55D5rpVtCA5F5IKytAovoif6fX2cKktJRvteSTNIV3pkOqRA
 U2V3Rtb+qs/GcKpUW+P/xnFI5nTN5Qs2LJS8ppIEDG/uFWhENXO9ZxBdaBUt+n14An6s
 K/OgwKpsfk73H+BSij3n2Vyj67ryxLPSgeYHmEv9dfHApCWx9OfwCb+TdjT8OpsYnVMC
 Il5Q==
X-Gm-Message-State: AOJu0Yw20wtHCvEKi0TA8q8nR+V1grLfuqc88OBxSq0XA6IgpXGnDWPm
 EQqKZB+t6eh4KersPeJANVMlEcACSQQPkWnvSAmOMW+rz5aL/HhlX6304a9VH9hkTfcXRyz+P6i
 I0w==
X-Gm-Gg: ASbGncsbV3UvwX0X9dyDhrTmC1pc3O3w4iJ91IXTUnSe/GzKMk3sjZDk+JMb/Cx5ML0
 NlQoz03e427huA2i3U8iOZhzMG2RjAUQawAYpbd8MPAgXXnoOT1jLz/3uBjeg0uFnvgXVap+eOK
 B0xtMiE5sCUluS3C0+BpRpl/GsWU1diNkqW+MCANSgVwP18yDLfqHkH5SSmmDrYPwHsrZeDHlvL
 6cfl68aPkjCBhw8VwgkTbO+jmQnz4aRW1c6STZWLFIXDdflsuZlm9iPfVn42nekmNkAP9b5TeTP
 OD353TMA5pNqeJo=
X-Google-Smtp-Source: AGHT+IH6ripgAkrYDcQixzbygFzYHjMoYv4HZXrLFD0ubht7OoOnDi8sB4R3AOKuNheAOHdg8pbnnA==
X-Received: by 2002:a05:600c:3b86:b0:434:ff9d:a3a1 with SMTP id
 5b1f17b1804b1-4366854826cmr450539255e9.2.1736187624515; 
 Mon, 06 Jan 2025 10:20:24 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b1143dsm606125305e9.18.2025.01.06.10.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 10:20:24 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Jan 2025 19:20:16 +0100
Message-ID: <20250106182018.2006380-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106182018.2006380-1-francois.perrad@gadz.org>
References: <20250106182018.2006380-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1736187624; x=1736792424; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DyDOvOumwcwiPqEPifLqlexEBsMIk+h2JQuC7gm2yI=;
 b=HfKHxNAk/XrNQFtsrGZlrUmlrF0PqY4ahuVsmdZZNykqf9ymBktu65QMGzkzyM8WE5
 Ad750D13yRnKLbTS0UrALT4wKlSEB7QRECNatRoh7zB6SIZXW90BIdDpfbXIjpruvQyB
 wXowau5s/+cC11kF7R4ExSlpj1xaf5BgUhru1PgkMjkuv55hDvoDQM9seT4qCEVc7u8h
 XFQ1nzX5erwYU3QoJJ2t7ROOKYh1/JQU9S8wLQXf4XQKtlcgHK+zTLRywQgKIgOWswKG
 ClrmWFgwTYi52OgT0n5c/lYs3ojN7QCXin03S/wAlH56ZfgB2W8qa3lysXs7+BAmfMaO
 IWfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=HfKHxNAk
Subject: [Buildroot] [PATCH v4 1/2] package/busybox: handle
 LIBFOO_BUSYBOX_CONFIG_FIXUPS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-generic.adoc | 6 ++++++
 package/busybox/busybox.mk               | 1 +
 package/pkg-generic.mk                   | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 89fc70045..f0b0508f5 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -631,6 +631,12 @@ different steps of the build process.
   This is seldom used, as package usually have no strict requirements on
   the kernel options.
 
+* +LIBFOO_BUSYBOX_CONFIG_FIXUPS+ lists the Busybox configuration
+  options that are needed to use this package especially in some scripts,
+  or at contrario the useless options. This shall be a set of
+  calls to one of the kconfig tweaking option: `KCONFIG_ENABLE_OPT`,
+  `KCONFIG_DISABLE_OPT`, or `KCONFIG_SET_OPT`.
+
 The preferred way to define these variables is:
 
 ----
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 942875ee0..4baa42320 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -412,6 +412,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
 endef
 
 define BUSYBOX_BUILD_CMDS
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9ec84d0f4..dc500f6d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1242,6 +1242,9 @@ endif
 ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
+ifneq ($$($(2)_BUSYBOX_CONFIG_FIXUPS),)
+PACKAGES_BUSYBOX_CONFIG_FIXUPS += $$($(2)_BUSYBOX_CONFIG_FIXUPS)$$(sep)
+endif
 ifneq ($$($(2)_LINUX_CONFIG_FIXUPS),)
 PACKAGES_LINUX_CONFIG_FIXUPS += $$($(2)_LINUX_CONFIG_FIXUPS)$$(sep)
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
