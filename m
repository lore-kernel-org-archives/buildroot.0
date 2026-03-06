Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A14FCC050
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20D6F41E10;
	Fri,  6 Mar 2026 18:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFxbkidVcx_k; Fri,  6 Mar 2026 18:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 237D1407A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772821162;
	bh=VZRaxUj5NYPF+alI7Nk0arwah2FYBIM2edUjF8pwfN8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dLHCE6O/2H+/jrdp9jusDNqwo8WIRc8s6p6956G5gz2UH6SXsSHGizoHSsQ3UR72E
	 syEeBQYNC6GnpRpoYjswEbKxXN3exuBREOaDHuz4rn2Hr1U0Rwq4H9YHUU5qSxMaST
	 EyOuD6JMP4rxV3iu6DBl9MdSNJ3+lPOnHASXomogq5xOCdIcQWLG6vwX4zKogZCqTu
	 rdCPCN4nlEAgzbSC2MEPdqPKDHhg6/l/oGUCBCZL/lSH/lApWfxK3v3MbCW8wKtDxi
	 CVaXgDlgan2GtAPd724jZ6GqQI+CjXA4P3hxXewRPSMuzQj4qtAPgkn52R2tGKqShT
	 Om9EWYzxPJF4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237D1407A8;
	Fri,  6 Mar 2026 18:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4669725B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 280E6407A8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puv4GABjFqy4 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F3A9407A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F3A9407A1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F3A9407A1
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:19:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 603D6B00539;
 Fri,  6 Mar 2026 19:19:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 19:19:17 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 19:19:17 +0100
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260306142329.1010724-1-dowan.gullient@smile.fr>
References: <20260306142329.1010724-1-dowan.gullient@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <1595068e43c1b150dcce7282187f5fcc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772821158;
 bh=gVNSv/rjHYp94tQRry2ArJopBviWJSwK0qwklazmToU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bXxmxsWvMd4B36HPLRgJoSbrwX7xVBfzgKpgBZ1xZqHcohqY3ZsShkTOIIBNdSAGT
 wWGvWJ4LU0RiyyZlrK7UUaByXQpFBicbkGCkG1HUKWzFkmdpCNFnRuGVqCDbAVG5gd
 Lnv16DJmE8M+ux95s1ZNbvPa3mPV1L1r7PH/8TXovUZELgv79sztH5GUfviA+Knntm
 JbPLEFsHLyFC8wZAoDp5PiBkiCfS8fn+Ben5Ve/v3nwYkHtWNjr6Upm4p6FkFWeSdv
 9gQo6qxiVk2drfCSBuknICMSwbx8oTjuMLMFVAHCTQyR2lMBaQCiqlZcJMaya4+e2c
 +/+NNOBTHw7zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bXxmxsWv
Subject: Re: [Buildroot] [PATCH v1 1/1] support/testing/infra: update
 artifacts URL to https and .org domain
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

On 06/03/2026 15:23, Dowan Gullient via buildroot wrote:
> The artifacts URL has been moved to https and domain to .org to
> improve security and avoid redirection issues. This ensures that
> downloads of kernels and rootfs images during runtime tests are
> encrypted and verified.
> 
> The change has been tested by running a runtime test, confirming the
> correct download and renaming of artifacts from the new URL:
> 
>     Downloading to .../tmpyotq8uor
>     Renaming from .../tmpyotq8uor to .../kernel-versatile-5.10.202
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
