Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26C1CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B997A80348;
	Wed,  6 May 2026 22:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JPCXCNEsaKA; Wed,  6 May 2026 22:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E47DD83529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106853;
	bh=LfW05erfZvRjTn7X6eRgaPzBySAfza3YDl2Fla+M424=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SnNzlFpY76fOaIpWSJG7+/ZRH4kl+i7vVlazVZjaLJnkBSJ+RURjrqNcvbL9BAqMP
	 Dm/3rtmaNrC3FtoBMeqc9exYF6tu/tmootqRnGO1akVCo6igi+5Ay1cM2jGNupqrCn
	 EfdWf0o994miz9sYTLGWZJQBD2bipW1iUIENi14rmCH/sFNFebgertCe0g0oU897Ow
	 +76CcQ1fXN4ga9ktnSjJ2Ylx1zV0ESvxJtaZJRAStDkAOA/0U9sJ9cmUIXsRJAw/mM
	 v7FZ3/SH2ruNlPEpSrViE4qSgM0RHnOrm0B7wL3xR4pG1kEtKu+Hj9/TKZNXZWyRTE
	 akoH7d+fqc9LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E47DD83529;
	Wed,  6 May 2026 22:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95ACD280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9357C400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJ_LqgNgDK8i for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEA6E406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEA6E406F3
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEA6E406F3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:07 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7dbccf6a23dso198579a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106846; x=1778711646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nSUzs3yulpnCB2u5xzxJZhhQKcN2Ba99oePHPNqrIEA=;
 b=lehoMWp2BThie/daAr6fVAiNur2Xu1jJmVqoSYRBJ5Xnixrlosb4SK5asRYXwoDYrK
 Q/gwhEW8tI7lOMl4acxHrIwQRWRc03IkJpWl3vqvbwGqG7I566yXjrVBsnuVug3u69jO
 g2gX34xvFcLaZuCdykI0BmU74EDhm020bgOSMpmA4HPiWZZwEDN9hMoLlkL09YnSZuYv
 hlnBvKpnnQR3pPpTCE+SDBzbrvhEsK34pAv5tMfQD+Mxuddb40lKsPy9nkmtSVuFmPoD
 7+JzOFYi6Yx2F8WjDHHe1WtT6GWYy0RJjLmAGHOgtaAA5c4cugMGwySPZCamKqV6Sjzf
 /cwg==
X-Gm-Message-State: AOJu0YzfV3Dlkg4KJhhrUqaYxNIU5FracEi0lx7joEBbyhfSsQeXrdgh
 zZWaFtfs95ZRJCc8xUJOqzvVfyM/m/0RK1+sRZ8bMdJzf30UQldjwZlnc46H+SQY
X-Gm-Gg: AeBDietIKeQwk0X0DEEmjBfnGt8Q1z9BpS3aUGG6YbcAO+5MbD5KCrPFiyD3mKsc9v5
 yuNsY1hADCy7UOCpF26zzWVF4QwBU/QtFJ/vK9/dhtnZHsuWoATaZgNY3wBgaDwH2EUGmlksumP
 An5YTbjYjIixFNmI6fOkXoILndJjuM19tu+IEt19sf25xjQ7JatQmyABJiVXrDyO5uCDYdprDwt
 rt6df2neuWESeejnHUciyo8pcuxMDcZRJm+nnnar7OJePsqlEn5mrS+kRCF6IwEzUZ726IARNro
 LhutgAGhNbiZPaGFX/vjcEBqF+SI0EcEhCh7Ij1XYbyMe3K0a4zk/g9shhkJCSlXkgbon4eme3v
 YAWUfbkCy+32wH8TRtk/BoX48FiqTPt7d0H/Z5GHrUGcVz5RF7uKL/ekejL8ZxJfX+HPamRZiS7
 H7qiuw93iPBShSqVmomG28JbGj6lnMa42eHN9kjCSUeaFi8abcj2S7sX4qizF5dGwZu+D/xzDR1
 WLRgLxbrxiYIt3JYHazD3UgjuxTXLBbyi/J7BEe6w/3+A/yknJX/VnC4L6dbLOsY8bU4S4cQp+x
 TWuKa1s=
X-Received: by 2002:a05:6830:67e3:b0:7dc:cd0b:58be with SMTP id
 46e09a7af769-7e1deef5890mr3109281a34.8.1778106846553; 
 Wed, 06 May 2026 15:34:06 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:19 -0600
Message-ID: <20260506223341.1759760-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106846; x=1778711646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSUzs3yulpnCB2u5xzxJZhhQKcN2Ba99oePHPNqrIEA=;
 b=I2rTGy5CFHON/RuEVutbUeesmilaX4PQEJttzLwt2qcifpEZdl5kpA9mchBDX9xuNR
 SSigdxQI+m78FIpQEwxsq1Vn+ghyBmvYkNNcP+r08Awa1HYEx+DvF5JnlqaFcsiAoNDj
 dZLL4f0QYfqrrz0aftL0/6mZIW2KEh6jIcCpMJmePGErlTudCgiJN+de46RBH9i25ZIP
 2QazJ5MZWFXB8kwCvWIvZwIqkr33+TpNk6x1aqidOtCfnd2mP+Cvy74ytq48AVv58Gde
 fFTu4G0Ya+RObpJYsjcJtKUnt870fnksa4dN4noirXUl/ScrEbz8DaYrYq9S1jVAei/J
 aaww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=I2rTGy5C
Subject: [Buildroot] [PATCH 18/40] package/nethogs: preserve /usr/sbin
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
 package/nethogs/nethogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nethogs/nethogs.mk b/package/nethogs/nethogs.mk
index 74387d7397..5a8d825565 100644
--- a/package/nethogs/nethogs.mk
+++ b/package/nethogs/nethogs.mk
@@ -15,7 +15,7 @@ define NETHOGS_BUILD_CMDS
 endef
 
 define NETHOGS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/nethogs $(TARGET_DIR)/usr/sbin/nethogs
+	$(INSTALL) -m 0755 $(@D)/src/nethogs $(TARGET_DIR)/usr/sbin/nethogs
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
