Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A997F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9F441B0E;
	Sat,  7 Mar 2026 20:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6MMTQfy0QJR; Sat,  7 Mar 2026 20:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E0B41A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772915673;
	bh=5HxRXxTKhr0YKLyiutfT4ggjAQozqcjny0WsQ5dhBSc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E4z4lxJrWwHZivdK1Yh7zW1IU0frcfMzbGZ9PLQ9/yLk/0kMJraTvbAxy0XoBF2wD
	 YD7MMDL+OJJ4yUmWzAoG5bbqXHOWI4rcOIOl+eBQwAoZNqO0+k/IE21rU/N7w6p+Z/
	 bdhdgLxQPol7HvkpejD5+sM/ntiUC+gjA4JpDmkJ1/DpDNMn5soASBGEay49Sv/OnB
	 c3XcG2JhU1YVRlVcLq89trLZuyEhvUD0TGindE2VF/S9NFHlDeSCdeS+/GBqA2XWiq
	 8YKgREiDVTmcpRF7VyMhmOE8hE1YgGCQlhAeqcNMRLh6yEhP4Jwvt2lP7sobeWD0ke
	 jz8g2UVuFNnTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E0B41A3F;
	Sat,  7 Mar 2026 20:34:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D153169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ECFD83DCC
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vU7JtbEnG6tN for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E9D283DC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9D283DC7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E9D283DC7
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:34:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6FD6713F86A;
 Sat,  7 Mar 2026 21:34:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 21:34:27 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 21:34:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Murat Demirten <mdemirten@yh.com.tr>
In-Reply-To: <20260307160405.1745633-1-bernd@kuhls.net>
References: <20260307160405.1745633-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <bab72c8dbdd8da66d60963dd0f7ff5a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772915669;
 bh=lFHZnz5EaIWYd/3D7+VPx6RbwUzswq/gcJRCaB1VFtQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SpRUGbhDz+8jqNlTET1Gj1KO8fee7D6fyJNSdVInnDsiUwRFdrRf8UxI0EkLO8xxr
 h6JsEeqJ2cBsDBCjYvNYhkM5PHTgAg4MX2bxiHm2md8L7F0lHaknf2mzJuIFrwFc8V
 7hrtRycRkFMpyfAg0gUkErz9XlPVJHirrbsTj0FnbMRiPQt72mF0xc8nQPtuljgR9S
 RJTZoLb8m0CDNp3LA2SC6IaK8ilsHgda0QMfBWKg8Hgr2nYzi5yW+YHWGq/5i48LbE
 Q5/C/TBwQrPGh7aOjif87BihYqYndGYqVkjpEW4/06GT6GE1Pq//EprPO0q9DxWshP
 fp7sMJPNmFxIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SpRUGbhD
Subject: Re: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump version to
 3.1.3
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

On 07/03/2026 17:04, Bernd Kuhls wrote:
> https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.1.3/ChangeLog.md
> 
> Added sha256 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
