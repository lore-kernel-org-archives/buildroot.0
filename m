Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD490EF48C4
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9215608E0;
	Sat, 14 Feb 2026 11:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSi0gWm_RJbi; Sat, 14 Feb 2026 11:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98EC3608C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771068280;
	bh=cRWMQUKsr3XZb72gsX6x2SlIjXLXacIv74P7SCrgXA8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qSEWmjWRSx+JRbmg9EFr30LZEVkQgwUpgQyLmBgSqw2XREIlekTUB8p097xkYBEen
	 ix9ssGJduqItdINYIwN2W7V56D2a+IydXkrIcLYs3fktk8VBjEy2NG3ufW9cxaFln4
	 IL5j2Ud5ax5Mnt6b3mVvJWXt9O7vtM43ypAvuMwjfoJGhQkCHgAAQCMITObiqoxyoH
	 GAJLgk3aVEQmW5UkqIrSRIvqDSkr8W//EOuPM8oanXvX1f1aRtW/AGML1iPdrDMazX
	 GYpIro6N1r8VwOTH0bH1E19pj1pnAg6s6AHgLAO13ikBjs9GOdmjC19Cv0Kzy8zv7Z
	 0sZQZdptNZ2pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98EC3608C4;
	Sat, 14 Feb 2026 11:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 175E5270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0DB940AA8
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9vaUY5nSyhk for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 444FC40A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 444FC40A9F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 444FC40A9F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:24:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DF928B0051E;
 Sat, 14 Feb 2026 12:24:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 12:24:34 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 12:24:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260213221832.1177432-1-bernd@kuhls.net>
References: <20260213221832.1177432-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <494ec05ee4063b37ea30084e6479e723@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771068276;
 bh=oOstRtNGKoSSCV2dmPM5Byzn+DWpiCGHzQd8avH44r8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ow88ndTedp1tr4zlyT4eTa5Usmx+sXdnccmuBpoXWBP0J8BMq3Lbyuo5lD+XBe4aE
 Nih4DoDB/1a11plF8AbONsNkWpbZz/jtBj9nqoZZ42YfTRcw9AJsCIP3EyTOZCVmdG
 aYaMES2DT60efvizLYkfTjsE5sNcfFtNkvevfaRYEmsuIZzd6jXlSzcYTN5dEpC2PS
 Kpv3ssNLnKWAX1qWA4BhpXHeGa8jcWTjg9Zt6MiXWDBsCsFgP2o+gKb0M2hv4iljxu
 Ymiq7ZLUlA3VOS0FksfnzWyiBLrTuU33D0NAZ+4ieGQrcL4OAtt1BtR8JLtNYpSvEN
 Sf5UMyzs8rVMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ow88ndTe
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x series
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

On 13/02/2026 23:18, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
