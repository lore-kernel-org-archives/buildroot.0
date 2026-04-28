Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B3FFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA51A41EF1;
	Tue, 28 Apr 2026 18:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXxqebT5S7_P; Tue, 28 Apr 2026 18:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA26C41EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402637;
	bh=NU+gHIq7TMrrXw3iFZGFBdaJdkUaTl8vtnibqXdibFA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pDqasCu5Xh2zqPKA0T8iFk0M+8k8E89YxRXIvp5izIhdkX4glyCNKJ8SScd3j3GU9
	 0P+NLuSlTnYKMgDX3RWdIL8HMpQwv1UnlFTP2TdvIgoPfswAXtviznGm5PURqna9BW
	 HM47LQEir3kbaRZuC43h727fxBxq0iajrd7EJpZ5aqmkCqIOn4nru4vZPGj2t3JDyT
	 QH6kG5qUZ0ZlYJPxEyWl99rjTNQnbKdCehFrR6cvlLsLzWyWKf8W13i90RigPJPU0I
	 7g1bycP8VJqHDosFg7WUDURGSANoDb6kmQd4jsWRc9EVyyAqQVr7OfYcFUGhAlSRFj
	 D2pJVI1iBpeDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA26C41EF2;
	Tue, 28 Apr 2026 18:57:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EC5C1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50762610B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVT5eqkemHO8 for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:57:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73D04610B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D04610B7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73D04610B7
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:57:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 889C32003DE;
 Tue, 28 Apr 2026 20:57:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:57:11 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:57:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260427061647.390951-1-bernd@kuhls.net>
References: <20260427061647.390951-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <e9f1a10834a55509f6be6ce0f85e3b1b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777402632;
 bh=d/ui/AwKb4dSInxUMgetYMpO10WhtpT6SUhA73fGlhg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sQ5kCohvhw9vnk5BJmNT5JGBR8fxEH9dXxNeRl5zghyCzOkzYpVINpCwmDP5PCWhs
 Lw+zWHPfUe6quRZsAnbDDP1QXLgbdkD/InAhwQzdW+5AInJDB4LfeoLWo2oy5s5HxY
 JLaR0mWvpETi6H8j8flF+33kdybxl/JYzkENl/CVfBwkuhQEOZQ12yOBthY1oGf8rK
 TfiNclLXMCNiUT2oSvlNfSshM+SO/vfAXj/lgqv4z7NniTb1MFUTYGV30qmS6kSSsL
 FTVMjigDibsO/xnjviClCJqmrkFGTSnCk/otkDdpObInD5Muzol7WaEhZ3gEx8YWsK
 GxgJgMEDcdz9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sQ5kCohv
Subject: Re: [Buildroot] [PATCH 1/1] package/libunibreak: bump version to 7.0
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

On 27/04/2026 08:16, Bernd Kuhls wrote:
> https://github.com/adah1972/libunibreak/blob/libunibreak_7_0/NEWS
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
