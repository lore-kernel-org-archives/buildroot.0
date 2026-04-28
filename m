Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A98DFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D64F610AA;
	Tue, 28 Apr 2026 18:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKW2O9isV9N1; Tue, 28 Apr 2026 18:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C0196108B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402130;
	bh=AgHxY0EqHoSKBm1j8DQSvo/lT0Ct24x0wBiwv8KQRw8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q1a+PgPuKP6qtNIyIxgiASisxi0Ghfs/RtReSCxVOpxI1qsQFhvhSD6wub68mOzi4
	 +/IjX2/KHhD+nQz60DAE43y1eYGsffoEMkAxZ8PH3K34qBKfMkBkG+hSah3Ze37cu2
	 JEN0gYFo2OLq60UcuCw5AF9lzWnQYLfEPR4v7LeBVpucKni8x9B5kK+QX77dbucrTd
	 c2w2Ck883OIPbFeuRCeDnmJr1k8JS/wBre8DFd3Pwkkz+IEMO0NU+jBXa0U+eAI9Ur
	 bkTM2p2rUZo5LHt/QaNiM8Q3g71vGoYg9eqHkh7R+noENl1fFYK9CyiXwxc0iCM/H0
	 dkAALLAAp0TYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0196108B;
	Tue, 28 Apr 2026 18:48:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05D48231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC0BD407C5
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIlq-oLCZ2gt for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C42EE402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C42EE402EF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C42EE402EF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:48:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 93230B00548;
 Tue, 28 Apr 2026 20:48:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:48:43 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:48:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260426185448.1650280-1-bernd@kuhls.net>
References: <20260426185448.1650280-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <bd7f49ea9e5a66af0bf4605d8341bb9d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777402125;
 bh=Lr/UV3tw0LkdbWY942yeMP8HlgmdLg3Th0+SMqestRM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i2TQD7JWTYfvVnW+ZOOnYs3TVSJIOsbKf4O/32YigWZAi0jrqXB2hZ96bMN1dYVDa
 6EcQzltqxpDbHgBDu/PfchTJ4CiyQaJYgzYQeRH+b+GDWxrMqwYKAfXvcgGQ86O6Uv
 8btNIQAv1symYjCT5tKm79F90rIw4uHFc+4hvMi6wjoPuxN6a++7dCGK4HpAibJLqt
 YkYQ0U41UWzFN+Gp7lu+uSw3iVINBMgRrM8+yVTJm7F9EfNLumTdzTQusxRkLyu1pi
 u1PV0bviaCraJ1Dk2r7DLN1h0DHvBo5fugLUA9rpoVlFy1siSSx529/0kzSjrzw/Gr
 wKib31cd9n6mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=i2TQD7JW
Subject: Re: [Buildroot] [PATCH 1/1] package/stunnel: Switch URLs to main
 project site
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

On 26/04/2026 20:54, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
