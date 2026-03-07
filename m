Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05966F55105
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C818D41A3F;
	Sat,  7 Mar 2026 20:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYc7F7R2pZcp; Sat,  7 Mar 2026 20:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C514941BE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772915157;
	bh=byHR7bk83VmCDEIIM7eE/B8cfYhDzfvIzy89YXOcsog=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VKTFzaP1Yc5Qz+0gBIS+z2fvgr3XB/WvGOob78N6BJdGb5i7Z9aVhaIgVXKCsNyXU
	 Uev6kCudHQPDqC1pJRB09AsVtOWQX9glWkaIi+NuC5N9jakPjnbzDT+2vmHkaJC6qx
	 jbrLPwpV4ZPqMhSYw5kBDMnluiy8RPS4wD3WOuJKFcLte93ijEwueWivcOz7N9WWKh
	 J4pEkkk/94w3ECTrxXhXpMQx4mpB/w+7w1O7z14V4gfQ3RoNRg5dhk+TTILKh0vzYF
	 o9Akb3jVJy4TbrhIh8eVmGRL6YxnxpQOT/DDgM7SR4sSgRPNTL0O/61aFldtLrOv42
	 0nBQkv9CfIc+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C514941BE2;
	Sat,  7 Mar 2026 20:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A66169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DAC940232
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUM_a1oCfC3D for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 428FC40226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 428FC40226
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 428FC40226
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:25:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 648D713F88E;
 Sat,  7 Mar 2026 21:25:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 21:25:51 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 21:25:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260307165240.1215719-1-bernd@kuhls.net>
References: <20260307165240.1215719-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <30574899d0fe720357b0be2c069ba2f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772915152;
 bh=nKqi5WmM+5yIbK3KSXxYwNOEoopbtmUzYVSFyn/NrDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e9uopIotW//YmFSL6S8Wlde74ruZzb+wSM6UPr1VZxzp0tXlqqqMT46/c+4+6CsQ3
 Ie4t6XGXN7dzUAVTXOghtWZHAUzaNDPrA4vxhD+PYPsvlvimJFDyK8EXltyazp6Zuh
 EcTf7gNSH2NvZjqlXzPZ3Ng9qiBRYYZBZzmXDFVab9pSipO3jb9zkXEHGiKUuPZ6zD
 D5iTQuznsX/Ha6pKlq/L52c2VB6iK3Rsp6JLClRLL0/qA2zWP4guvAmy5wbg8iwj8o
 JSm9ZnJvv5jL9ndHniepSSNpwIi5SYcmMJT5Acr+qw8WC8Ig/krg7fuFzk5pYm6GiU
 Kv6rYsZIGszJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=e9uopIot
Subject: Re: [Buildroot] [PATCH 1/1] package/taglib: bump version to 2.2.1
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

On 07/03/2026 17:52, Bernd Kuhls wrote:
> https://github.com/taglib/taglib/blob/v2.2.1/CHANGELOG.md
> 
> Used sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
