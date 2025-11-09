Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5226FCCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC81140693;
	Sun,  9 Nov 2025 17:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEGNIKfEHTLa; Sun,  9 Nov 2025 17:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0099640683
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0099640683;
	Sun,  9 Nov 2025 17:35:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC8425D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29397403AD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6Su6PaUsakK for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA798400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA798400F6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA798400F6
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:35:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C34CB13F8AE;
 Sun,  9 Nov 2025 18:35:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 18:35:42 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 18:35:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Carsten Schoenert
 <c.schoenert@gmail.com>, Lionel Orry <lionel.orry@gmail.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251106204522.3273683-14-bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-14-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <15fe7060de7452d2de137d57f390a8f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762709749;
 bh=cQbLJtgo1JzccAF1O6wCKKhGupsXQelmv826oRcv89E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a6UXYY15XdjKTyzs3tMsL3RNWYgCmsG41W7VDPJ7/o+xgNYMGUVbwhTiWOgGKi1Fq
 00ksxu6C7hdiSniJcHtREPWBrnISYvB1Slfh7JW5p470kM71umVeXmyjs+DUtdllxq
 +uh721gQsU7CdROLXEKtu32+mGLHbMbzBQD2ji/7ALGwC/o97WEK0WWAy4mPHb4n64
 Ll0e80/tkE/16Ge3bH2H7nDSksGqX2iuQ9dCqIhdj3WsD5b2YKMHbh/juZlJ8sVDur
 85ytdhE+S7Fdd6bmixnEOGg0cUm2Gx7Ihmam7GWkiFUG+CEU7Fw5xpT7sd2xs01LcN
 PgESYwR/w4iGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=a6UXYY15
Subject: Re: [Buildroot] [PATCH v3 13/14] package/xscreensaver: bump version
 to 6.12
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

On 06/11/2025 21:45, Bernd Kuhls wrote:
> Added two patches from Debian to fix configure errors.
> 
> Switched from libgtk2 to libgtk3 and adjusted dependencies.
> Added dependency to libxcrypt.
> 
> Fixed broken include path for gl.h, inspired by Gentoo:
> https://gitweb.gentoo.org/repo/gentoo.git/tree/x11-misc/xscreensaver/xscreensaver-6.12-r2.ebuild#n172
> 
> Removed dependency to gdk-pixbuf-xlib, not needed since version 6.05:
> https://gitweb.gentoo.org/repo/gentoo.git/commit/x11-misc/xscreensaver?id=3d6bc3a216196c795de6e0932f74055548beb9bb
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this bump only to master.
I'll apply other removal patches later.
Thanks!

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
