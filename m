Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C180CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C7660F02;
	Sun, 31 May 2026 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlHOwqMFNs4c; Sun, 31 May 2026 14:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 153A360D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780236342;
	bh=xgCU9m3S9LCjiSuW4r6k8mK6YXb7eV4Y9qz9QWwFGzA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hLVPCREsUyLoppsAJsKQXHAZPxG57RklwcfWDnNA2cjmLt6Z77wMqJa9YCc1Qtgt0
	 aHXcJBtw8AfhIQ5tfmwD7nkoDzVBcPjeoeqolr9Jxu+E+MoC4l+XQbaZARP5Lm9F+d
	 SduLmdpIN6Y8PyWYusyxLBJp+wD1q2i3OjkIbXYHnoU/6gWjQbsp4tGwdUezkiOhai
	 Bh/GSRVXKzyF476efVZ7gaf4siLOoBZZvGMv3v8b08iDRSR47Tc/5YcZLbfW6dmgtU
	 nLDfNxKjVAxkZk+mOIiW9AwEoAbQ02ClUQgt6vHjE3tvbggOmFaLg9CoXqeqAYxaLO
	 nBHTu1IU7z1xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 153A360D7A;
	Sun, 31 May 2026 14:05:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75A91257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66EA4822D0
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWB4TW143kcS for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AF8280EE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF8280EE8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AF8280EE8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:05:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AB0E719F733;
 Sun, 31 May 2026 16:05:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 31 May 2026 16:05:35 +0200
MIME-Version: 1.0
Date: Sun, 31 May 2026 16:05:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260531062103.7093-1-bernd@kuhls.net>
References: <20260531062103.7093-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <46b1fa60a9374220acf6072ecbea5cc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780236337;
 bh=qTatNNRZjJZId1iPGqiCPwQ6lh85CEDOLbaY5QB4ypc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OdREMJATU0BF3P5VO8qHblL2Y7sFfuBr++oRJrCyZZeq+uisXRvgSqmT0e9x99A5z
 wP5tgs9fyiojoxYw+gu/ZkSvdKVW3T/whnnhQigz7LkuwtrA+LHO87OpNOJHQvyLI5
 12DirfBKGi0YQqi2qSn1i1EukZlAswUEF9vZ0aFKJI1SatprKzUYTBvI8H+ywbCzRo
 4COc6Ku6YLuQWQFI8csMc8f9aUZJSb206F9xy8ZXjM+uk8dePLUGGAibUCRvmYUae8
 w22LTwX7f3HmS61Op0f3ztRzLUfH32gyyoJELn41BdmDuwTsxazv2kJYn6ec660RTi
 vApLdLdXjOVSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OdREMJAT
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/lensfun: bump version
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

On 31/05/2026 08:21, Bernd Kuhls wrote:
> Last release dates back to Jul 2023 with >3000 commits since then:
> https://github.com/lensfun/lensfun/issues/2634
> 
> Removed patch which is included in this version.
> 
> Renamed CMake option PYTHON to INSTALL_PYTHON_MODULE:
> Upstream renamed PYTHON to PYTHONINTERP_FOUND with commit
> https://github.com/lensfun/lensfun/commit/824b9d36c13f97b415a94d271e35c815ea576b21
> and later guarded the python code with a new CMake option
> INSTALL_PYTHON_MODULE which we now use.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
