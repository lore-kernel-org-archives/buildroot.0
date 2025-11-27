Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85779D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57310605C6;
	Thu, 27 Nov 2025 20:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzLeJsien69e; Thu, 27 Nov 2025 20:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882CE6083C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882CE6083C;
	Thu, 27 Nov 2025 20:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0AAB2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC0E6083C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CokjFljTUr5C for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7B0D605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B0D605C6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7B0D605C6
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:24:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4853B2003DC;
 Thu, 27 Nov 2025 21:24:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Nov 2025 21:24:21 +0100
MIME-Version: 1.0
Date: Thu, 27 Nov 2025 21:24:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251127063059.5166-1-bernd@kuhls.net>
References: <20251127063059.5166-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a0d10aea0ab239714e911633766c3136@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764275063;
 bh=Dc5JSl8tamu3fI4JvQROKZOPYY5OvKHoLVPKbsD5sJ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e1zRz2+NHqPioaE2CMURMsFJ2L8aeXwk7+b1sxlSyaRZzVcd2ZU15htOffnJo4WW7
 gkKWBq5w4o3Spfzga62NdQtlWKNyihC/Uzy8raPNazdRkzFDMgvhtMblPXOKhK8q6/
 dg3uv1wBFy/oovBkrZ231Bd0AQ0JIpzxSl9Q9yLh0aHtpPJ3/CgcP9yqoZxzm1tYen
 akyBk1XSN0OQ/hNS/t/NisSEiRms+sIS3SSHKyRUiKc37DKl9UkEFEUVsxg4PZ+Diw
 EyVu/POm6sRCJccrq4hXl41MN4/SOx3fkwTXdX7pOu6ZvDDp3lVdgdxRkV9NUfoSy5
 Siu1+B6IRjVmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e1zRz2+N
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: fix hash for kernel 6.6.117
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

On 27/11/2025 07:30, Bernd Kuhls wrote:
> Buildroot commit 59479ae646767f22914335301dcec6fbeb313755 added a wrong
> hash for kernel 6.6.117.
> 
> Fixes:
> https://autobuild.buildroot.org/results/5aa65e053b827e4d5c21d4cc06f439f1dd093053/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
