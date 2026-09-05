Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD2DC624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 18:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9982880F19;
	Sat,  5 Sep 2026 18:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIQzQjUbhuHQ; Sat,  5 Sep 2026 18:51:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A630480EF0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788634282;
	b=dcxO6SyaCZGTWGzcIz8SFnYbvULxelyvQNmoK61Fo81HtKyAGkFBUlTsUJ/fUORUt43z
	 hIZu3Iw99Vdy3lg2qfjiKqz+tigoIstbTo2VjI87WC2RuIdROs6HJidkB3h/A15wADgAA
	 eN+sgJV+CnquCLHK5pduxIWp8ohTcDYRSg8/pLxEWpTOaVsNJUlw1+Tpf9cy4jmQhqWYI
	 II6y/db8AZYBkTtyTVwwzKvqeDx7wd1JR/LTMuMr1iTV5C8KAFVZeMHVKBq5MDmM9ajxV
	 qvW9hsL/67q6hKb6J/EPcXFXfZZ/M1RVpV/jV79W194ImsIuQvCB4VbvvZpSvR2+fFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788634282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BE76Cj8xTFrqGT6WNO5+tZ93i1L03KhA2qJvlhDVUcg=;
	b=E5v/8IleNLrJVUsG2UyO+7MeM2uHdZyDvS9jwpdOYR2CjI+JewUU+BLzbwaJS2RpnURi
	 rJ06tN6ZjyZe+cPYlB6DNFayfOwqjum4AzbB/qVsFpoFTgSyiBzGspC46d8ZRG2Uc5dvT
	 kXIWI5NA7OICbkdKYWj17lnencaU9mNMii/+5SvBbnU5FKA8ecnFm+xoxDt2tcBNvX/0E
	 L1e5XXvgMNY8MDwzzslLxd/UwrQ4lgPtKuJ59hq0wR5x3RHOq/Rhrq459lp9ftURIaVWW
	 AzC9Q9LLPjYD4IM6M8Efkf1UfPpDbYfjlF9MeC5kxVYdM9s+sCleQOiazaALby1MCoA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788634282;
	bh=BE76Cj8xTFrqGT6WNO5+tZ93i1L03KhA2qJvlhDVUcg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iVmx0fCOQjRBqxKIBDgIgNHtvxhgckX4pgT1iBVajVikyQ0csbGwg99busYziJi6G
	 f0hWecpYyOJ7WVdsxK/OSV+SKsdt/atBchjoPHIGrYiYRCBaC4FH8OkQDSlmEaGAjh
	 UObp5xzZyxKDZq9R5QU/uiBukdZwt5/Umkdib4uCYEInbp6qPyAeoRC8qIZtiNkZm5
	 9W7igqailDucq/evq2Lm5835WWFIx/X4KvyNGYIYuDW/1S+lxZ/xJmbqf2T0dWX4O6
	 Kd2dY1UIjn+sHCCTVpJHcGvGk/u5zfTdOIw9dSPKbh+gZhgxpP0NqeRdwuTT3yndW5
	 eyMAlZnQ+NFDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A630480EF0;
	Sat,  5 Sep 2026 18:51:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E6449D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A7D80EF0
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6meiPwgLXdK for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 18:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3A6C980EE9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788634279;
 b=M6nzqSBkSeyHDYiCiZGe7ox4924HsAqlKJuN8WSft4yjdTqp7jVF9MVZn9GYEIcr7Cju
 Z96+K9npt3ocLJBkk1vnAL7FJtnF2nQDq3nB/CgHVXqqrjcvJ01VSambQpAglAGLW3uXU
 PLsi9IPokJFeGGlb4b67vx4SrtRYhp9P/I5PXQlDjl5RKvw+VAY9MI8zpB0RKHEE9rIGl
 l5B/6zP6mgIsuP6LSHdB7J81Yl8bt5yeFc2EdwdmP132Qa2l8/x1ut691u13pGto7/Gab
 Kt6MgGzoz1t9aXw+/Wt/+GIicHPqt1dyMNt979W8h+TRXBlOgc3HQmpyJIyPEzMCosg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788634279;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=M7CS6FpYuWwkNxbh2HsqlJXTtjt+9NCGwBLbnFrygwY=;
 b=b2GznddVlNjC45gQAT6wAc8Jl0ZcSVB7kODCILttb6ZdK5MboKwKX3BiVo7lV92IXo8M
 Df2w/my39NRu95nvPNrXOGen1PT38t1LC75nXkYXweIl1d+BYGNs8WgLyb7+675a9aWla
 keFjuH6eA0KQeSxnDzpYA42kGhkAPMny+zFy+Lkanfc4KL/LZWJ1yhf3qI6fQpNo5nRWs
 S5CudZB3acLc1L51e5Fcb6uWaqY1/04WkyIMtBik34QDXXBQwIIRjEDDnAw8tqRz5YLj0
 UnLxO/w52oRkl6daOavFjTJFJAUXfESmhPG+44UveiKdWORoMUIaMJ8JAaD4twGAMQQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jkhY0a51; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A6C980EE9
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:51:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BDEBD4E41537;
 Sat,  5 Sep 2026 18:51:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8B5B160233;
 Sat,  5 Sep 2026 18:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF9F911C783E9; 
 Sat,  5 Sep 2026 20:51:09 +0200 (CEST)
Date: Sat, 5 Sep 2026 20:51:09 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <apxkjfDG2NoMAlPW@windsurf>
References: <SY8P300MB0041EFD8D13BF20DAB3D61FCB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041EFD8D13BF20DAB3D61FCB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 0/3] support/scripts/gen-bootlin-toolchains:
 add missing BR2_USE_MMU dependencies
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

Hello,

On Sat, Aug 29, 2026 at 07:12:09PM +0800, Fengwei Tan wrote:

> Fengwei Tan (3):
>       toolchain/toolchain-external/toolchain-external-bootlin: drop duplicate BR2_TOOLCHAIN_HAS_THREADS selections
>       support/scripts/gen-bootlin-toolchains: add missing BR2_USE_MMU dependencies
>       support/testing, toolchain/toolchain-external/toolchain-external-bootlin: regenerate after MMU dependency update

Thanks a lot, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
