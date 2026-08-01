Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C914C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 14:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF9F80D05;
	Sat,  1 Aug 2026 14:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11vcWBvScSC7; Sat,  1 Aug 2026 14:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AACC880D2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785594453;
	bh=k75MCt2nL0up0hH9tktnS/XD6WCH2pAlI/X11bBqjkI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p9O4l2LuudiiijUlKs7byMmqPqL7opwjFgnTzPAo6917DTzbqOmvCmEiMDOBUkCLj
	 2b+TL4Xm0rN35eezgdZegtdsdkpMNpfcTUn3jRglg/P3vsI+q6mhiKuAPHDcfAUAVo
	 kNOCo1euMK0U3pgfrjKRKwGt4BY8i8/rVlQJOwVGP96YZoe8hb8gXGdjkQ1fVINHFh
	 IqfePNkwYRvE9YpI4cJi1pOE/jNq5TtfriqQpSUnz/EaET/DaGWkZpY4hMxMX5QZ1V
	 zD4QNM8MBAyRxi1TWpM3xRWFy/leBM3kd8Xopz0/pS9b7kOVuj7qmXZfJo4BJWBbHO
	 BSYUhXa3lxSPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACC880D2B;
	Sat,  1 Aug 2026 14:27:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 154A0FE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0793840825
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0geJVBNDzGQ5 for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 14:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58E77405FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E77405FB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58E77405FB
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:27:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2EA766013B;
 Sat,  1 Aug 2026 16:27:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 16:27:29 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 16:27:29 +0200
To: viper@landau.one
Cc: buildroot@buildroot.org
In-Reply-To: <20260801140923.1375200-1-viper@landau.one>
References: <720f85aa2477fe660f66a45354973035@free.fr>
 <20260801140923.1375200-1-viper@landau.one>
User-Agent: Webmail Free/1.6.17
Message-ID: <33e356b04cfaab58c2adf1495eaa8931@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785594450;
 bh=frnJfomRy3ANLVdagfvJt+ONZmyTGXT8me/q/QPd1kc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oe50iBMJbn47LSRXiXergR8vKs3eFyqWuRLxcJiChqFlJRtj5CaFMMdNCFIpSsea/
 fo4lCpU5H7OwKJ413IA3lHhAo7y5HIXnpaDMfM1NW8sUDyaofj2gbbSTpKELFnxZf6
 4oB/0OfnJpdaQas+XFGKKmIDMX5UEiLqieWAeLVj0dP8VqcPLiX2mM7SKN97//eMHj
 6qVakaN1U46e4MsjjrSPI3jTVhtNriD2tKJ2KSG76XiJDivw38/f4tx+WYiLW1dKWE
 ysOr/qjcz556U1vv7L9UmZ70JznJPfgEzw6P1ZhcTlE752/vM9xGwqCcKEtRVTGobk
 Ebs60y7R6q53g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oe50iBMJ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/cpp-argparse: new package
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

On 01/08/2026 16:09, viper@landau.one wrote:
> From: Konstantin Menyaev <viper@landau.one>
> 
> A Modern C++ header-only library
> for parsing command-line arguments.
> 
> https: //github.com/p-ranav/argparse
> 
> Signed-off-by: Konstantin Menyaev <viper@landau.one>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
