Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE7DCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE35240659;
	Sat, 10 Oct 2026 14:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxeNXqWMO9I2; Sat, 10 Oct 2026 14:37:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F2CB402AF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791643042;
	b=iuyX3k10EfKpvFWYBeJWFUPgtxPUgqzr20Q9UaQi4xnJDkN56kpJdrjjrd0T9D9AU4Qx
	 rbdQQLITAzcNdLaze0dG1u5izdHakEn6AxoBKIumID4Tpi5bKuXhU4ZQMFBcVhgqC5xK3
	 umC6Aniap/xgKnB77vseWOxRystIDEyV6a9/plPuNuN3NWXUrm0vlhta7UQ7vnRw9pRtB
	 bLsqxfPuKMXPbzdgYBPH/wQA+gmNgKtba95ajC35UiU8zxHq0/cDSwACFjt1t5mW1VdC5
	 dChfXVbwW9g7gKrgeNQOH1ABVcBOpI0EpI8qpy1UAP5z3McKjn0d8mu7pS+0SIndgYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791643042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RR5xdpNDMHkB39AZS309QbZLBRoljVCu4pH9mg5IH3I=;
	b=hYxqKzctuaOoWaYizxnnrI3u5Q9mXfTnKwpZXD7+NRiUXBJcWhCb6L2WaPR7EYJkzExZ
	 HgT6e5zqNB+KZwn/VjrSugCiyYnr198Jn0tr3q5ovG/qXHfP9SKYCCX+vHdNmCZh4hPN/
	 y1AFTVWvWnZAHCf9q9x1ZK4M4h/K+DdKN7sTEYTV3n1imKk4TUa/Ga0NWNDtD8dzndWtI
	 qxxzCBcroK72MXF3XO5XG5Tyjb2N8dF/X+TYFiSylsaQLETEQRhNlRcj8qBiuZWmLsWIS
	 +KBMM7iBdGPyoWKF3dcE420dSMLEqlBgENKUww0gusEcFprU7s/Fs//hXr/LM89v2TA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791643042;
	bh=RR5xdpNDMHkB39AZS309QbZLBRoljVCu4pH9mg5IH3I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cbHyiZQUwY0kxGjO2tMtUQthohiENCMbV1EVqBqgEiT7TblxFXiWGvLvqlw10NZdB
	 MCL9uktoNYfKfL8c2aFDr7HbHX1KrBxS3rGMmYg/cZDyACNSupg5W16dVXYf5hkxJ9
	 ySI38I95HljqY12B3tvJF+dcp6A7TqiPsa8Z3tqWccRqgjNtozGo9cV1Zbir0TfUOZ
	 HGDaR7Haw5+irFBG/6wMjQTV7V7umQ3Wsku1+hCzxOafKKD80oy7lyohP9LPgt4Bpb
	 yfD4tj7k9XYv6bcx+v2+eDlmN4O15qCOxQJZhWrLiQr0IMN85XqvVOe0K0O1OuMP7n
	 uu306LVtgSqLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2CB402AF;
	Sat, 10 Oct 2026 14:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1869156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E31B0400E9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfcyOke-YTiH for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:37:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A8913400AF
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791643038;
 b=BjXZHgSJJWZGBfvea7URvPi7R2OKrdF47LdZ+/khvbrmIqWux2k6Rfpa5iWEHBPsQRSK
 nxLbi30tF903uhXzjPf3umH4hAHAubTqLwJ4I0VbWTtQtsaNa2S2bDz3HfqXIJrbxX7R+
 GdvqR1HLOScxjd332kV6k2P9Pkv+qtUawSiGgsiUcnCSpiAA4DhL0l8VfZqONGBbQ0PvN
 TYdsScNnp8Ji3XSY5/AfXqWvjuz87Xw2Fn/9Pj0YFTV+Tc37ArFKQUWG4ftUcO/MsMgob
 3nuL9MCJipyQEbEsw/nHTBJLuxe2XGo0KNdKaRg2VFfe9uNEM3BflgZ9DURrdrYQrdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791643038;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=3b49w7WuXDxQGRyVHn6h1bSJiHGcaTglKVoRrNOygUg=;
 b=dG/GDL0h/IGY4f2XGbAHJVlb64aTTSotqQUCUGSKg5tKGbuuwY7T0KP4LPgcC6gdeqXD
 6NENabN29apcgG24pBZdbg1O3Tzii0gh5Kxl8OTbOtHXm1v3OtQsoSy1xs1C+EQ35OhBz
 zJLvX8sc0KjmrKiXg9fFw2mbkiTQy76UYkhVgOEzHd6MR1r02J6Gwu4KpUeBRnVUzZihH
 Zz/+0GHYyKkn9HHjjghNe2V/xeUhT7B3LXl7PLpK/nhnG7FSaifxJ3NzebxQqIc72PFh2
 4xIFICyLfKNG7RnD+Oop+3iR11BdNlnYt6ZpI+GXP8pR1nJAZTKhDXGV9vZmb/sBlXw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=VpKk6lkd; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=VpKk6lkd
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8913400AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=VpKk6lkdnbODJm5LHpjWWX5jA4He3Q9jGgPW/Y6KfumPB2re1ENu8Sitegk/pLBBxuX2jFhNeVlIVNBLrdQzzuRw7zsiYqRTL23Xv0mREhdhgGagLby0UOa3tOCaShL4Kj52CsF+IqCNMi1Su2vS1iAl3f0OQu0b3bDIQunwYGtZIcyAo9AR2TE6yhACB5vqG0qRk8sIzz4e0p5HXxxis2jNXimRz99q9akNPlbiUyVzpES6MUHuOJGrswhF+7bMfR8jkyUuoi9+Qs5vx0GSgVKaV2S4Q46J1aw5g5V64QaB5TcYB5B9OfrcLQXuQ94INeZ1mQysZbTAhLiF0MILtg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=3b49w7WuXDxQGRyVHn6h1bSJiHGcaTglKVoRrNOygUg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 645229265; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 14:37:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xFYCG-00000001lXw-0CnO;
 Sat, 10 Oct 2026 16:37:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:37:05 +0200
Message-ID: <20261010143708.421070-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010143708.421070-1-peter@korsgaard.com>
References: <20261010143708.421070-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 2/3] package/pkg-generic.mk: drop PKGDIR
 variable for patch step
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was added in commit 604d261fb0 ("infra: remove variable
FOO_DIR_PREFIX") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_PKGDIR, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f8ffaa21c7..c69bc96237 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
