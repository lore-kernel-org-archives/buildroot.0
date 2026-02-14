Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9638EF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1AF460D93;
	Sat, 14 Feb 2026 20:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeumi2NSB2PB; Sat, 14 Feb 2026 20:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC06860BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771099328;
	bh=NPaZHSmdRMlmvQbBMUgYrYJzf7TzntElsLEXwsTlFIo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V0t1C0eyUkcek70RwWlTdFoqUvkiyblsyEaihYbxfZKzlMTS4kAtCf2U+IMPFJ0+7
	 psAMaumXBDGzOIg2aKhg7NpESAJ9HUmBwSvpGftwvk6xWnlVWRrfOVo+nQKGXPupak
	 SpxKdnMnHLZ/Tq+Hm9IaL0PvPkyraP/NtV+PU46a1yPK1F5/u84O7lbVObBT5SNQ4j
	 WUSkQF/LYoiWNyZI2DUK1gPpTkDJ8DLzcsXyL4kY3mVDAtE5CXGA80pf1T3kIY0ewu
	 2NxDI5GGv6VUZdazKhhw8Aj8xkMtzNfCWKpHAKoOBpHdaGLXNfa8mVxbvEamZtFlhy
	 RWz1k+1Zd+qMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC06860BDC;
	Sat, 14 Feb 2026 20:02:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 570C3270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C16340B64
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEvJjZpuyHmY for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 805D740ADB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 805D740ADB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 805D740ADB
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:02:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 83AFF19F5AF;
 Sat, 14 Feb 2026 21:01:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 21:01:55 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 21:01:55 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Leon Anavi <leon.anavi@konsulko.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Fabrice Goucem
 <fabrice.goucem@oss.nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260210000827.3811338-2-giulio.benetti@benettiengineering.com>
References: <20260210000827.3811338-1-giulio.benetti@benettiengineering.com>
 <20260210000827.3811338-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <f65c7f97714ce0d26f6e57079bc9b9b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771099324;
 bh=WHluK5auYP9yanCEF73uupfP1iMPWL0jVW8yvEqh1sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lvud+25U+k5kBugJNzTfDH7zop+5As+otQU1n04q2/z+WDKfU6HLPgFM/gMNfQcZd
 q07FVJByRUHiI7i8+/qeGQy506bHGZIJDCgH76wv67PkRhU/TLqnzwhC4N+Ecbhhhe
 k1swU5ORZJNL9pN5lJVJbva5bkLeRS79afIt71oL5epYd/XIf1GDvCVs9dsx1GWKJB
 +12UgN1CrKCf83M7ceJejIh8UqjK7uaCgqC25qyF0JD1kJIFeK2u6exl4q5BlqkyxR
 Nr6qi+2L4CRs+4rrPk0Jbp10WDkqVo11Kd+HAfcTxAiaYrx5v5d9q3kjHcBQ3OOxQl
 kLizbgzzXtELQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lvud+25U
Subject: Re: [Buildroot] [PATCH v2 11/13]
 configs/olimex_a20_olinuxino_micro: bump Linux to 6.18.8 and U-Boot to
 2026.01
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

Hi Giulio, All,

On 10/02/2026 01:08, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.8
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[...]
> diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash 
> b/board/olimex/a20_olinuxino/patches/linux/linux.hash
> index 9dd49776b0..567e9b38c5 100644
> --- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
> +++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
>  sha256  
> 7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  
> linux-6.18.3.tar.xz
> +sha256  
> 37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  
> linux-6.18.8.tar.xz

It would be great is somebody could send an update of the two other 
defconfigs:
olimex_a20_olinuxino_lime_defconfig
olimex_a20_olinuxino_lime2_defconfig
bumping the kernel to 6.18.8 to have the three defconfigs aligned,
so we can remove the 6.18.3 hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
