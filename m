Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49560C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 13:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBAC06068F;
	Sat,  8 Aug 2026 13:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mK65WnyJDno0; Sat,  8 Aug 2026 13:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB916065E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786197398;
	bh=Iyd2PQm7HDrQLcBQpPGNs0gh7YZgGwcOcZYRRzf5AYo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DIQEtM5q9hm5iodAHsxp4jHb+84FZ+hxT/gjVlj8rFJZzHDXag54unYwRXxkEct9E
	 St6HnZ99SzEvT9b7x8VvWggvz1Xat73/KYVhGEqT8Pg/tKQPWzTyFyhO9obgcuRQri
	 t+VK+lGcWMyy64opxu/yswfvNOyzeOD6U4FF0xnOp8rOX6rQi8gXVBNHjEWJc2ySH+
	 Q9tib4/N3Q4CTjGEaJcQm+uEEuFND9ROpYPzEOArpCN9HQwhhkwgkg5pBMt+WIbqss
	 g+PgOjT1oUmyziZliIn7V/5G4hBcF7wLUTTfXNafKYh2LcEE+l7CnGR7aFJGY6R+if
	 nsEEshEtgKsVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB916065E;
	Sat,  8 Aug 2026 13:56:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76776282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6813980E5D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpZPsiO5G87m for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 13:56:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6000380E5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6000380E5B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6000380E5B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:56:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0DB0E13F8B9;
 Sat,  8 Aug 2026 15:56:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 15:56:32 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 15:56:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260807175306.3545835-1-bernd@kuhls.net>
References: <20260807175306.3545835-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <68e01f3a8d14ed460669aa51b506a1d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786197394;
 bh=LrsO+tV4NidOVNdQ5/c4fqQB2QuUzkporwyRrFVHsgQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t2Kf7+bwNeaU8JKrcPVpN96i/POI2pNT5ipch4nBr8p1W+AuQeyxFGPOr7l54Za1c
 BtvTMpF1gLbDngWAytSI1u/NuuUv3jFQrmDIeHOLaui01th9HF5NEr4LcpPh411cjM
 i79/evHmpjJnKKNxLIjNOrRUeIsIg4apbekvREMhj6Y+w24QTOtrzVDUnDxb0ZwbY6
 LM0VEGH4tvxSBfyhgJ3Vb+ZpswtMQC4zn1Ok9ndBiEWeyTJ+IHGpb/XzyuxkiIX2UW
 WLJPqZa1WhGvLyL4UoHb5+zS1EsqTjp7LODl7jlqXOgJXoWIwWamgSWQDtanaW+FPH
 vFdPkw/aAOqgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t2Kf7+bw
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.5.4
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

On 07/08/2026 19:53, Bernd Kuhls wrote:
> https://blog.clamav.net/2026/08/clamav-154-and-146-security-patch.html
> 
> Fixes CVE-2025-8088, CVE-2026-20337, CVE-2026-20338, CVE-2026-20339,
> CVE-2026-20345, CVE-2026-20346, CVE-2026-20347 & CVE-2026-20348.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
