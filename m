Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BD0CA5FE6
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 21:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8175E6065F;
	Fri,  2 Oct 2026 21:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BK92s7o60nBy; Fri,  2 Oct 2026 21:41:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A0DC360D96
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790977293;
	b=iSl77CXBKZRl/yK0xuGtZ0ClyA4jqGLxvmPgIXGkQ4udWxsg/fdSlSqk+KNmZc8o8K3h
	 7D8Oeu4cAiJHHJwuVDQrdmZAdwsiTenzK+TIISplxzqet1KwNxavnOoMLFZ0CkxIE9uAa
	 f1yG658ePOKUR+eerS5+zPNJ2YyRrtXTeuNAm9M1j6O9sYbBO9GJtrAYB7cxhAByqcnaP
	 qtGdORylvjFeHYx3YC7iQSV9AaG2Sf2kl4DaAQyUtNjlBHQZMOj51EA7TUL2Ub83axFtm
	 dmqGcO571oCWuoQg5+y9vMemn8pIfj9ozOVSOQgmffC3MXuTtv9gfojhw0U60poOtAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790977293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RYMUFdFkIg2sR2l7k4P72Az9PluUnF/yufe1bLu0bUA=;
	b=TOImHDTyLcOUVd/O2Jj9tusyg0bEwQB3GOg56NNgicTSaX2c8hnNpkXGXYwQxVfjGivQ
	 QC3warezKJ/LSfrq0I3fnaWLXb8ybjcA+8bnn8AVBscSctgwMcvyAKdIQVUE2sR0FlXI0
	 u4Lc7Loe1WGTiH4tKS21ZRzS/aEKBhMcRV5j8tTp12ThxWbGfPdhujvxOSWwRgYwftEQl
	 3Zvuhzqi1AIcJyxw5OeRifmAAdvKXllbZ+veQ0CrurIj4O1VxycAuQ9fU70LtAP+JVjrN
	 TfMWjUm/ExOUiXtV2rgInhPsfr6WWgGkASyPE3BCRrWbPqzHwAAqsFCquWnjIvwVCtA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790977293;
	bh=RYMUFdFkIg2sR2l7k4P72Az9PluUnF/yufe1bLu0bUA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CXY4wIa1ayB/Wr/HOhhGYhCrQtRwkOblk6HLi7AUZKMWBI1/53Pbub6p6Vm2cxJAp
	 l+Qnr+V8eD0Rvq04kJvVFfKMw9SfjaiOzqJ9jdSgyQge6Goq3u0Llzu6aA0Y6IZiEC
	 Ebdc6AufOB3mzvKHOKX6X0He9ElnBCN2Kj7C7KBrzonSLbFfV+cUWkwRdBaNCvND0N
	 Y4MNJ+Wj1Ig2TXsx6NwpnHGQe2JciPFdZf+CvKjBgWy0TE2x+ki/gSwApiT6Jvdigs
	 PtGnbiUfHo1lWja280zq9LXQQcQN+cWdZedRFtrO7lIYhAxU9LDrxJY01x6XdS6Wfy
	 +6v7Yhxu/X+3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0DC360D96;
	Fri,  2 Oct 2026 21:41:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E4D434D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C03A40590
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Om7bvO_I1ghU for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 21:41:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 001F040585
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790977291;
 b=BZkjDQrPSNg3KNe96Cte3KWsWRv0XV6BD4UJ0wD8O4eicqhoIemkcOq0fGxqeGnaPPmV
 A4zk2FkftVRLpUNNTsZ00DX2sqZY0FyiH1UveyPRXlTj5Gve9dKFTdr8ev0LjSKnMCHAw
 /Xjgc1OI+Ea6b1hwOXA1v18teG8BoyZ+kU1JUP+Pgx2kP/TH1oKQeJz94J7QzCDhVwEFT
 l9aIS+cHAgIyDsfVGPYlXsLDQvu5KrzrtUVfgANb98fmMPgjpMvmILqSNpV9aJVHdnIpT
 LayiKN8g0Obn3AidCNm/c955LReMAUpLuWiMI8462IOE/A9W5oY0daPCWvzt/UsPwVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790977291;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=3pmB6AsJ++sRhCsWJDl3bUg779jEmXaGRm5vJVIQbLA=;
 b=SuIqhhF/zRjGs64BG33Ufl6GZc0L26V1ZuSyVznHvfhwKis5adDWQltlxi1jXosdNTBP
 V/PC66gG3F8HtqxxSliDzCgvo57lo/9qIdPHfhbGJ+wW8waECK4G53axwT8eFedbfnpor
 yo9qQB1dnLbK5xTgaVkXxba98G0p/J7pY54GcUoOmlbNiYbgOBdDpyXc8QyTu39xBh6ck
 xbdkAVNoK1Zzhu44cI8n0XxDh3ey9605YuB+jykiJZZfEZpX9qeN13uhABDSQ5bhWH+fw
 RHGvdQawAewBqf40M5wyRKX+N7CgdQD0zRxLl9rYrrCuRQ2OYor6rOKO8J1Wa012KxQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Hi6om6LI; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 001F040585
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:41:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1wMzfH3h0l-012O8W; Fri, 02
 Oct 2026 23:41:21 +0200
Message-ID: <530fc58a-779a-44a0-b6f6-0bfbbcff068e@gmx.de>
Date: Fri, 2 Oct 2026 23:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20260922122936.3945-1-tianyuanhao3@163.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260922122936.3945-1-tianyuanhao3@163.com>
X-Provags-ID: V03:K1:1Q1zcyOUPmqSQ+qA17dluQyEwYLNJ4jv3LAr03J4pR4DDgIg3Bm
 ZRCZ5VmD8wukTAXFUAtBNvzcDF6fc73EaPTqDa6HkQspccGeSgNqCvqYPuZ1XTRNo6KRX4F
 qo2Piw2TIj9hNUfo2LD3E5jJjqzFRvnKxY9Zqcfc8rvSIFnT+1t+U/d+of6lf3wZAGOoO6o
 cu2meFjyx7gc4WnVroFyA==
UI-OutboundReport: notjunk:1;M01:P0:fVadDah4UNM=;3luY1XM63voK+x7YfFD7Bp/OM/A
 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
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: set modprobe
 path to /sbin/modprobe
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

Am 22.09.26 um 14:29 schrieb TIAN Yuanhao:
> With -Dmodprobe left empty, meson's find_program() bakes the build
> host's modprobe path into MODPROBE_PATH, which doesn't exist on the
> target.
> 
> Pass -Dmodprobe=/sbin/modprobe: both busybox's and kmod's modprobe
> resolve there; a missing modprobe only costs an error log at runtime.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to master, thank you. I've edited the commit message to mention 
where the Meson build searches for modprobe on the host.

Best regards,
Fiona

> ---
>   package/network-manager/network-manager.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index bf4f29c3cc..c96f613831 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -31,6 +31,7 @@ NETWORK_MANAGER_CONF_OPTS = \
>   	-Dqt=false \
>   	-Diptables=/usr/sbin/iptables \
>   	-Dip6tables=/usr/sbin/ip6tables \
> +	-Dmodprobe=/sbin/modprobe \
>   	-Difupdown=false \
>   	-Dnm_cloud_setup=false \
>   	-Dsession_tracking_consolekit=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
