Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC67C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7319560F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7319560F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34DE483196;
	Sun, 25 Jul 2021 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHFMnVY4Okrs; Sun, 25 Jul 2021 14:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8261283103;
	Sun, 25 Jul 2021 14:11:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2977B1BF34C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1838340147
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-BUc1osIwOU for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 14:11:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FF94401A4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:11:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id oz16so3213591ejc.7
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAPN9GkVTnmAZto2y3i/h8TN/pm3PNyK5RAD39WOMJ4=;
 b=ALPHYOHX6rRo+nP9R4MUCsZzMdAjkUFmsLADnHg+QWMMEz8DEcTqZtu5aWv9v7Llws
 LvcoqERZb1iY9KZWOduB31YjRE/Njqa6mG941iADmw+S6ZgU2R9jeGkQbK4aD27UeZGs
 HqyaZvkiteLdv/6iH9WKy7cSgSJdtCs0dfrJNedbKHaSOK5RZFZobkuss630ZwF0pncp
 qN/wvHWhmtNvoQPUUrGZAQVAzMv5shdFjTNpg8CcDW1QRWguWna5QuCHTDxXNhR06yCG
 wa1VNmFzkPnGAk/r0oGdIy/PLQQPc9UgulQnVnLDRWMxP2jvFasm2N1/cdihgAEqfPTx
 SfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAPN9GkVTnmAZto2y3i/h8TN/pm3PNyK5RAD39WOMJ4=;
 b=cq5deyeKjU6FeEske1eBfhwhf9b+SGvMTTt+ue/DZYt6aZuzBG+wetf/+GbZrtNVPL
 5kBsFs73YlhnfHd4qkY3Xk4QybDAvbKq04si8w55mWxUhW3jFdrpvLdMGEum4ct8otiY
 Q7oMjMKOoyQ82vDAwA4U0toJ6epV6ebvyPHDajlTDtBA0sodhIITw/TMhPYuW87Bi8z1
 29OfsuXxFXXY6DeeYyN2tHtuyZ67Lb0c1Ol9qBwaca91MkUhih1Nz/s1DXobwkcR0uRw
 IbribMCh9HYMnE+jnu76Fw+SvfxTeKtm/JxdObB0Tjh9UnvRQ8qftqEDnvjT2B+8x7or
 3OrA==
X-Gm-Message-State: AOAM531zbS40UFoSOK8wh8zp1d6ia/WPvACHZ9OhJQ6SP+AcXDMYwR6n
 gTi9yx3eFuA8n963zUghqUMQMNT4pJMiPNe3
X-Google-Smtp-Source: ABdhPJxXhaqfNgs3HjHvaTwKFRgG0P75zwHpPWgfmEOh/SJLG+uhVjiMwsfKEcWbGLch7w7OsIK8hw==
X-Received: by 2002:aa7:cb86:: with SMTP id r6mr16116050edt.181.1627222314432; 
 Sun, 25 Jul 2021 07:11:54 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d2sm13313515ejo.13.2021.07.25.07.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 07:11:54 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 16:11:45 +0200
Message-Id: <20210725141146.539853-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkg-kconfig: hide defconfig targets
 if defconfig not supported
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

When the savedefconfig target is not supported by a kconfig package,
(like is the case for busybox) it doesn't make sense to define
busybox-savedefconfig or busybox-update-defconfig. Calling these leads
to an error from busybox itself "No rule to make target
'savedefconfig'.", which may be confusing.

Only define the savedefconfig and update-defconfig target if
$(2)_KCONFIG_SUPPORTS_DEFCONFIG is YES.

Note that we also need to define it as phony in the condition, otherwise
'make busybox-update-defconfig' will just say "Nothing to be done" and
we really want the error "No rule to make target
'busybox-update-defconfig'".

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-kconfig.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 715c3e04ec..baad2e3baf 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -279,8 +279,11 @@ $(1)-check-configuration-done:
 		exit 1; \
 	fi
 
+ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
 $(1)-savedefconfig: $(1)-check-configuration-done
 	$$(call kconfig-package-savedefconfig,$(2))
+.PHONY: $(1)-savedefconfig
+endif
 
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
@@ -289,6 +292,7 @@ $(1)-update-config: PKG=$(2)
 $(1)-update-config: $(1)-check-configuration-done
 	$$(call kconfig-package-update-config,$$($(2)_KCONFIG_DOTCONFIG))
 
+ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
 # Note: make sure the timestamp of the stored configuration is not newer than
 # the .config to avoid a useless rebuild. Note that, contrary to
 # $(1)-update-config, the reference for 'touch' is _not_ the file from which
@@ -296,6 +300,8 @@ $(1)-update-config: $(1)-check-configuration-done
 $(1)-update-defconfig: PKG=$(2)
 $(1)-update-defconfig: $(1)-savedefconfig
 	$$(call kconfig-package-update-config,defconfig)
+.PHONY: $(1)-update-defconfig
+endif
 
 # Target to output differences between the configuration obtained via the
 # defconfig + fragments (if any) and the current configuration.
@@ -315,9 +321,7 @@ endif # package enabled
 
 .PHONY: \
 	$(1)-update-config \
-	$(1)-update-defconfig \
 	$(1)-diff-config \
-	$(1)-savedefconfig \
 	$(1)-check-configuration-done \
 	$$($(2)_DIR)/.kconfig_editor_% \
 	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
