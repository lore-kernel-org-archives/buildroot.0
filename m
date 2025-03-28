Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7F2C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5DBE6FA23;
	Fri, 28 Mar 2025 18:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQZxLw9B1Vu6; Fri, 28 Mar 2025 18:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F6547071D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6547071D;
	Fri, 28 Mar 2025 18:55:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D6D81B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ECB684DE1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NV0oqhxYEOyT for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAB2884DA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAB2884DA4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAB2884DA4
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:55:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AB9A113F879;
 Fri, 28 Mar 2025 19:55:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47098])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Mar 2025 19:55:43 +0100
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 19:55:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250326222350.1329230-1-thomas.petazzoni@bootlin.com>
References: <20250326222350.1329230-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ab10a9ffb7bdac333d737ecab877a382@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743188144;
 bh=+iHRcTVhn+jm9uIkB2mDuW9irI3sNa2FVOwIfONcUcQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ibN/YoBwxju478jH6lDqXR12pcYOE/nk6kCqPUxe4tPD0DlIP7LE+I+BODEe9sX5I
 +VWq4Y3XCwbSYkrakBWYP6NgVRPad0oeauV4z2/VJxqIr60VhB2d0eJLFa2yUurZKs
 +95Y+U/CyugaFLVBxDLSBbWmk6G3mjVb7xbmkWKhZej6jH80/TfxJm0y3pM/s7vrYG
 ujQTIDn2ptdbQ1QsVzAgPnWJl75Hn/kv79xeYVJnxb5fmu027q7jTlwjqTfr6qKmdi
 Or8GYM6DnQMlE/qmZnoYbaAl/m1IWoS+1aD87nozuGB7k8O+JuZRxrA0fbR2IL59Qf
 x3jc4GICY3HoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ibN/YoBw
Subject: Re: [Buildroot] [PATCH] package/gdb: bump 16.x series to 16.2
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

On 26/03/2025 23:23, Thomas Petazzoni via buildroot wrote:
> This is a corrective release over GDB 16.1, fixing the following 
> issues:
> 
>     PR build/32578 (cannot build GDB 16.1 out of tree when calling the 
> configure script with a relative path)
>     PR tui/32592 ([gdb/tui] internal error in 
> tui-winsource.c:340:refresh_window)
>     PR remote/32593 (Incompatibilities between GDB's and LLDB's 'x' 
> packet implementation)
>     PR build/32610 (Missing #include file in darwin_nat.c)
> 
> None of which is really super important for Buildroot, but at least
> we're using the latest without wondering why we're not.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
