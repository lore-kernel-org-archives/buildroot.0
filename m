Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0136107BCD0
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 18:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6220F40C13;
	Fri, 13 Mar 2026 18:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_gTXgTOnGph; Fri, 13 Mar 2026 18:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A08B40C2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773426260;
	bh=3Gdlgn6Iq9TRYqxmEjA0V3q8czPLIdHJEMRxAL1LDXY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E0Cyz2hBm/Epm0U76cMI7S+1gzLQda6R8Rh/4pJPH2UI3D6ueAaANezXFZOONixa0
	 ZKyvtPGHFaIsal585afOzbUQsdEMolzMyVPngyN76r0mvcnJH7HUrMollvLQWqHUWP
	 8iMedjPmXGAs7tKxo7HgPLc5dsqj7utJAJGdeM0SnLX0MKRsPJu/yMbK0YzTFLnxEh
	 HSGWWhR97Ck2Seu5Pv4cOyhCqEF5TeEL3/iHF13PhgbeZ3L852tFUcr8sTYCgv5Q/M
	 MYWjhc3lSOicsGurqb26F/OG/vdU2eUeZOg6c53B1KGs++Ur4QXzs8feWRC6vvL/zR
	 hXhgi/kUflVjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A08B40C2F;
	Fri, 13 Mar 2026 18:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A2D201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 18:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB4104018D
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 18:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKuTt1FY86ed for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 18:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC5B24004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC5B24004D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC5B24004D
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 18:24:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E5EFD780372;
 Fri, 13 Mar 2026 19:24:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Mar 2026 19:24:08 +0100
MIME-Version: 1.0
Date: Fri, 13 Mar 2026 19:24:08 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>, Christian
 Stewart <christian@aperture.us>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <875x6zirde.fsf@dell.be.48ers.dk>
References: <20260312075722.86111-1-christian@aperture.us>
 <4529c7b6d321750cc0d99e8e02c4758f@free.fr> <875x6zirde.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.13
Message-ID: <11d74c7acb42b8608bae709315dd7468@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773426254;
 bh=d2M0+dfuOBtTHZVn6BtN12vHenSRBQV+5B8Eyc3EmSU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DOF85Jzsd5rYkKHJlM0YGoqHIWxN1AN/6iMLqlNsnnCUXXsGA/cwWPAPY8yadUE1a
 n9BrllWhf8CA5a2pc3tZ+0MjIpIiQuWqXWEeP2D/wZopi07jYCGom4DBW+llxoVNXO
 gQyJxX04am6ofwA7eOup30hslXsVpxJfnCqD0R1BrQcB9rkDofui7YCuXuoR14Rk2O
 HrFHjzbDcoO37uxw/xeqfBM6KaGz5+XXGaEtqLlRJUJVdX7yD9dro2nrcNI2qhFt0h
 R178dNNP4iKOeE9imoPUg1z6/Pzon//5GdaPUpNyC3pty/ZtRQ2sGbtDa6kfPTQxlF
 0gUOVEPbgxsQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DOF85Jzs
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

Hi Peter, All,

On 13/03/2026 18:14, Peter Korsgaard wrote:
>>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> 
>>>>>> writes:
> 
>  > On 12/03/2026 08:57, Christian Stewart via buildroot wrote:
>  >> Building Go 1.26 and later requires Go 1.24.6 or later for 
> bootstrap.
>  >> To support this we use Go version 1.25.8 as the version for
>  >> go-bootstrap-stage5 and have the build for Go 1.26.1 depend on
>  >> go-bootstrap-stage5.
>  >> Go version 1.25.8 is the latest Go version we can build using
>  >> go-bootstrap-stage4.
>  >> The package build for go-bootstrap-stage5 is effectively identical
>  >> to
>  >> go-bootstrap-stage4 with only the Go version and stage number 
> changed.
>  >> Go 1.28 is expected to require a minor release of Go 1.26 for
>  >> bootstrap.
>  >> Fixes the following security vulnerabilities:
>  >> - CVE-2026-25679: net/url: reject IPv6 literal not at start of host
>  >> - CVE-2026-27142: html/template: URLs in meta attribute actions not
>  >> escaped
>  >> - CVE-2026-27137: crypto/x509: incorrect enforcement of email
>  >> constraints
>  >> - CVE-2026-27138: crypto/x509: panic in name constraint checking:
>  >> certificates
>  >> - CVE-2026-27139: os: FileInfo can escape from a Root
>  >> For full release notes, see:
>  >> https://go.dev/doc/devel/release#go1.26.0
>  >> Signed-off-by: Christian Stewart <christian@aperture.us>
> 
>  > Applied to master, thanks.
> 
> NIT: It would have been better to first bump to 1.25.8 (which includes
> the same security fixes) and then afterwards add the feature bump from
> 1.25.x to 1.26.x so the security fix could be backported.

I thought about that. We usually do that for LTS maintainers to
cherry pick the bump. But the LTS branch is including go 1.23.12.
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.x/package/go/go.mk#L7

For which branch you wanted this patch to be backported to?

> --
> Bye, Peter Korsgaard

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
