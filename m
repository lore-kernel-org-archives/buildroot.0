Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4929CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67D5F6069E;
	Mon,  1 Jun 2026 19:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t58lUASPBsrh; Mon,  1 Jun 2026 19:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7831B605C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341227;
	bh=EWEixW+ixrDxBtH0TpsDjM52VoWLNAxSOkeQnrfdPoo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kQtCPta/L+lHO01DHVRtetb3gqTGKYMyHzWO/S/xxn8pgpDFDrZ7Nubt6GaPROvHC
	 RndbuwOAXPBVRcf7LW85g2uT5V7PqxTBW3HKBlUhxx6GcwZEs8H29bEz6+oKwNsmK6
	 HgVnzYhdJLbJC3rR4V73aM4CJFnPpsjyboRiq0bkFyCCZXqYamvxGTCXN2jcXwklXD
	 MzIPcDhWcss9yx3DIE3l/X+YtD9lpSogSH3gltfRuvouUSG4FPpgidqc4zEFSb4A2k
	 BtmakK1vbxfOs0XJYqGL1WomF0o8uZmRt7QVSfznbP8+UNi0Hc1U8rS5+C9/55Zyhe
	 ilS35zNTchaRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7831B605C7;
	Mon,  1 Jun 2026 19:13:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4433BD3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4164E80F47
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2muk7dCpdHl1 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F5BD80F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F5BD80F48
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F5BD80F48
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:13:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 20B1260136;
 Mon,  1 Jun 2026 21:13:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Jun 2026 21:13:41 +0200
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 21:13:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260531174514.1681226-1-bernd@kuhls.net>
References: <20260531174514.1681226-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0f99f79a58864aa2c7dc8d9b1b381dbc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780341223;
 bh=zpdabbreJZEhHTzczuXFXUH6lnbkvzIdkbWxNov+Yf0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gD25sKvv8PYWp3/89LB4LgAYgn0cckSz3bKb0OFN/Kq/JpXI/gdKpOBe8E9k1sxsB
 0cbMFeEFYnKz1/aMS7nTN1uDxU+kYGacv4EuX/t4W4QbJKfqQmd1NHJNBHSDHQ3Yii
 kp6boiKql5EeEzoeE2RPLh1RXCtiAy79D381VIpzheHaZLMJCXw+jKo8MB8LdyVhPv
 iKqilZtHu6V9BKxsLsqiLFfvUTAMOa0nzj9nD7N4q6xHAykFf9eiuLYK+FDEPQNyL5
 VNWV+KyvU/5IJ0UoPzGWGCUMIZmLhoz8HDiL+tvMOlQpxRmT5ZB11e2p2C3OfiXcKP
 1ZyZ8oy5LRYQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gD25sKvv
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: update upstream URL of
 patch 0001
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

On 31/05/2026 19:45, Bernd Kuhls wrote:
> Buildroot commit 49a4dc97456b9b777c25acb0cc3d1fdaacf9859d added a patch
> from the master branch which was now cherry-picked to the 2.43 branch.
> Update the upstream URL accordingly.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
