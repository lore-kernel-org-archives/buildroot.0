Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E31FFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05B9B83D8A;
	Tue, 28 Apr 2026 19:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vL8FVkEI5Zu; Tue, 28 Apr 2026 19:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E3883D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777405385;
	bh=ZtKRMvXwWlRTiTHiaeGGQoEjFnr3xSfvwiuf/pnaPgM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZZTIQCtEUX12ZgY52Qe5b+B36XxOzLkZeCc9T8731T9OoiSs2DnotNFHcC3poNyvR
	 VvdxVWDpAWpAKAr09Una/vMoQd8IX58RsXhr6L0sedB+qZzSnL3wAIMZT2MwEFikCR
	 GIW1aDJQG6t4OdtqXeC4HvClNvTdsd9/eZlOLSxDsDkYJ0OfTsYc+A5OboSHEPw0DW
	 F+1qFMee9BlnAeHhQzD5536YKkPgm4HdO5gh5zqCdz8ZoFaSTCx1o4vltJ4b+Ebmr/
	 ulg68KigkIv0/4K8/NqDey5xXijbu3aYVdJR9ShNGw4hEgD8YNbwGoK2/mW3nP2JU6
	 ph5oGHEOhSnfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E3883D94;
	Tue, 28 Apr 2026 19:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7730C1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 684CE60F18
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2TTJMobG4TS for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FCF06074A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FCF06074A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FCF06074A
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:43:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 37D64B0053E;
 Tue, 28 Apr 2026 21:42:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:42:58 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:42:58 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Johan Oudinet <johan.oudinet@gmail.com>
In-Reply-To: <20260426192320.183163-1-giulio.benetti@benettiengineering.com>
References: <20260426192320.183163-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <3fe3333ed61de7e7d2e7944afbf86517@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777405380;
 bh=GB92lkmFXaysaIqU2ixMQuDwrsXaXrwfgO9fpuBw2iM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=inNe/8pKIM/a6qbDX0edkN/YdsRlhdqVwDFnPoFPzYsl1FyNem5L3hUETqzAxoKM7
 T53ULo+jAf4Hq4hbe9yx8AhP5cGViSc4GzwPu7AIF3eGyS7NuQR7YKJTC9Iyy07iNJ
 LLDCJIaBYKaWRYuoxun80kKjglZDus7muT4QYO7+9qtccnbeE+Uqh+cyBWJEaCaFVH
 4imayC5CU1yDBYKJiQ2ZrV3DhfvfokajJ3+aMcI15uKSgbJKPOyEnVXp4LEyW0pyII
 47XNiOVjy+Qc+GCoylzouOP7q0uinlb0hD9gUrF1/vMyx5YIJcz8yDyRv51XGzzH3X
 DYrmWWWWr2oGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=inNe/8pK
Subject: Re: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 2.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 26/04/2026 21:23, Giulio Benetti wrote:
> Release Notes:
> https://github.com/davisp/jiffy/releases/tag/2.0.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/erlang-jiffy/erlang-jiffy.hash | 2 +-
>  package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erlang-jiffy/erlang-jiffy.hash 
> b/package/erlang-jiffy/erlang-jiffy.hash
> index b5cbb99f0e..79647e2b96 100644
> --- a/package/erlang-jiffy/erlang-jiffy.hash
> +++ b/package/erlang-jiffy/erlang-jiffy.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  
> erlang-jiffy-1.1.3.tar.gz
> +sha256  
> d4ef3fe9a231f4fa3d2f5b4be905c2d2a116b96d56433c66b5d7bd2dace5d52c  
> erlang-jiffy-2.0.0.tar.gz
>  sha256  
> 0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  
> LICENSE

Running the command:

make erlang-jiffy-legal-info

fails with an incorrect license hash.

The license was updated upstream in
https://github.com/davisp/jiffy/commit/f6f49d1c0dce7d42d89b7b25aaab3a1ceb17c86e
to add Apache-2.0 for the file ffc.h, so
"Apache-2.0 (ffc.h)" should be added to ERLANG_JIFFY_LICENSE.

Could you send an updated patch addressing this issue, please?

> diff --git a/package/erlang-jiffy/erlang-jiffy.mk 
> b/package/erlang-jiffy/erlang-jiffy.mk
> index b0839210d6..55fb14c000 100644
> --- a/package/erlang-jiffy/erlang-jiffy.mk
> +++ b/package/erlang-jiffy/erlang-jiffy.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -ERLANG_JIFFY_VERSION = 1.1.3
> +ERLANG_JIFFY_VERSION = 2.0.0
>  ERLANG_JIFFY_SITE = $(call 
> github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
>  ERLANG_JIFFY_LICENSE = MIT (core), \
>  	BSD-3-Clause (Google double conversion library), \
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
