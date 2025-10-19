Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55780CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 21:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DA0A4142A;
	Sun, 19 Oct 2025 21:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYYERfg4PNHi; Sun, 19 Oct 2025 21:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38FBD412ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38FBD412ED;
	Sun, 19 Oct 2025 21:49:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 582681CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 21:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DE7C60BF2
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 21:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7vwHHCk0_Q5 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 21:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 928F760ADA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928F760ADA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 928F760ADA
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 21:49:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A2F1AB0053E;
 Sun, 19 Oct 2025 23:49:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 23:49:14 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 23:49:14 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <20251019200644.3956464-1-peter@korsgaard.com>
References: <20251019200644.3956464-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <47f8d94d23f2bf4e63eca18c0b69e7b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760910557;
 bh=d7WljzHlGn0nVtIBhVf2chy9TOTl8m7i9SBI5UP5WsY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rtpdOp09L4Nok6jc8p8focLkBinQRdWRws2i0sjlKxwte14b+3ch2VNyY+sdXO2BT
 vGHx5bxI8MRGvgW9IWe8MpA76BPCsXBdgFOrHo4ZBHF332+N6gLYmyDtT5f/R5Czg1
 Hpbob2kPtJOPY1lhDe8Ov16LZo378FE4ZOnc3tVSeiACiCWbl2upm4BII3mdvvt8iN
 AElP4Pcp5jzlu0EZC/lkuBndkcsVko2jbdNcU7VXCKtmOVhlYI80+LmLGFFUfpqE/w
 cmoa2cpmyiqqh1nel0qnjN2tOBMtmw3jbU9cvv/P2qTjWdCl/h9mXBbXF2Z4N2DtEj
 28PheFInWuxWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rtpdOp09
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.25.3
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

On 19/10/2025 22:06, Peter Korsgaard wrote:
> go1.25.2 (released 2025-10-07) includes security fixes to the 
> archive/tar,
> crypto/tls, crypto/x509, encoding/asn1, encoding/pem, net/http, 
> net/mail,
> net/textproto, and net/url packages, as well as bug fixes to the 
> compiler,
> the runtime, and the context, debug/pe, net/http, os, and sync/atomic
> packages.
> 
> go1.25.3 (released 2025-10-13) includes fixes to the crypto/x509 
> package.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
