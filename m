Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7142DD10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3252180DCF;
	Sat, 26 Oct 2024 15:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpXWrOybf1_m; Sat, 26 Oct 2024 15:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E4180CE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E4180CE5;
	Sat, 26 Oct 2024 15:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 723745C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52DAD400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rs5YtkZyB4fD for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBB8A40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB8A40139
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBB8A40139
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:35:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9562FFF803;
 Sat, 26 Oct 2024 15:35:03 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:35:02 +0200
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>
Message-ID: <20241026173502.4f6911a3@windsurf>
In-Reply-To: <45637d224995588db97c5908d41ea67600e432f3.1726568237.git.yann.morin@orange.com>
References: <45637d224995588db97c5908d41ea67600e432f3.1726568237.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729956903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHXODAuxcikK6DW7lXXTizJ8otiDCntbEQfvtw2J/pQ=;
 b=BedOpmUCYZkoH1Dzs2IYkP/qgCw6Al9IAyme4qyGCIiqRJXHB0KR6QnN6KnfU5XUuKjLJm
 gAyH5kNKQ9caHEmPBNJuNrJCc5d7ullkTShj2qO+YTNqlnXVe66ppezHbtmUTzqq3Qm3ys
 rhtE8Sm7RVEYPTcBePOww5EL0qL1D8dcWGwzbn0+8/WWCs2mht+Oc2sspXl1avBUF8DSWa
 ZiZWmje4zoaf2gSWRwD2o75NZ9AnJVA8hTMGFm1lcAJAmHcyWqp6ZZ/ogpDE/UhYdnPPhR
 mxGN5QVWOuOn479IS0eSAzM4qteqdm1VWufbV2ORHDlDJvOQxhM9yUywhCZYqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BedOpmUC
Subject: Re: [Buildroot] [PATCH] package/skopeo: ignore un-applicable CVE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Tue, 17 Sep 2024 12:17:17 +0200
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The CVE tracker detects that CVE-2019-10214 impacts skopeo, but this is
> a false positive. Indeed, that CVE applies to containers/image (which is
> vendored in skopeo), and is matched for un-versioned skopeo (notice the
> dash '-' in the CPE ID):
> 
>     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:-:*:*:*:*:*:*:*
> 
> and does not apply to any versioned skopeo (1.16.1 and "any version" for
> example; notice the star '*' or the version instead of the dash, in the
> CPE ID):
> 
>     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:*:*:*:*:*:*:*:*
>     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:1.16.1:*:*:*:*:*:*:*

Wow, it took me a while to process the explanation here. Let me
rephrase what I understood:

- The NVD database entry for CVE-2019-10214 indicates that one of the
  affected CPE IDs is cpe:2.3:a:skopeo_project:skopeo:-:*:*:*:*:*:*:*

- The CPE ID generated by Buildroot for the skopeo package is
  cpe:2.3:a:skopeo_project:skopeo:1.16.0:*:*:*:*:*:*:*

- Because pkg-stats handles "-" as "any version is affected", then it
  causes CVE-2019-10214 to be assumed to affect our version of skopeo

> This was fixed in containers/image in upstream commit a3d69a4a (Use the
> same HTTP client for contacting the bearer token server and the
> registry, 2019-08-01) which has been released in containers/image
> v3.0.0 (2019-08-02), which has been vendored in skopeo since commit
> bebcb94653cc (vendor github.com/containers/image@v3.0.0) released the
> same day in skopeo 0.1.38 (2019-02-08).

So I agree, but then the proper course of action we recommend to our
contributors in this situation, is to contact the NVD people and have
them update their database entry. In this case, you already have the
needed information, as you tracked which exact version fixed the issue.
Could you contact the NVD database maintainers to get this fixed
upstream?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
