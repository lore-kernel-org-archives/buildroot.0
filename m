Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F08C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D5860875;
	Sun, 14 Jul 2024 15:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4ORUVD5K-zm; Sun, 14 Jul 2024 15:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 912856088C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 912856088C;
	Sun, 14 Jul 2024 15:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7DB1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3130A40582
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKPq-3mE_ZbT for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:08:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAA12404F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA12404F4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAA12404F4
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:08:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D3ABFF803;
 Sun, 14 Jul 2024 15:08:08 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:08:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240714170808.2d258375@windsurf>
In-Reply-To: <20240713215252.671703-1-fontaine.fabrice@gmail.com>
References: <20240713215252.671703-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tv+g7Ed6Hf6+NMF6K52xMu8qS4NYJ55HzZXOLzIEdgs=;
 b=DsuGjR2uHfne2WeZTcmkNW0GVkBAQDp0nDeuxAy5h9k3Q41Yw7nPGR/456ftlv+qPA9Pqn
 xvQP+ZsHLoy2jQwFpMTQeDFOBGdYQsC0nf6L25xKwRJKfXf6YjU5UkpeIwvMXYlpvDj/0U
 x5U01lmd6Op4Sbah3qAOl6boalqIkPmvqWRYg4Y0KXrJgot+k+dPaAmk+3D7dzbK2R8tGF
 ZB6QzuEI7LcMW/o5O63r8Sxla0f1CAgV7B+ezUlqI/TZn9ZkQvoFmYjaLCFAw8dZ1FFzNp
 Aj5yoix2cZMNGWD9HTNMobUlMvPiMa7l++UmLCFvMde7NIcsxc3PfbwjruRjfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DsuGjR2u
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.7.2
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 23:52:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2024-1544, CVE-2024-5288, CVE-2024-5991 and CVE-2024-5814
> - Disable option checking which is enabled by default since
>   https://github.com/wolfSSL/wolfssl/commit/412447ac416ce76ba2a9bebbea8917258ed4c81e
> 
> https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.2-stable
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wolfssl/wolfssl.hash | 2 +-
>  package/wolfssl/wolfssl.mk   | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

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
