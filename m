Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0225BEED60F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA4F80D6A;
	Thu,  1 Jan 2026 16:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2k-Kkd0eOfw; Thu,  1 Jan 2026 16:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB45E80D6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767285399;
	bh=4o2Eht7aYBvNwxlF+ppWpazhMvYkc0uW63jr/sd22CU=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pVodE15Dlv0WavnFCq7BzGe4/38RvyzGqx7Uhr2WlTerWzlGPL4oLWq9FOUpdmxWS
	 iDNGN2EGFbgd7FWkBHu1+3YKFixfae4sj8DdnZNptm3FZyouwdkfWgUTUsV1DPJ3C0
	 2rQtgvyafSOLJIAZplP8XQ58c/uh0jKUVIIja8dma4wjTKobjj5dVhZxtFfoKIyuX3
	 nYRbqdKvJBa5ndrqL1sFkuiX4k6KMmfPBh73Npt7P6sLjJYh4san9kUAgFTd3NNZyZ
	 ky/f9/1dflSvGq53AOdQgykVeFHta70moeN/WFaXBbRUe78nHrO2cH8O5DB4SO8WKG
	 zpO5+AeEs9KbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB45E80D6C;
	Thu,  1 Jan 2026 16:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB9B119D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E57F40273
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPqpiszvbOwO for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A076A40259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A076A40259
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A076A40259
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:36:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DD4681A25A2;
 Thu,  1 Jan 2026 16:36:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A48E560749;
 Thu,  1 Jan 2026 16:36:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C476113B0777; Thu,  1 Jan 2026 17:36:31 +0100 (CET)
Date: Thu, 1 Jan 2026 17:36:30 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20260101173630.10079d1b@windsurf>
In-Reply-To: <20251019064503.2583945-1-thomas@devoogdt.com>
References: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
 <20251019064503.2583945-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767285394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FG3b+14tHZK6aZs0spqBWURRXkDQl+oFZWp01UzyXzo=;
 b=IjevSVs/MryRmS9VcPzhaf/bpjA6/8Hl46Edik4YLMRip9skXOIuOo7I9cwvkqhPPyAhTB
 OwarZgOaRjF/nvZt6+vLC5QSlyhpkzZJh+nrFRfVaZjD8EwbRkVFU3Hf/GNHcrpPZfub8H
 2ZrTRgyICZvsvIINDAH1u/aVzHTYcMPASGC729y4H5VA3k6bsCr90Bu57Ryuato2pz+YNj
 rHyK88RXQQWcPnhqgC0DIcppKT3PAH+zHY5mni7mBmN2cuzOmnnCjfIkzNCTSybchL2e9k
 zza9Gl0e67kpUyGUVqaSonNff8sK7CqQvfLmhdlXMFJMY1AbuwmYw4qEHLLcjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IjevSVs/
Subject: Re: [Buildroot] [PATCH v6 1/3] package/pkg-cargo: add support to
 bundle a custom Cargo.lock file
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
Cc: eric.le.bihan.dev@free.fr, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 guillaume.chaye@zeetim.com, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Adding Buildroot maintainers in Cc.

On Sun, 19 Oct 2025 08:45:01 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> E.g. https://github.com/lu-zero/cargo-c/releases/tag/v0.10.15
> 
> Cargo-c releases a separate Cargo.lock file, but doesn't bundle
> one in its normal .tar.gz code source target.
> 
> We can't use extra downloads/patches/... as cargo is a vendored
> package, which is done quite early in the chain.
> 
> This patch allows us to define a custom Cargo.lock source.
> Both a local bundled file and remote (only wget) file can be linked.
> 
> Usage:
> 
> <PKG>_CARGO_LOCK_FILE = <PKG>_PKGDIR/Cargo.lock
> 
> <PKG>_CARGO_LOCK_FILE = https://.../Cargo.lock
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Thanks for this patch.

I understand the need, but I am wondering if we shouldn't craft a more
generic solution, such as providing the ability to apply patches
*before* the vendoring step. This would allow many more things than
just adding the Cargo.lock in this case: it would allow to fix issues
that exist prior to vendoring, which is something that has already
popped up a few times (I don't remember if it was for Cargo packages or
Go packages though).

The one thing I'm not sure about is (of course) naming. Should we have
something like *.patch-prevendoring ? Or a dedicated variable in the
.mk file ? Or what other convention ?

Feedback from the other maintainers on this topic?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
