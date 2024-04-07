Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13938CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 07:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF216077E;
	Sun,  7 Apr 2024 07:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIPYjTC55LEz; Sun,  7 Apr 2024 07:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFCBE60898
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFCBE60898;
	Sun,  7 Apr 2024 07:59:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D038E1BF340
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD46C40711
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fd-b0p6FCbhX for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 07:59:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A8AC407A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A8AC407A4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A8AC407A4
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 07:59:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04F131C0003;
 Sun,  7 Apr 2024 07:59:20 +0000 (UTC)
Date: Sun, 7 Apr 2024 09:59:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240407095920.48c52d73@windsurf>
In-Reply-To: <20240406102541.172982-1-bernd@kuhls.net>
References: <20240406102541.172982-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712476761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3GF2w25zEjq28i8QcvNRpY3QUx1t3c8BAgyk7CQ5s8=;
 b=ArNqZzdKJc2/LPGJ8OPupktJqTmtNE6P1UivAVyLBMkjkR73pK49g8qVsSpsKRrTxvvOR1
 g0MbM8fBFWkA6xWXfozyo7w0X0/k0086rdivSi0KPwJ7N2wah9GwlesX47fb1r/7VQDZgS
 zTh6b44TyXvCEa7GoBOQuXMZhpepsqqmE8JlRchNY8yzd4K0gHP3R7eu3AL9cenZG6qiKF
 m8krnlTSl2wAj44tfCklAhBg6E7KdIZaeth3gLYQa1H5bqUZ6uFx+Fvm/wiO2THGbXG+0z
 oLGNBVQxgdVGxVza7YN/FEw/dPLBmddKo+ld70W5VG3TY1zPMr5iXe2TJ++Q6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ArNqZzdK
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: bump version to
 2024.84
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Apr 2024 12:25:41 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Drop patch which is included in this release.
> 
> Changelog: https://matt.ucc.asn.au/dropbear/CHANGES
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-Implement-Strict-KEX-mode.patch      | 232 ------------------
>  package/dropbear/dropbear.hash                |   2 +-
>  package/dropbear/dropbear.mk                  |   5 +-
>  3 files changed, 2 insertions(+), 237 deletions(-)
>  delete mode 100644 package/dropbear/0001-Implement-Strict-KEX-mode.patch

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
