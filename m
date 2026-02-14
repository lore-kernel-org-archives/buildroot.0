Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33945EF584C
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC326125B;
	Sat, 14 Feb 2026 20:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gbi9ePSfT9V; Sat, 14 Feb 2026 20:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE0661073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771101061;
	bh=V8N+94iXmZaF2NVVjZ1fycobOZ28PI1gMCHNEm+9MFs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EC5wv9ZHxBPoUhYI/QpVd75dEa59unBfm2peEEWIYilFxDof6ntSy+dbs0ZQKQ4CP
	 Newoe5F+cR6PjbB8ZJTMH/AsLYBMBsxNNK01DS/4dkVME8Ahv/SE+a7Fl8gz8g2gaB
	 OSNmOTEqV9yEFsBYsJDRB1ma9Hn9f2mlTLaWtIoWNcSJod0m59F393X5FhHenYRHzg
	 3Vim732bQHKP4b/0KPe6tCxGrirdPV6gPvObxOsV+8vOFq5aM8JrMwIPwterC5K+lH
	 Y77OPD77rQd5Ep5tqWHuwuhfidLPpU+XMA0nyDJoxmVO/RzJMQMsJskdCaqrHAMBvs
	 rkm3+wIaQGQOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE0661073;
	Sat, 14 Feb 2026 20:31:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13348353
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC8A540A9F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ci9O052MB_Hh for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2491C40A9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2491C40A9C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2491C40A9C
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:30:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F19A12003C1;
 Sat, 14 Feb 2026 21:30:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 21:30:55 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 21:30:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260214180647.1863688-1-bernd@kuhls.net>
References: <20260214180647.1863688-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <8101464f4885c709a8201b58cef1e998@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771101057;
 bh=ElB4SKUa/5pWov6AnT4dJDIsQ8A2luo/OmWq6BZ0KfU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nC2pgKnOqAE0IYLq44AYqEM/Pk4W6AiuBrUvVxWPin9pqjuKfI6bQKdLRNUXpr/9k
 pbbWcJeR/U+pjlLAa2c6Bmt/OSztjO4PDuMjvzztldsI152N/XaeNeFATnDEI0+NcA
 +w05hmUApsS+qt+elCkfPG8Nu2w8Js5V3M0elLHYLQZqchHIZbYQJKaWTBlTfilEFM
 qYdXgu11RbcAV/kXb9Mc+7OCh+FcbeFF6DaWomaXfqeFR8Geou/CciNOimo6K7Uusu
 raZquQ3DS3dWYaRi/PrIa1UcXmzB5UjAbA2S7f2mQY5moXVpDf5ODyCd/fKNRvK3zz
 +sZJpYoJgCV6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nC2pgKnO
Subject: Re: [Buildroot] [PATCH 1/1] package/libplist: bump version to 2.7.0
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

On 14/02/2026 19:06, Bernd Kuhls wrote:
> https://github.com/libimobiledevice/libplist/blob/2.7.0/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
