Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417ACC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3980180E20;
	Sun, 16 Aug 2026 19:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ux33yBVC3my9; Sun, 16 Aug 2026 19:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C637980E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907887;
	bh=IzwcodF9L2xH4SK6PD6jkGZBphpNd8vSdSFaM4y7Dis=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buGetoiMuRdH1MSiahm7FS8FzgYniV+B1ioL3O/hH/xzqORQPGQQgRo1rle7O9qGZ
	 DzfdQ/nkLkHV6Ou/Lm05zDB17dIMaKwJn0HMuOR3YsNqLz0HUQzqzUhws97vwvBXB6
	 VbcaFi5+5VqxRo4Q/bixRRLRDIM+jRgXuSl+wlxu1JWv41eD2lchHaV8o2FRdVMmkm
	 hZtX1W1LPOrFXmo+iULk7UwB2bPz2H5aDoMH6MidjPXIGkfONK+bbD2M8xetWYHmMF
	 aHWt4PKm5xlJiQzflKWWvZmynkqtlUICU/gvmYNUPvTw/zAX3rUCpA3kATQB86HCZ3
	 0VVtXacmOUy4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C637980E0B;
	Sun, 16 Aug 2026 19:18:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB453A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2123240063
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6bW37CAlxG7 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E5B740086
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E5B740086
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UGfhMb9f
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E5B740086
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:01 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-92ea24a2dbfso228324085a.0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907880; x=1787512680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R2oM0SAZYKNeRJn6UMECc0f8wfyTywh4lWzDUFQc/7M=;
 b=UGfhMb9fOvQkpFxAuJ+xFtrjlPwKYhqKsHzAW3Z8lhfH2mCn3LEiU9QAYzDcqScrS6
 Nd6DYJywGWj8JoSQfoQgSRiuo2bh6tQJx6HGfWP87PecNFU/IpfgXCHz3/+f1CkQku7h
 uMpiixtXlEI7VFiKPnNRJHMiM70Mw2sOEZSmHTqRZTGhD9YP6CqxZSlTiTgc6Xvzac99
 d5tvcZJBuVCQi46N7+yKjAHlt8lnVTxheCtdxIthMP3AdLKyiXvZcy9lBRpsCmEAklVO
 ZDDM+x9gutNnuSFsVKyXtlVhZlqUfaV6klc4m0lOqwGDkRFm7K5Iw2RoHSIuZ/c2PlNs
 T1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907880; x=1787512680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R2oM0SAZYKNeRJn6UMECc0f8wfyTywh4lWzDUFQc/7M=;
 b=g37NYgbWHjNZhLhGvlzH6RohssPwvV9DC6lOG1/RvHUk4OJTe1orHCYaYi5NQuYFU8
 LAILql9JRSaeR11TEnfi4uvvMyTh398wz4bRgqAgt6PxK/a7lVc/RBOYflfZ8lwJdojV
 F3dC1AnZd0W3r+h/PeZcNSB2coCMKpfFU52fM9TjBdom0rhQ8+dqoFJIa4ymKvppbN4t
 dEJZPjnYZ5PujfLVvMRBN64NClZtfx9VwXKP04S0CPpTG2toxlakwwLKA5SThMbAfrWO
 1uf+9KmzQ9IRLu6E1s1fYFeKaVEwWxHlRPyvS1yk8hCRNrW3xqAQ5h6FK6OLx5GHcDWz
 +cGg==
X-Gm-Message-State: AOJu0Yy+Gd8Mmnjvl2gymMVdgyD6JC75caePh7XX6Ze6YR+qUR8VM0KR
 oHUfFLagXATRoEVfYV5ZWfXbUlayDXdfjjO0ed8x2gxL10bR46k8fAxExmmlNw==
X-Gm-Gg: AR+sD12nRcabhBWx5yo96U4aTp0ey/Q8Uu6DjfUcPXOBmEpg6OdvW528bP5VE7c5evc
 4FYvfnn4R6VfVTufTWLpiUYiTBAwEhoazoppRSixzvUPOR2nUiiA6HgYPjPgRtZoKQbRRMVYJQ3
 ABJx1K6rbwr1QKzmZveo1/n7y4FEANk/RxU817Mli37nST9QSm/gs+p/CZuDYZNRYtrfi/Oj/Wj
 w9XxNWVBFgTI0duU8Z85mrW8WoyXK08tUFVEeg1sjEuM0WLIuH56Gb6YvQvKVHEwuh5gs1zcDBJ
 JCikaeIjKj4cmefjL015ZrYf7I9NAvLd3RwHRIz4CuvtFdhCA+ZqHr7px4DLEZgtB41LIBRAuNK
 1iGHeUOZ3Hqlt1cER/h11VyygbyBOaJDjV0Qx1senjTkSSg9AmcMi+6DlCEbnxfFXQZx9BdY8nF
 0UEZ4sRXLOCQrV70cYLwrEhjKxMAmsXYQNoAm9O3Apf3P2eTJx2eKZPi1IF4ckci3emyroH8rHD
 C9MY3EMVz/HKFc=
X-Received: by 2002:a05:620a:8e0c:b0:92e:e2fc:26d3 with SMTP id
 af79cd13be357-936d2339dccmr1524849385a.46.1786907880080; 
 Sun, 16 Aug 2026 12:18:00 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:17:59 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:27 -0400
Message-ID: <20260816191830.533747-6-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/8] package/sdl3_ttf: do not build the samples
 or install man pages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SDLTTF_SAMPLES builds example programs that are not installed, and
SDLTTF_INSTALL_MAN puts man pages on the target that Buildroot removes
again. STRICT makes the build fail on a missing dependency rather than
quietly dropping the feature it belongs to.

Also state SDLTTF_HARFBUZZ=OFF in the branch where harfbuzz is absent
instead of relying on the default set above it, so both halves of the
condition read the same way.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/sdl3_ttf/sdl3_ttf.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index 12441e243e..130e07746e 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -15,11 +15,15 @@ SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
 
 SDL3_TTF_CONF_OPTS = \
 	-DSDLTTF_VENDORED=OFF \
-	-DSDLTTF_HARFBUZZ=OFF
+	-DSDLTTF_STRICT=ON \
+	-DSDLTTF_SAMPLES=OFF \
+	-DSDLTTF_INSTALL_MAN=OFF
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz
 SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=ON
+else
+SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
