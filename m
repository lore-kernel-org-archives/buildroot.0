Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DE6CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 145A160F56;
	Wed,  6 May 2026 22:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyeEMK4_14LX; Wed,  6 May 2026 22:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36FB9606CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106836;
	bh=9PRUY7edfCDG7v2jjsVcgrCLdEoDdst4NGwB7HNE7zk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f9IvCsNCCkz8LMVAtoAX5B+HoSF5Q+6ldfkb6NPzCUdcmW3YL1sO7N0jHtWYmpJ8k
	 HOBQs1siUy+Ulxnl8Avauz3l9bAi9B4UmtYyA+e3CP+wRLK3pAt4jqpa6TOEFA3JtE
	 kschFDYaeoBQdGA/n/X3JwMSNeQErvdPKa4VKEPF55TERX6FiVqyb2xKfuAkzYV5W3
	 oVAR8BriaPKtkCDAyzQUkwPJS4sxpeBQvY3g+GttwcjsCW2vVwqYDLlGW81GOyZc80
	 hRJX7tebN0xf1+bVbzzhNKq1WWq68rytQ+0ozcklTz419gXwtsV8mtD9qPjYkb+EZh
	 vdgzL/KW6QaLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FB9606CB;
	Wed,  6 May 2026 22:33:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 198B6280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0877560F63
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDDDaERB2d4x for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84D7960EAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D7960EAF
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84D7960EAF
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:53 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7de4e6c5a30so277128a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106832; x=1778711632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9DIBcU0JS5X0Ry7hVPP4gZLatUnz/wVedlgPllLGYg0=;
 b=JBGY+CIDfiI+fA56YXm0wBHxPSB6rLtZmpY5IYDads9JTuM4rY4bGKTCzZqSXFFLnW
 H3JxtsKABL0rtAI7zJ1g92bQd2mZZbJS2L7keZVAufp5ghcmz38fixje1kN+lSNIGUnH
 SlCx3HDNzXMmUPjo6ZY/KkdRRwzqUbut9GqNypoEvGlrra9auc0fiknHv/5WuDhAYC8j
 1JXwxos9bqu5VR+yLWS6G5IocpffISes8RrqXmXfzI8hEaqRahAQzMxiUlnGx+s91CGN
 6pO+4pe2Ee5XQi5dU0h9UH6X+zYkn6VB0E+GZZT7t6rIYQkJlEgyrFlCr94GBZ6UCY5K
 3uzA==
X-Gm-Message-State: AOJu0YxpEuv3kpw+cjCRB2tr3mQOXLmAQKIPLz0tLCN/74Oq3o/HR992
 cDO8jSTIesSilVA5cjbe5EocKLexp6Ab74WmRRgNhjgjra8DiElplfTVbrFkz1Mg
X-Gm-Gg: AeBDieuKZHNz1Z3rBGf3gDqu78B5rIitCpyMh17v1cmNlr9tlDHYQGVDafuzqdj48Hv
 5VIKg3c+SkCQjmKNKu2n6WHWSgnyJi733uMxX660B4NfQC9DDc7hGthMEj0XUYbfkMVd2msJ5VW
 8K4RV899QGMTI79vI/rgJ8OH3dqOsf8e0kaIZeLfNY+Tf1ZQhkJQp0TJPpgRSyQK5e6i3SdquLq
 E2Z3S3bwdxgMkRIvD/B0UGbu+tG6qCE2yeMqDAXS7djAptk8NEby4qs9hTDSpDzo+8407g0RIrN
 hInRTz8c2Uw+qxMYEMUR8BtGtFHnSg+baBBQpFq+F4XG/c4ZxRN7uSZAJ/qLnoeaPYTB5X+uFTX
 SJaqKeK6P9EZYHpGFuHp2CdViQj/vezBbR1bfJtxXZxTn1dZn10oRhv9PpiAUcxay5xgkNMzE32
 VWsGWCwyMPwn1NG1D2xS0OZHchXTv0RriQnBjNMuV4hHGiGtQSPB8QL2n8f6Acgr+cBnAANy/by
 MGIXnkzpQvDMsPSIsXueXnifI82Kr+364cQMvcIdMYxWmI5iyonpE/wTN/AcEqlz94+jlXM/u3O
 UnOR7/Q=
X-Received: by 2002:a05:6830:4488:b0:7d7:eabb:2a5 with SMTP id
 46e09a7af769-7e1df110d3dmr3011550a34.24.1778106832189; 
 Wed, 06 May 2026 15:33:52 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:05 -0600
Message-ID: <20260506223341.1759760-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106832; x=1778711632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DIBcU0JS5X0Ry7hVPP4gZLatUnz/wVedlgPllLGYg0=;
 b=c7H6OgQlLeh3u90vccwsN3JAVV5r7EPGcoaEH+qtibenqi+D47XKaqxg/iQGuom+h4
 8GeoDKpETrSvB9QzEKT7e1e/EbvZLwHtPmpXg6VRr4N72136bKysyztGbWKzh1kN9grk
 O4+CuIsRaCbXPvwUAfvkGIuM7RDLCcaX/fXx1x3t53jABu/teuXyEXf4XkfdRyPsr0Dt
 3A04waZGF7IeexNL3nPxJla/tivPHOC8k3N0w9YVU0C9ZWxGCcHbDLnbwRualYq7xlY7
 o9sPgniRhfWwNLfxTvP1Qd1qDoM26qKfNGHN+P8DCnCc1opWyquaPfkO+6qt51eh84H4
 gOxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=c7H6OgQl
Subject: [Buildroot] [PATCH 04/40] package/darkhttpd: preserve /usr/sbin
 symlink
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
 package/darkhttpd/darkhttpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index ca8495f5c4..0010f58c28 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -15,7 +15,7 @@ define DARKHTTPD_BUILD_CMDS
 endef
 
 define DARKHTTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/darkhttpd \
+	$(INSTALL) -m 0755 $(@D)/darkhttpd \
 		$(TARGET_DIR)/usr/sbin/darkhttpd
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
