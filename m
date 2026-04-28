Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D784DFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A58134138C;
	Tue, 28 Apr 2026 18:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXzQmUF_COJq; Tue, 28 Apr 2026 18:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70C641328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402346;
	bh=LacUNHQpqzjfj9jNbcDum+paW1yMckY0o0qousJeoV8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RBdIrDA7uLXMFD0UidaUJ9jxbssxjx1AfsO0TOXe/9skboHNi5t2tYjZ1kcMPC17h
	 jykIlcjzWRLgGxKLgCvuYSZ8C0jbrJ4i9y0EzKJPuzm9Ntdlkcl8Jqxyy9NOgNhiZ6
	 MByc8CGjTR7PnTNJwbLaUwoALfIw5zP7KX5mm397iBZpxZBp0S+lEKsM8d9F75ekWb
	 BslGjrv7YQafWqF5M871HoH+9NQN0FCFq0ThUmUt1uYOGwjN6n2c4Ox6bM3qJtLEnA
	 h8tWtK6Ik6//M7LhO4QAvQoHi7SkLa2uFuSr0y/sgY9Yo+p8eVQtCtlZ/YNA3InqYj
	 KV2JbEcbRCw8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70C641328;
	Tue, 28 Apr 2026 18:52:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB481B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0061F82779
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hGMK-64BnJS for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC96B827A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC96B827A0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC96B827A0
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:52:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 32CE5B00563;
 Tue, 28 Apr 2026 20:52:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:52:21 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:52:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260427060611.107651-1-bernd@kuhls.net>
References: <20260427060611.107651-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <bc6481a30cc262d52d21e5d05a2c2fc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777402342;
 bh=9oYhVLC8CyqVAqAsL2pcyBsb+P1vlZO4GuMNc1w5pAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=amOA2Jd+zUmumzqCF7h/gBQ3f+WqZ86gh0RWZXjLNChJfHIGXlGLv5jH3iaR4vOpO
 YhVeBrJNILrG1NUdKJ3scE9p8Wf2cd8wuJwZ6roVAEhEGlV3ABll0kQjmVFXQdNSdA
 Bxf/5nzfsQ0+AcuYlLn1HyGHLdym9Ypq3B4zf0OmJo23ymja0VHDCmDIGqrxhoHj5Z
 /RAy+6K1PSjYYabHUPAzl5FU6uytC6D+Y9WVn6F0DGgNF8IMBt+gxMgX/NAv3hjrE3
 BHWxaE131bD/NYyMoyZN5xMe77JWlG5mibSnxlGN8sTlaKWbOkcAaEA932GbhckBoz
 02mTu60sQfBYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=amOA2Jd+
Subject: Re: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.12
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

On 27/04/2026 08:06, Bernd Kuhls wrote:
> https://www.han.de/~werner/ytree.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
