Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956F7E8FDD0
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6602C40674;
	Sat, 27 Dec 2025 11:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5Vo8tLtOwkZ; Sat, 27 Dec 2025 11:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90A640631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766833826;
	bh=9QO0AzqN/tJeFJJi6yf3Un4hw+tLB6Lysl8fubi42Qs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cb23QlVZqh8Abnq36MGnYps+w2QNSYPIjjfPp/A1NnQpgGvYSOYjrNGQ+c2V4+qm8
	 JHMhydDdgQiDjT4S5gKEoF4bKwLE/km3fnOEWgo/ojaI6QgrRS8xUXi0q4Guwh1lm3
	 t1iFYhzZunCiGQzN4cDdS7++UgIw4VK/wyS7duwuyDPIYCaz7wBfmuoFBV6k2/5vw9
	 w8BD3YNpqRGJOxP6zhqOg6DWAzcGoOHSfRywSMTyOMm11Xo27YSie7Z5YfjdyGtk3w
	 87ke8NOnHvvxhp1r1Poyf1TM4Cml73etbR5bcbucypH89/iu7ogA7FzQ2PJuLCGlga
	 k3Vl1aCD0Km+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90A640631;
	Sat, 27 Dec 2025 11:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1D73EC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D884380CB7
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vx9jxighoOtx for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22D5880CAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D5880CAA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22D5880CAA
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:10:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 15B97780383;
 Sat, 27 Dec 2025 12:10:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 12:10:21 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 12:10:21 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251216093447.1377743-1-thomas.petazzoni@bootlin.com>
References: <20251216093447.1377743-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <9468113e1283b07013e6ba39f05aab21@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766833823;
 bh=wOs8xgirvsaQhduLEIh/8EgtFJxdnlrUZsMK4+axvDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UzciiCwS2RG5qTMQwxEq9tw+dgj45WjhX37o8lkeHV9Ox6+bvzT99tSDAat60hc6Q
 TiXyDpRXhUllo04pOESu95R7sfa6t2Du27TPKYi+ctrVb6C5OgLrVvtrEiTgXu2ybY
 OpoH2Opd2nwLk3IDJ8bkMjwu7w8isb3W6AKs//CxrptSM2zrVAg2Oi3WvDPoEg7QNf
 Y7rcpQxmWdQ2t4GDQjmf0XbLzSNQC7J1pkl5geG7zBUjNsZO7+uyvoyHoPmQP9l8tu
 WITicHWQ1BTfzwpAX0gxkkRgG49RaKxRbNyTLXbGbYh8vWeScsJ0/t+7WW6ujEutrt
 Icifc5OyzHC0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UzciiCwS
Subject: Re: [Buildroot] [PATCH] package/musepack: fix build with CMake 4
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

On 16/12/2025 10:34, Thomas Petazzoni via buildroot wrote:
> No autobuilder issues, as this problem was hidden by the libcuefile
> CMake 4 build issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> I would also be totally OK by dropping this package related to
> libcuefile, and similarly unmaintained.

Since you wrote the patch to fix the issue, I applied it to master.
We will remove it in the next cleanup of unmaintained packages.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
