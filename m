Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505A6C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A5F405CC;
	Sun, 13 Sep 2026 08:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxSd0pKYdhcy; Sun, 13 Sep 2026 08:15:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2BCA7405CD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789287339;
	b=rYN+FyfYIKYKA7WzDkaoZAgEHtXpO+dS2WFlG1j2ET9rLzj+XbrZzOG3cPg05IVa4O3+
	 OQ/O2468jdrGqCS0+wtqARqjgRYSYEVs8ek8JFlAZA1n6xh1xzMbMIa8h4Qe6qfAcKvkH
	 1eTSghoTlYsQnEAvp1j0UYAOO28jl+J3P6RdN8xTzMnYme3gjeolnbpggy+FKq5zGKStI
	 WGhsW1xKPi7wEZI0wNcC/RRq5Qzz/WF4h4QYfubhV11KnDzh86L6pOpY3+9kUYt9VL0FZ
	 Ty9d0bCYSSqErRfoxXpakHSqZmgkTBrTBBSYtWo4wJrF81WzxapV4yylzOeqjtvPFIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789287339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=IF7YyL4l5xc/nF3Tk4fFvbAwGSwf1iPvvQrb8AsiNp4=;
	b=Hd48NIzZeLRvU3tDS3TwyaydRziu6hE2P1QR3EHlDS2etH5SbahvYPfnAlJBCdmAKerM
	 YLUhOy6gtzo/gILTqAygzvfBfifpDIJknnsRxHL2b5qiQNlpoRpf3svlvovVDi7Jp3Ylb
	 BxkKSK6bElC9C6qkrVQLrIkO4mwWpmaFVjz2lV5yzryHcx58hMWdPNxjSvMZD0djKOKnl
	 4KwRLheJFcPUHNFcvpVab43kuFBzqRRzeLuFJb/a35Njf+6FOROSVx/vslfqlduvIUWYL
	 cMxMO7ROLU4IrnPGw+v0ZsrWkKiTWW4Y3cA7NwkOJBLAZ8YOkfunfHb8KYRye60DO+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789287339;
	bh=IF7YyL4l5xc/nF3Tk4fFvbAwGSwf1iPvvQrb8AsiNp4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jAYwV63HyLheINpGLmQ/S+fwYbIfAzsaJdl2YZJ9nPG7javJrUroP4ylSOAkfcxzR
	 Ab9QBXSzjZVXdY0QvnHhXr5qxU5dR4jOfm2vul56i2MR9upFoqnx2Rg3kolOtVnD+g
	 PCmmKbIMnoN8/UX+7mz9Q2EDuMz3tRFbI/8JNBPMoKyFUlDBi5oDyC5Lf8NHkzrosu
	 vHl45AbW2oNvJ7eIwDRKUUKGSFIgPxtPAQoGHf0x0oTKtRg05ew2ILomtge1pkwhBy
	 pSfDTIcMVDnVi99r7x3xOOaVirFQ42F1Pm2lqoAM/M5sdOkGYheYT7tIWNAiX7K+OC
	 BWsHbslm6WvIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BCA7405CD;
	Sun, 13 Sep 2026 08:15:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E87EA29B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA2EA405CD
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8q0AityoJW5r for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:15:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E1389405CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789287337;
 b=WMTZ8g0/EpiSWqU5T6jyGOn8Eb+Tnm2rCBRnfBdI0oTX1Nc1J6uHuVnc7gulePUVSJYZ
 +M3WO+Fr21KI27W/qxLFxJ2KTumwUgcFo/MJ3VoDcGvPVRby/LugHZN+DLUiXSBpOzY6o
 ql3QIUBVXWLW5y57IW/rP8PsCxJZq9HCBwSw28tyrYBWXaWNLbKWidOMMmLM98qJlMno8
 KgQtn/+cdxUn0tH6Nk8c6HGyesLBkl3NWns5sNSm57E6J772hNvtr3Oa9ufBPNxLSvwKl
 pluwT1T0g6r2xSzqRYT+MtYGoLbfAmZMbAqnjrArUsKgc2ctWh7v8vEzlIHKBZjVsCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789287337;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Xi707jdpDCcS/FgpxZJI7IrwoBEfthU1WvEY5wepH4k=;
 b=LaONap3P/+Dte5bqp553u35pXEbkdoxSHrSvLzjwWgz3TQZWrLXOdEFJGhUgxOykiQ8a
 IAL/xBo/nh6pM95I9sLJQ9xX8UtVRN8Akl20C/MhDyjtBb4bc9q3MaZxVS/sAAAYfwFON
 io8RNWc55HWTyJwdJcIwgpdFs2s56EbzWTwQnh5/R0YPYu5ELCLHpUo+LKeBJll314ZvP
 erXRlLINbCQb+9nq93Y7uAFQhJa8HVhJY50ug+/XPO0rQagXdWb/qwvHCxhgG8PjEnfwE
 wiLdE5s7zZ0rJf84ExfhUNXiUrJoQT9p+fQSrJ2ED5a18EQHWAsJp/ylWQ91pkuSolg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dpGikir4; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1389405CC
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:15:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A937478034D;
 Sun, 13 Sep 2026 10:15:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 10:15:32 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 10:15:32 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>
In-Reply-To: <20260912210046.1550198-1-thomas.petazzoni@bootlin.com>
References: <20260912210046.1550198-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <a787652e42e0348fd26d4aed54c29e6d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/mpd: enable smb support on uClibc
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

On 12/09/2026 23:00, Thomas Petazzoni via buildroot wrote:
> samba4 is available on !musl, but samba support in mpd is available
> only with glibc. Turns out that samba support in mpd builds just fine
> with uClibc-ng, and that samba4 no longer needs native RPC support: it
> can use libtirpc when needed (it's handled in the samba4 package
> itself).
> 
> Tested with the following defconfig:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE=y
> BR2_PACKAGE_MPD=y
> BR2_PACKAGE_MPD_LIBSMBCLIENT=y
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
