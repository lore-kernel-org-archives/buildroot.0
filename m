Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9EEEA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E4782358;
	Sun, 19 Apr 2026 19:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7PBPRD3HzR1; Sun, 19 Apr 2026 19:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E0978233E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776628015;
	bh=1uNCUaQK8XTaKaeElXPONHnUNs93ezbqbnX9q9Qsc6A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ta5eNhl6CDjVMnQKxK8gfmmkPmw2oL0N/esPv2rbvh4FBrnYvgMGmGQhsSqtvR/1Z
	 HMTf0xdteckA6yRfAkcy8UBXh2ZfqDIRGSXNm9nVkAq3wXNqEQZbyOoxX5fWs+Irxh
	 6iMPNBO9ZxvQYrbNkHD2As1hN5tFpBae3/ETbAjVSpU81BBUZr1NFJufpOlUud4QGR
	 sFbq6vd8zFuTyccm4N1GZJJm5bFuYOoSrd9VRuKU20VG6VuCdmGz12ec+GjImk3NTQ
	 AVDJbHDHU5QqVRxamQD5H/P59G0Du00ATDqf2okA/hg+wg66DGNW2Uqpn/BEzK8So7
	 8nvdaOP3hygbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E0978233E;
	Sun, 19 Apr 2026 19:46:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82230259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73F0C407B1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQD0Za1Cav9m for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EB8740448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB8740448
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EB8740448
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:46:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B639919F5B2;
 Sun, 19 Apr 2026 21:46:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 21:46:49 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 21:46:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260419171028.1659761-1-bernd@kuhls.net>
References: <20260419171028.1659761-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <6fc605d6af155fdba542305d989f7608@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776628010;
 bh=I1VahWN6/aEi4m1LjaHkM1tIjQmZGg2gaBhPHDWN4lg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iFuQy2zQpy07H3W7mmZUcrzkIA7cK2l/zGQHbSd+nYZcdXtQmIQ8i50jS9FqZRR87
 m4n47GsyLUr/rzo9w4wL3io7PKFG790hidVt5Sa2OH1MSbyHcGKZbAXVTLqs+EocKw
 O8sHeRBaYFvb8KGz2gTsqCj1aNTNGgSMOAW3e9UFb64JEX4dMlFD6TCGiHW/c6+GTu
 51gf/M4X7jXgBL1CR/ncn6zDYSlMmzuBNw8Be36RhXXmTDI7yJ/4YHHJxIpApFgPhB
 TiJ/uah1sIxowQ9xj+fs6MSA7UPL3afWAwInJWvH4g7frTVhugw4QjxPXXzHXYRIct
 cUbekozohy/7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iFuQy2zQ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openvpn: bump version to
 2.7.1
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

On 19/04/2026 19:10, Bernd Kuhls wrote:
> https://github.com/OpenVPN/openvpn/blob/v2.7.1/Changes.rst
> 
> Added static_assert fix for older uClibc needed due to upstream commit:
> https://github.com/OpenVPN/openvpn/commit/6768ef1dab5cb6c1dbc210c20cf92820a64dace3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
