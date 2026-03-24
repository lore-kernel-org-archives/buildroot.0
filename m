Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B4FEC0F1
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 18:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649C741281;
	Tue, 24 Mar 2026 18:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgLSw64kArlJ; Tue, 24 Mar 2026 18:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C204127A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774377034;
	bh=HJRX7/F94h8OjwYXjULkcNu0uwsBumpm28/rkS0Hpt4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aTJQv5G06hsT/1zn1XagpqwQ76sgvXxMXcvs0p0s4awpBr8NodfHG2LzPJI+rHNao
	 JUpxu+wf7eT7+2ph3BKVufEVLbVg5m/IosuBjTy3spY0M6+Iri5GqOt7lzqyh58VXd
	 i1nJH+SxBTOdP6/tsuIBAhyskfzK+aEcBCipMIkKLRM3gVrTxoU+Bji8OAIEVBkq9I
	 cQgaYNtl5Zs7J8BcsVQsGUGnrXTpyv4cgQwW9r9h6OJC2//yyFZfctOl1aVtTmwJeL
	 4+fsaS6iOhq/LkkT7UvebmSM/+NA2OzwTHf+32D7f/BQCpLKvIYTeU+y98lmksOA0F
	 qMUSqkR1PoQ2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C204127A;
	Tue, 24 Mar 2026 18:30:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC2B9353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 18:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDA574127A
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 18:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTGrDgn4kIMl for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 18:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD52B41273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD52B41273
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD52B41273
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 18:30:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1EA87B0054E;
 Tue, 24 Mar 2026 19:30:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 24 Mar 2026 19:30:22 +0100
MIME-Version: 1.0
Date: Tue, 24 Mar 2026 19:30:22 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260324073706.654995-3-titouan.christophe@mind.be>
References: <20260324073706.654995-1-titouan.christophe@mind.be>
 <20260324073706.654995-3-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <481d246b5592f0cc3833e11468b453c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774377028;
 bh=Sa/Lr/uUeTzKmbkOPPd2ZGNauN8y1QjnFWReHCop0aY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F8OilSNpdNJY0z7h0aSHEKKAcFhsm6z/nHHnUPeAdQj+mODtz73qUS03UPx3px/Qu
 Eg5JnHkUnaFhaSz5qk7oBVqK83iI9bU5ZuiVXSLG3Q8nDt/jStmb57z7geGSQXSSWO
 Sn/sekuDMLS9ZikxGWmhzfRbXDaRuFk7XgNd2ZFWwq61hq3BOejrW4qHCI9PclXiSS
 5DSd6icBJ20C5Pqya9ZvX8H8qIhwj7Qr560EdcnWrxNMNwOoXUjzmKbPF47iTweZqC
 /wNgmxp56nCdqv2G70Gw8N7m8Nrnzs6pFg2YF2+XNIxaH/jlg4gcF77VAtj5zk+sUf
 Xmdy2IQz3nB3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F8OilSNp
Subject: Re: [Buildroot] [PATCH RFC 2/2] SECURITY.md: add new file
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

Hi Titouan,

Thanks for the patch. I have few suggestions, see below.

On 24/03/2026 08:37, Titouan Christophe via buildroot wrote:
> This is an in-tree description of Buildroot's security policy
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  SECURITY.md | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 SECURITY.md
> 
> diff --git a/SECURITY.md b/SECURITY.md
> new file mode 100644
> index 0000000000..6b955638df
> --- /dev/null
> +++ b/SECURITY.md
> @@ -0,0 +1,16 @@
> +# Security Policy
> +
> +## Reporting a Vulnerability
> +
> +To report a security vulnerability found in the Buildroot build system 
> itself,
> +please send an email to 
> [security@buildroot.org](mailto:security@buildroot.org).

Maybe we should make explicit this email is a private one.
For example:
"""
Note: this is a private mailing list contacting the Buildroot
maintainers.
"""

About Buildroot vulnerabilities, we could also mention that Buildroot
security advisories are announced publicly on the general mailing list.
https://lists.buildroot.org/mailman/listinfo/buildroot

Buildroot itself has a CPE to track its published vulnerabilities:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=buildroot

> +
> +## Vulnerabilities in packages
> +
> +Buildroot is a build system that cross-compiles packages from 
> third-party
> +sources. The Buildroot developers are not responsible for security
> +vulnerabilities in these packages. Such vulnerabilities should be 
> reported
> +directly to the upstream project that maintains the affected package.

Regarding vulnerability in packages, I would also suggest to add
here a comment suggesting Buildroot provides ways to monitor the
vulnerability of those packages:

"""
While Buildroot does not have the responsibility to fix those
upstream packages, Buildroot provide ways to its users to track
the published vulnerabilities of its packages included in the
generated images.

See for example:
https://nightly.buildroot.org/manual.html#_details_about_packages
https://autobuild.buildroot.org/stats/
https://security.buildroot.org/
"""

> +
> +When vulnerabilities are fixed upstream, send a patch to update the 
> affected
> +packages in Buildroot.
> --
> 2.53.0

What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
