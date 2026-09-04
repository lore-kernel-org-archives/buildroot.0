Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD677C79F8E
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF5681184;
	Sat,  5 Sep 2026 08:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzK95t_6pCHe; Sat,  5 Sep 2026 08:12:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A856C81183
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595958;
	b=qAjUgoe7q7auei1BnmArZyMe3coMiyDveJFClju5xyk1KuRr4Bt9eaKchZZO1JC9W/xf
	 YrBYijNBNBWyWiFs3x541x6ZwVJA99adfOGb8lhkfTVometJdiTYXKQdLisg1IcprwF1W
	 gI1wsVLDG6Kt3P6Pc7vGoXyrowQf1cMO542jkb/BdzdBfpeQGCv54ku92fc/KDtUibzvH
	 mys69VkbgqhR9tZqGs9xZtqhPA7pDhAvJO7ISW3v6nV/S9WQvmDwvy1YP8BJVxAVXFM/Z
	 LhLGn9N15/fzWDy0Ld7B4V/7BOrr0O7XRjxHQ3NCaUj5eFX3UNAHVKa3NkoDpivOwbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=l/vPRH1SgvL0MQJDdTL4//xgVKj59T9GAHZb502JhsA=;
	b=fnxNjTXYGeqemLjLDoEYbsGGQ5Ylk/1k7gEiy7w5hnPldE+GJl46RH9YmVdF++SxYO9I
	 W1IW4hztAFC7bPy2lHR7Egg+wBF4V37IVN4plS6gmUELwQry+iyN1ERhHdPOFU+EuJRRE
	 +3J58BWxAKn9W54470AXzQZOMf/Q38yatxxnFPXrbv0bqT+mhst+/BZSBrTMZVwhmnRuq
	 enCbsGP4Mqnu6hR6vGyI/L2Fq7Boi1yhEQUO8dYa9XRLijiM78ORGH2ivnil+WL2Q8b9w
	 wRHiYa33UniYJfH2n08zXcE3FJePMLAJiT2flNeqRo57vJMTWjvV544dj3edk5BK9uw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V9YtrrRR;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595958;
	bh=l/vPRH1SgvL0MQJDdTL4//xgVKj59T9GAHZb502JhsA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mA4/k9jjy4lOI9BuKpEIhKRgWW1bcSUVXqp+q8bEhSyqiGcE1O7BSSbyzJelDuwOY
	 G8hS+uY60Pl1swDNIstAAPOH5U5C1YFqWzyL0S8n13GOjuJwFEKOAfcZtOajyxfn1E
	 SwWY22jxlvG1CcKEW6ro3dAzyPnIWX6Xt75+Rg41h0dhOv1FbrIUs3Fdcv2OIK614T
	 7ZpESuxcQZdOQDzv4q6yM77M7aUT8TNY6gYm55MhX5Otg//q1rTo5Gm8xmYE6BGG7J
	 +Z3kbsuDggSiGDJ9EqD8/x5iGnUABoYXY8uqoPgiNATgpaiNlAdksELufBDzhKZRZi
	 g7c0PVRdviaDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A856C81183;
	Sat,  5 Sep 2026 08:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD11970
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E96B28112F
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2wy0avz_AMK for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F323981176
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595951;
 b=L/1FPo4COK96i6puUey6AEQ3RPYqabB1ZjY36EMwOla8ZQYjpGPTL1D8AHm6F7tbmUls
 p8gFFnBKD8D8W71mEqVJTlJOeVx+HdNya+xM62eN9aQ5wboULeIfSM7qaJcC4ik36xprn
 605vVHtRqdtcf3sd/+xPN1vJUU3WqC6geOkmpYPmxpyLBFV8x4ZUX8zNnyEJbr1W3Ovvo
 rhTfJ7rbP2R5VXyLYoBgK2GSNuy3l23+G5HXQualF/mqUPlNvZuKwCua0+jT0RpIKMARe
 3DnHEvux36TUEVEGvCk48llDWLicPRlaJh6/Y1E2kxZMMV023C0juKZMpyy3JzcPVcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595951;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=cfDVJMJ9+f2t2EFF2c0ivItnTrpZGMKrV4KMeilk4ZE=;
 b=MsytE2hfTQQNP03AORtjGBHyNnfYfuX/3s3+JddXiHGCp+0/KWMuBZHu2l6xkb2FUJVX
 wssoT9xA3rn5zoeqttDQHhFAObrxLtKoUREnGiongc3TTq7oFi8tI9f9J8muQk2VhBCby
 jT7u8IdmEZf+acBi5S0IONCuvI+9wEGS17O66ZWLyYDaSzuvuXSLpNigQF/AMQ1TyBPuT
 3WDclXkS37p6CsyNv54w+pw8k7Ul1K0kntuI3Q+rcBU/rie/etcthkxLY5DEShpa4ZcsX
 hoaivQHPRmzaXrktqIxp9gM0qBA0IRfa0GWSXqdl6Wo2m3w+s/Y7QIT4BEVjR5OhNSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=V9YtrrRR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=V9YtrrRR
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F323981176
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48444ec4fe2so1105603f8f.0
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595948; x=1789200748; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cfDVJMJ9+f2t2EFF2c0ivItnTrpZGMKrV4KMeilk4ZE=;
 b=V9YtrrRRLIXMpzs+pfiOn/ksrKzmTAB+Wqeq/9+jW2+r1VnDp5omJQ2hTBNdl8Avnw
 QzRv0STJ656pp4sBmwRGnm0SXURqDVafhjg/T+HeqKwZd1TYAFriw49B8jNczLFQDe2c
 cikXQyrF6wsCwi3bx3y+qv5IIXOnxrZ0iskpLnm5EWwhwqh+hyIUXkc5m0TVwgyjXjGc
 LusONFF3OnIiU1Sz5CiKDnKN59xDOmfSfLygkcG6zXY3OkI51NNKFeZpePvWTgV0cm9c
 7iX5zuk4WWGt7iMRQ1bZ8G69dxJSnuTvodaTIXT+pOKITKDiiy8QSNqzvH4gx1wFRvSu
 XOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595948; x=1789200748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cfDVJMJ9+f2t2EFF2c0ivItnTrpZGMKrV4KMeilk4ZE=;
 b=o3c8iU7SucUhhcy47yOoS4c4msU7KQTf2q04lyk0E9ckPpt97VgKEHIsfPzyRLjGQq
 Sme3W7RRq1rnqdLTIhnzwmh3jIVGkYcSKZqd59KcxK5clAAb40fikW/4hfaNXFBPshFm
 BV6qtGnqGJbekI8i9vcvQyRuNOjaG4kbGLFuh9YbiEGWgfos0eCZJZ0Jc2R491+Kpu5G
 0KCTpyY+CY9Q9Qt45yk+APk7acDRSnAZAxYDsPfactduUk4wSiBNavqIaL5pF+iyJc8t
 MRVat3oQ/m5yr6LHSQawRA7ntj97IE2lBquOX4kRc8WXw+2wzKW7ENli4/OG0FGEo/gD
 dHrg==
