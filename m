Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51EFC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A87A780C67;
	Sun, 16 Aug 2026 19:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5RMOWhQjSdO; Sun, 16 Aug 2026 19:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F88780E39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907893;
	bh=ai5hnK0lbB+J7Cj+7iNCahzG7tSGf6nicVi8c8hG9SA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvmuWpdIr1pkzGaGs39fBVh6ZoV0FSonnz4FPPJkXJDVg52MbZlv86TGI/FhvzhZz
	 infFQQkrMBWuGy05qWOk3M2bJUrlhJVy1yoMJZAwUwSBrRKVvXMygqBXCJKcyJNIYy
	 YeQlVwRgIBtwYAl9ozfTQdAW/4AIiDIuH2iaQCyVrNX6/41rdIvB97J/PJiRI8Gptx
	 Q8MebAsovW0XVgObClBVaUECSh+3RHmB0yfn+PdcIRTv2+MaYZc4rS7IaQ1j+aqY5M
	 VLv2O2xbQlDWpMuScyrxVGG6bB2fHQSObk7xOuvTYw1MG+1jmldXfB6xAnIVhtIcwq
	 3OPBRHY0UcMjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F88780E39;
	Sun, 16 Aug 2026 19:18:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7BCF3A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9954B406FA
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqjVotyvaROE for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FA02406D5
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA02406D5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=F+SKKDAO
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FA02406D5
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-936dfd009d1so125862585a.1
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907884; x=1787512684; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ta8Y48NcuNQ9156PbY6X1O4X4HLlmNJ58AESJvm4bXo=;
 b=F+SKKDAOJU9D+Ej118Xk+GtgR+91sZVSTx3Y7kkIEyedgiMd5BYpLEhL8QTSYSwQy1
 RKyGIBITSkgf5/BB23rQCP9GH/tWfR8462lNaEfKSHvu92ah6Q/NjyPFVs/pvapGZTOn
 OSvjQI0SWnXLfOSstcyuaM86I3MqMg1dauYhMre7pjj86nQtD+Lz+Yov9zcdl+7H3y4L
 ZjN7rYK7q/M568o/6fNk2dJ81Be7No7Y95gmw63sVOlxs7EWOxMZqWTZokfn3TwS6ZhO
 gxNpoYWgQhGmaHkpRYJIElujjU/Y6e+pd45Wr4+6d77f8Rx5fVTlBUPFCXnYh6kphujL
 +8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907884; x=1787512684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ta8Y48NcuNQ9156PbY6X1O4X4HLlmNJ58AESJvm4bXo=;
 b=a3nUEkTimEQxybpBww3zXEGC5cmUm1USrFP/syqsfxLMVqAxO08pc5Dp+R3Zgxi+yq
 m3riKn7kWPDLbhaZJ/NZx6QQ+qRX9D45Gv4pXVmd21I0Qq6CJS7ECFZl8ISXgHcXPyK7
 fiRX9+07CxPqjYdSaV0A/5krIxMT5UgBDZUozIlQvOMlB5IXdAN4ndZSW6XLCBppA1d2
 Jnr5QUrGrhU8g0H5TLYS9vJM61CVXjrME456m4BHYF+bI5AgXATGIbaYL73urd7NufvQ
 sjMRmQg1XvnCvpW3cDweh/ujslbwykMVfBEb7D/7To1OyBu0H+tTvyObzg4Wczgz4jTx
 F2vQ==
X-Gm-Message-State: AOJu0YyBg+Ef/YUIiXr1MkMlnvmx47wXgurXOa3ZGgKjEazZ/IPUjTIG
 DAjVE+cZsB5OgMhS9PyTKjkP5GUlVL98sC5jOIPmoQFJ5nQ/K7NqzH6n9JUyxA==
X-Gm-Gg: AR+sD11ajn2nvKLskWg8qZpqxUvamUUF2Ht/8ZHF3OmAacIHlk2x8VE7YYlNSdy0zmr
 TMVItL64pIgfNSZN/kFgLUc9kH9wneMPL1NRmbODbeRYJsV20W1amhZRnTOl9zIlkuHXHP0tB7c
 TQd6xvntSYe8WLwUuR14UjPBninYDtuztXa9W8f2ZcAjroXHoeP4w4ceXN3/LeJ4hrgkFfH0sZJ
 qzGIw6wghTdB5hQ270D63/vbocgASaOfOS6Lal8aQsLn/OBSVhcJ4aQR/yqH2s7hLZ2NM5S2g4O
 vQwKMdet/GPnq5eIdSTuNASu1CrHU8rpjVgvvkvVt3+wUrMRsp1t14+4dKIzFI+E5vAgbWl6MWO
 6JgjPhPSbdKXrQoY26ztynv8S+S7lRLKjc3GTZ8HYk0Jhs/Tdc2AK3Xqofb/Bb/kfEISoEQQ5fX
 C1iZAU2GsZO4bFB0rEECph0PRbjno5y/rsqCy+EzmlCgEr+dcXgn9HQuQk4AP2swN2iQcCN0HWf
 TbmUppquQVB4vI=
