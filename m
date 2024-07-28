Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE012C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83A97403BF;
	Sun, 28 Jul 2024 19:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPpshcVzk9NJ; Sun, 28 Jul 2024 19:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 431104051C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 431104051C;
	Sun, 28 Jul 2024 19:50:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00FEE1BF577
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1E804051C
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gesZS_oi-xxR for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68CFD403BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68CFD403BF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68CFD403BF
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:50:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 672A51C0006;
 Sun, 28 Jul 2024 19:50:19 +0000 (UTC)
Date: Sun, 28 Jul 2024 21:50:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240728215018.7ec6bc4c@windsurf>
In-Reply-To: <20240728075247.4724-1-bernd@kuhls.net>
References: <20240728075247.4724-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722196219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8v4LBfwliyeW/4WxMwbMl5DMsrO7x5TCu6m0ndPhl58=;
 b=SMQJlR+xGHbU4ktYyFTNdlo7Jpz3HGvaHy+nQCeQ4hZBCNvFDg8km/P2fh6psYPezB7GCG
 al+1JZYV84UUy5+CahregxTmpd/lExKtSIHKbo6malXBOYpfpk7B1nGuHMmlH5f4Wxmtt4
 Z+x1aPNcsBxFzD2tHMNvg3lx4fv0aawPyS5Cgs8Qn7ANeBuwPKNi1/4bt+NmXGmV+6JlJv
 edUM79srIhM1gekxvjkzs32EcJ0BrjCmzO9q9QVP8JbB8j48CVDsWLRebRSmLG0AnyRZFo
 Y2SMxX1NlVpQ4IGQGblsSBeQD7MoC6xF38t/L9/u9X/rhWXeHwJL+hvPGt5AAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SMQJlR+x
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.9.0
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

On Sun, 28 Jul 2024 09:52:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> 
> Changelog: https://curl.se/changes.html#8_9_0
> 
> Fixes
> CVE-2024-6197: https://curl.se/docs/CVE-2024-6197.html
> CVE-2024-6874 (Apple-only): https://curl.se/docs/CVE-2024-6874.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...-mbedtls-check-version-for-cipher-id.patch | 56 -------------------
>  package/libcurl/libcurl.hash                  |  4 +-
>  package/libcurl/libcurl.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 59 deletions(-)
>  delete mode 100644 package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch

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
