Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D44C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:11:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236F161360
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 236F161360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B52A660853;
	Mon,  8 Nov 2021 20:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhG9bbTnsAOn; Mon,  8 Nov 2021 20:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA8B606E7;
	Mon,  8 Nov 2021 20:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A94E1BF867
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDA1580DA1
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5Lq_gh1hBEu for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 20:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 028C980D92
 for <buildroot@busybox.net>; Mon,  8 Nov 2021 20:11:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u1so28971991wru.13
 for <buildroot@busybox.net>; Mon, 08 Nov 2021 12:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hl/3lleRUhcPvLtItUiUcoWGSX7TAr6mUcE5nw0yaDo=;
 b=HVK89sBMuXwxvsUWa6sBKXT40mRsCZCMh6IhC1K108MboZPuxzpbbKjq1gYvOzdGsJ
 Huk9YzW7njgwBUJ4+hFtQXHs4zm1fxYz9yt1KIHMmKBqEE2AhZqFMuSrjG1T9Shv5Fiu
 a58z7gd58XEQ8zTqAYOORDdvwLkAb4/FrkUqVzD2sZt5SjRP5AcAXgCEajMV0PO0trPC
 TgnTSIOh24CRlJSlXsw7GJBZwqFYGGePtoVNO8Pg4lNZwqlRxJ5U9jhBUoh8JpsleROR
 w8K7V/yCSN+g8+ed2no+gFNViwX3Lo4j1u1c7+Ur/lRLDb1zJ7yA7qoqR2LQgp/8UNJA
 2czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hl/3lleRUhcPvLtItUiUcoWGSX7TAr6mUcE5nw0yaDo=;
 b=z6MYj6DHQCi+lL5bHYZcoKzaDEIUQRAqcbfA+I//DuShJv5rckCeJadETJwVSeuLnP
 h6Lc5D8dSaapNCU+XHLp2Fik5vosSAUor+Fc9w38jjcFTCyAzPWtkWi9hxDs2+ueMma8
 IUKVlJ4h9SEXLwdtybzF4W7p48atfzSF42TrvpPDAfYKpm2+C/IeWGe3r8rxo1jqZ4EX
 VzKMgZhZ7sIeJL5dgCcIniPT2JQkzd4eU1eFKgN54miPiBtnnT+/oo5UCw1BogGIOfB4
 euduzp9EBENM4oF+IzxcfE2zeda6ir9n/cQxm43qCNLhocy4AFk/47Cb/bpLX3HifVic
 X29A==
X-Gm-Message-State: AOAM533YVkNtQLOsGZ+35l1VkyhaLo7VXO/hXuFREo5BVMclIn5Up4/Z
 hIYvBII8mFSrKgCeIDf/4vvBbSjn1vc=
X-Google-Smtp-Source: ABdhPJwyQm5JzNchpQjiVH4fnpmWgGxVYYU9FXGRq/dWTq2uav9RTapQ8MUlU9Nf3gQa/TOauuKdqQ==
X-Received: by 2002:a5d:4143:: with SMTP id c3mr2359438wrq.254.1636402260318; 
 Mon, 08 Nov 2021 12:11:00 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t189sm357726wma.8.2021.11.08.12.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 12:10:59 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  8 Nov 2021 21:10:54 +0100
Message-Id: <20211108201054.225256-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luajit: fix luvi
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

luvi uses the cross bytecode generation of host-luajit
the bytecode format has 2 flavors, depending of GC64 option.

since the commit https://github.com/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32aad79b7ea8ea6b78ed25
GC64 mode is enable by default on all 64bits platform.

with this patch, luajit and host-luajit are built with the same option,
so the bytecode generated by host-luajit is valid on luajit.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index fbbd8ebc7..ba5d85434 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -15,6 +15,7 @@ LUAJIT_PROVIDES = luainterpreter
 
 ifeq ($(BR2_PACKAGE_LUAJIT_COMPAT52),y)
 LUAJIT_XCFLAGS += -DLUAJIT_ENABLE_LUA52COMPAT
+HOST_LUAJIT_XCFLAGS += -DLUAJIT_ENABLE_LUA52COMPAT
 endif
 
 # The luajit build procedure requires the host compiler to have the
@@ -26,8 +27,10 @@ endif
 # libraries are installed.
 ifeq ($(BR2_ARCH_IS_64),y)
 LUAJIT_HOST_CC = $(HOSTCC)
+HOST_LUAJIT_XCFLAGS += -DLUAJIT_ENABLE_GC64
 else
 LUAJIT_HOST_CC = $(HOSTCC) -m32
+HOST_LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
@@ -66,7 +69,7 @@ LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 define HOST_LUAJIT_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)" BUILDMODE=dynamic \
 		TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
-		XCFLAGS=$(LUAJIT_XCFLAGS) \
+		XCFLAGS=$(HOST_LUAJIT_XCFLAGS) \
 		-C $(@D) amalg
 endef
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