X-Received: by 2002:a05:620a:1d08:b0:930:9cbc:7121 with SMTP id
 af79cd13be357-936c05e43f3mr2890082385a.3.1786907884281; 
 Sun, 16 Aug 2026 12:18:04 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:18:03 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:30 -0400
Message-ID: <20260816191830.533747-9-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/8] package/sdl3_net: new package
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

SDL3_net is the small cross-platform networking library for SDL3,
providing TCP and UDP sockets and hostname resolution.

Samples are not built and the man pages are not installed: the samples
are demo programs that are never installed, and Buildroot removes
/usr/share/man from the target anyway.

Built with CMake, like sdl3 itself, rather than with the autotools setup
the SDL2 counterpart uses.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sdl3_net/Config.in     |  9 +++++++++
 package/sdl3_net/sdl3_net.hash |  3 +++
 package/sdl3_net/sdl3_net.mk   | 21 +++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/sdl3_net/Config.in
 create mode 100644 package/sdl3_net/sdl3_net.hash
 create mode 100644 package/sdl3_net/sdl3_net.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 964fe9a597..3c8f7c5198 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -173,6 +173,7 @@ F:	package/liblc3/
 F:	package/plutosvg/
 F:	package/plutovg/
 F:	package/sdl3_mixer/
+F:	package/sdl3_net/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
diff --git a/package/Config.in b/package/Config.in
index 853d3bd07d..eeb10fd569 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ comment "Graphic libraries"
 	source "package/sdl3_gfx/Config.in"
 	source "package/sdl3_image/Config.in"
 	source "package/sdl3_mixer/Config.in"
+	source "package/sdl3_net/Config.in"
 	source "package/sdl3_ttf/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
diff --git a/package/sdl3_net/Config.in b/package/sdl3_net/Config.in
new file mode 100644
index 0000000000..8375e5e0b6
--- /dev/null
+++ b/package/sdl3_net/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL3_NET
+	bool "sdl3_net"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  SDL3_net is a small cross-platform networking library for
+	  SDL3, providing TCP and UDP sockets and hostname
+	  resolution.
+
+	  https://github.com/libsdl-org/SDL_net
diff --git a/package/sdl3_net/sdl3_net.hash b/package/sdl3_net/sdl3_net.hash
new file mode 100644
index 0000000000..af871c8e99
--- /dev/null
+++ b/package/sdl3_net/sdl3_net.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  098522fc26d4e302ef9348aee6e76e67fe504dfefd7f596236568f8330570c41  SDL3_net-3.2.0.tar.gz
+sha256  1c040b8271b37e5076359f8fd54240e371114112924d2df81ef87c7d6a1dfdfd  LICENSE.txt
diff --git a/package/sdl3_net/sdl3_net.mk b/package/sdl3_net/sdl3_net.mk
new file mode 100644
index 0000000000..da7deee6f6
--- /dev/null
+++ b/package/sdl3_net/sdl3_net.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# sdl3_net
+#
+################################################################################
+
+SDL3_NET_VERSION = 3.2.0
+SDL3_NET_SOURCE = SDL3_net-$(SDL3_NET_VERSION).tar.gz
+SDL3_NET_SITE = https://www.libsdl.org/projects/SDL_net/release
+SDL3_NET_LICENSE = Zlib
+SDL3_NET_LICENSE_FILES = LICENSE.txt
+SDL3_NET_CPE_ID_VENDOR = libsdl
+SDL3_NET_CPE_ID_PRODUCT = sdl_net
+SDL3_NET_INSTALL_STAGING = YES
+SDL3_NET_DEPENDENCIES = sdl3 host-pkgconf
+
+SDL3_NET_CONF_OPTS = \
+	-DSDLNET_SAMPLES=OFF \
+	-DSDLNET_INSTALL_MAN=OFF
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
