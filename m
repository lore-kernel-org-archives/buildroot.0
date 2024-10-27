Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A484ED13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CF0D406C8;
	Sun, 27 Oct 2024 18:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLMiY120TuuJ; Sun, 27 Oct 2024 18:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA7740585
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA7740585;
	Sun, 27 Oct 2024 18:44:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A631971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B315860787
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGORxc1tfS63 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8739D606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8739D606D6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8739D606D6
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5786FF802;
 Sun, 27 Oct 2024 18:44:34 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:19 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194319.513b8c4f@windsurf>
In-Reply-To: <20241026210348.2668466-1-bernd@kuhls.net>
References: <20241026210348.2668466-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFy1soixedgLv4I6wSzZDR0ixmO7ELgUj1X9hn7OBmo=;
 b=ptKKiFOicWqiafJ80csHM6whD6Ox7iRrtft9IpnpnhNaYbhkdqlGiqx0vAHxn/0KrX4I4I
 AiZ+8pJHJLnh8ErWffXp0izZFPwxFwBSgj7jJd8n+k+HmciWcdCMt6fZe57GB4/lGk6l+s
 Obp2cxXnTx0pjjvWlHeQ+OrQT+rmg1ZB+ntqbODc6/lyTepmR5kwr9Qokt0jbgQRzMCkkL
 LPm16FmD7WsN+FJpGeC2BVJLiLHQThSyPki/LGWlF1PB+G8jX7mm7ynjg2JkLUFgl/1v7W
 wF2TFRhnhRGMzH9SLWORrpBPa4aqJGLiF3+X1fjY2nST2OdkoNxXprGBrG5/Wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ptKKiFOi
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Oct 2024 23:03:48 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dav1d/dav1d.hash | 4 ++--
>  package/dav1d/dav1d.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
