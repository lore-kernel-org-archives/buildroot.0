Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7B5CD5BAC
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 19:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F49743AB1;
	Fri, 22 May 2026 19:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlbjiXD8d08T; Fri, 22 May 2026 19:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4294742C0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779477817;
	bh=CGFUZlF+FpD0HFtJhOsX+rq6F+v3zsnAJ7fCcvrIv9w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LnPfxltgJ2iBdtajnh0Fo3f76k3pE/8a+1DUc+oKkalw2Yu5Mtkmw3WtQ0k9GEu0P
	 d/IZcq0vB+OoRWWJw5WOSlbBXPZDqzczIEleuC9kHtWmpAPLTm4gDlRLO2J0hBtK9j
	 6mLeFO34OVkfIEhGl8MF4EhW1hBE1CcBOwZlSTyEUN907Iy8ZBN804XyqIMOeGbIAG
	 semDWMlSz0ywApayUGMiHCgMq732mRheYYtdi0Sm92aBC0RIsGPa9vVGedcxah8ID5
	 jtIpBKcFWzqez3poeSiQJnsms4RYlo2aoScDtKL7Z1Qdn3XHiXyqqXpWRba8VoBCcM
	 VQDB3kZI2v9GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4294742C0B;
	Fri, 22 May 2026 19:23:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CEF6282
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 523EA816FF
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bf0bniXLh-dc for <buildroot@buildroot.org>;
 Fri, 22 May 2026 19:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A675853F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A675853F5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A675853F5
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:23:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7988360129;
 Fri, 22 May 2026 21:23:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 May 2026 21:23:30 +0200
MIME-Version: 1.0
Date: Fri, 22 May 2026 21:23:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260520170051.1119985-1-bernd@kuhls.net>
References: <20260520170051.1119985-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <c2cba336867a8e1e3502bc7dbb13b846@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779477811;
 bh=yeRj98lK8QiwRzwFUmX88OrqdMajMxvc7TbEjazVsPg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KsOU34nk4Tog3DeD422x0/hgRw/pdsnfN0fYKlVL3RkcOrJKcXmheAYVk90jDQVLK
 NmmqK9g9Ejz8t5AtUauDAFJAw+TqX95mgAsPjv3n/XF5m+Ms6YR10KW/2k2+4oYRj3
 t7/nogt1ikMSt/qRT1OneYmQ0wM9Y394Ye9x4EzJycfQ0Z2Y4UHglgCEKqusbfTeQv
 ke08YQkjG2GlCnC5qNgiicqASpVmmEuloo3IanaE7eHcXkA1/NDdNwy8udbr0k/0b+
 D0o8taPvNKvIKlSkwEAZxklDGGuSxDyXL5A0VpxZ1efBpHPB41WLenUc2CVU7dDGKA
 XrL3jZn+iNMJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KsOU34nk
Subject: Re: [Buildroot] [PATCH/next 1/2] package/linux-firmware: bump
 version to 20260519
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

On 20/05/2026 19:00, Bernd Kuhls wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
