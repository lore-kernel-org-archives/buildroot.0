Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A25EC55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB7E80EB3;
	Sat,  8 Aug 2026 14:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tURuq3cTXyYT; Sat,  8 Aug 2026 14:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D02B80EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786198646;
	bh=KagacLsEo+DmoZNcyEdNA4+8M2bUFZUS2VIMRvYfuIQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qwIRgBbbWtHrYHGzr+R7wk13qnEgKfQJzp10VFsyYikzQcHUb3tdhhJtEON9fV/qT
	 IVYOdhFhy7gloOflidlKSew+w/+Zc2lD2YBLqCuD7+3sRM6tvNmsCKIXXuBRcHw2mg
	 2seRAMDXAMRR/U+G9HQXhktqgCTNrPEnL0gOHwTfDZojCKWfUtJtxC/sHN8l8u8Gsi
	 oXbDOxk1skKAt57uPpapYI2CA7bRBHqggn8YZQqgjswJWMD8/vbhP4iE1YdnjqWTcJ
	 MPiPycJc211O3hCnj6iEBmxUkO8TYDCgXkGZXcIMeDXlLGfNtl+0uhQe1R+r0JPus/
	 C0icb5muGhv4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D02B80EA3;
	Sat,  8 Aug 2026 14:17:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D393710E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B999F4060C
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rr0E0jXwIvLf for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ED0540609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED0540609
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ED0540609
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:17:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2B3CB6012D;
 Sat,  8 Aug 2026 16:17:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 16:17:19 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 16:17:19 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260808101348.924397-1-thomas.petazzoni@bootlin.com>
References: <20260808101348.924397-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <b06f001f6112c28732f6885291d1c1fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786198641;
 bh=y/xaFPUHqN+wXOvFaqyX9DnkvLxRlrVFuxBjm87LeJo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ntcTUNcrf41IHVK9AVz0VvmT75F5w6JK30bBXJM/5XYlIlBqWvqbyjRBVK+TGm0Kj
 NkpVBSzkinJIDcRXSgq7Alpjg4QUqQSHrB5nTEBvTjuZgFMDCxrrgCgrxGbP4xubkg
 ByrZrBF9vs3tV8Z3eCrL7wp00LCPGOK3ZSkmfswdlDG8x6YnQHWtpLDFJR9NkJkxeu
 ELB/3CkgXPjfi7bxHjbZ0CJazA6o948302s+cjQ36Jc/M+mA14TrSs0rPic6KCgkAa
 R0UAlL3JzqhtSin3zLey7Qb8BCF5QKDgofVJ5MykI7Uqya9yRnvDbzjIcsrLokJIRL
 SJBph6dutCIXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ntcTUNcr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pyudev: depend on
 libudev instead of udev
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

On 08/08/2026 12:13, Thomas Petazzoni via buildroot wrote:
> Commit 3f24135c56f6aa8f0524307b7339512fecfa6f92 ("package/libinput:
> only needs libudev, not udev daemon") changed libinput to depend on
> libudev instead of udev.
> 
> However, BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS selects
> BR2_PACKAGE_PYTHON_PYUDEV, which depends on udev, causing a broken
> dependency chain:
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_PYTHON_PYUDEV
>   Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HAS_UDEV [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS [=y] && BR2_PACKAGE_LIBINPUT [=y] 
> && BR2_PACKAGE_PYTHON3 [=y]
> 
> Turns out that after experimenting, the majority of the pyudev
> functionality works fine with just libudev. Only pyudev.udev_version()
> has been detected as not working as it calls into udevadm. But the
> actual features to enumerate devices and get their characteristics
> just fine.
> 
> So, to fix the issue, we change the dependency of python-pyudev to
> just libudev instead of udev.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
