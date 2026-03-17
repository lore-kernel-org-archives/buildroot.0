Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93448FF6E8A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6685E6152D;
	Tue, 17 Mar 2026 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5k889EF9dJo; Tue, 17 Mar 2026 22:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AEB061529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785798;
	bh=wxt1D3CuBkyXV7AnmoNiOp+LbfLgm2QV2Yo7AGjNLg4=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iN6jDn14MsJ5DlftZ1T83KCwkFBOMoDDhRqd8aFleziawDO5uWLVZRfGd+IpynMNa
	 MMwKTN/9cT4/9wkWo2KxJEdihojGSI+oMFRsUdPXd9QbL6Br7P9AnFZoHpaKNW76Sn
	 +RWmL02WASKm+P+cr0u8gpu/vYdv4Ji5GjPvH4t2ryYe6fCrk4qNOmTIJdfuvNVwxV
	 Wri5/1ljz7lojdrHIULuS/59HTg930FDZi31+5dM8xz5usSKeFP/BPk19YEzW2h37u
	 BS9h/9uWiMYiZ95WsSHpJhfkxfmgTWl5OZz/KpcUBPEHXG0Vm1N6wOyveLWxRAYlDM
	 TjcR3F8e5ipDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AEB061529;
	Tue, 17 Mar 2026 22:16:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7F171B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E974106C
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bETkYoRdlcRs for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDE6D40E6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE6D40E6E
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDE6D40E6E
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:32 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-35b9d29480aso2061072a91.1
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785792; x=1774390592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X/dLMzUNtJdmaOHbs6vKsJGLVvQWhyA17kfj5upiVGc=;
 b=TFOeKeIw/C/iwpwii2yNf/9fGEXr/NUPKWdQ7gRa8UCGJDMYoB4RbLYcGmCPzrRC7s
 a1NA+I+3fuMMLFHZz2sj47O+MGQ8jrViX9WFfor6RBiNn5mqEGEUt8TJ4KFN+CdPXFPt
 b3lwWkmrJ68WCjV/rPtQuXTQ0ceGbMsBUhChM+x1YgkuLhJ/zh3nS2Q7rp0yxUDks1sc
 Lso0WH0F9NJwUf9YqobOD6XVjuD064eji6wFYSM2jMFXotR6MPJHBAZXOhhfURclZNuW
 zJjoV+vVezHr2vutlQEAhjonEaBMyaRUnzXAgRBvY1aCex9VK6HfJSPASZActnJJzRUy
 P43w==
X-Gm-Message-State: AOJu0Yxt7X8nAj/MCVECK26+4AH7WJw3fXmwFT61jq/PFkGOmXc/jtjJ
 1mbT3ilXkX/FzHfNPj65qvtOFmRxCpCoi8h6PlfpF77qqJjgAo2Jph5b
X-Gm-Gg: ATEYQzwVpNgl4rtlXXS6B9ty7C+9kyIpRj6VCXfJAZmNdbYwXfMBJ3i3WlrdWx1SIBY
 KCbxHvktjVgRtUPdCAIZLpxxVItzL4c2E2deNC1F4onyyohf9f3wjIhGMbi/EROedDlsoKaTLLx
 7cNI6n/MMzqVxVZj44OpY76A4Qy/CVHOEkpV1DPERqy6PCzoE7E9J3lKveuIxF9psQIEkYadxAa
 ahUUG1u/2/Ah8JiVA1p2qqS7UkSXzpLvxDl/b8/bNq5aUM2okSVR1bBiQy93OXQT21AbAPo4lus
 n/pemgZQSQ8uP4lyM253XGXCoIfF9wHxz4SLm+XyMtdZMDqFPb/LJcWn15lCpSEyZ2O+Yb/t+7H
 U5miY0+NEOV7Bc4V9dj7xZmN4ni9FO9WcX0cmYk8vBZoi4pkWeqQOcPzBZoArrIw6setGIjz/ZJ
 cQisJTtMvn/U5bwm/B8kzx76nHao8=
X-Received: by 2002:a17:90b:3d83:b0:35b:9ae3:9080 with SMTP id
 98e67ed59e1d1-35bb9e7f6b1mr889058a91.14.1773785792098; 
 Tue, 17 Mar 2026 15:16:32 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bada2bfdbsm3997231a91.3.2026.03.17.15.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 15:16:31 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Mar 2026 15:16:25 -0700
MIME-Version: 1.0
Message-Id: <20260317-virglrenderer-v4-4-ed223e222bb6@gmail.com>
References: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
In-Reply-To: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773785788; l=1764;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=GQ2USBpCC4toY0FwGBarUnG/ifhp5lt1NMCBNcFQz5U=;
 b=VzCvPcAbKPlrnV/b3TGVXNkvGh4RjQre4RfgjMGUNVRAEm/C+ZJIGgQrKOiIU2GH56Sf3/cI7
 I7C73vNyHbvBcXE+GpQWNj9ICovYVjhLxGYjyU/VjYftfDX1IGYgP2e
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773785792; x=1774390592; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X/dLMzUNtJdmaOHbs6vKsJGLVvQWhyA17kfj5upiVGc=;
 b=NlY4hMuwnmsuWujS/SHKCm0BOAR19b81eBMoZ6u0xRC2cL1Iu+ExRi2rbgI2rjfTRM
 jbLjO0WAc1/E31xWv/ZTwDJmlXMHaVdppht690ylOjMvzrWqWN0+OLuau/IovzpYv8dX
 mE2jjaVWKX3ZY+/8dclKK5dwKyL3c/v+nerqJOof/IeEToVDkJAlazGC1Abb4ARx0Gb0
 cVILfGU4gKX2lK6CPJr763CsfdXJ5KrNligjIR28D5mK0TxQdaAYEiAQAgNphipJVaSF
 /gu00Cun6krUbiZvt8yBQBGq8N5t1RXasxN7VeELfcxvIu/RL8i0ET9pKtcgDRvaYrGF
 1ooA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NlY4hMuw
Subject: [Buildroot] [PATCH v4 4/5] package/qemu: add OpenGL config
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

From: Joseph Kogut <joseph@anodize.com>

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 14 ++++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e16eafe446..e4e8eb3b63 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -116,6 +116,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  Say 'y' to enable OpenGL accelerated display frontend support.
+	  This is necessary to efficiently display frames rendered in a
+	  guest on the host.
+
+	  Run qemu with `-display sdl,gl=on`
+
+comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f8e22091..9b780797fa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -274,6 +274,13 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -330,7 +337,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
