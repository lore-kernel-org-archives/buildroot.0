Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD5CD6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E818822A1;
	Thu, 22 Jan 2026 19:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuUPc0n8RG4T; Thu, 22 Jan 2026 19:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F5E38229A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109212;
	bh=DUcIOhopQgtr1PC8zGNuw11qAwch1HP1r2hTncCgnHU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mULTZx652YYYuj7QPaJfvcmNip5QrTvmDEfvK9+hGhgXAOVi+ZwGqSxMqEl0kjdqH
	 wY7UQKQ0e2GjDoyI4OoqfQoNBth7bOKDU0xCb6MlnO+IyKi1HxAZe8Bu289WVuBHbh
	 h0Dz5Gsm5nIel90XMI98VVE3/y8r2ro6PkvDJuc5r7zeaLFiEx9FiHgpUH+JOpTKV6
	 opEBAgtCi52Aa8faWek6APOZjIJY85eQC29j+2jnT7VwJJ8jlu+YSTtZrtd6SE/9g6
	 N8DO5zN0lJuZdyJqakelSGpB27z5tZavQRITzjtsmiepXXDFldsu3J0rHU3d9JKLq2
	 yJS/gMJBTeVOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5E38229A;
	Thu, 22 Jan 2026 19:13:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7320A4DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 634404015C
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjyhNyrBJpX5 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 722664012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722664012B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 722664012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:13:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5D7BC7803A2;
 Thu, 22 Jan 2026 20:13:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:13:26 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:13:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260121180842.48561-1-bernd@kuhls.net>
References: <20260121180842.48561-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <7b15cbe5089e0f0effd88da2b750acc9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769109207;
 bh=I01329P8C3JKWvFogX8UuZOS8aZ536R7BoiMl6rl504=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=exXbxJvxEkol0UDOg+utw8OkktB9rB8upY6EcG6oBWVbk6EdfDxdliUXCboRpGCLH
 YG0jeukuPOwzkbp2oujz0lz4gtkpQvcc3tHUn5pMtUAMhRtXEL9BBHGlZIWUFcQ857
 OTDbVOi6uS8+5FklY/9i1iWvHIux+z15oqoy66h6HtA+EYpf+s4GNGamvEaz4AH5Ew
 HK+BLMbO2lS090eIREYlECQxCddOFC/Fk2c8/ku50wo2D5Ud98WbNrPFALzp8+/3OL
 WbeOpPCS3tLPYNb/eMZumRFJNTNeAcqU8UhJJcdATNlrWkZRnsXGeQQ2Zro4v/+644
 PFj5ci++bUELg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=exXbxJvx
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: bump version to 2.92
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

On 21/01/2026 19:08, Bernd Kuhls wrote:
> Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG
> 
> Release notes:
> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q1/018380.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
