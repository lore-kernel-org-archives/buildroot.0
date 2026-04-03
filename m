Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440FDE8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1EBE6113E;
	Fri,  3 Apr 2026 17:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqcasO1j5Y91; Fri,  3 Apr 2026 17:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D26560E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237184;
	bh=TXcA80KYzHZz9cCTBiFmRQwfwS15xWZ3R80TBX7U2D4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gyG5AmdjA0/pGUljlT8LbKQfMyeWzjrEPOtCH49x46j0Wwz43HxUL+bGEZcwyO+Kd
	 svfPuZyOn7dHNq6ozOFl8e884jHx5QplBtBzT6a+ZAuQN3jDktDV7vToNd2eZhIqfO
	 4Fdz+L/zY7uaBzGslJSgiJoyqRA4sOXzfXAYLrZNhPMZcSWtqueEU8ZiQbuNnMBokB
	 QQzJDwn3ihKeTSUqEwzs8BorPDDPBl2kcibifbSzGdIlGzl0V1dUuxJ74joJRxy67f
	 v0Xy2o5f0MJW5uaZ7kDWNMUwvGLckiZsqfhPrfdtTQWsSn+D0I0QfSvLrTgIAvecJp
	 OYOQlYIgWPXMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D26560E9C;
	Fri,  3 Apr 2026 17:26:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD52C2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2B8A60E9C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZJulLpl2xv2 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:26:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7703260E69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7703260E69
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7703260E69
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:26:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C858778051A;
 Fri,  3 Apr 2026 19:26:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:26:16 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:26:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260402180518.2780136-1-bernd@kuhls.net>
References: <20260402180518.2780136-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <c425cdd82adf737f1e01c8ecc967dde7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775237179;
 bh=xw6IpKD+VLV/1dOXrw2roRRDAQgnr8nit3tiz8hoOXU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SE790K8FoT6j4bIpLLDwTDurF9lhnUCqk3LI00+/LyT6m4bdCm+raoJ5SHHUuEewo
 vLIAvrpFofYh6HfF2bWdHBr/Ugbt2V6PrYlqK0QKFySkPsR5RUsVZDe1lFF5d3yNC/
 vrSqERmTcqJzxB6yh0TbVUyZDAoRIBYRlzfkXiNr9gPzgJgZ0kwgh3Fd/HsAJOBjTJ
 C4y3bl1uT2DPw6aBl2nvGJusC7MwqsXt33/1u13P9tThKVIzzoQ7eiw3eT6tZAhpmk
 txVl5GVsjFxktTpluae8OR26JZTtCl/2n/0oc+dLSiDkKoLzmv+qFAc+TeYd2QCQGB
 emo7JyXHGYHQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SE790K8F
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.4
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

On 02/04/2026 20:05, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-April/000843.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
