Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081F3C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E406065F;
	Sat,  1 Jun 2024 15:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gj88f5KiRXoo; Sat,  1 Jun 2024 15:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9424B606A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9424B606A9;
	Sat,  1 Jun 2024 15:39:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 230A61BF2EA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CC944016B
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-aAN2WRIP98 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B0D74010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B0D74010C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B0D74010C
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:39:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 815BB13F879;
 Sat,  1 Jun 2024 17:39:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 17:39:43 +0200
Date: Sat, 1 Jun 2024 17:39:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZltAvz2EpafJCYTy@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-2-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-2-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717256388;
 bh=VIfk0RKBivOr5xW71V5W22f8pz/ECpoIgkzhTEI8300=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9FkRa+MuRgYeY3zDmS9m08I+q13aevKOjzMtXx7/FErm5hwJfvPG9CNqI0Z+KKRn
 4sUTCYQ4DfgWhhHaWyx7j9b0gbwOrbnxNGUbsFNnGaMIoLEqi0HoMQKz7o/eaDMhuN
 2Of8AngliCRPuMxgJqNeDBJGQwYpVmUmU+NecfeMN+Y4OXQbyPAAETi3afImBwRItH
 fG+BSDqnLZCom0wo3iY+7YGkH/QoXqsRk/XuusFWKOHqMzKoQzbift39Y1P/WiNnZb
 tUckLjrMYEqZh2DPbp8AcMyhJP4phqVrAR9LhQZdhmNI+VqgBDaM0O/JmMQQT4S0m9
 obe5M7sfwPFnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I9FkRa+M
Subject: Re: [Buildroot] [PATCH v2 1/6] DEVELOPERS: add Thomas Perale for
 'go'
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 399b2931ff..039b803d50 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2979,6 +2979,9 @@ F:	package/frotz/
>  F:	package/kvm-unit-tests/
>  F:	package/xorcurses/
> 
> +N:	Thomas Perale <thomas.perale@mind.be>
> +F:	package/go/
> +
>  N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  F:	arch/Config.in.arm
>  F:	board/beaglev/
> --
> 2.44.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
