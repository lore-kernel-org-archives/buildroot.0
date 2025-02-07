Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADBCC0219E
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 22:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F353370524;
	Fri,  7 Feb 2025 22:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjAkwBxGWcvt; Fri,  7 Feb 2025 22:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 001F370538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001F370538;
	Fri,  7 Feb 2025 22:25:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7242BE4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 618F642C4F
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlpUs_X6JueX for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 22:25:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A472429A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A472429A7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A472429A7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:25:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9A5475FFB1;
 Fri,  7 Feb 2025 23:25:39 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:34518])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Feb 2025 23:25:39 +0100
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 23:25:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250207215341.2268859-1-thomas.perale@mind.be>
References: <20250207215341.2268859-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.9
Message-ID: <a27b0b9ad88eb49e045bda8ac2e2feb0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738967140;
 bh=BTSu1n9oIDZg7Ctbman4PcxuKlyZ7h608UnfDw/2cOo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kFJicRhAcH8UU/ffBntGJ22wXxN79DiSzR6cyqLT4oxYk0OxA3O4ZAut2bvOLvOzm
 RX3CkTFHDHV5RI/89B35h4vc61xNC+lu0eklcOasSZOokevQkG6AVPfHIilV/aFohN
 lnX1W0QX2Sw2YCQFjir5TpkZOen1sBUp6JxqH0uiIyeSbtXwx9f3Y/XkpgV4x77Pse
 pHX/msHuRwm8MiQTUA6tH9cFw7nNF97OyOTZBSaUpRUbWD4jfC3rz2WrOlPlUNjy95
 tTYxHhSsZVBXGzFCzKIzxMsrbAqVyy4/vBmBhB6wweCAlf9jajdNJH2uyjTylS5e63
 s8e0TI36kBYVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kFJicRhA
Subject: Re: [Buildroot] [PATCH 1/1] package/lynis: add wchar dependency
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

On 07/02/2025 22:53, Thomas Perale via buildroot wrote:
> Since the introduction of the package lynis in 48bce6ad8f autobuild
> failure for the gzip package started appearing on configuration
> without wchar support with the following error message:
> 
> vasnprintf.c:355:38: warning: implicit declaration of function 'wctomb' 
> [-Wimplicit-function-declaration]
>   355 | #   define local_wcrtomb(S, WC, PS)  wctomb ((S), (WC))
>       |                                      ^~~~~~
> 
> This error happens when building gzip without BR2_USE_WCHAR dependency.
> The gzip package already depends on BR2_USE_WCHAR, this patch also 
> apply
> this dependency to the lynis package.
> 
> Fixes:
> https://autobuild.buildroot.org/results/fbf/fbf31c8c09496cd3fe02e8ed55939dad5c1cbaec
> https://autobuild.buildroot.org/results/560/56083310acedba31dccc1f6594f814347bf21caf
> https://autobuild.buildroot.org/results/1d9/1d97e3f0c626421fdae45e794f02c560d1b9080c
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
