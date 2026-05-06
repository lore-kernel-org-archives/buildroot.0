Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAB2CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB76260F99;
	Wed,  6 May 2026 22:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNKIjZ5qcGpo; Wed,  6 May 2026 22:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A12160FB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106857;
	bh=5Un/EckT/becr6PN9c0c+nG+Qb/TceaYdmy63PLc+EU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=le/jnyBIPrhSVHTLh9wQC1m1l0Au8ysvN4k6CRnTLfJXhn/t0Fin9+tBL9zX4RLyk
	 Dnu5iyLqvKZutWiOjyTfw7T8tvM29UypLx36uGzNuznpeEKeLa9NTv9frc/uftANi5
	 blvoY80/lq7SgAK952iWXVpIs5MrwlmrnszFZD9zwIWQAiHGR213jBRYCLs+JC4PJD
	 YQPhbD7kj0Xzgc4UpmRcHZR0vBawlPWfFAg3z9yqa0Rl3efO8EE9logD4YxvW7pQWP
	 WhDTcwjCuFqJL278llEsO6RNqCA1TC7zSy7L8z5zE6gWj/JP32sGu47fFLlRBagiOo
	 u2gJXrOaxvt1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A12160FB9;
	Wed,  6 May 2026 22:34:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F603280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DDC483443
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbgnjkqkFExq for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B56D833C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B56D833C6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B56D833C6
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:12 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7dcd17e19b6so150525a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106851; x=1778711651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mJBG46P+8FCSz2L/4lCGAdlyTsQrwQTK2k6ibgli6Xs=;
 b=eATiWoMSO7gZkj+BAY1b7b1056BIRynGWTvziBD1BWzcvG8SUFl4VjjiZOkTLZwi6F
 XfHPAwHuuS/tB/EIdQXhWVt1nLGS0t6yirqJzziAGThFGk4HngLKtuNRSuikREUpcnET
 A7aAmYfPOOHY9AoIMahbmO9lHSu2Q3Lidaw4bNu1/wbNANy7ucWqkyY9TtsRJGXEECJ3
 qD9izGgE7a3SyLb+2uL2k+4ub7P3pGD8/DdREre+2uc/mHNPCAQ7S7IbQuafjyhvN44V
 IXKPzfkr5QZeBqG7gKu0pzGQuwli/u7W8GPlrCXnUYsBMx3+lJthKVvGeSkYKSYfm7Ah
 A6PA==
X-Gm-Message-State: AOJu0Ywavuz7vMb8jTClTFVWAEqyVEj+A4ateBaCD+t7ViP52emFqg/v
 XEkyrAnrNsh9W7Lwm8RqSj7W1wsFDrmXK180/TVq46m9NBd15y6IHwAoCe9brsWv
X-Gm-Gg: AeBDiesRCOj8MBi9rdXaeArsVaeA8ouE5XDxCvtMIXCT9rI2Uot7zU/awHf6/mZAJyt
 3M/0NvUWdHhFgFq8pER7NknQnSG07C+Cl7wsoAmuxVaZ5dSoPoA0yPf5YyswK5xzIdVEIFyqC1M
 X/YoXqGI2qV117uFupxwi+AX5eYnBGOwHVlQ3YgmMfgqXp//UYH9YZFGq7zgxsNoH86ZswrQV9O
 hK8ltdmZU2am1Xp05tE9fauaAK/dzOa1CMc5ucUuoNsDscWF6CZt6tGsCGfK3ickzuFJum+WZ4+
 ZTfb1CQqJNhPc3Hig/XQnN2bql1oubEzH59TvjWl0SgZEbXNjYzXoEkkXiyYHlCOYHOinYDKO9x
 ipl03Bea/WzLxyVRq3F1GF9MwDIGKzz3RMN7HqbrTdnZLFH/Z2s9ZtBBZSFI+i8r9EOMYt3yRdB
 9kHtHRzwm0baio4C5vBbkMbjZRYdhBwniXY0e66h8PQAAu6bluP0Fuzo5l3UCOdEnUTDU+ZWoVO
 uiCTz7SHcVQ4+XcM5LylJiiMavEMJSCZFWyvCiHL6zlPVdbqpUaPM7RwrwzmYC7HXpn+sK/m0lH
 GZbMx0E=
X-Received: by 2002:a05:6830:3902:b0:7dc:da80:42b4 with SMTP id
 46e09a7af769-7e1df1f3d0amr3124926a34.24.1778106851095; 
 Wed, 06 May 2026 15:34:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:23 -0600
Message-ID: <20260506223341.1759760-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106851; x=1778711651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJBG46P+8FCSz2L/4lCGAdlyTsQrwQTK2k6ibgli6Xs=;
 b=aSjVFH41MtEHTVs+daPiaf+7IZDdRwk1WOxJex0Uoze6psBOlrRVPqp9gCV3/6pTuV
 KQCNwXrt4OwhD7WIrrwtX3o3wvbQgIZZ3iySkL6sqH/+qMkLVX0r/UQwV8FwryER5U/b
 ukRimvr7oKVt9nny5+NNKeSm9peU60ik4cFaXVN6yhPXDFqKDSo7xbue+DqXDezYHv03
 AcRYJ4fhj7PdAFzOUqljMBWEcWGrSCslSDlUcD7pEzO8c/dVfS+YhXx1AC5icP3jbC+q
 PjqkuOTjhu0qZ4PCcDufQEIGnxK1pfHLXk4bVvwR6ezPgd3bc9zXdCEW69MIZpwQo9QI
 ggaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=aSjVFH41
Subject: [Buildroot] [PATCH 22/40] package/p910nd: preserve /usr/sbin symlink
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
 package/p910nd/p910nd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
index fea8aafd50..d16fc68fa2 100644
--- a/package/p910nd/p910nd.mk
+++ b/package/p910nd/p910nd.mk
@@ -14,7 +14,7 @@ define P910ND_BUILD_CMDS
 endef
 
 define P910ND_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
+	$(INSTALL) -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
