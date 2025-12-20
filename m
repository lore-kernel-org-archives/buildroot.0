Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE956E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA3A60E20;
	Sat, 20 Dec 2025 21:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FhLwgeaNMac; Sat, 20 Dec 2025 21:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D00060E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266791;
	bh=ndThoX3KbU7dAerP0ZRlTLiAAZK1HnbocctCTDd6IeE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUgC2Jsxj7f8Qt+L5Tqk89gwoLck07LG+qmJVFh8Pt2UD7EEteR8BHwwQYLWhJcg9
	 JKsubvBtxJgxtRyscmMORBmMNGr7H1GggprsD5lKypg3tRvfjlZrmmHX2ZlYJlNDqb
	 hWUR7QeGGUZURIwTY/vfyXWb+QDjmyqFmxzLZKSjrGGfKninaws3B8uTP98Kp5RqTS
	 eHCqfLWRCMbT4ZUvBlYpk82HRk/l2IxezsL2s5e3cHuB8Rde1CNCZKgrglFKlvh4Ws
	 ArgrCTT1J70pPxNES+A5+8d1mFwpFspHnxIESkc5T8jMlV/kwCR9hQlZaC+dIe8Uhc
	 Fq634W0G/WOTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D00060E0F;
	Sat, 20 Dec 2025 21:39:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0184119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6A02406D5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apleM-9oYqfZ for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:39:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC256405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC256405A3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC256405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9088178032A;
 Sat, 20 Dec 2025 22:39:44 +0100 (CET)
Received: from [37.167.203.127:60856] via [37.167.203.127] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 22:39:44 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 22:39:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251213115809.1277255-1-bernd@kuhls.net>
References: <20251213115809.1277255-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <2763074bdafdd9f63d81e787bf765bcc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766266786;
 bh=9nY//O927OglJaPT6JOzj1RPdfUl5y0lXrykjlJsZm0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KVpnQfA7kEs55MN+4d7H//YN6IOf28iGhrLiepemqeIJoC0Zg2aI5esh6cP+wLWYX
 RZ5UHPxnCirrGczdUOxqJBZvm5lGgy0BMkcKSvO6hKqK+bRoTr8fnrEINcPBwccckq
 g97U/ZkogSHTMoLe8nLnt9Rd7ruonqPWegEkkQLBJiJGYztpagdmsGshRmBcr51LFo
 /r/wvencuVnmpIkr541zZtbVOPQuXRTXRjF+YwyrE2bT5OW+BMMN6DVPXmHnHRxBwO
 DDQWnsQsXmXAq1dquxKWdbME2noZH9gCQQSqNJrpreAi3zW3Gjj+2lj51H5CYXnH+K
 HTJ5gAQhJjt2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KVpnQfA7
Subject: Re: [Buildroot] [PATCH 1/3] package/spirv-llvm-translator: bump
 version to 21.1.3
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

On 13/12/2025 12:58, Bernd Kuhls wrote:
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.3
> 
> Switched version number format according to 'git describe'result:
> 
> $ git describe --tags --match 'v21*' --abbrev=40 llvm_release_210
> v21.1.3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
