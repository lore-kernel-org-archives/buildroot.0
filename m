Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C7CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 12:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5E780A7A;
	Mon,  5 Oct 2026 12:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRi09LEyGzZT; Mon,  5 Oct 2026 12:14:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F214780B86
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791202469;
	b=O98KPQ8+n0Da70O/XVzn2PsF44bD57azJTvQlCePGScELMcrgxedpzy4tMIVz8lf9avI
	 Lemgn9XTNSQnePevC4qoxGNImNte8Fd0HStzplz5UbUE4PaJ6XnkURHr9mb5Fuy+xmYrc
	 c2K4iR+YKfI0CPRqlwBNgtScEGVo141wAGXl0M1JHkVO/+ZvkNAwMsn552xLwyXUcoo3U
	 +Bxv4CpcNbe/GHdJQ8ZC7fqmhfox1YVjKftEL7kyzjgAk+qiBQTBVOp4Ny8T9pnVuQp3V
	 ETWPlpiWCNdz06XvZxDz8uXTR+QZwlOjlp7Kw25NFOsp3MrOUahlwXXopuYIHefqI1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791202469;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tggtCIThaCLknim0OiTxkw+fSgV9Elgs579kvnXaT7w=;
	b=JWcp/c0R3LK6q/TNIJ0EA5Bda1xQ+WzlRS0J+OVbFeOZS1rEstSSQXRd7kqPCk+3U5+k
	 Zs6nubtiX0BaIfFXy0bfSssBtRrbEKySuefkQXlzAqbwtwBV4rWHg8YfAhWYKV5k2or53
	 389Ibmq8y2xVMMaCSJfD5og7DJf6YLVTNQ4AKMeoORAbhRo8iNVLePA36C6fENkSLWjEe
	 9jYmgDqLHvv67ffqrzPWUhM6GBY7xzbxRRA5l1NsEYJDnHYnar6nsQ5po2Sri4dx6cf+b
	 0w3CN/zMNWbi10KTd+VpeKCiI4tIu1HRz0aZOK4MjUO638+rgPWCoCUL0JtLuEg7XTg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791202469;
	bh=tggtCIThaCLknim0OiTxkw+fSgV9Elgs579kvnXaT7w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dumhc7pC0BRBqCxJkotA7mWHxv0LfdGlJJMKx3ZgNangozk6QvLC38aN0UV8OQGif
	 A8+lISL6kF0FzblsnVyTHPYx2RlgNEP8v7Wrs5UfoBsM239uZG07KjnvdyLsMF38W1
	 C0dMdpaP6sijeQg/Ck2SyW6qrytxpSTVRkKkqw2uT4cy8ioUn4KegzD8yfrBwxeyNg
	 HIv2JHSjDrVZseLpDFalJD0Km5EJvPr2+B2uyE1kSvUR5PrgU4A5S6ZWa9mgChT8Kw
	 kkjbhUj+lYrPmXzL0JUG1icEiRB/BU88mEb+OB5B91qMrKWbU6FSqOIg4+fW+wO461
	 E4JLxi54V/CDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F214780B86;
	Mon,  5 Oct 2026 12:14:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E24231A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C87EF605F3
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLaB11wdiyPO for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 12:07:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2EA21605A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791202046;
 b=SLkQGsRt32bMlGZ6NXgqlZMzLYMOER1CQs4Qpqq2h/OatC1g9VZT/Ehg1/j0U+N1E/Ek
 YKGw2q9vGSSbKhIlPdQIKIsuGzdiIqAq+rLtINa8yzhrrNFDqejaCDkKFGB7w00OEoTM0
 FnepsLZWPKMjHBdvWo6TsKAJx5JuK3t+n8jScs9nihcV00xvf2HKtCVTkBeRET8hXUXg5
 qvWjb9OFYHcjQH4L3/ZgTXRYH5odet+LJnuEDJnG0FMuWGkQH2900lYyy/l+lgx7X2mit
 268dCNHTzoeppcOB79+jc+yvUK/alcK0i1gsIh9Tke8Hdnq2nx0mt9jv34Iu7YjOqgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791202046;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=2jt6fCGTCad201zTOClT93nyixj33XpqtTzPWKSF3hE=;
 b=QQL6cMalvIkSG+8dF0NXRaSosmn3OVTyvS93yT6eyt0OgPu+nlIatm3HENwFjOHmhqUW
 rU5NKwBdyF7lJwhK8pm034pCUHa8CZ41ORNkaNXP9ZQF5hIIvBqMJbmRSjueiRn3wnEnl
 1eN1N6j2FfmNN8xm1DwTICXKWLbvuV3JDbAPGmWXHthb1uvCAFkw3uk+0tuIEXj44/4MO
 65O3U9ShtTsNQ9VFBEhUgEth1rv9RiKcYw+KjyUi8nJe2h2MA0IVZfCP5AmhX4xytpk5f
 OqI93cxIGMB/WfIbzXW5fnPf57LwBizKnuA5WncogGl3vhdxWm0TE7keuyHWp+sc6XA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ZIx2ts43; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EA21605A7
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:07:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1x0YJD3lVg-00Ly0f; Mon, 05
 Oct 2026 14:07:12 +0200
Message-ID: <7f26fd28-f2ca-478d-ac73-88ca5b6a477e@gmx.de>
Date: Mon, 5 Oct 2026 14:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20261003162913.1025194-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261003162913.1025194-1-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:lGjDj6tRQmP+5CJkt2s9wAR0juH5S92dpUZ1X8mScTfYvebjylT
 D4PG9wjbitTmvAicxDcYEWAp/d3F4Ad4t3pW6kK+JXpd3C7NnSyjxpC4c0iB7T/ykLNZIHl
 qe0LMngztxlynZ7/rh597yT4c+2yeLqSJvOIkFrISDas68xJtvccwD9ByIAm0MlVF3syME4
 YSV+PDaeXk/l1YwJcX2jw==
UI-OutboundReport: notjunk:1;M01:P0:hsXtTIx4y3U=;zdTPhAKYyhbE1FXk1wfTmOba4NN
 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
 5+XLnTsK8ftHtmmfjXWtXieChgwkA=
Subject: Re: [Buildroot] [PATCH] package/libarchive: drop dependency on
 host-pkgconf
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 03.10.26 um 18:29 schrieb Thomas Petazzoni via buildroot:
> Commit 95db5707dff571c7f3485b3aa63bf5977c7bf08d bumped libarchive to
> version 3.8.1, and as part of this, dropped AUTORECONF = YES. This
> allowed to drop the host-pkgconf dependency, which was only needed due
> to AUTORECONF = YES. However, the host-pkgconf dependency removal was
> only done for the target variant of libarchive, and not for the host
> variant.
> 
> This commit aligns the host variant with the target variant from that
> perspective.
> 
> This is not tagged as a fix, as nothing was broken.
> 
> Cc: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thank you!

> ---
>   package/libarchive/libarchive.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 5b6aea3407..88dbf2a48e 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -146,8 +146,6 @@ endif
>   
>   # The only user of host-libarchive needs zlib support
>   HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
> -# needed for autoreconf
> -HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
>   HOST_LIBARCHIVE_CONF_OPTS = \
>   	--disable-bsdtar \
>   	--disable-bsdcpio \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
