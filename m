Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE4AE92FE5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 22:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B6B60B19;
	Mon, 29 Dec 2025 22:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jng7H_hV30II; Mon, 29 Dec 2025 22:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9648260B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767047497;
	bh=xD/JbE3QJhh+M/qfWG9WHnvSb5900Se3zyLcC3z7Pms=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DDeL1QeUL+XtpsdED1Xr1S8dyxkPOByuJiJF+cI63lLEDJUjHBqXuP0xO7Mwo8M8O
	 6jolr6aLUVBMAf6DagqmC47DeR39wY9L8oRT/74JEUyoiqG/AMhlm+HVl5Wc/1tEKv
	 JjbjmEuessXx1fDdrjfjLLCOHCBL19N0GythVF3HIz929/flGwsLmzklD2LcucaLKE
	 NmPycFt0DR+6PEpyHwqCc+9hzEoXax95vuK2pAQJBuWSQiIukc+6mvlpC34lUDccx8
	 EjbQZgIVRklPme5kW4Wn8QpIDcyQtxNFU1roi3IPCebUDV58hJvN9efTxXUQR7x1ZW
	 8ZQFPimwW/xcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9648260B12;
	Mon, 29 Dec 2025 22:31:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE00D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 22:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7199960B12
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 22:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACuiHeYCaYiT for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 22:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DE5F60B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE5F60B08
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DE5F60B08
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 22:31:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9EA9F13F88D;
 Mon, 29 Dec 2025 23:31:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 23:31:32 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 23:31:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251229082427.827148-1-bernd@kuhls.net>
References: <20251229082427.827148-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <01f68f89ea6b44cdca861aa157264766@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767047493;
 bh=YxSxXCydHb+PSPBnt/SL55yz06Sn7kGnX34XhpMxCa0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qztxrSc8cU1uTfpGmR8CkSRT2LwSwdA6t+tGO9ykE6EeCK4c/baTuLKoWYWgzhKGK
 5agluR9KcryXcAvxORhOF9Vuuyrsl9rBsO6aZHJxpBZpIDthIjYFSiuBPsoXc3p4rv
 3YOI5QgcPvwGZFX4mDfByHbLvSjT6ImZequ5NuRF+Q+imaQdptLNHroYHRD6Ywn1g5
 +nqwjqHWzUi13rNlzcTPcIcNi6at9lPSzzoXmOZ64Z5SbLhCJEQ2+U+6q6JcDBQsn7
 hYoqxJDd/tdalBpb0ChFzc9/EcA0/LwC1iZu3BkkGTKTBu95+OM83swPH9UPDqrxM0
 fX5q/Q1HRUgUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qztxrSc8
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: bump version to
 2.3
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

On 29/12/2025 09:24, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2025-December/003648.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