X-Gm-Message-State: AFuF++nATxQU2PUXtL1Sbu1t4Wm4OSdPplASmMpxBxN34Oh8veM/C6LC
 x7BwEIhPcl8TdKb9iao+YjGg/LX1xBeL+L/sA+lGHtCz//nf0dmgIrizJGTXdw==
X-Gm-Gg: AYBFou1L+siLhIGChVGhTrMQFjDqg0dFfSEg3IH535OiKTd+lvfhCNkzBGpsryxBcus
 lEDQnMFmsAGR0Y/mSl/6ORxbO9EPpg9DKd2ghpp6DTDO8cDW0dVDN8/5uHY39iWmdz463nqVhDh
 v9VPa8rsaauiA/pd6ef+uSrR1Ex0BTeSYOnbwHct5mB14zoycDpXrmku4BQ/gqyA5L9gLOxMsGw
 SLeeTnnpAWI9b6iAwydPuCkQwYgNMvytKbj1nw68mx7+3cNfQlNmP3IOI53LepwMksQxuNK9dgi
 1C7OrFDVFS22xLyFC8Ig6pKPT85ZK0iAickKgmiR2NC+k4Ipu5Bli83Gg955RrX/JyV4YD7nCCW
 v783mRldNwDiCvTutfpdcV1VU+UgzBKWNYCqAB65yWGbC6jjm+qQnmSfpCB9xhMNSzbQEXv36Y/
 +aHzis0sEgI0KIfycSsEO8NEWsaEMtfBPaX/RuafCsi4/kaQidMsTG7OL4pBNv7g9qEFGwcinFD
 PgTpgou0iL/iI+L7KfxJJcgR3SG3Q==
X-Received: by 2002:a05:6000:2585:b0:485:8e72:93ad with SMTP id
 ffacd0b85a97d-4858e729492mr12318380f8f.0.1788595948315; 
 Sat, 05 Sep 2026 01:12:28 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:28 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:14 +0200
Message-ID: <20260904185921.587878-6-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/12] package/lua-utf8: bump to version 0.2.1
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-utf8/lua-utf8.hash | 4 ++--
 package/lua-utf8/lua-utf8.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index 8973b4bff..1e56d8b5c 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  37901bc127c4afe9f611bba58af7b12eda6599fc270e1706e2f767807dfacd82  luautf8-0.1.6-1.src.rock
-sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.6/LICENSE
+sha256  70c1590a6c2cfca417755b0bc79207bdfd0b469f854bfcc4e2cc5a39b5e3e3b6  luautf8-0.2.1-1.src.rock
+sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.2.1/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 991ebfa2f..c15967471 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 0.1.6-1
+LUA_UTF8_VERSION = 0.2.1-1
 LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
 LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
