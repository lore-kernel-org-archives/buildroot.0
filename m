Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38488FC9EF5
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE78B841C4;
	Sat,  7 Mar 2026 10:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYVcCCgpEjUw; Sat,  7 Mar 2026 10:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B49841A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772880565;
	bh=UUaGXPGEr3FJgBUZ3KFfHIF5EieDSHbtwGI0BIQ7BSE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nkt/db6R+wjBU+zRYsHX+dPW+X+Bbv8PEeTy5M292xOL0vLw8BK8HwOAfLf1QxRm1
	 Dy87PsypIbXffLb8r28HBTjdZtSMWnf+n4+4pLFf0HaQJkhJEbqJk+ksbx5BefCGbP
	 x0e8D+f7EuTcpH2cMilsFuU0z14K3sZNh/CyrEGNEvefUP2qZ4cogd1uL7qiGsruoo
	 xNAxfRobFlKQHnIFtMEBJLqDWo4RFI6XnUTmnNrpUkDO07jTxONR0yDXrdvjv2odT4
	 v8DcZjzsI0AQ86mw5+hFU1cQIQyd0sE7NzJ7xnXTnnsolkNDyjcr8H5llFmfg/yTdq
	 WASBPaC9GuuHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B49841A7;
	Sat,  7 Mar 2026 10:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2EF725B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D89A9610E8
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXf4LCFky5UJ for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E63EF60FB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63EF60FB5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E63EF60FB5
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:49:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0CDE078050C;
 Sat,  7 Mar 2026 11:49:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 11:49:18 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 11:49:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260307093629.22188-1-bernd@kuhls.net>
References: <20260307093629.22188-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <377fd793d5ada02b67ac1bd9d9af6596@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772880560;
 bh=11qWCcBUHTXI9yycHaKr39xS2yf9xCk9RrjzRqJxjNI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lgAJJ1JT31lAZl7qvV4VkIpQLeWfjD5yxOPU7KbvxuhfuNUQLgEnxoYx2nSeIjUrQ
 vJZtyqPUdgRUNEZ6VAFTNHUyKA4Swn//+EYp5VpxN/7AtNAWQ89PQcbinHPFmj/4ix
 /BvhMCzHJ0EsxIaw/l8dn5VadCiPFkdYW50msS1Tn7CfcJyQ6HwVw+ieZ2rLdVnoQ0
 3QccxT+X+8c6CLzgGyM3HKM/VTDJQ7SvwSoLYOhaCq2lT43NAxk5paU/LFsCWhhnOK
 wSDK+2ue/ov7lBRESGaD50Zr0N1jygph8K7qqYejVOhpkmR35bDh4hBHsx0h9UIeYp
 FJfzeNOp7MBNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lgAJJ1JT
Subject: Re: [Buildroot] [PATCH v2 1/1] package/docker: Fix build with
 gcc-15.x
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

On 07/03/2026 10:36, Bernd Kuhls wrote:
> Add patch from Debian to fix build error with gcc-15.x
> 
> Fixes:
> https://autobuild.buildroot.net/results/495/4956555fd033d43c1877e66141789bcd06aff5be/
> 
> Patch sent to fork which is used by Arch Linux:
> https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wmdocker
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
