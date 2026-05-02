Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBCACD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 10:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A9980E4F;
	Sat,  2 May 2026 10:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-6KSoO5Jv0S; Sat,  2 May 2026 10:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6183280E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777716309;
	bh=ByJN0bBNlbyM6G44Al4JFl9Vfky6Sx6dpPIhP11KjRs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mosZhwaGlPQ9jRObCHFS5SdMRURF4F7ieSZVZ9eimI5IEq7Ikk3S2JRBZtz1q+X0W
	 BFDjj4rU2gUQHUjBondU4xRg+k5gTFCRbiVkLhcgwZf9KxpjU/6dq1vrLUFbvuN/U0
	 un0CXjrTL9WKw/PFwcb1DfefT0FIHtoxNPxYc5s4hoP+dJE5EN/E/ZvmbJbe4TGFes
	 KD7+J8zO/phEjY94x1BviivYViOfAfUvd1UAO62TPPdNJ7RLz0Z3rsFi8WfnVSKqg4
	 yfv32tA2D1DY/Z1d6+ShnZ296tbQ6EFRVgM3E+O9yLIbjXggDGIdUw9OaSta+tx8Bb
	 f/nz2ln/9ir8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6183280E50;
	Sat,  2 May 2026 10:05:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A683204
 for <buildroot@buildroot.org>; Sat,  2 May 2026 10:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FCB860C21
 for <buildroot@buildroot.org>; Sat,  2 May 2026 10:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thmSPXU7ofJK for <buildroot@buildroot.org>;
 Sat,  2 May 2026 10:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64D4860C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D4860C13
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64D4860C13
 for <buildroot@buildroot.org>; Sat,  2 May 2026 10:05:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 96C6360129;
 Sat,  2 May 2026 12:05:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 12:05:03 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 12:05:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430045109.59810-1-bernd@kuhls.net>
References: <20260430045109.59810-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <d6c888dac0ed2099692ca08b2485fe14@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777716304;
 bh=t9SkC/RQmwFR/XpPF4zBCxtbTrdwom+CE6ri/XxuOA8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lk1yTgQE6/Z6kXhwk0btO8z/SB5DhTqA+P37WdMnrkMP7AzRS/10WEZ3FCVuHMb4B
 /6w7aptm1/8uUOhORni+EI67RXRhi/GsI1Jqxtbuo0o5cZNbIZuvII2qD9NpuVEQ3N
 XTNe3mxKKFeeekrwfziK3vlo41XNS7GO29LVYY89oc9FeYdgb7wBnTCNzYhEwcn5Qw
 ekRJEjnE7u6rg3452TMjDE/TcHi79MtonzN1GGHuavO0HBKgDzlMnFaUxfONheube4
 yxf/YKh/CFDere7MKkyAuwOrOKvKFUDP2QG2+7y45wCftelncqMkQrrSm1C6VxgpG2
 3s65bIyaJqUtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lk1yTgQE
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: security bump to
 version 3.8.13
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

On 30/04/2026 06:51, Bernd Kuhls wrote:
> https://lists.gnupg.org/pipermail/gnutls-help/2026-April/004922.html
> 
> Fixes the following CVEs:
> 
> CVE-2026-33845
> CVE-2026-33846
> CVE-2026-3832
> CVE-2026-3833
> CVE-2026-42009
> CVE-2026-42010
> CVE-2026-42011
> CVE-2026-42012
> CVE-2026-42013
> CVE-2026-42014
> CVE-2026-42015
> CVE-2026-5260
> CVE-2026-5419
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
