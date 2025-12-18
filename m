Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDE4D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1346E6125C;
	Thu, 18 Dec 2025 16:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id li7OFN-rxb1X; Thu, 18 Dec 2025 16:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC46B61234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075907;
	bh=7WhVxvF5h48UL3SyrvdfqM1AZ8S7WS8bT70WkSyh27s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ve5xgsZsxZ5Hdj2KeWH7sMqVGu1LviDdZluU6qBJ89rp3ldWac5cTM3WRzb9U+Xcw
	 9Cz4fSELIySJDkrBrp/DENXYuKj+7hShAxCVS4F2r84fFy8sAcpUX4xaJ1PhIuZu3b
	 GjKLx987OfdzJlo9s5MutqsMqanHa3b85Eh9WZ2vDpWttWFAvAmBFpHHRUYQsrvCVT
	 GxJq7tJD8MlWoHqdySdG5XGtfDFw0mmfI+7L7yTzUO1zElQhZ0IE4Iy+JRgNSOqm3w
	 jtAfAjwLzVBjkDNaj3KEbm7AXgLm6e5NE+n5kpLHQPoR6VtYVClN1GRQ/zvffYS0QH
	 rJIergvUrI74w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC46B61234;
	Thu, 18 Dec 2025 16:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCD8B361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFAD341119
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iygs_gBdvNuP for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD3A3410D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3A3410D0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD3A3410D0
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76555B97A328; Thu, 18 Dec 2025 17:38:23 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:38:15 +0100
Message-ID: <20251218163815.380143-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209094135.653478-1-giulio.benetti@benettiengineering.com>
References: <20251209094135.653478-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075903; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=IEUfEpfVMj5qRBphztu4SmvpHA+/FVk3zd+wtRlHLQQ=;
 b=MzPW/OxguhYEL1aONMnJQK1gIPbGMi+3qEFSyzVrYApdUkgziztDwSF+q4VWaiTOwNps42
 Po65O0TT54BdnUCkLKxmw2TSMTUk5ifH2eib/H33YJ6zzoYlMBVaMeLjmBpkIl+VFaXAGl
 tJZpJbM8rRxqTJcxPCUxJmyPaZAntC9PeQoEmq/dpsnqPNsDGuDe/FccJY1hQxzIjnujQd
 dzj8CpOvDVcwZla5y5kVw48vrsPXEq3taQuhk+u+HYvAW8eKiFHS5Af7bzk/gW0V+TzmWA
 0eut+b3blbbGxD5ISQruwjWbeLr3bBpqRGWJ89k2CGvI/VCNFr1knkkRPGVUIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MzPW/Oxg
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: bump to version
 2025-12-09
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.org/results/52081e3a500dd2566af145e8c6d793df7f72d025/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.11.x. Thanks

> ---
>  package/rtl8723ds/rtl8723ds.hash | 2 +-
>  package/rtl8723ds/rtl8723ds.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
> index c2691402bd..580f5d09f6 100644
> --- a/package/rtl8723ds/rtl8723ds.hash
> +++ b/package/rtl8723ds/rtl8723ds.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  338f0fe08acdd1352428d86f88366935e1b967b134f252ac9a3e50cc8922fe14  rtl8723ds-546ffb2cb735e0c33e765936721bd66dd58e6893.tar.gz
> +sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
>  sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index 14938daaf6..d8072f14bc 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8723DS_VERSION = 546ffb2cb735e0c33e765936721bd66dd58e6893
> +RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
>  RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
>  RTL8723DS_LICENSE = GPL-2.0
>  RTL8723DS_LICENSE_FILES = COPYING
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
