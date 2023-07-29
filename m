Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D8CC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F26682041;
	Sat, 29 Jul 2023 22:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F26682041
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gu7bSbKo5y6E; Sat, 29 Jul 2023 22:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9591382037;
	Sat, 29 Jul 2023 22:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9591382037
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65D1C1BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C6868202F
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C6868202F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lPZzD2267bv for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:16:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 353B28202E
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 353B28202E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DBEA240002;
 Sat, 29 Jul 2023 22:16:19 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:16:16 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230730001616.7d5946ae@windsurf>
In-Reply-To: <20230325203808.1272652-1-giulio.benetti@benettiengineering.com>
References: <20230325203808.1272652-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690668980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB1883sS7UlRg+6HquAaoSXcKiRraJ2SS9d1smxMYIs=;
 b=eCpjD8/TnkQSAoi6bzRwqYH9QtnlerSo31+tk/TAyuw2zMghvJXN5GffoOD08VIRu7rvfz
 FryERG7Bd1rnNUhugVDxcatHvP+hGPPuKTdXUdhOKJOlFM1a2uW9eCKp01ccZ2CsA1bbrI
 dTfqXCb63VLn2Bn21P/0ju8sEDi6Vy+EdBLJhlfc8aQLVdOQYr7x9VWhTOgEN2IGIZagHZ
 VGsKu7MwLw3tpd2m5N+aaW4AzHG96HJ91Vi1UevYiFczb7zp+hYSJiS3+S8MUMZ6xOfiyM
 t+r5DlrgIzL7iS6YIkMBarhC1EZmt4u/gF8RJdU0AkUe1ncKNES4ftj7lYD+Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eCpjD8/T
Subject: Re: [Buildroot] [PATCH] package/bind: fix build failure due to gcc
 bug 101737
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

On Sat, 25 Mar 2023 21:38:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> The bind package exhibits gcc bug 101737 when built for the SH4
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
> To achieve this we need to correct the override of CFLAGS by using:
> BIND_CONF_OPTS += CFLAGS="$(BIND_CFLAGS)"
> instead of:
> BIND_CONF_ENV = BUILD_CFLAGS"$(BIND_CFLAGS)"
> since the latter doesn't work as expected and doesn't override CFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e7b/e7b9a4cbee8bb16431609182b96d1ac1ccec10e7/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/bind/bind.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

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
