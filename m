Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80276D1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A50F41D96;
	Thu, 24 Oct 2024 20:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QXESpNGHcsm; Thu, 24 Oct 2024 20:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E367241DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E367241DB0;
	Thu, 24 Oct 2024 20:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CFD4960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 850968122D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dn6goHTosKx1 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CD1981263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CD1981263
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CD1981263
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0B9D1C0003;
 Thu, 24 Oct 2024 20:48:29 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:48:28 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
Message-ID: <20241024224828.533bd7d9@windsurf>
In-Reply-To: <20241007173356.967432-1-fido_max@inbox.ru>
References: <20241007173356.967432-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSm2NeKvg3kCOb7eMsW5LgSzit4FGKdX2pj9MVGhO+8=;
 b=oeTK+N/aya+YY3/aYDxCqAHQA+a14Zj1fYl3cKtmDPcOxv5ZaRZbJ9AImCKKaL3hauHEtg
 1v7WcCrD5zOKrwcHHODcNE3sTqqSrC4DSpIRzLQz0lkXuRLRbL39s+KDwdnc0u3fVqtJ6x
 5P7nJsSTc/CJNcnTP+QYC0gcn3Vvby3zfBG/CsEPKJwPzlC3TdbcLZoxMSgOGhKzoalid8
 9Ld0Zjce3pPyLxuzsuQ4EKqKtFKSfAqcNIzmk7qKkpeE0+GU6Um33rKaZG4mxwuOu9ULUI
 Jk0exxrwRRkcdUnnKhdTg1+iWlhZP1107K7vmcuFpIaDoK8+dOIhR12hyONDgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oeTK+N/a
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.13.0
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

On Mon,  7 Oct 2024 20:33:56 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Changelog: https://github.com/libgeos/geos/releases/tag/3.13.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/libgeos/libgeos.hash | 2 +-
>  package/libgeos/libgeos.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
