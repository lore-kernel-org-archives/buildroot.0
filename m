Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91491D5AE72
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 630E58409C;
	Thu,  7 Nov 2024 08:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tMJL8RKkMuF; Thu,  7 Nov 2024 08:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D59A8408A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D59A8408A;
	Thu,  7 Nov 2024 08:04:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 140C3C0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D786561093
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nd1oqMtGPlvs for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 761DA6108C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761DA6108C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 761DA6108C
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4F1F60002;
 Thu,  7 Nov 2024 08:03:45 +0000 (UTC)
Date: Thu, 7 Nov 2024 09:03:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241107090331.5050cb7b@windsurf>
In-Reply-To: <20241105192600.1589181-1-james.hilliard1@gmail.com>
References: <20241105192600.1589181-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730966626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYnpCCEhoEhWZeHu3LR5fmAomuW1+D2ifvLxxEMUiLA=;
 b=YWHW3KTuKwkbMau0YV0MbRTgl0hIa8Jok3lhIu/pS81NXQTAtw5l2NR91v+VoiQnuO37QQ
 ceAHMx8Jr5+hbpkVrrMZCDeaBGvo50/c0y7FxqLD4g4gzLKJqhMqWo0cT+CPmV0IXDmN9U
 gxpmuoV6iyLkuxFFik7uDRQsvWvsDKlg0lwuulxgrbnGwUUqwClg0XsJ3J3xwlDGn8hgFU
 qnHxlndt6+85ZgrHEnyJy2nv1AX/haER+uNvXj5K00cHQmHvRQQMxC+M1qfgAlxA9kn3eU
 GxW7x9j1riM92Lk4IowHjmDygMVWqff2hf/PM+I7oXAPfRaW5xqxNwQcBusJhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YWHW3KTu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zopfli: bump to version
 0.2.3.post1
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

On Tue,  5 Nov 2024 12:26:00 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Switch from zip archive to tar.gz archive.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-zopfli/python-zopfli.hash |  4 ++--
>  package/python-zopfli/python-zopfli.mk   | 12 +++---------
>  2 files changed, 5 insertions(+), 11 deletions(-)

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
