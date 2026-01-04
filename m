Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E826C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F339A60889;
	Sun,  4 Jan 2026 10:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBNszRvidu-2; Sun,  4 Jan 2026 10:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A26CB60730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767522751;
	bh=373YTinRTDyhrrZOOpAwL8xaQesILeRCgXMY5bCesao=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GTcxxZDe8JVv2JWthqJYqaKHLv71L4SmDz4MgqhxUlArx+YjEV6CaM369EYDiLfML
	 qr69fn+Hn02JTCIVZhGh3TuNmyeFHkhbQp9BOFrzWEpIpaaz8mKpiNGpmesH7nZ20m
	 F62ByNNkJXPwlVGrSphoiJQT1+4EyK554Qlszwg/CRpmmFM/QMRClS5R12OJoNUTFq
	 VQz20PpvrRnVr+2Vao6955mYGrT9CZAO7oCH2eXoM5RP3+aRktR5LeW+aJ5uyg5qHb
	 1R5ZWk4Atz9Zl7bNl/ja6izlY2208SDLuE0DT88loPrgFpbluloFd86RE2Z3wTb/CR
	 VQduNtJqJYgYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26CB60730;
	Sun,  4 Jan 2026 10:32:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CB02DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B318404A8
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RhA6vxu3eXD for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:32:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CA32404A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA32404A5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CA32404A5
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 766142003C8;
 Sun,  4 Jan 2026 11:32:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 11:32:25 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 11:32:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103194250.2266963-1-james.hilliard1@gmail.com>
References: <20260103194250.2266963-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <8bd545c25acb90d9141d7dc7e217e3bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767522746;
 bh=IEGv8QLRkuvYp4QRYBdXQl93dl635G1GPTuO6TkYTEI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RSSu0wrBV1hFZkKOp8nsPo5FwQea9jWCADUwxQU5p31+BBX2iidNHpvLhOssPNuRG
 XAbNEzAHMx1Abl/XmS/133A2vKLCkCsSrZ6Sj3zLaQKClcpCtwPUaRkU/o4rdI/Mja
 t9TsaCiVLu7Q9uHiM8bdwQgaUAdKHNVYmgtdMy3JgFSl9haoT1/T+JdiNNVDg5UbzC
 pjaRyThAr0oKna+kpIlOT1nUvQo4TAZpJtmtYDXmZ6iU+l58PDdsAgx345lkl9fYmV
 4O/MwVTKMxZXxhA0q3srxQtAnPnZi0kgCGX5SXSgIUCztc6gMsIQnbk5Fa2KZ8oBLc
 BC8wYKm+7khXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RSSu0wrB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-memray: bump to version
 1.19.1
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

On 03/01/2026 20:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
