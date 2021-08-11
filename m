Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0824BC4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 20:58:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B675960EB9
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 20:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B675960EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 721CB40205;
	Wed, 11 Aug 2021 20:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bt8DuRtLZ6xw; Wed, 11 Aug 2021 20:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 868FB40343;
	Wed, 11 Aug 2021 20:58:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF2041BF470
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 20:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9769240580
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 20:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkaA9ObeaF1m for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 20:58:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 042054057C
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 20:58:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso4530333wms.0
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 13:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HRfkWbG0lgwNJB52Lvmyu6MTeHdvzGrTjIlXgdgyeos=;
 b=J5IXh9auEI2XDz/0i9dsKupiZekEso4v8qxVPz9qcHPMaTZ6GNFW8sJtm1EPrQ6JA4
 Si9/ecEc/lHzD8F6guZEFIuN9mcCDzkOojY3e4FuJ8Fw+5HWb/z0I0blqo0veHp6r8T4
 EAhSCRsR3GavfBit55h9XZpcrdxMGH3TXps2CZrnynej8r5NkO6gw9PTgo3jy0DYe8pD
 0cDb32ojkD7qqh6rU5gbhJxO4mmJxaVRfuzMB2SUMiDgflgO2ydEdxHinx3sJKbxKPCu
 f4p6pq0vrL9/ctFXLkd9GNJYyjaNsElZhVE3x3wqyHrMTyUApdAl9FEABsKxlzLsld3b
 JNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HRfkWbG0lgwNJB52Lvmyu6MTeHdvzGrTjIlXgdgyeos=;
 b=EQQKjvcX4UTNtZjqukMsjfwljfn0a483mioPU6Sf/mCkk5jHdaVOl+oLL+ZSF/gt0M
 TQfwuDeYxw0nh+sk8LTSAceH+fASJHVix5JQkkzq7NWCGCO+zlqMc/wqjicceokEZwlz
 tAaK6aUjkwUA48nsfoWj6fN2zqpiS5Lzd7r1L9NOeWkVmSXPTrXeF2YmlczQpJ0AAlEs
 IL/107QRmv2QGkQfzNTzscHQe09H2YSn4TzeuXecCW2kXGUts9PX66foVFwaP/mF6XdG
 muLHg5LmOzWPBC1hNB780UaYqJ3jx4bhYydqrh5/wG6q77aiq4wbvkkiHB5uGbQrVypK
 86Yg==
X-Gm-Message-State: AOAM532fLuXeglG75+WAqSwA+1T9DQ06Y0qMM3Obvb7LNcvEzXq3kRsY
 RZHKdVvM02H8+DYSrrNwUd7U6s8YjhHPfA==
X-Google-Smtp-Source: ABdhPJzK0pLqOKwvc6XHiYx4jVEmoWAAjATjZ1N9azkL/AIFIyeA/b60qBw1B1dBROOY1UNOgmUnHA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr459992wmr.168.1628715506593;
 Wed, 11 Aug 2021 13:58:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id e10sm427125wrt.82.2021.08.11.13.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 13:58:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 22:58:14 +0200
Message-Id: <20210811205814.1317710-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/perl-net-ssh2: fix gcrypt build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Pass crypto_backend option to avoid the following build failure raised
since bump to version 0.72 in commit
cd1d56bcde2a571062a1943c88506a8d9d2db357 and
https://github.com/rkitover/net-ssh2/commit/86a1274534dd7e0da03d98fb88c9c7ad4b1adb9b:

/tmp/instance-7/output-1/per-package/perl-net-ssh2/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssl
/tmp/instance-7/output-1/per-package/perl-net-ssh2/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lcrypto

Fixes:
 - http://autobuild.buildroot.org/results/25747ec239e0b92775aa883e4f531f77d45f352e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-net-ssh2/perl-net-ssh2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 5572e23257..20e45b6287 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -18,7 +18,7 @@ PERL_NET_SSH2_CONF_OPTS += \
 	inc="$(STAGING_DIR)/usr/include"
 
 ifeq ($(BR2_PACKAGE_LIBSSH2_LIBGCRYPT),y)
-PERL_NET_SSH2_CONF_OPTS += gcrypt
+PERL_NET_SSH2_CONF_OPTS += crypto_backend=gcrypt
 endif
 
 $(eval $(perl-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
