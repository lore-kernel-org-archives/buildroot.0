Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD0DC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 14:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90890606D0;
	Sun,  5 Jul 2026 14:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWcUGubenIEj; Sun,  5 Jul 2026 14:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD9D606F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783260956;
	bh=54WiCSQ6DqiL4qM7TcP9YcWBMlCMVDnu3JbCkNbuIOM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oLXzdYaxusorKn4nSQ5QE0DfZOc2hhVXzdOT96KGsH97nr/HclQhGU5pgY5Dmo5Wx
	 BwQ8/DaWVXCO1YT10oJF11qJ9kj41yzla6rV6EC4hvgBNb0VmqqItI8qPGts5MJ2CE
	 /rfVbmX/Hojev8D1e+FGXq/OmjXV6W/6W1hLd8S22ry4vuPBPT/1RYCNLkqupsvn+W
	 YeGz/7+B2eudzt8Gn/5UfysZWIUDI+IFUYq+VyWwhVWQosyRzcI4CIutuQy+I5pzh9
	 xKx98hJV1bA9DsTGsQdL6h3nKYWAKJeTlBjj4x25KhSgA/DhEzGL/h2RCFBAHTBkLN
	 U6Y+kMnVL7bkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD9D606F1;
	Sun,  5 Jul 2026 14:15:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 487422A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 14:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D61440633
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 14:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-NzTX0vvch5 for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 14:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49A7B40640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49A7B40640
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49A7B40640
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 14:15:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CE52A2003B4;
 Sun,  5 Jul 2026 16:15:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 16:15:49 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 16:15:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260705115519.1127439-1-bernd@kuhls.net>
References: <20260705115519.1127439-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <4b4f0e9bc6b4a07c47ee76dffe5517f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783260952;
 bh=JknA4irfDa/X5InNg5P6oeiE+/aXJ4z+WGu3ZYklE5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HlFQO1ruqHHF/nSqRgq96DxbHFfdr4KI41M6gfpZ3+r8Ah6XNNe1a+NEFOUZrFThc
 oDntDfP0JdVUohPcNh7IHu1yoPFEf8kevwKADKXexvyAm/8t12ZAPwKPyzlu7sHHEu
 BOs4pmirhQrqcSNdq5UKPcbi1jvLUrTGJv69HF9twUXy6mhWThiB3t6o6qU2aYONhx
 5oWYgINFV6wgKpSLhdoRgR7ZFcOiOLx6CVZjA66k6PuuFf3Xt6zBjoRqK12XyrzD0a
 K6X+xP0tCAO3QW91l/qOFwVILGOo6rT3tOk10fT2er/rO5QHQqUhj7wLr+xBjIX5TI
 tf+JL82sETtjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HlFQO1ru
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: security bump to version 1.96.1
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

On 05/07/2026 13:55, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/06/30/Rust-1.96.1/
> 
> Fixes CVE-2025-15661, CVE-2026-55199 & CVE-2026-55200.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
