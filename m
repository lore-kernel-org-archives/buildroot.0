Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB5EEE0AF1
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 19:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DCD040518;
	Sat,  7 Feb 2026 19:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTHJ6AbT7Hv5; Sat,  7 Feb 2026 19:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF314030F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770492985;
	bh=2Qp0MKECao/IZWf0B5f2+21Dy7h3eyqpWrZEL7H8+Bo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wogad87u2e1UiMUlTSymDlXW8yskKXq+lVlrhjsTsabKM+NFsUIs1aEa2S2NkGV4i
	 1i/8EmYvDkRyPd4+FBx85UcrLriYuFLOP0iKRQFqS6roYOZePS00wqQKBtgCGJ3H4A
	 B9FFbvko2faTmifEJZaw/mkkCsxYaR+BgDWdunQsRkq8IK5EJxJQHNhqhIOgCRR4pg
	 TNZp+5+0uECvcI4ehrPvcMEEclpd3J/P0nth7A4Z+Hur+MErngHy91X4Ih2dMOGhyD
	 DROhgLApWXMIb0Jg6WXydv8/XUf/3C2l8/dWgnmnzinUARaoFXK79A2TJWBOu8ru4E
	 HkMFqWAdkuOrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF314030F;
	Sat,  7 Feb 2026 19:36:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE703219
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB21260D88
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxEcOxbRNuFf for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 19:36:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F80B60DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F80B60DF4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F80B60DF4
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:36:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1569647348; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Feb 2026 19:36:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1voo67-0000000Gxgw-3VJ0;
 Sat, 07 Feb 2026 20:36:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260206221518.1833343-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 6 Feb 2026 23:15:18 +0100")
References: <20260206221518.1833343-1-bernd@kuhls.net>
Date: Sat, 07 Feb 2026 20:36:03 +0100
Message-ID: <871piwtkgs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FJ8d7E/kDvsQWljdxAgOf8sUy4YZ/Qj77kf3LkrKzkXw/m1VoEhP6rBzPZI9q8oR1+a0qQbzBNC2XADCnZzIyPldaGeGaQt6CIdsjvWAa6jQIyOl8t7bAAUPQrYR4ahHCzmj9RjFYgHloHHoKroLuOs/Jzv6Yul0+j7J0RGY4G2ow+yqEpmm2EHMp6zXJbEkDlbvHe01iM1/0E2N292sEl7OEBoUKqIVbKHX0nonf3bnLCHQw7lCh9/KeCnxUDwDpf1RY5G2EFoYV9pg9kmhGdzntqmGV/UBg7GywZ5iUgXFnGnedZ7lcdsIubDDPCKwDaFUveF9BlPOA0nljMUOHg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=FxwiZ1xU+XDTrXFDaPdUsro9b1IT7h0FUV4l+/hNiTI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=FJ8d7E/k
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.5
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://lists.freedesktop.org/archives/mesa-announce/2026-February/000837.html
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
