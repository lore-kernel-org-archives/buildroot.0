Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0336CD8C9D
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6D940723;
	Mon,  8 Jun 2026 02:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chQldQ9KppYR; Mon,  8 Jun 2026 02:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4FE940874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884386;
	bh=fksUivFC0vfD7f/gl9LLL5kYtYuhhlMaJ4FtIQEDWmg=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BsqDdreIic5dM9C2i6BIgYzqjOz0Inl3s66BAKGbD9OY92prhp7PBp7ygSUehZOVf
	 lz/OGfyH5wrcOif3g33CXalZj+4nYBtIcug7o+SpgdlZqCjS+sr/egr8nFW87av6Oy
	 VOV5JWXwcxgF+ztPlkyr3HP5oKJ7K1y0uyaxhxCywtpm8c6SpHZw6VfadsavaRqk72
	 0zgDwANOrAEFnQUyNv/mc0xBA+BUADNtHuvDNzRXF5YjFrmXwQR6mwXHTjind5Rjaz
	 tIvvT0+7Iwe+FKYucxswe46uz9IhTjKykD7OODGK2zJ3Vs9YiorD6SnTrXBJRLTAkf
	 wlejcYIgXx7QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4FE940874;
	Mon,  8 Jun 2026 02:06:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 142C0EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0459D405A5
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V9tUA5dL_TZ for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48A4240511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A4240511
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48A4240511
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-36bb3551f6eso3229264a91.1
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884379; x=1781489179;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KcuzwI3P8Z1h3jXmBQ1iHOriONQjwFQvdhFVSTU6ICA=;
 b=AWiiS1lp7xFRpEKcvyLeW00SntGeziawYcqq9JZvQJbwXSwEtAcsZ9MdNX7g+sLJ7Z
 HlMzhv0EtwqnfcSw/fhLnxi+s+itqqYKshuT7w7UDYhwCY8y4S/z6Ait+tRyWfbEMBm8
 Af/1EdCr8Jg5D/2RVtMsw/tHhj9bzvRLVrahAP4/OpAJQM7Mo+5A/O/Cljbw6OWmJR/0
 U+gC1RjQCP3clAXmjw47B7JlO0grYgzso0oqUdfWtjJ/UO5XwHqaHhtCKXIOT1akZz0Y
 6ZucrUXtMN7AHOHnHuCG6QRCq4DHdY0jebSDLglp4IFXdEkxU0Bi8Th8225hx0ry5sQV
 z7/g==
X-Gm-Message-State: AOJu0Yw6oXeebHxeJtK9mtO1uxs2wqxcwSgvh+AGdc/piGkwO/NLqu5F
 swq4KhPbXDqszz/xSVmsQFHiqZepQUgylyokKFEP27ogMWR0JE3GM4nX
X-Gm-Gg: Acq92OE7MlCKN8Q01fEutHMPLIZcid/hbZxd0d/eR3yWmfZkA63FsU51JPlyBHqvPTB
 5QUeRbLsZI17wuDPMU3OwyEg5S8h2TfBnfDMh6VWGHKD2CgRwqq+RJSaFEEgr+mUAy/4Sluuduz
 3MTw/uvKCG79Yh5fCswwJYMC648RMn9nt9zNJrmPgrerHPpZ6RcK5Cp+dfugjcxfKIYQls7t0On
 44ADykRtrHXufMySIh7p2VOPKc6AfPJul+WQVzZLkG167anhdZb7a/JT6EJIJlaQnoMN1N/qSeS
 H4Nwr/vJfoIH62vGsxr1ZiGLzHqgYDaY1FRx/kcaiyELHqyA/l9JBKlkaV37yoQKkHJArq+yKZN
 ChwaGWywEmWeU8TWfrEf5S/NeBeqdNHY2B8EZezhXfs9ryU/3Q5698tROVtRk4tF08SlfiI+xu2
 D7fk/s0u3iZugkShOQNDjcSglgUwwE2bTXyplVKeo=
X-Received: by 2002:a17:90b:5787:b0:36b:8824:d7cc with SMTP id
 98e67ed59e1d1-370f057a115mr14824603a91.20.1780884379349; 
 Sun, 07 Jun 2026 19:06:19 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:18 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:08 -0700
MIME-Version: 1.0
Message-Id: <20260607-b4-virglrenderer-v1-5-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
In-Reply-To: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=1803;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=pmMGlcMWh9kxQpVMMNkwPl+DxENi9zXc/ywjzo91VHU=;
 b=kHQ6UcNB86Z1110bI3HoX7OGSAyTNKQzIGUYa0w1t9RFYXYxYt3yf/wRSaNjgt8VavuykrzeE
 fgAFgCc6qO4BBaWvGs6ze+oUCbawu+xGr5EXLJe8XpENU0ZJxsJy2nm
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884379; x=1781489179; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KcuzwI3P8Z1h3jXmBQ1iHOriONQjwFQvdhFVSTU6ICA=;
 b=elscnuTZuxL/8A/JZX7X3EmHyM+LYdPuu1zJphmxSP5feMY+2c1JJuJvjMJxJ6IIdi
 jeAGEyYefpfHwUMXacVtCVF5AOTfyuj4TE95gapc1G2MUxjaLVcYfWwaNEY3hMT4yart
 q4mMIHR8FuAmMUpywCXf72+i02qH9HCq3Tep7+rjFDguf8iRYvHMGn8dobDUjX18a74X
 ML9f6kKphjlN+gb5YzY9ncrZ5xJHJA3JsTCL82P+jlqJdUMxWxIpDYG3Cs4OyIVcC7Kd
 en1f3y1cEx0f55ntHjaNhT+4bXrb4Fa53ZmguSaRaduaBVhxXbfkM7KN2YaUgA/tfF4b
 SBEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=elscnuTZ
Subject: [Buildroot] [PATCH 5/7] package/qemu: add OpenGL config
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Acked-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 14 ++++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2a6aa288d3..8e932c014f 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -112,6 +112,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
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
index 2199db38cf..aff1762fb9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -272,6 +272,13 @@ else
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
@@ -329,7 +336,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
