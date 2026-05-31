Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08349CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3CFD60F8E;
	Sun, 31 May 2026 17:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uTVTZoijIsy; Sun, 31 May 2026 17:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE57460E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247320;
	bh=MbOMUL/NlqenCGVHAQb/e4R87oB+uxJLOQ6sCo4/npg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Kcc13HBLz0VEL4HBgjLnCnCtqOU6adivAHzU6mtpvFaRsymJr3eEHn6P+KFklq3xs
	 VXFmPVDFA2ZGJMAXsxLYhHqBSDjofE1dGJoM2dWB9wJwrJ8QvgxP/gaWjzNkEauNdR
	 ISLJPZ3BYBendRduL9wbK8i46jtoC8cQ/wXA2s56ehzIDVImFs6xsXn7lboBx04eW0
	 +6I2k5JSxiqTP/iNY0DtxJEx7AE95suYLt5m94jLPc0zgHdbrMj6XzGIlEWmg/nVCk
	 CFAkj1c/b6PUPBQyU/bZoDgsO58l/ooNnRm02kPDMPQ3APVsDk2nraSR6L/TK/5QcM
	 n0Haryx7FOEow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE57460E6B;
	Sun, 31 May 2026 17:08:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E17A2AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F6E58502E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_k45GgCNqzp for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:08:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34DD48502B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34DD48502B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34DD48502B
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:08:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3FDC71A3772;
 Sun, 31 May 2026 17:08:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 14AC460230;
 Sun, 31 May 2026 17:08:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C53C510888CCD; 
 Sun, 31 May 2026 19:08:33 +0200 (CEST)
Date: Sun, 31 May 2026 19:08:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Message-ID: <ahxrA8FVmAd-k0Vw@windsurf>
References: <20260531160251.2333017-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531160251.2333017-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780247314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=kdpCkvDGy1MraGgtuma5ox2YLbEuYmKDsxAVg3GhC+E=;
 b=VAT74V73aHHVhzx6Tm/8tJGhPe7VFkRuI16MkHkLgmhBoa7A5PFYjHhuuH0mnLelQOR35Q
 0wK4M7fTzyD/wD+WzOOCKhEA2FEX3SIV8aXADAsV8o0bNyC+hUpnsmguvhT506/USAv6kB
 IL4NrxkSHUDAkDTShvlJgobnqu3lZaowHWHr0wkxT3UZrdenI/2V0KbduLEGJ+Hvi6yB5v
 P50XjaDLdHNGIXTUUUEOVJTsmoUki7MUgywwCRvtB0tuc+hq1VAC4xOXgLWbAT730H2xIX
 xFHJL2caejlNGoLZGt068pXSOJEl+jNiOAsuReH5adDK7L6Pd2yV6zf6ACB8NA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VAT74V73
Subject: Re: [Buildroot] [PATCH 1/1] package/libpthsem: update project URL
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

On Sun, May 31, 2026 at 06:02:51PM +0200, Bernd Kuhls wrote:
> The previous site went offline, the last entry dates back to April 2026:
> https://web.archive.org/web/20260401000000*/http://www.auto.tuwien.ac.at/~mkoegler/pth/
> 
> Update _SITE to the bcusdk project which depends on libpthsem and stores
> the original tarball. Update project URL to github mirror provided by the
> linknx project which also depends on libpthsem.
> 
> Fixes download error:
> 
> ERROR: while checking hashes from package/libpthsem/libpthsem.hash
> ERROR: pthsem_2.0.8.tar.gz has wrong sha256 hash:
> ERROR: expected: 4024cafdd5d4bce2b1778a6be5491222c3f6e7ef1e43971264c451c0012c5c01
> ERROR: got     : 01d9027268f27aab3ca5c6c649a7f7a444db5bc889e496d80c8704e4e120346e
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Fixes:
> https://autobuild.buildroot.net/results/0d9/0d9e957540d15302ac55bc5a2207db0c45279b37/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
