Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F69C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 430AA61057
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 430AA61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00CFF80D02;
	Fri, 20 Aug 2021 22:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2VBfz2XD66x; Fri, 20 Aug 2021 22:53:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D8281B84;
	Fri, 20 Aug 2021 22:53:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 487B11BF853
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 368586142C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uf1JIqwohkmU for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 22:53:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7522A60669
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 22:53:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l24-20020a05600c089800b002e71a10130eso3681977wmp.5
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zqY+qkoF+ry9vYSpD9IXS+ZONVdfpKuLlJgTIHuhk/c=;
 b=SbBzLrTo3ZutTl+JmxZ/jXoNO3nREFMRARyACno/33qCgWZWZL+HY4XuIOh032cZS+
 WTbmRlaZGTwAO+781cB/jCdPjtP3cK4zzSGzvgFS82+DGhxmNyf0aaDwbmQ+/ifrloNN
 53Q9Jw5CeXARRXxfksKTA9alWUeCU+bvKEN1LUdRr6NivinbPAgg+R4YEPnfSnxnOm1q
 AI7IyGbARK80P236OtsOx1xzV3G/b/kKsuc8A2f9r0F2rIz2bzDpdzfi5/qH5yv12Jte
 BhhXnO33jr5HbwRfhLtZdCSzGHwETCzfBDhKhyzPfjS/yxCzjKziH7z+yjIadbwOUVGV
 GeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zqY+qkoF+ry9vYSpD9IXS+ZONVdfpKuLlJgTIHuhk/c=;
 b=twX+NZBPbPjm3J/jn5BNr8SCJNwQwAnsPAvJyyPf8ZQPBaV4/mYqs1/YOsD0jS+Qcd
 uJwUj9kfvk5uK5C+wk2HIRLbQ4KYWjFEXSgWc4I3QVNoKzWKnK+vvTvIwvk3O5tKYEhN
 D5RBUPE7E+qtcmyyqSHzfZY7Rjh5W5XfoPVY4DkxgWXq50fXwgStCKG6YUesthS9d2jL
 70nptc4qHL1Bs4K50p3FO7YtY/3Qj1d489Os5ZCpgYdTQ9AKhfXT6LLZp4CBGsM1yf/Z
 rKFmMrpqLjllWr8yNzKnvj77LEAEyk82l/BArxpwjijcoStO2vobCwSL4OKqjf9hSCn6
 x/YQ==
X-Gm-Message-State: AOAM532L0rcdz293/H+H2lClhmH+H98lSwOUFO9XeqYzA/xG/QT5s0wx
 KSAulDuVks17wM28BWvFpq0ldnLc3VU=
X-Google-Smtp-Source: ABdhPJzWCr4LaZrwAV/bOc2ZW0XLW89eMLFv88jA94nAj9p6j8UtvdE2noIdWRfKPvOwlunQ/Wt2wQ==
X-Received: by 2002:a7b:c4c2:: with SMTP id g2mr325746wmk.134.1629500026726;
 Fri, 20 Aug 2021 15:53:46 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id d9sm7280242wrw.26.2021.08.20.15.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 15:53:46 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 00:53:41 +0200
Message-Id: <20210820225341.1131147-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Config.in: disable Fortify Source for microblaze
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

As reported by Toolchain-builder project [1], the system doesn't
boot when Fortify Source is enabled for glibc based toolchain
(the init process hang).

Also, hardening features may not be wanted or possible for such
slow soft-core cpus [2].

[1] https://gitlab.com/bootlin/toolchains-builder/-/jobs/1467624500
[2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
With BR2_RELRO_PARTIAL enabled, the system boot.
---
 Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Config.in b/Config.in
index 2ef5d407e4..84f7fa6e8d 100644
--- a/Config.in
+++ b/Config.in
@@ -853,9 +853,16 @@ endchoice
 comment "RELocation Read Only (RELRO) needs shared libraries"
 	depends on !BR2_SHARED_LIBS
 
+config BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
+	bool
+	default y
+	# Microblaze glibc toolchains don't work with Fortify Source enabled
+	depends on !BR2_microblaze
+
 choice
 	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
 	default BR2_FORTIFY_SOURCE_1
+	depends on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_OPTIMIZE_0
 	help
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
