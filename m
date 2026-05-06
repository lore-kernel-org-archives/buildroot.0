Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7C6CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA81A4077C;
	Wed,  6 May 2026 22:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fvwz-d_zstV; Wed,  6 May 2026 22:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59B741004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106851;
	bh=oxsy3ZjjuooXyaAYD6u8ONk5RRw+6GLuefiyP446blg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iz7mrHpU/t23uL5f/SK07QZUHjvtiC5JLsY7cv688GzUFh8Mh/IPrMkvnDoE9/EJX
	 OtBZ85nf5A7vn3N5BFkUMUunYLSZ/WZBj5eyBFXWxpur5QD7vejn5XIShmjs7ugW7u
	 4IWU74EubrlvbpHsjLLpVo0jBaeAVL6DQd31wjSeqTUciZJ3wm6FNrT/hVhrfXHupU
	 GbXKKaUy2962tUEuXRMPkcFPYeTsSJKQ5M/jRL7v8BS3hwt1zKzs0sj66QqRW7QJZH
	 D5T0E4o+cjIAveaeQtVWwwc7QBdKprYT0b1EFvseezmstodCGcUyO7XIuImHyHQfFf
	 NxtOELD6d0kKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59B741004;
	Wed,  6 May 2026 22:34:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9FF8280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7913406F9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDT1hcFICoyz for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC428400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC428400EC
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC428400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:06 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7de7dc85b74so201629a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106845; x=1778711645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u23z/r7yrEoQkDPtiNy7Xn4YAMZ+777UNQHcYzvGNRg=;
 b=SuQeBNhomwvidRPyxeLQfxLwjhIkYMdrlXSgtvUftJkLzYje24tJE3hrQ5RTYJfzzj
 ieSGmD5VVndJLP9sr/FTpvt/7Lsraknl4l/B5d++6BPUYPqNUmaJhYktFafl+lWpt7L5
 AF2xy52wRoJtcbbDbecQOFhOItJcAaLKUQdwPRTZa2xwtWMN6dOSk6ZtzraBE6vipOeB
 RGd8VVoBE3So7HnzN7IK2/IpCTdeDtQdF9YOqA66e9N/+l9Ko8i/OKw4N170DmmtBAQf
 9gakiF8CIs/kkprVmcF8nLYEFE0hHzJfBcbdINzFvzbk7tY8czOyVpPdcjy/0NKM1OzC
 dMWg==
X-Gm-Message-State: AOJu0YybnXWIOtBSw0cE5WHfjt4oamKKJuqiAckMvMfPP6XPzyXKhpJd
 qyEXMh5zbk2PE5FAbswgjHR5s3rP81vhBAUk2gA9pzq8iHlq2JZ+tlzuB39CeBjm
X-Gm-Gg: AeBDies08+P04wDgWkZZaEsSQfUi3Qgx8xm+oBD0GTPCxszcXofAeS+V2MG+eCPWntk
 X+6isgWEVFlDSYjHU1kjWCYh6Lx5snZte7vt0dAtXTGWirasKv/Di73afDWX1V5KL4esbWReIfv
 ChynjJKu8oXA6CbLKHPrMI8lSVQgu/fo+y0O4iUc4furW6FI1oLUuImGwr5F9Lp7CgVjpe3uK21
 qV8hcANAbMLkmHJAoaJL8VY8zWLRKgxzNy0wBZM2dH7rx811XRQ/e19CL2IJg94ucvB9oz/m2tR
 ORwMNv77V0qQRXB0rXRBTFdh0WY4eKOLsDf08cn7KApzqz8oj6154DkOC4aQr4RlcN06mviqpXO
 lGDNH1oo90YDA5XhcalXX+R7etvQNfyDc0T3y3+LsIz9XDHLbWKRfuiv1bwcF6nAre08VEE+ASs
 Lz5fRqZMFYWenvhU9OCeN0D/6642HORY1GWoxBjtHj10gd08Qc2ctfOOngSoo4uwS6kvVyO3B7X
 B3SNfkeALBxh2/l96aaf2lntTULWIt0eT5PuzCxi3QEIlwlJo/mq0AIdae2Pit1/ci3msztyLpM
 VXA24us=
X-Received: by 2002:a05:6830:2b29:b0:7dd:72f:7fb6 with SMTP id
 46e09a7af769-7e1df074314mr3018521a34.17.1778106845565; 
 Wed, 06 May 2026 15:34:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:18 -0600
Message-ID: <20260506223341.1759760-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106845; x=1778711645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u23z/r7yrEoQkDPtiNy7Xn4YAMZ+777UNQHcYzvGNRg=;
 b=sg2jHSuER6qqevULWrcgZ53Kyaw+CgN1bwvoemzxatO+FerW9BLSS7YaWX/8uAvKcb
 A2p4nSZ3LTRhSm0eX1bh6VABulG0ll7WWhrzVKLGNpUq1+oKA2HXWFS2S9sT2HU0tnIP
 CxOJ38gg7pgZC1jjRtChnRsISiqSn/HggPgCk9XoYaZtccpccV5m+YJ/M9yPFdSk++cY
 kDNHTkEjT7UiMT9Y5fK1YfEBCEVTwWl1ikYqCk/ffEzP+vlB+o7uk0WbQGEOTjxMlohF
 Pn4RNliEOau86sDCQOXbmJXRBASCjb6/Fse1aIJBsh+qUdhriTx5lgdTXlmgp0KRvAuz
 RifA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sg2jHSuE
Subject: [Buildroot] [PATCH 17/40] package/mtd: preserve /usr/sbin symlink
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
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mtd/mtd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 2a625fccce..032c486c66 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -157,7 +157,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FSCKUBIFS)	+= fsck.ubifs
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
-		$(INSTALL) -D -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(notdir $(f))
+		$(INSTALL) -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(notdir $(f))
 	)
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
