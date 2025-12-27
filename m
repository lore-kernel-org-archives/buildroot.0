Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA70E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B86607AF;
	Sat, 27 Dec 2025 11:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsB0Wf8v-Rq1; Sat, 27 Dec 2025 11:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A15C6078A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766835503;
	bh=vhY5T188JI0G9LBOl5owQuQ10/++dX5u960HcvOQZ1c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jDdFeck51yQ7wcUGa89RjUC/w+GD8VVG/p9W6gQzTIy40IVSiFicQNZA6adXfjWPr
	 qCISJPR7VyMYUwkkZOCAh87c/HFv6mYfVH88DV+Ww0ulUKqxzVkXk8CXea42MfnQVX
	 Ebz8moPHVfj2mldYdo/htFUTOOGseuQALqioYapJY69mSnIKwKF0OXwR1juyeOMzGN
	 ZOeJ/3Ne1Tl+JbPxoASQuVXpyMZFrEUHsJqDGkt1QTBa8KBSoNC8j01YZLa8HRZxag
	 XtxQOIc1SQhKB3THmPgCeh92390q+Tzx6MvoZ9O7/xSN8x0/awbzpJkMeDRdvqBrVn
	 uCIA98lsxDeXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A15C6078A;
	Sat, 27 Dec 2025 11:38:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4A5EEC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBBB680E14
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiDaevXNeq1a for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B845780E0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B845780E0F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B845780E0F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E6502B0054E;
 Sat, 27 Dec 2025 12:38:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 12:38:17 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 12:38:17 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
References: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <ab718d3b7c1aee24e2cf7a78636a1c6b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766835499;
 bh=sb0DZ30tEuPRN6U6H/WWNnWAkezKyObDGEfJmtQd+rI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=selcLMrW7toobWzy5galHnXpMks+/+xsEJEuVqkYSw15ND26pzX/4MPNzEV5y448U
 jV6/vs8WNQ5TlowZdPZLbC55uQxeTKue1rZnr9Oa4cBJfYFJbp8qcQOuV8EnSQzpFn
 LiPzzOEtr2z/njRPcUn2hi01IqeyazfqTJbCjQdT/VNlo/a4LxuMWYAuft3+aFXxyI
 UVEF+qyrs9JN05EqRKVt0fOIisA4gITpgFfswsN9pFhmEVf3WdE/m13rHvkeVXcdJE
 VqA09OIg5q+2TpQGUcz7zmRUYEhaFP2D8FEAQ4r9ukTRJPyfCu9j+jgkC/8ODI913P
 dtVxb7wYn00UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=selcLMrW
Subject: Re: [Buildroot] [PATCH 1/3] package/cppcms: add patch to fix build
 with CMake 4
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

On 17/12/2025 23:25, Thomas Petazzoni via buildroot wrote:
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/5f0a3a525866519ee12acb9997d217b4a8b870fe/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
