Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D9BFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6355361C4D;
	Sun, 26 Apr 2026 16:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgGtzh2C7xg6; Sun, 26 Apr 2026 16:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FA1612A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777221041;
	bh=Zb/ksrJoMDnJwwIi6QzTejptMJqLFDwO44AFO1ntbCY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LEp1+9cClxC2NhCLyu+mpvM7olOiSs61ttburttHu6uMsAj0eNMUPQT8VOBOiCJxP
	 WupSxRN6sz34O8KplSIyw9LEs2wi6V1skE+M70EAeCX0Mla3WdDFAlUqhMxZAMW7uf
	 JxT8DqNl4L+lvmcS3ykSLKAL0ETbSS9MCQbfWItgzFVlcj7R6Y0lYDcLaRe+PxY062
	 lLEZAJlxRM/QYyaKOfp+5VtpOGxI8bXGdIN5KfRYh5yTFL9D7lzD+63RhjpsBjVwSw
	 609LtwGJOzrvDe4jsr3w/rWBHlGo/y3n2QDpvcvSVd5GUie6q8/+XkDPlbt/ixkr0n
	 x9boeQVM7H2Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90FA1612A7;
	Sun, 26 Apr 2026 16:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D0D62DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42FC7842F6
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNyuNIOvlfxx for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 346CF842F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346CF842F4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 346CF842F4
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:30:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A2AAA2003CE;
 Sun, 26 Apr 2026 18:30:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 18:30:34 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 18:30:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260426084054.3305901-1-bernd@kuhls.net>
References: <20260426084054.3305901-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <29b6b283347707ab46ec0498449fb7a6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777221036;
 bh=BsPxCSedXwY32aCG/sj05eOIxoeOO5yknIFzuZo3FMc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MEBFY3DrVsbp9Oqky46nA0W0e8+lfYs+AkDJ5lIVj2mwmILU0A+qESUXEvLlRlWa6
 by7WU0NhFRittyfQ825KRHdNsz0g67J3itZ1zBn/ZED22nWAAVpswO8dpZLDY0ywOV
 Mz4D2s/0uazf1M4ZKtcFtMO/nihjlP8VMchiz4k2pAdM4xpnxJTuT3IAHe72EJYqLa
 0k7Mrh47xElyg9R0Ewv2vcBuSRWWdQeKhgeZ7P98i3GcCDJmi0TUWaOpX8PktHIDsK
 H5gQ+ht+vSFlV7aehtp15A2JQZN1MorUIs0KPfstsoyaOnSGU08w5/ns1hefNEWaKm
 odJwxP153lC2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MEBFY3Dr
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.0
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

On 26/04/2026 10:40, Bernd Kuhls wrote:
> https://github.com/libexpat/libexpat/blob/R_2_8_0/expat/Changes
> 
> Fixes CVE-2026-41080.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
