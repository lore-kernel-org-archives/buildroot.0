Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CDF106ACE3
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F479407E3;
	Thu, 12 Mar 2026 19:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSUmOLVN-tAR; Thu, 12 Mar 2026 19:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9764E407DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773344688;
	bh=dOlX8ezybyoBoX8R0XyWUFFLMracgdluD89Qt7y+mxs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kq20fcuW0/QG9Ubqedzl3pu+qX2Pdh0HnIjNWVcKgao01LHJqapCDqIYnR2PQY2UA
	 nmbnmW0LmwGcKcpQgMuHiG7BkrkCUmScsQkzUNqh1fSvxnkSdPgcL/kHi9T1+k3zoC
	 ac+fY2MzlOuK0Rbxjz+rgYJfRwt6bKjEM1x5DNDvNAQ+oHxlZ5U2txJ6LjC+mNBh78
	 waDKrQWCYuawVbz26fVsG3HdwjkfNftK4ny1xl+MvJKOtegsneCi+endhzVS61LI5g
	 mu0e5K4jwwIhuOoDWpNz1la8Yk2UcnwVBLCpNaMLajlpj/uYvq9712MfhJOPUA0ZWp
	 yBIEyGvAQU1CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9764E407DB;
	Thu, 12 Mar 2026 19:44:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B59E2282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 19:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AFE8606E1
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 19:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtL6wtkhxJYn for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 19:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EC3F606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EC3F606DC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EC3F606DC
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 19:44:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B9B142003AE;
 Thu, 12 Mar 2026 20:44:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 20:44:37 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 20:44:37 +0100
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260312075722.86111-1-christian@aperture.us>
References: <20260312075722.86111-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.13
Message-ID: <4529c7b6d321750cc0d99e8e02c4758f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773344682;
 bh=dX1+DOBdlFKrBYgfFiixgL51xy/pDR8Z0hc5pVNRSlI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SPMlXs/howvo/M0hKdo3aFN8WJECNp9d9qpYaOSSy8XGa2+EOWOtqoQpE4R6WsowV
 oyht6BbmUvfgNGRXwRwYZy52fxuNxxQm/My3Nm1lneOFFB2/+PofKeUVfuMqayOUAY
 fzz0Wv5EA25xrz4klwVMbLQ2gqJ1Wri6eVEDYyW31Cc/A1TDpZYw40Ov2Z9hXlwy0p
 WdWhrJl4YpXk7O8uHbUM3KIxbYpGDUTUAozRi0uGo52U+06ht+fXq2xxsz68F0B3V1
 qiYmpzSiTOtvLKxODn5e0rRNGRPuYRTg5ydHRs4YR51TUCy+oLZ9efCykZ4PvdAQBS
 PwW9ujV6lQHUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SPMlXs/h
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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

On 12/03/2026 08:57, Christian Stewart via buildroot wrote:
> Building Go 1.26 and later requires Go 1.24.6 or later for bootstrap.
> 
> To support this we use Go version 1.25.8 as the version for
> go-bootstrap-stage5 and have the build for Go 1.26.1 depend on
> go-bootstrap-stage5.
> 
> Go version 1.25.8 is the latest Go version we can build using
> go-bootstrap-stage4.
> 
> The package build for go-bootstrap-stage5 is effectively identical to
> go-bootstrap-stage4 with only the Go version and stage number changed.
> 
> Go 1.28 is expected to require a minor release of Go 1.26 for 
> bootstrap.
> 
> Fixes the following security vulnerabilities:
> 
> - CVE-2026-25679: net/url: reject IPv6 literal not at start of host
> - CVE-2026-27142: html/template: URLs in meta attribute actions not 
> escaped
> - CVE-2026-27137: crypto/x509: incorrect enforcement of email 
> constraints
> - CVE-2026-27138: crypto/x509: panic in name constraint checking: 
> certificates
> - CVE-2026-27139: os: FileInfo can escape from a Root
> 
> For full release notes, see:
> https://go.dev/doc/devel/release#go1.26.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
