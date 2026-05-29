Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F0CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A0984322;
	Fri, 29 May 2026 09:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQTHNWvydov3; Fri, 29 May 2026 09:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993A484326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047961;
	bh=jds033Yo7vm6KHnlZqhxnv+HvoIUHi14pgJ6AkmhAYs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PiHpebdAD6bW1amfFe0ybKwAwb6xy/4RImFW6GHbEiYawaJUGSk0t8tiHP1OrBG5Z
	 W7ZCfe8QL29e1ynqu/bSf8hvQ9W5D5xTjDCGITG0WKjaatiHSMrCGBYt+0/jcMklLb
	 deRBkY2f4l2ozM8SnuW+CSY8hNFpgEreVa0P80hZ9TowTeNvDA4qaP/slVbn+R8Qok
	 cc3k7pKUwrf3Jj6G4A5s9Zz7RASDxd6kq5vKwaILlMYnqYW5iODqmvnV8EmTQySYVu
	 iTd4/iNU6ek8ieRsuSQvqtVKnfc0lC5Dxz8jpS7xFz8qYTjJDYTFc6hJQILp35RtAg
	 bNNzdRIjsh0sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993A484326;
	Fri, 29 May 2026 09:46:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA3D8D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8FE984322
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grYtZ_SeZilK for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDC7983DAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC7983DAE
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDC7983DAE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 84A814E42D81
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 548FE601FA;
 Fri, 29 May 2026 09:45:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7EC3210888CBE; 
 Fri, 29 May 2026 11:45:55 +0200 (CEST)
Date: Fri, 29 May 2026 11:45:54 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <ahlfm8PQMCidZ3TT@windsurf>
References: <20260204131841.282589-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204131841.282589-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780047955; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=35tINbOqul9mZjMEJiDjmE6jrdM0fuGESHd0e0z7tVI=;
 b=bQp/IRPvagd+AbMLHu6FLL+YR3CNc6agtDaTKTyzVCZNsI5YcTDH81oDBn53KqGSyrZGD7
 wBfPc468PzzTLfBezMDy/ywSxLuu/vTL3mI0prZNRmeaK6HknL5L0XxQgE7OwCnEfj4olE
 2ZxlXsc1kYjfhK/2nI/RxVFpdIvLIbf8SHqFrfcYe27F8MRwiwZQ9g3CPYlibcKRhbT76G
 s268FMtHYa6u8hvFw4m3dy5CSJJRUABD4u8amBmhtXwEGIlRPiVKhULKdPEd/og3o7vY7e
 M3Fjyt4155seCwbz/QANZoOFIHwwRF8Ou4PoCqiNwaj9kT8sM0/NZeAOlTpVpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bQp/IRPv
Subject: Re: [Buildroot] [PATCH 1/4] package/unzip: import patches from
 Debian
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

Hello Thomas,

On Wed, Feb 04, 2026 at 02:18:30PM +0100, Thomas Perale via buildroot wrote:
> In Buildroot there are multiple way to apply patches on a package [1]
> 
> - Adding `.patch` file in the package directory.
> - Define `<pkg>_PATCH` variable with the location of the patch tar.gz.
>   It used to download Debian patches tarball.
> - Implement custom patching logic with `PRE`/`POST` patches hooks.
> 
> To make the CycloneDX SBOM generation not dependant on downloading the
> packages, the two last options have the downside of not appearing on the
> generated SBOM.
> 
> The unzip package is downloading a tarball from the Debian mirror with
> the `<pkg>_PATCH` method [2].
> 
> To improve the tracking of the patched vulnerabilities for the unzip
> package this commit import the patches previously downloaded with the
> `_PATCH` variable in the Buildroot tree.
> This allows to add the `CVE:` trailer [3] on the patches that fix
> vulnerabilities to better track which patch is fixing the vulnerability.
> 
> [1] https://buildroot.org/downloads/manual/manual.html#patch-policy
> [2] https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip/unzip_6.0-29.debian.tar.xz
> [3] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Thanks a lot, entire series applied to master.

Actually PATCH 3/4 is fixing a pretty nasty bug: we were pretending
that some of the CVEs were fixed by patches, but we were not actually
applying those patches, so the CVEs were not actually fixed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
