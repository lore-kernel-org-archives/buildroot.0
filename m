Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2528FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80F78114F;
	Fri,  2 Jan 2026 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4gN9TEfn9hg; Fri,  2 Jan 2026 21:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8D4810FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390446;
	bh=2CB9jJWAsXEhGGnu3IlWU2yMXR/DEWJeX1OHf7GhFm0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o34kFMUh6BcpPlXqHa/K1+QbRG4VqWzQJ955o34h8QCt++kA2YB8Qc54Tg4AT3diu
	 lgvSqIa7jOdcSmLE3k9SuHxRtzsqrC63DmvxJmof66mR4rJw1RKVDCxM5nQeY2hnon
	 8at3UONFz3IG7IZ4cSXCPu9Vsq8KLYD4ya0TLLB7VvGoQM16exmvI0ac0M+920ILpC
	 xo7ptnm7xqxq15MCTZurxTGQbxMz3fRrnpVwrM2JOMdVN0vM8PtqgaMhwMe04RqLcc
	 NY1Fh+PsZWIjsGkKJWBKupULOMzJWu9ip51nsDwqk6km2jQcyGvEKDBJ8TSodtX2uT
	 HANO8zb5MX03w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8D4810FF;
	Fri,  2 Jan 2026 21:47:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81C52440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 745434083B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzKcooWc8lqC for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:47:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7117140838
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7117140838
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7117140838
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:47:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 74337C1C3BC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 23EB7606C7;
 Fri,  2 Jan 2026 21:47:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CAF85113B023E; Fri,  2 Jan 2026 22:47:19 +0100 (CET)
Date: Fri, 2 Jan 2026 22:47:18 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20260102224718.775cf9cf@windsurf>
In-Reply-To: <20241122213809.176709-1-ju.o@free.fr>
References: <20241122213809.176709-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767390440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7CHzMblWKzoSfRukGEZX3QI38jDfwuVro6C+B1rCi6U=;
 b=IOX0FcXwRohv9F963ppGFId87mb6ldM0qR2ex4HzRQCmcDpA8tUm4uVUV4xDFXa4ctnio1
 N5/pN49pag4PTRIb+lhHZDBbCuv6ERZCnOWL2k4FRotGXNcbct0eTgv4/S0GuSj7uSvP0S
 xkvxafWHH7w5sJZ03d+zIT2YtOfeMZ5ZTZM9WiIqKe7PrGumrYgtwtCaH39wbnPFlpQErO
 gdbBIXKe86IB0odVy8mbXr1rqoqi7RAheXefPNubcN8TDCraXi6vZYvQ9y19X64D3tw3/j
 DqJDFRw3Md+fjydcrr+vJSbKXUMSS5Gv0hn8ZAm6ELhsssF5FhR6HzVfxYegJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IOX0FcXw
Subject: Re: [Buildroot] [PATCH next 1/1] package/spice: re-enable on all
 cpu architectures
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

Hello Julien,

On Fri, 22 Nov 2024 22:38:09 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Buildroot commit [1] restricted spice compilation to x86 only.
> As the log of this commit mention, this was because at that time,
> spice 0.12.0 was generating an error on untested cpu architectures.
> See [2] (we can also see that armv6+ platforms was apparently
> supported).
> 
> Spice commit [3] (first included in spice v0.12.6) relaxed this error
> to a warning. The reason was that big endian support was improved,
> and also there was an intent to make testing easier.
> 
> This commit removes this i386/x86_64 cpu architecture restriction.
> It reverts the commit [1] and also adds the dependency on
> BR2_USE_MMU, as it is needed by libglib2. This dependency was
> missing, but was implied by the cpu restriction (as all i386/x86_64
> cpus has a MMU). Spice also needs a gcc version with C++11 support,
> including with std::list allocator which correspond to gcc >= 6.
> See gcc commit [4].
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/4f452a86b8523d90ffa7a94cb1d540e574ceb165
> [2] https://gitlab.freedesktop.org/spice/spice/-/blob/v0.12.0/configure.ac#L60
> [3] https://gitlab.freedesktop.org/spice/spice/-/commit/f80eef8f9ca04f923752efbda043ab856801be8a
> [4] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc7f3d0eeef05fb8fc11384a9a29afae10a54cc7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1556927270
> ---
>  package/spice/Config.in | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

I've applied, but after splitting this in 3 commits:

- Adding the missing BR2_USE_MMU dependency (it's a fix, even though it
  doesn't really have an impact)
- Adding the missing gcc >= 6 dependency (it's a fix)
- Re-enabling on all CPU architectures (it's not a fix)

Indeed, the first two are eligible for LTS, while the last one isn't.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
