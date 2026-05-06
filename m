Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A9CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0305F83440;
	Wed,  6 May 2026 22:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfU5mW1x1uy1; Wed,  6 May 2026 22:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F08E83449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106843;
	bh=KpN9I/+r8DwW3mhlqtAxSeMr1lg2vWIZVpJIF/CXxb0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=n/y19mjD7m/Js1XAt9FDpcMjgGpdLUnUA74f35P6Q6kQ6iPEdLmOCx7z+zVuNAyLd
	 1ECZHTkLKgHZIV8uJVBuLfSExOu9RTM0ADjmLIn+92E7i9v1ueVEBdFk/zhcJy9pNl
	 7Pky09NiNdZgfIQUjvvzEPyndmp7gRBpeId8Xzd757ZjS4odfSdZySieOglnHqmITD
	 rivNoAVtDTxM4CabSP4rH28HOJVfaxj5htZXzCVdvBj9FNdWwqGM9/mydqVUZ/UIag
	 6cIywujY2brnA60yJ66ZL9+qKlRFUbGJ5OG8yum2QWfPoiFEtDGfRfKBcDIF3F5x/B
	 m8JJe5+iP0Seg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F08E83449;
	Wed,  6 May 2026 22:34:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C2C2317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DFF9406F3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mjGwTGrZZz5 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81474400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81474400EC
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81474400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:58 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7dccb8644c4so137743a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106837; x=1778711637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fDV6x8+yP93YtGz10dFDIgwUhmVK9dK1tRsr5pru08c=;
 b=T1ILZIaYwuo9sHujrwjPidPDPUaTOZ2BddxNE9ZXJYepURJow7nd+tX+KGn4YSNuY2
 TgS6KXr7LWdjimXired9adFlonnCLiWcobYhMVehFpVpwkRh7GemdUhHdSTF5ahL+Nbk
 ATl/v9dEbWh4ihsK5+GE893hnsiLureL9dOclht5RTnNuO3wr4AFASKBJMbeUhF/UNON
 E4HIF/pmiNXBosWSltj7TCRXdHDH4kWz2vbppn7rRHTTo47AgneWReqrk4Bc37wX3aGl
 7oFHzFf+VlMexQKjsHqy1EkEDGl7HBgdQVXAQgV7BK62/y8pOkFf9IkrS4V3oic2P46n
 g8bQ==
X-Gm-Message-State: AOJu0Yw+LNZP/4Yism1JakgViC3pTeKRZNqu8bZ5ZofUsukQG3zMdVQe
 obshYpis9MzLX+B9/j87z2UTzzxd+w8mDOOxg/VxLl8o7jK66HmGWcYa06gwX9zX
X-Gm-Gg: AeBDievBa858rCszNpGHIyKG8z0bsQbCGtWm3r2d45ZzlOe4xW+QixXfQOW5GDJ3SP/
 tw8zwHU084ygtpKP544iQ0YrpV0dRJ0QyM/af5uZgw71HFlquJJZhqDXMYEufIGNZX6r6NhB3sE
 rlzJ7YeVO/o/RkIQ/na+uSpKCICbCrf8jmaFIrvJBrVfQaQGbMTpXcvzTSnBHELpQ5d0vaGY0JD
 8m6rEVD6QKvnVukJLZoiV35wTDvYxjTVmOURJpQybMueIncu0bhQcy8qYBxE++WLhqfb59ld+Vk
 Lyy32MbzzI+o96yqbmyrRY2pPrYmXffhLSRhzKfEb7mALk67YHfUB4/zhty5cdyeEDISjXr2DGj
 KjoJcrpgeRbhusOgvrVVgpJFYm79msoSnueanEB2LRpBb3l/aLPILWY4MRdyV9UYysOTkgxbFrS
 3M8FdEcnI/bzn27Ql71gMoD+K7+4PebcCht19OMjg+FEANAq6rm7z+HPfDV2vl7+UM9UUsK5r6X
 y/8i9LWDByMTR4KdEdL94vkZKA0cNfmscqvPgz5QqQXGw0QX2Nh7wqDsEx6dW4yJ68hk1rz6AS3
 R2B+vIk=
X-Received: by 2002:a05:6830:d13:b0:7d7:bf59:16df with SMTP id
 46e09a7af769-7e1df0f5e22mr3293322a34.17.1778106837148; 
 Wed, 06 May 2026 15:33:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:10 -0600
Message-ID: <20260506223341.1759760-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106837; x=1778711637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDV6x8+yP93YtGz10dFDIgwUhmVK9dK1tRsr5pru08c=;
 b=Y9Ym3nwvq/zFMJgMTQ1kIHvwAc7LlHbMZZVCUAcuWBo6OZvYqlO0kru7QajQ9nzeAH
 vjuQXzjzCaC25QaClATMPR94KJPlWSpU975Tpz4fp2XuggE3O80NO0tmyeVTA847JM3Z
 I9TyT1Wk32tipvb/6pbnohqKJww4dm3vfVJSUXIbk53Ao4F5dO+fYwrxDmZUrSXbng1v
 hTjzBoPBcliLtiqxV8gQNp1zN8n9PFbn1mpbFGS7hx5zlIn0ngbk+ByWXII8pkI/VFWU
 RObsDjrCINtML4k0EqIeARHI6MZvOOu2pWnhklwBjW/3c9YFXXW7WJPjdNt6Kclq+Pzi
 Ktvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Y9Ym3nwv
Subject: [Buildroot] [PATCH 09/40] package/freescale-imx/imx-m4fwloader:
 preserve /usr/sbin symlink
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
 package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
index 320d5dc617..da7f4af221 100644
--- a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
@@ -15,7 +15,7 @@ define IMX_M4FWLOADER_BUILD_CMDS
 endef
 
 define IMX_M4FWLOADER_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/imx-m4fwloader \
+	$(INSTALL) -m 755 $(@D)/imx-m4fwloader \
 		$(TARGET_DIR)/usr/sbin/imx-m4fwloader
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
