Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95BBCD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A02B8200A;
	Fri, 12 Jun 2026 16:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUKyUK-IV3JA; Fri, 12 Jun 2026 16:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04DBA81EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781283050;
	bh=BN67u+TtS8d8bSC0hfN/jopyYTHcmSWmlQTOJh+2qp4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LlNI/h4GMNDwu0L8EHYE7qBhAz9isIWZ7FcBbVx1rsOE7lKpafBg7Fno7Okx/KP0E
	 OqXa13FxjiyUCNcg/Qiw+RvAvAXAE/NI3Jrmx1JZ8aWygXPPzCyP983lC83B0pXQjI
	 8xfIDFklcbAh5+YtncAAfJRbECstmuN/AVaknd8ouerNLE/8XXaNM03GuIGnQ7vcdG
	 Vf46ICeiebWeyNPX5f/uMQ9t1rSHczIj/TlsR+zqRe414K1HBwGID5NE09G03gdRIo
	 IPT/h7XeF6SpGiZ+SmS8PnIyFt6V5jq1pfHMrW1+NgFamxmVx2qQn0PIth8WeyxrfU
	 MpnD2nCDlS6Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04DBA81EA2;
	Fri, 12 Jun 2026 16:50:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC72F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE6840601
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-RGW2R0jekt for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6012740099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6012740099
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6012740099
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:50:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DF9D22003E8;
 Fri, 12 Jun 2026 18:50:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:50:40 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:50:40 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Oli Vogt
 <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260612090819.1195510-1-titouan.christophe@mind.be>
References: <20260612090819.1195510-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.16
Message-ID: <c987bc365d0dfc1ef8dbabd219fbec72@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781283046;
 bh=kzjtRd+VJpCqLy/ACD1hQr5VGfB9Dsg8UkDzsLubCAA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b5ixlxJwEaPIjl0JWBOJKWCYwAXM7an++U0wZAwXM/FN6lH4ffz9Iw7/V4LXxM/3n
 lWD7N0gJl3QNyl7g7kU39hkHqFUOmQUAY67gFYjT2he1WMeBllBXtbIap68s8I4WiJ
 aWEzfS8c4ypv0TOw6Xd7wWB0W5D1OBmmWhfmA+M3hDN2QBrg5anBJH8sXAJto7rv89
 r3jjv55FphlNZmvMpX+jwdeX6Ndh9oW/l+o4nW4IyvjYbRZWFUneDULvjkzDTBrUUF
 /wSkh/yN1gt6OJ6xetMv4Tf6dQXnOR8dw7U4NghX0BIKsXxRgTR3Ao2B7NVRfDrLUP
 4l88FKIjPa6/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b5ixlxJw
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 v6.0.6
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

On 12/06/2026 11:08, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://docs.djangoproject.com/en/6.0/releases/6.0.6/
> 
> This fixes the following vulnerabilities:
> - CVE-2026-6873 : Signed cookie salt namespace collision
> - CVE-2026-7666 : Potential unencrypted email transmission via STARTTLS
>                   in the SMTP backend
> - CVE-2026-8404 : Potential exposure of private data via case-sensitive
>                   Cache-Control directives
> - CVE-2026-35193: Potential exposure of private data via missing
>                   Vary: Authorization
> - CVE-2026-48587: Potential exposure of private data via whitespace 
> padding
>                   in Vary header
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
