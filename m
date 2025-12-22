Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E44AE69165
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 20:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D0460AF9;
	Mon, 22 Dec 2025 20:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLUYql4ioMnT; Mon, 22 Dec 2025 20:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6382260657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766434719;
	bh=BoTxlMipjOXIOMhRxbwYoetrNKx5O5iYPhbNGHPkL/c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gEqLDpyJcZrW55RdJ3n4UxDVVMhxYNeX8XtzqMT65R/svyyYunKxHfRDQHCqEZLCE
	 W3sppQaAEsaqaRi51JKIFAq44KjprPfBhLHSCsnfqx3tlJq0wRU5u336sS4Te31Gfp
	 HcyAzQykTR5TE85VU5H5s9xdw/N20QA3dLKcOuD/wp9OljhhdJL+XkLENsQBBTUiAI
	 5oHE7Dg72cQ9Ebu8tD2e1i+iNJ9JkoMq4qouL63T1BEUmsWVi934zDhRbRL91A7JzH
	 J2TNr9ZnH+M/rQbp+vrt+gf4xi2A25lplTE3Z1WdsUqvYfp9XhZPvgfIcmA6ePZtTd
	 CJU4QkSAIAmqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6382260657;
	Mon, 22 Dec 2025 20:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6648725A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6233940622
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHnnx5tEiem9 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 20:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77857405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77857405A1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77857405A1
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:18:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E54E819F58A;
 Mon, 22 Dec 2025 21:18:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Dec 2025 21:18:31 +0100
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 21:18:31 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20251218153407.4069189-1-pkerbrat@free.fr>
References: <20251218153407.4069189-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <567827e5cdf4ea708b4710aa0be20bdc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766434714;
 bh=TlyIoPD93Jo8L+h1rFyJdIu9jxe3JWi81/kqtOKih0I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZAQxgz4x08VqEhtjA30qrq1yKmi31GQjGIDJxTb7MTBinM9oMX0EwWG02AL1PXbzI
 hWTYQDPXm+hgvIgdbHeAF0QpwztiICugQPEec0OgjsbJeC+vM66PESmQDMtsqmBO+Y
 MKFusktWUbvHObM4ipdc/SJFy+C0ZbsvNJnAKx3ONvGBb9GL6Y7eoJ13qHUiSZ9vSD
 7X9bO0IWrw2VyXOF0dfIsHMuZeHFuPZuaaxEtztKzshojFlWoCLGbK7+NbbIsxLTrC
 Ha6J4XzeXRDSpv7i5Wk7u69YAVdiJfQe6pgaqnPMSQO/LEOrZiFofh90/4ijUaxXCv
 ezmWXrlcO7iHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZAQxgz4x
Subject: Re: [Buildroot] [PATCH 1/1] package/dpdk: bump dpdk package version
 to 25.11 (LTS)
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

Hi Pierre-Yves,

On 18/12/2025 16:34, Pierre-Yves Kerbrat via buildroot wrote:
> Releases notes since 24.11:
> - 25.03: https://doc.dpdk.org/guides-25.11/rel_notes/release_25_03.html
> - 25.07: https://doc.dpdk.org/guides-25.11/rel_notes/release_25_07.html
> - 25.11: https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

I applied the same patch proposed my Maxime few days before you, in:
https://patchwork.ozlabs.org/project/buildroot/patch/20251215114302.32596-2-maxime@leroys.fr/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
