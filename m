Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FEDEB271F
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 22:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3AEF60EB3;
	Tue, 10 Feb 2026 22:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwYLEgXqAi1K; Tue, 10 Feb 2026 22:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA01F60B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770763930;
	bh=eMpGQJAG/4nH/P9GGpx9qkUAnLvdBogFTMnBAHVZutQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WbptABdyNHB8zuVNHaP4cGFpT+TptmoGCgZ5E9tgXeudh+vLQe7SnOi5N8SBp2No9
	 2gSJguTa0GUNs4VPRE4x46IKsOhdlhvdKxM2TIPiVb6gXxT6Zc7NSMY4HQp2AZmysm
	 BUbOYiHpJY7fXnasKHqOEnWTOjATvaVD9iJdfogTL2QNtKFrQiRHuSG/w/tV/k2Icr
	 Q/LhXx1BvW7wvxEH+BFnYuDMTg7GrBgGBc8+s4Mu7BN7ifPQy/ZygoJou0ehiyodPY
	 hpD2LtHJonTU+vy53DPKAYpkUPgaQWcODWAEe/4fOjUoWKVOKDdtmh4JjOH8y8vb9X
	 TDMmch0dI8Z7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA01F60B89;
	Tue, 10 Feb 2026 22:52:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2D6A23D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFFCF409C9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNhrPSf8B4zi for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 22:52:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04104408F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04104408F7
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04104408F7
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:52:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2D708C8F455;
 Tue, 10 Feb 2026 22:52:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89CE6606BD;
 Tue, 10 Feb 2026 22:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E131F10B90957; Tue, 10 Feb 2026 23:52:01 +0100 (CET)
Date: Tue, 10 Feb 2026 23:52:01 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, tim.hammer@nav-timing.safrangroup.com, 
 nicolas.carrier@nav-timing.safrangroup.com
Message-ID: <aYu2ayHWQbTTzjb7@windsurf>
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
 <20251016-openscap-v3-1-d7b28e958f5f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-openscap-v3-1-d7b28e958f5f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770763922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XFpiNBeqDMdjgBpV4AacER6gVScw9LWJ919Kv4ZIbDI=;
 b=IR069e0xNrWkpg5mVwMWZUXN5sZPqxCAF31D9CccOcoKkn2nU6tMvpiRtAzm7E02Ar4NEF
 JCg3z1s3CMAwykZzGbqCkvyf9xfLj+Azgv9I3OyfVO9AJZWWWUwghzDm0FF0+27sz7MpcB
 J7SHOrLYNREAbBFDn2cp+qHptHgBt19zUhOHOnCj36cAVq5IJmDksrhUSuOa9QigW8KoEQ
 wXLQ51PY1+zzhvycmwlLgf/aFLc8ghpjwxOGzesuitwe2hQC7jSX2epnRFgiLTwuKDSKBD
 W0alxo5J2p0Knrzr5w274luP+flbqH2eNNNUnhAvtzxru++1y7IZkDbw9tnC6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IR069e0x
Subject: Re: [Buildroot] [PATCH v3 1/5] package/libxmlsec1: new package
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 16, 2025 at 04:46:34PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> Introduce the libxmlsec1 library package. libxmlsec implements XML
> security standards.
> =

> The library has only a few mandatory dependencies(libxml2 and libxslt
> and a crypto library).  It needs one of the following cryptographic
> libraries: OpenSSL, NSS, or Gcrypt/GNUTLS. Default to openssl for now to
> keep the package simple.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Thanks, applied, after updating to 1.3.9, since 1.3.7 was not building
here (most likely due to gcc 15.x, but I haven't really investigated
much since 1.3.9 built just fine).

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
