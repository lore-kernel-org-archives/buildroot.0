Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D370FEEA84E
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 20:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C9360BC9;
	Thu, 12 Feb 2026 20:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0F-MFG5iPtJ; Thu, 12 Feb 2026 20:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC2460BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770929054;
	bh=96KgqJA+K0laDMj1nsHv/magOmbS5tiTzM0QHFdcfFs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VI31U00Uw21ZqQewCQRBd6uUbgTCS65oDkp4IfB2b9gOSibf+IKNXFSbKCGbptveq
	 z4zUebk4e8kcv0Gh7zaY4Zw6saWuly2dpR5nP4k3hAKe57f1RrUD/Bf7JwE7L4pglK
	 Uc6oap1kE7/vFUIJq+TiEVn9Xy9AdquxwpM9mglCt7JangRwuwj5cOvgKEZFZ15qXQ
	 sNFwsM0XnNnqU/QMwrUQDIcVBDe0MQ5ZLGX6vkz0KgQkuil8sF3p+68GsQwUISev/M
	 o4WSYLQ1BH9YkZEKeQfd40M+h1iDUgSPpTlwhkumsYJipPkvFLiUQ4CzkcUGgp4vPn
	 uNIU1KB4MfANg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC2460BC0;
	Thu, 12 Feb 2026 20:44:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58E171CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B3860BC9
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-VJTgDHyVZ7 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 20:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 368E660BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368E660BC6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 368E660BC6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:44:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1F6F92003C8;
 Thu, 12 Feb 2026 21:44:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 21:44:08 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 21:44:08 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20260212111019.4129325-1-buildroot@heine.tech>
References: <20260212111019.4129325-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.13
Message-ID: <8a50c4d8c640ea7c22964c6270dd5364@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770929050;
 bh=ao5q5k7V9b8ovcnlIv9/11rrZTMYqOY6VHVvJGBAGps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hPWhxXNYRCuLBb0ki6YOEkwiKv5egAsoLafzf+i+nS8gYQ23lw7tkTKkfM39Y3mrI
 hNJZnPpxQ1DA5Gn8+jAJyF5pLohfZy6vHgEvCIcMEUWtvZg+//jGcgAFuK4wwzUdjf
 1tntxOUfTdAYlyKKVj+bHwFnWBbu/euGfSt4GWP94po4i/ZON9logo/yE5kRGM4EGZ
 H5ISLTOshKHqeJsPOCEv/8D6NhAkxFkgXImK/rZN6buonjeaTd14DHVvZpehYQdth/
 O5RAGVMXFvK6uUhDNYollTuqnHGEo/jI5LkFa7qiHLQww9UqVB4s7qt4H2PwHynWG7
 ddpUTVw52lDdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hPWhxXNY
Subject: Re: [Buildroot] [PATCH 1/2] package/libabseil-cpp: bump to version
 20260107.1
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

On 12/02/2026 12:10, Michael Nosthoff via buildroot wrote:
> Changelog:
> https://github.com/abseil/abseil-cpp/releases/tag/20260107.1
> https://github.com/abseil/abseil-cpp/releases/tag/20260107.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
