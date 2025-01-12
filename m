Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C11E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73439408E3;
	Sun, 12 Jan 2025 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1AMhj86AywR; Sun, 12 Jan 2025 11:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC3E408E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC3E408E6;
	Sun, 12 Jan 2025 11:15:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BF2968
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 592F160B24
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gABtUqPg8rf for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A90D460A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90D460A5B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A90D460A5B
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:15:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E5C9BB0051B;
 Sun, 12 Jan 2025 12:15:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:15:00 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:15:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111171222.2906306-1-james.hilliard1@gmail.com>
References: <20250111171222.2906306-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4370f5a4c35dea908fb79b29b8d0eca0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680502;
 bh=1R+VOut3jN38MjMUccuprovKkeL3EQ3Roo8Tc1AWZNY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SoxJcyri8IT2XVmdm9l0p36IY+VsxwbTJKRxUH6XHlW+wwBeKc2zereql5NcPDeTm
 xwGXb+n4hOU3UTa6E6POei8+AeNzV/yPvtMBxmY0V6XLUCB8c+zzUJCvaOJ8GuKA/Y
 Im3dfpCIzS54T3Qteq5X4bYpVjD7VPTv7UbzOlYLtMpMkNm2HyJigmYRHNAhpd9Ef2
 aVib3g0o4fbh7+fBhi+6zS54swuwhnOyeRyNjLG5oJDWZrpWvX6GfbysiRv1sirwTP
 NjjtcDjHZcFCv5ACi1XdJ20ojiRV5c3oUA4+x1P7WmTQX+x1Zmg1bVbza6CxJWCfj9
 GvO/8Mz+0+oGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SoxJcyri
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 2.2.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 18:12, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
