Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EFAF53D90
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 19:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB73F40C81;
	Mon, 16 Mar 2026 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuUQHykrVdoQ; Mon, 16 Mar 2026 19:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E6DC40C6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773691056;
	bh=BLWGMF+gif+/wiMQFD6/l5fBb3BnBNDEuVNmLWQfOaM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LLeIZYKmvuhBRcWWuOmiolUf0Ki4OsW4Tthb7xFWYfIgkcUGFC/reprOJtnqmCeh2
	 rPYARz72loMxEudKLSSepSZA+kPmRswkijTRkbqlvifAZWNL+8Lmft5PdpAivexLoA
	 p5VuP1QO/21dDCXXNT31ntyUpqd1C5rwlNCBKyIkjvB6iQevlEYRZOB9r7NefxpbfC
	 sRtJ967xytZBZqPfjU2VV0yIayzrWrjghsDc7szIRwFd/vytWL+o+yvaPvQYWPDqCk
	 6lTor4G0leCYNaUh4jAJcGZIslY4EbziWO+APzFRpZRR3tn2Wbu17aXEUCQz0pwKIS
	 mLL4gq/qtgDPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6DC40C6A;
	Mon, 16 Mar 2026 19:57:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF5653BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 19:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E96B40907
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 19:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guJrJ69EjNEk for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 19:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABB7140086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB7140086
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABB7140086
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 19:57:29 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7d76c145ed9so4674922a34.0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 12:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773691048; x=1774295848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhCik8xxoBTLceTU6CZaGR1/Y+5PaMU3MrOOpbUusnY=;
 b=nhE5cgjKbnKjs+VPMcmQpbKIKUbYXXk7kdSpVcLMP9l02jngTSb7h39U7H8fnMrvtH
 Ewo8w2eeMxuqxRgSL+v7xnNoK8FZpOBLqK4No8yVHU/jPnC4M8aNcwfChsfZYVv0aW5U
 SbMP40F+ll1puvb+PnaIKX5V+YDBNYJQXLCDVGOTlYPl8oBE3MTydcanYG7A7jpZREfC
 /ORoA//8J2nZQrfMy4zBgr4pqjfvsQ5wUHf9j5ypxmu+SIuhil4hvKMHtHOqy1kkOOev
 II0wQpZ2tk+9Hn0YLNwZGuexwdtoAQiNQLizsS/Ge8nrcKP4AHauMKjAJUueJH1Udg0P
 oShA==
X-Gm-Message-State: AOJu0Yx3K6CV0wvAtwj8onuVbphJVxQ6bzTcsCvZ3SrODkWJZuQxuFiL
 GgPtjx8N9AzU45YMuvCcWHletr7SiBmqaDE7SktFPkCTU4sGgaa//2iySAX8Xg==
X-Gm-Gg: ATEYQzxTIoXd6xjEb8KIWufHf2QX9KQpfApI7ttuWMG2hvYFzLStit6TwMV0mGNeTSr
 vt0p9V9Ni7tL+nPkT4hwd5f3vshv+3CpELRHorEaHyFefdx4aTeMl0wHv1Mw/kNJ2gv4UBGLiSR
 XB4y5mb+rtfAgmmdadQubgKxGfWmV7o6I06a7rFPudSXlZ4P8JtqAQq3sjXsKm6Ab2GDcrfb3wv
 yllwtXrr5okzzyQxuGnT5+jhrmCPysNy6WKpWg7EyjqMKCbyLeBpoy39jI7DiH3QX9iV6Nb3zh6
 X7FoUTQ/cOhGhJAiknwWiVivnUWrDt2OlTwAlmuWKbAzWn3ZtS8wkKgCoUli+UVMbNtiuG8Of2K
 BpGiRA/yRcs6cNoMC4t1tzAjmUFLQurbG5DtsygaZVg2dfawvAvxU+tA++CzuTC3TyVwJxsSgeb
 +IWDgFL0MvqKwC3LCW8GQ1xAfUmrFbDXnLc8R8a4u6L6SFigjVHwQigziNBRHIsExEAYEet9C6K
 bhLxrU4FwX27TdhuDYrPY4C8IfarLOXaKIDHFrPia2PRm4na5xHMfjizbEi
X-Received: by 2002:a9d:76d2:0:b0:7d7:b690:f2a1 with SMTP id
 46e09a7af769-7d7b69100b7mr874293a34.22.1773691048392; 
 Mon, 16 Mar 2026 12:57:28 -0700 (PDT)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d7ba4aa1c9sm745731a34.25.2026.03.16.12.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 12:57:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Mar 2026 13:57:26 -0600
Message-ID: <20260316195726.690352-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773691048; x=1774295848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yhCik8xxoBTLceTU6CZaGR1/Y+5PaMU3MrOOpbUusnY=;
 b=d1mG22vgEgcNEgdTVZQ48g4U7Wafb9gBYz459ucNh6a940VVEYUtRmbBtWVIF9aYNj
 LvLY7Jst8QcM5NUFSYIhEBHVQuNwujwVSP30VDCygf/DpBCnN4Ch+BOX46JGOHpVAgEp
 mWCqvNGZiZtIC556v97QRgU+jVkb12d/okavbra+sLpzku5jGhpVMC9NMEnH3dAkWU7t
 tklaEec2PDpP4sRFRyVwfTDs8y4pgUPSYIDetKmwbdp9AX2E56Rdh2UUSegNmFKhdVxf
 SYLWHpONcnAn9DO09RQiary+BKLxg+B1INHLHntNpMN55IkA6w1qKxqPc8yEvrMw0ri8
 cJKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d1mG22vg
Subject: [Buildroot] [PATCH 1/1] package/tailscale: don't overwrite
 tailscaled when using merged bin
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

When merged bin was enabled in systemd in buildroot commit
a530492cd3e6de7ed5f9406f7573fe7b9061b3d5 the tailscaled package
started overwriting the tailscaled binary with a broken symlink as it
assumed /usr/bin and /usr/sbin were not merged.

To ensure this doesn't happen only apply the symlink when
BR2_ROOTFS_MERGED_BIN is not selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 86039fd4b1..f231022476 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -22,10 +22,12 @@ define TAILSCALE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
 endef
 
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
 define TAILSCALE_INSTALL_SYMLINK
 	ln -f -s ../bin/tailscaled $(TARGET_DIR)/usr/sbin/tailscaled
 endef
 TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
+endif
 
 define TAILSCALE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
