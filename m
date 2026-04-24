Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDF1FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A4342969;
	Fri, 24 Apr 2026 16:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSN8u1TmH3WC; Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E18B429C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048049;
	bh=cph9zSysA7M/pYMFivChNXzsIHcau20L7m446m1j2Os=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KXPmO4XsMIiOTMf2HfFJZU5rwOPKIHvdc1ymdyZipRx+tz4GJLpeIoCp25X/Vo/sL
	 TtFyU+RrgtyDEurkS0QGPFJEscq6pgHJC0ma8Naj6I7f33yfu9T1waA09eusk8V2j2
	 q5bAuxTcCCag3EtnNarCHc9HM7GOiXtN1WmD2GbI4n0yH3WODlHMtq02UsW7zXRJ2f
	 X3zrbzJzIjzb71L/99DdhrXXkFslVN4AMjXjPIabQBhtaTzLUyV+H3WbCKnbP8traV
	 woY4EGW8pi3wF3S5g71+CHoDrOQjDSnsRLoL/Yd5b7XfJO4E/nzQwwtPyUciP3d4nk
	 kjJi2D2lSu6sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E18B429C4;
	Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 092FC194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2DBD61C31
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eK0XEvD0EU9j for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE43E61C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE43E61C30
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE43E61C30
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso83860625e9.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048042; x=1777652842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aYmHffE7S9jKh8GVtus4vTJjVQWyMNxzg+D5zc2vpFo=;
 b=N3KN6olV0CgFI4jLC9xbHTWyKj6jsLPQudNPk3HjRCqtPx3gFrGC1++BjICYw+Gpon
 cXD6EMEs4j2FpMJFosvo9qL9BjN5+Hce+fCVF2BdfZIAknxAlaO4Pvfypf9voGBtG6qW
 dOe2ldwfmPqlzRLMtHga+4BZe5N4QUqdGo6z0UvM+nWs1ZSBnzun4q59kR/qx2TeZxAI
 jxQ8WqhdshBOwDTf3D/utRhZmJ9TRXqO2FKp8TQ3qs+Nm3e9PQChzP6J596FGbV3y4XP
 ZLU23tU5sJztoUJZHB9micD+rjJM6lLzv0xM6sO5PaW+vyTrPmvstDJ1qq1ZtTTpXrc0
 nwrQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+oEZn+K66m4FzGgApLvGL/eLS+RvBxAJsapQ5YVaGu0C31A9hUOzzQMkpBvF4IAE09zvjgjwjr7u4=@buildroot.org
X-Gm-Message-State: AOJu0Yz1nHDgQoWrbtiK0XujHbPnK2OzLGGT3/tnnIil+/qfD80CiFvr
 L+myWTJ1zafvNkJGi5GU0pNJSrlCl1P2v96YBC+ktU7VOPvKCSL9HA5BbYFCvLjsb7+olCNQkQL
 rh19M
X-Gm-Gg: AeBDievLxxqT3mgDq4oAwycM7x8EJCTPiccDjtROEEqn9EIHhn95WX3wEPunJttJfJY
 dxvAQPpsdIzUUBlljUaiJCL1JLhL81EsAhg9O3Yd+NZya2L/Sm1tTgEFdd/kcpxPOvOCbSph8KR
 CRHYisdsBoDilAdgkdrkOkzleCnlKAuWr3o1VNQ2ffz7Sp34deZq/NJeTyI4pOpKSOAubqJ7Hfi
 0UcXK9Ye7VNiAzoNjNSOyy3Uxw+LaM68oxMQrDQn8DL+lTkkgFbTnvE+LX7p1SLnFSZsZv/3wtm
 XYPVRurciwy6fDX10vSEVOiLGB5Sg6lekrO9EyBPNpxEsmwdIuqk2xXRwqqwOaTKIlJ/XQAqiZg
 gjkom1R/J/ajbKKo8f4rZG3nH/c6Qywkb+uLN5tESW5ExMxpUZNKr0mZNxBTvfdwn/wzfay7udC
 5iTApxTBQBEiDWSbFacG93sJ3vBw==
X-Received: by 2002:a05:600c:1da1:b0:488:d376:42cd with SMTP id
 5b1f17b1804b1-488fb785901mr507555705e9.22.1777048041679; 
 Fri, 24 Apr 2026 09:27:21 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc177dafsm730128065e9.4.2026.04.24.09.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:21 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:20 +0200
Message-ID: <20260424162720.161944-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260414163424.2355464-1-bernd@kuhls.net>
References: <20260414163424.2355464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048042; x=1777652842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYmHffE7S9jKh8GVtus4vTJjVQWyMNxzg+D5zc2vpFo=;
 b=flxGCzvX8hM44yzkJ2eCxu6OD1OuMC5/qcNKqJ1Oa6fnXtU9XEtM95sJFlKEMtyY0s
 Q9xLajqsd4hSsF3y2c11tBI+HeTsmuxhnaznw3ohv0xogiYC3UtwaJOuvCfn7aEO1TO9
 NAH1rT5dsqjGJIJg1z4HIuQ79rOocCu/qT03e5WIQarx1dLjm6FwqYPoxUasz98du+pH
 JMZrrnEsqme+XcZMKMvOxZSlPmdK1xVyFpQBO6ZXSDFXJLefOYtSdDJA2NPRZdBqvTp1
 FWryOmHJu6zqJaAGseS1YdHR5NGU3qsIxpt2ueC55K/w0I0QY/9rZcjfl+ICqv3qG5OG
 cQ+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=flxGCzvX
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server:
 security bump version to 21.1.22
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://lists.x.org/archives/xorg-announce/2026-April/003678.html
> 
> Updated license hash due to upstream commits:
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/3069f64d691db5396706c1ec1182bd8db52ffb22
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/dd924b160c9b434ff7687d1e1d2a9058cdefb6b8
> 
> Fixes the following CVEs:
> 
> * CVE-2026-33999: XKB Integer Underflow in XkbSetCompatMap()
> * CVE-2026-34000: XKB Out-of-bounds Read in CheckSetGeom()
> * CVE-2026-34001: XSYNC Use-after-free in miSyncTriggerFence()
> * CVE-2026-34002: XKB Out-of-bounds read in CheckModifierMap()
> * CVE-2026-34003: XKB Buffer overflow in CheckKeyTypes()
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../x11r7/xserver_xorg-server/xserver_xorg-server.hash    | 8 ++++----
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk  | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index ceca9c215b..b7adf1559d 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2025-November/003643.html
> -sha256  c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519  xorg-server-21.1.21.tar.xz
> -sha512  bb2eb4e6756eb9e38b61bd47c017da44bcf5f45f2b7a906b4bb3a56b3d791cec64abb9bf37b224efe1e4fab9cc296f3672c9b2f8e00e1cdfc54337bef63cd16c  xorg-server-21.1.21.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-April/003678.html
> +sha256  1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3  xorg-server-21.1.22.tar.xz
> +sha512  6cb37ff971e10eb4a7dfcb3e8071afd769c7632d50e4ad8bc948b810dc4847e152b8a05ec135f55e0695b35908abd07e7728ef85dd3135456fd532e919f440f4  xorg-server-21.1.22.tar.xz
>  # Locally calculated
> -sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
> +sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 0dc3a4a5c6..d1e7267c27 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XSERVER_XORG_SERVER_VERSION = 21.1.21
> +XSERVER_XORG_SERVER_VERSION = 21.1.22
>  XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
>  XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XSERVER_XORG_SERVER_LICENSE = MIT
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
