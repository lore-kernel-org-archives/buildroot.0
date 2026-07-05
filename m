Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020EBC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 10:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F33940891;
	Sun,  5 Jul 2026 10:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8-DDUUQpZUi; Sun,  5 Jul 2026 10:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B27040874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783246198;
	bh=Sm1N5Z8XPsozLFKRDDmqIk0feBO6JxXBMYxNEae7DzI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eJ3O+AT23odaKsmwR6gk8Q9oLCgW/pTOOAwPQoVLJEMm4FM+YPM7l93QLUsJxHm/m
	 H0cKI5TNiL3dibVXP9Fpg8rIXyLG6aHvzsXxl1+dV60Icuxg3NmQ/vvUovtDvHUuoN
	 NTr3gztL0edAFV1z5LRClz7Wx7OYRzi6z7DVUeP7cypUVcGlKkrCsjrc//kL7tZy+P
	 UvSZhdZt3aPJUhKap2oFH2lL4dFSRGsxGU3HZ8GeR4BlMxAGIku0+kLFb+JmAdTgkG
	 yXZzn3xSniRFCQuBm+kDH+ua8XoAxgXcAKJ4RRFqOCR5B7FIURnxjQhTdH5iobn1yz
	 0EJYDC8vpjngg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B27040874;
	Sun,  5 Jul 2026 10:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC22F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE2A5401E9
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7s3tCN8S4cTA for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 10:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DD6240246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD6240246
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DD6240246
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:09:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B235C780395;
 Sun,  5 Jul 2026 12:09:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 12:09:52 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 12:09:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260705092955.182945-1-bernd@kuhls.net>
References: <20260705092955.182945-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <d227643d99f76c4343f499f5e7afb409@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783246193;
 bh=n7fyd3CeairSfpnm8jlJxE/xkByib8myzEe0DSVm40k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cqkb+B3eKn8RWnRkb/UAOQDu5NScDgpbMkXzLv+05u8SOtDuBWSM20cZDvvYp6Ypd
 98Zl2nqMzE1yFefNDXrlRnU0fctW3+ERiZ1hOMgRwtTo3jf2qE7zcM4XQXf+yqKhJo
 aC2PJJoJaNhalQp7bdoKltVD3Q6t9HVlwEqgO/ZBrybsFiYjwUMW788Wq+KgrCdAEQ
 W/7KOtdUpEbwEO7lpgaNzvcy4/UsV+TozS1FCnQwOiap6T04nJrqhEWzIGS3+IxLnw
 Du0LYur9e9v7nLH3B/rs0CTd6ZYTz9WU35Jybby3J9f2Y+Dxd46WsvfDAmKkxn3Vxh
 3/+dPWYOOV63w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cqkb+B3e
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: security bump version
 to 2.5.21
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

On 05/07/2026 11:29, Bernd Kuhls wrote:
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000506.html
> 
> Fixes CVE-2026-34182.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
