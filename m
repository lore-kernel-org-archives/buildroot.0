Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49223C4167B
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 09:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5F864F508;
	Mon, 30 Oct 2023 09:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5F864F508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoRSLRDjHxgY; Mon, 30 Oct 2023 09:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A21744F515;
	Mon, 30 Oct 2023 09:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A21744F515
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C349F1BF37A
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BF9885467
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BF9885467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLY344fQWB6y for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 09:11:52 +0000 (UTC)
X-Greylist: delayed 319 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 30 Oct 2023 09:11:50 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E68E85119
Received: from mail.cock.li (mail.cock.li [37.120.193.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E68E85119
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 09:11:49 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 30 Oct 2023 09:06:25 +0000
From: robertbarnes@airmail.cc
To: buildroot@buildroot.org
Message-ID: <1fd098d8770a499f7151d7ca25a541b1@airmail.cc>
X-Sender: robertbarnes@airmail.cc
User-Agent: Roundcube Webmail/1.3.17
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=airmail.cc; s=mail; 
 t=1698656785; bh=5jkyJC2qFYUUEu4gQKekQlVU/TYufZ5DSFVpjA6ayHo=;
 h=Date:From:To:Subject:From;
 b=p4Bw6mihe2aofrCnDjnAtZEhorPP+Tcoy3UR/tA4RzdJ8iBcXuplbEyUr1h+95Mdx
 s6s4SOoXsRSuFbyKVZ74wQ4n68y3cwDf6MCrHO0d2SXDtVnkjj0HmmARCC4K0m6f+m
 kdPjP+XhZLZMYnGMpM37VoVBAfMYuv5eY2Au7qiNBCcBkNQpbZMSyIDcQJASZqrAlY
 1rCwTG9+bCg+QefacpxF2SHG8O56RvJ2sjRHfu14ms1Tk7DXdvKC+l1LJkt3w3KfV3
 YDi9H+BmThwzku0Xyj5OpWlLFYlPcNyL48p0UEoVhcnqE28xvvRAxRwAXFOQKU21wV
 y9U9vQ2HVsDsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc
 header.a=rsa-sha256 header.s=mail header.b=p4Bw6mih
Subject: [Buildroot] Enable -fPIC for static toolchain libs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hello,

I am trying to enable -fPIC when building the static libs for the 
buildroot toolchain (BR2_STATIC_LIBS=y).
I need the static libs to be built with PIC in order to use them when 
building dynamic libraries (.so's) that uses these static libs.

How can I enable all static libs to be compiled with -fPIC?
Can I use some global CFLAG/CXXFLAG-override?

I understand that this is not very common, so hacks are welcome.

For example, there is a config parameter in: Toolchain -> "Additional 
gcc options" - can I use this parameter to force the buildroot toolchain 
to always use -fPIC?

Please speak up if you have done this yourself, or if you know, or think 
you know of a solution.

I am currently using the LTS (2018.08) version but I can make a switch 
if it is needed.

Best,
Robert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
