Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73188D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 437C7606D6;
	Sun, 27 Oct 2024 18:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0SPUKyPgQ0C; Sun, 27 Oct 2024 18:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A7B60740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A7B60740;
	Sun, 27 Oct 2024 18:44:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97CC85123
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85E8460621
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiA3DvmdNq1e for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51E516006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51E516006A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51E516006A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08980FF808;
 Sun, 27 Oct 2024 18:44:28 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:42:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194255.3f4fd90c@windsurf>
In-Reply-To: <20241026205947.2664708-1-bernd@kuhls.net>
References: <20241026205947.2664708-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjw4KWCJzSQsYpb8jikfgycChWZ3vp0DGOuP4lQljM8=;
 b=nBwqId+tQ9vdtRwWxUeuLWupRwxd1ThgIeh4hq+uf6Bhvd/6+m6pj8u1UH2BwAKLHhGQvA
 u30zlcBKHKGd2w4fIIyx8A1t+sY0GSiORdp93Ya/FZbvhrkXiFN0mvIR76n3nXVXXaYR3A
 dxKjYrrQYtIlUhJEBx+zJcbzx+iXF0pxtIBdkMYTaziAjK9BUuCXtgn02xxLmqFMciLKAY
 IB9xnwuiDrwXeCHKTsJKSGSHd3WgjZbPVhxayLGA3fwTLfs5vMxEDQv9JtPcXZ9nNHevrV
 yOho+V7RCcjZnqzWCj1P4XYALlcjtzbAEjI1UC2kC5o28U0CfTcNeYx3a+7LvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nBwqId+t
Subject: Re: [Buildroot] [PATCH 1/1] package/libldns: bump to version 1.8.4
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

On Sat, 26 Oct 2024 22:59:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Switched _SITE to https.
> 
> Changelog: https://github.com/NLnetLabs/ldns/blob/1.8.4/Changelog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libldns/libldns.hash | 8 ++++----
>  package/libldns/libldns.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
