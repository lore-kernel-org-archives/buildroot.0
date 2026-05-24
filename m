Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FBFCD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 16:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C0C41238;
	Sun, 24 May 2026 16:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJZzn0OOzbI6; Sun, 24 May 2026 16:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE6D41218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779638441;
	bh=nf3XYYajOVLOuiuIbvB/xNp8rb6qGLqVt+rQgkyH9lE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pN6V2dv4eu9w6L4JT55g8QhAOaSonF6ks1XqNXJv9rMapIEO7yVue0jhq6xH2avmt
	 QRq3CYlIc1cb5hI/rLmyJjcBlf6c0mEynV4eJjZXqHsGPQ+PqZb89YgZCJR+FOsMT0
	 PyE7wA7UEeVmrTB5jdgC3QX4PLsA2W6AnJXOieYDgvfgLKH5sC1PFE68WtHSklTDcv
	 K2ZD5uD9rdY+NfwQcbHCu7IrXe5XazyBTTC+nGx53m6e2BjtM8KALLRytfY8fHxwFv
	 SpDiF1+0fNtcFXXkfoXwGQGI7Ra2ppLnDOD6x3P0hfwfaoU4vZiHnm4qNKKUgWD06o
	 doSM2AcB3JJRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE6D41218;
	Sun, 24 May 2026 16:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 922B869
 for <buildroot@buildroot.org>; Sun, 24 May 2026 16:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78326403EF
 for <buildroot@buildroot.org>; Sun, 24 May 2026 16:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcL2QhAYZg80 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 16:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67BFF400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BFF400DC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67BFF400DC
 for <buildroot@buildroot.org>; Sun, 24 May 2026 16:00:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D5A1078050C;
 Sun, 24 May 2026 18:00:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 May 2026 18:00:35 +0200
MIME-Version: 1.0
Date: Sun, 24 May 2026 18:00:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260523160023.1306062-1-bernd@kuhls.net>
References: <20260523160023.1306062-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <6f5a53867b78ae5b010e116a5b41bb7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779638437;
 bh=frt2kSIIGGnEosQIMorW7wWsT4i6IfwmvWjENceorlo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uSYPkAVl3KGRLZcu+76kJe8/a/qnJH4BohFxfcgXXXYgtGd6PsN6RI1a0UPPRNlQq
 dAFZeo/EgD+4QNifusmLfQcOfqQQlzSouc/q3TAVC7ELTxcaYNlIo6HGek3p+H9cIu
 Z9a/dziszwzeKP1ZeJqBtckiunvNxekxW286zygZ2F7YYdIDwFVIZFmbyJ/UgU710d
 FPyrioCS11r/PHWtorpY7AfLLaAt3yuQBJhoK0eTXpYOFG4GggYGRvo/h36t/fPZqJ
 7U7EUyhMMADyXnaS7+eR0MHy5Z96nxQcgp122b1chUKeZYCl+C9ZlpWJjqpB7/0duV
 ZK80IjoRMfBkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uSYPkAVl
Subject: Re: [Buildroot] [PATCH/next 1/1] package/rrdtool: bump version to
 1.10.2
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

On 23/05/2026 18:00, Bernd Kuhls wrote:
> https://github.com/oetiker/rrdtool-1.x/blob/v1.10.2/CHANGES
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
