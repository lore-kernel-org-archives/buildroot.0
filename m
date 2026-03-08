Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDEFEA8536
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 17:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DC09419D5;
	Sun,  8 Mar 2026 17:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLcIeo3O9M35; Sun,  8 Mar 2026 17:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69BFB41800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772990197;
	bh=KSxdcGUL+iVQCPoksaAKDWXiWEzOB4sOpaJvEWXsyWo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h/YJGy+AUKxdWrTrfsHTHJAMwYNyq9puXA5OnOVuBSVnrRQnlbgTDJnpkSd8fvlNx
	 o314f5xCPsjenwkedznWLnaTkxacToFndt4woTvv8ZcPoJTNIgtT/TDbNDAcEQiv50
	 0KQrX3SxykYRPF3hj1TR/u0cgVWbczQN9ZoYKtFBSNQFicoXJ7/AiLqbC0Fazd9ZNy
	 fD8LgkYX6i3bpGryUXB1vbwujnCzTBicA6uQZQ1rteLMs08KmI+v99IGAA3aYJ0Ecf
	 Wi2IIxZF0nsahpSgdxY/dPKaMYdIKbOOeV/HLfrXgcOIHmQZBS8VySlt466Z5A7Kd5
	 Ym6Nx9rA/FV+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BFB41800;
	Sun,  8 Mar 2026 17:16:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A58A5119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 978734004D
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOpdm7qh-xhu for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 17:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDA694002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA694002A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDA694002A
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:16:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 777B22003D6;
 Sun,  8 Mar 2026 18:16:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 18:16:32 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 18:16:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260308103703.1722570-1-bernd@kuhls.net>
References: <20260308103703.1722570-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <e35df5bba4a2092260256c5d9d6115d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772990193;
 bh=Ig/vtZgY2tyT1E4ZtPZuHRyDfo8j7R2D0uLArHqG2dM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jkElPOuaPTlb+CYhCx8FPj8AsJkAzEewS3gb9b+8+48baU479+3fiR5ktmPVjRqSC
 nBWk+TgKpok+duzvdt5YI3fAMNqeKRE4FyvX2FacgSmZBVBV4pYBLPeg1y4KnXVK8I
 5/+1iVR/paAJaZqU8ORDuPLv5yPh6XMYl2bErP9K1vgHXDVkzqZm7fIOR9LOxMo3yf
 uXy3qr70vR8vuiefAAoZhIfT1Mj9adYU+qFtxxKaQdhpd3Biyz1tQHLD44Ly0oC4BD
 XQinOrRPB5BJvAZmrQR+zBhUI+LW82dKcRxCyasfRGpf4OYGHItfOaaUnt01HzUHjs
 uTycIhQxgwDrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jkElPOua
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.52.0
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

On 08/03/2026 11:37, Bernd Kuhls wrote:
> https://sqlite.org/releaselog/3_52_0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
