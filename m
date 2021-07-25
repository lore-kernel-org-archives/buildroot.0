Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4A8C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:12:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F25A60E77
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F25A60E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4499403E2;
	Sun, 25 Jul 2021 14:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlb9uorezZyT; Sun, 25 Jul 2021 14:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1154C403DA;
	Sun, 25 Jul 2021 14:12:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE89F1BF34C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCE9140288
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVbJBh6umfzA for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 14:11:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E39E140266
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:11:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id nb11so11777610ejc.4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67JZMXUAfb1eV2r/k1rVYPalp7oQRKyigzK2hrmDwOA=;
 b=MMBjixiGzt5kQuoDPdT7CJUU9IlCROXN4iswa29rUCaapxa3Z+xEu7ttjQQRYFbd7k
 OnOegyLcAUmXlTCdqodA6+yCEZlKM2Hl82C2qf79Hw7c9IbABSvIRFexoskDeJlNnaVW
 9t4NmXRWiX2/4zc5fZEpo885mPFwuvd4FdmsbKepUjviWl6BbRJ2amlusV77uUDRmzM6
 uKUEBX4nbS6gdnXojTZJzJcJpWxni9mXxpnI7EV41ApjYEXg9a7apkkkgUluuVfbGrD7
 9bWrxc54XcB/X8FnFZ1sl8KQNYD1t5hYL1E+VhBX5BS9V8QHftRAk4p+xYKGZufBo/w0
 E1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67JZMXUAfb1eV2r/k1rVYPalp7oQRKyigzK2hrmDwOA=;
 b=RvVw9TsTPtlGelBNDjMrv0bXHhc6zJ9RQKfSKMJTGtCHtjCwrOdGBWKXwlz4Zg6yqF
 UhLU7Y3InzQkAVEQckzGRrrRruTRybHx4v9Zp2rnlBEQBpj7s9NpknaHaYUn62TKHmKC
 t1260ys2Z25vMvYicztoAOBnA9y+pySHztZQ+AnBsqSOH6tnLuXUpUP/ZeTK0I+CAPSE
 176B/tHhObk16USYr+MfNBPqtKqRFABsNnEel5G161lYj4fbnXwjWMdhs/w0H++QjEmM
 pAXASzvG4zcPkJ4U/6BXXcxrk10om/lGYY9MRrwicC2kB94vvBtB1Ou2twHVMXP2XhVR
 jwvw==
X-Gm-Message-State: AOAM532bnjEc+4zYP8xhLsgkt7m6sQOJozBrFdehIKaNakdNn2ysmoJ2
 rBjeXlvNvZQXvEqMhStqpKTkW1z+3EmQZENw
X-Google-Smtp-Source: ABdhPJwD1xrw0ORUhOLGjnoazUdEePp3Z7zj2bL80W5vvjlbehQSqSduAo0/7aSmO6yeYHhBE4knCg==
X-Received: by 2002:a17:906:4889:: with SMTP id
 v9mr12963392ejq.269.1627222315036; 
 Sun, 25 Jul 2021 07:11:55 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d2sm13313515ejo.13.2021.07.25.07.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 07:11:54 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 16:11:46 +0200
Message-Id: <20210725141146.539853-2-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210725141146.539853-1-arnout@mind.be>
References: <20210725141146.539853-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig: only define
 -update-{def, }config if supported
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

The foo-update-config and foo-update-defconfig targets only work if a
custom config file was defined. Remove those targets entirely if they
don't work to begin with.

This was originally handled with an error condition in the
kconfig-package-update-config macro. However, it makes more sense to
simply remove the target if it anyway can't be used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-kconfig.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index baad2e3baf..1e18d7dc07 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -12,12 +12,12 @@
 ################################################################################
 
 # Macro to update back the custom (def)config file
+# Must only be called if $(PKG)_KCONFIG_FILE is set and $(PKG)_KCONFIG_DEFCONFIG)
+# is not set.
 # $(1): file to copy from
 define kconfig-package-update-config
 	@$(if $($(PKG)_KCONFIG_FRAGMENT_FILES), \
 		echo "Unable to perform $(@) when fragment files are set"; exit 1)
-	@$(if $($(PKG)_KCONFIG_DEFCONFIG), \
-		echo "Unable to perform $(@) when using a defconfig rule"; exit 1)
 	$(Q)if [ -d $($(PKG)_KCONFIG_FILE) ]; then \
 		echo "Unable to perform $(@) when $($(PKG)_KCONFIG_FILE) is a directory"; \
 		exit 1; \
@@ -285,12 +285,14 @@ $(1)-savedefconfig: $(1)-check-configuration-done
 .PHONY: $(1)-savedefconfig
 endif
 
+ifeq ($$($(2)_KCONFIG_DEFCONFIG),)
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
 # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
 $(1)-update-config: PKG=$(2)
 $(1)-update-config: $(1)-check-configuration-done
 	$$(call kconfig-package-update-config,$$($(2)_KCONFIG_DOTCONFIG))
+.PHONY: $(1)-update-config
 
 ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
 # Note: make sure the timestamp of the stored configuration is not newer than
@@ -303,6 +305,8 @@ $(1)-update-defconfig: $(1)-savedefconfig
 .PHONY: $(1)-update-defconfig
 endif
 
+endif
+
 # Target to output differences between the configuration obtained via the
 # defconfig + fragments (if any) and the current configuration.
 # Note: it preserves the timestamp of the current configuration when moving it
@@ -320,7 +324,6 @@ $(1)-diff-config: $(1)-check-configuration-done
 endif # package enabled
 
 .PHONY: \
-	$(1)-update-config \
 	$(1)-diff-config \
 	$(1)-check-configuration-done \
 	$$($(2)_DIR)/.kconfig_editor_% \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
