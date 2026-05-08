Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B076CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 075DC42023;
	Fri,  8 May 2026 20:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuNWsGJFlBtz; Fri,  8 May 2026 20:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA2342028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778271374;
	bh=RdPRCubQaJM3PEr8/I5Dfc42UHL8JHvFEvQsdHRMHf8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qhyOP8UWsAAwTQ/6cZvy2rXs51tBb+OALAMha2j6Z0txDK3sXOKk9vx6catMT0YwL
	 1bHssrC7BTlNAiEx36goDp6G9RZiBwNwl8ZcGYMhmBW+3z6KWRbPrLTk8tH/klR/V3
	 KCGibE2A2sIMlg/kre2eUSiEaL2+xT8JYND7ZiOfFXO6CbLe7H1I7Q8p9Hjb1vPNWY
	 ALO0mzVnQZ12QRZDSCIQLP4HxXMDVaahg1LULAjQ+ybuTM2gwiYaEqTciDUP10X5za
	 hzLT09h6HOVGPF9n+OoHxvLbAh4NZMdL2XIfYZjnd33GSMk3qyNOlVv1aJpbz/1BXS
	 73oa3pAy9pxrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DA2342028;
	Fri,  8 May 2026 20:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E79425B
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C2C984967
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3TB3f7_e2ly for <buildroot@buildroot.org>;
 Fri,  8 May 2026 20:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 436FA84966
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 436FA84966
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 436FA84966
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:16:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DF76EB0053E;
 Fri,  8 May 2026 22:16:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 22:16:08 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 22:16:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260508193517.4014949-1-bernd@kuhls.net>
References: <20260508193517.4014949-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <09a8f04956cdeccadbf94e6c593452a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778271370;
 bh=biDFrNL41pf5hSrIynWos/HHV7WF93S8lVv+YllqdW8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wbgki3xD8akt7b5vriFcfX9QQs2Y82ZKJ4MaJXPTeq/rgqdzLopBTDRAxEBUBYExx
 QcFD5uu1o4AUHz7e5GBQtOlf/LSDqlgxV1OCAJL6hTbFERdNEU010R4FFrPt91rC2d
 VWbA3DV6JMjZ74fqyxF20jz9BaJbWqSIsjb3rqQ92ACE8qmye8u4yyHUI3Oq/QsMC5
 32fbSOgrbrBu77R5yuKUBNxe8E6ruGWK52GpsqJJbTjFryHz999PCbeSvu+ElljOHW
 meZEefS1VQKNPr0RfkXny/GI/PSMS8ZOpv2/VrX3sosNOgcXHnf6tGV2KTC0JVb7Tb
 M/QvORHuUz4kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wbgki3xD
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.4
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

On 08/05/2026 21:35, Bernd Kuhls wrote:
> https://sourceforge.net/p/fetchmail/mailman/message/59332343/
> 
> Updated license hash due to upstream commit
> https://sourceforge.net/p/fetchmail/git/ci/389729194921d7ccc7054819678657a5b2054876/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
