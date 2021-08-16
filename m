Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D66C4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 21:52:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E3260F39
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 21:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48E3260F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE96C80FE8;
	Mon, 16 Aug 2021 21:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrdSuC3Pkw1C; Mon, 16 Aug 2021 21:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E90F80FEF;
	Mon, 16 Aug 2021 21:52:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25B371BF3F9
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 21:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21EBF606C9
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 21:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rH971v6hbTZV for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 21:52:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B1AC605F5
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 21:52:10 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q10so25632427wro.2
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 14:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eeO/QkA7pYMBMqW0y///udStIL1LRKfyE3HgWAJbRcw=;
 b=Fk2x5MSXKL4NGKTc4VVH1eVCGJb99S23/p5hYwr1CI/avixd5S7rCCIRBgmpyREsRY
 XmNruYI1XHu4j68jclItZA87IjhfQrTQQehuIBjkW6z5rYSnSOTGZ4nefDnzUQ8IIwD8
 w4k19GHyWhz95vBApM6ta8r398qb5yyjC0MNMeDVBCx5V8IyNaTdO/Pj9lnNxUXg2Pz3
 hlYzFO7eCNwGlDqkGZZaueEXhdDjx+is/fk+fIaX8rus2yvNl3f4MHpPE+2BL8JsynPj
 YLlOGoXvm8QeoEpnbjgXqlfHOiiy2DNm908V4ZBBl3Y3Y/4QAijSTMUELsubV4QPuxqG
 2/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eeO/QkA7pYMBMqW0y///udStIL1LRKfyE3HgWAJbRcw=;
 b=EqkRzFOvWyJe2QjsgdVeyFBrIQDYlmP9is1v/zEdF3rFLzMViIAYm+CzwlpdQ7laPr
 WyCSVVoituY9InxdiMPlKUQkLieVkwNfCoIF6hIxd3FgpguV3hawgagf2jPaVLw46R2N
 6kGfN3EL9SfdTnof/NznDAslqI+Y0HvPMRgRuyqFWUMYEOH8bdjT4Dc3cvtXYzMAY4Qd
 E2lU6G7F7Vm6FPC2kNqbhG/TWRj+jNq5OYW6OLVgHENlXpWqF1+36z476+f4D0U3UOg0
 jr0L3cOlf0VvzpkMz76opEEwq0TBM3IjdcMQU7TKlGueknjOkJSzkPtDGMX7j2dnYJNh
 VyOw==
X-Gm-Message-State: AOAM532I24mbxgKzQLIptz3sxVJV7/EPGE34wTeMM7uwHgwjxire/ARJ
 gES8Wk6r/SPOwH7SP90LZbZyjDvS4ZatXw==
X-Google-Smtp-Source: ABdhPJzibmlLujfimW+xmQ2NrhfqmuvUNviea4xgtSGYsdSNLX2INK4P+7U973/vUZ6Fqm5PhqAorQ==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr202970wrx.338.1629150725259; 
 Mon, 16 Aug 2021 14:52:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id e3sm55518wrv.65.2021.08.16.14.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 14:52:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Aug 2021 23:51:46 +0200
Message-Id: <20210816215147.2025454-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build without threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failures without threads by defining HB_NO_MT as
specified in https://github.com/harfbuzz/harfbuzz/blob/main/CONFIG.md:

In file included from ../src/hb.hh:458,
                 from ../src/hb-blob.cc:28:
../src/hb-mutex.hh:88:2: error: #error "Could not find any system to define mutex macros."
   88 | #error "Could not find any system to define mutex macros."
      |  ^~~~~

This build failure is raised since bump to version 2.8.1 in commit
e9ba1c80e8ebf5f5ad9d889d2dd37f27af87e811 and
https://github.com/harfbuzz/harfbuzz/commit/711c241f6c7e18c5403602375a733af74df76f83
which removed busyloop mutex implementation.

Fixes:
 - http://autobuild.buildroot.org/results/0c03aca5e3ade735b54b0b9233896b868aec1520

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/harfbuzz/harfbuzz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f327a95eb6..c7f5dfe9d2 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -90,5 +90,9 @@ else
 HARFBUZZ_CONF_OPTS += -Dicu=disabled
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
+endif
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
