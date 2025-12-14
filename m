Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D9CD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 13:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BD2813C9;
	Sun, 14 Dec 2025 13:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFZTrTu48E3V; Sun, 14 Dec 2025 13:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 060BF813AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765717348;
	bh=Zq1I/MEYcrt3l0UDLwM2pjAoPXP6KQLNxj0f3+X35dc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pewt5imtNv+M87ZLlhgl2lupcXkJPkPu+QqPocSag2rZ6mBk/xoyaVBsbgxN2Uz2U
	 WIyh7kA/ANQvEZMSrSYU/2zASmpsGPKhQACIsB9h41l+lYHycn5qzm7qcuaHjtp+O8
	 EF+xA4r6QE1s3DVlfoEglCGWxHB06reB7v2JuR/KD9ZtJDr5oSh3JKdbGyqjL7p9D6
	 P0bFfCjHF11T7wrujzGQ3KOKDSHS9lewg9nJ/yup6LeDqGwREIjMpGHviDQoBSW1PR
	 iclcB3Tk+jUA1lN6GiQYSy61X1mK9csou4NvH6sDzX8qGTuwdaVjRAVeBr8OR0ppAR
	 /5tXfgQ9iMZwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 060BF813AC;
	Sun, 14 Dec 2025 13:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 446082D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 13:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29D6F402DD
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 13:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpF3WiA-LHKg for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 13:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 921E9400C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 921E9400C0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 921E9400C0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 13:02:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 313415FFB1;
 Sun, 14 Dec 2025 14:02:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Dec 2025 14:02:17 +0100
MIME-Version: 1.0
Date: Sun, 14 Dec 2025 14:02:17 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Qais Yousef <qais.yousef@arm.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251213224541.1760321-1-bernd@kuhls.net>
References: <20251213224541.1760321-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6a2cd6fba4e8535bb8d00f5c253345ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765717341;
 bh=IGiuTC/2Xa3UM5OgbnhD+eyXYzqQbGjxpJPYW37nTT8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NKs9RpRJ+Tm61o3LHBWygt9izpY3m+lrfiIigEao6+pviGTm0QcCoU+fTl/ycirCq
 mLLWeXEgLxj3BljcN4hCWJ/J/r7M0XYzYE1q8VO+HeLxRV4Ytdb3h85vW6jg/TB8WG
 8rekvPDsYvdnI759D2UPCXd1iCc5yy/ZUScphzus1gS722HFWW1yw5allgPS7d/Wnh
 zB/TYnwOUgsb04qU9gzo4JYS1ecwzYG+m1d2sRuwMwVW3KsztnfJK2JOytiD7Qw4tn
 bRkVQoVNUKX8pBvZnFWn7EzJ9SZNl/psExtYSoeiimMb1EDXatxfG1fz+ruadoh0ID
 Y1pE/mXdeFyJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NKs9RpRJ
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftrace: bump version to 0.24.2
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

On 13/12/2025 23:45, Bernd Kuhls wrote:
> https://github.com/bpftrace/bpftrace/blob/v0.24.2/CHANGELOG.md
> 
> Version 0.24.0 contains: "Add support for LLVM 21"
> 
> Buildroot commit d6a7c0226333138721ae722b89e31a82cfb22ae0 bumped llvm 
> to
> the 21 series causing a build error with bpftrace:
> 
> CMake Error at CMakeLists.txt:168 (message):
>   Unsupported LLVM version found via
>   
> /home/autobuild/autobuild/instance-14/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include:
>   21
> 
> CMake Error at CMakeLists.txt:169 (message):
>   Only versions between 16 and 20 are supported
> 
> Fixes:
> https://autobuild.buildroot.net/results/2bf/2bf26b4848796ab031ab0767b97aba63a35f1184/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
