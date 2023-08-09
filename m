Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827F9C001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC1A4025F;
	Wed,  9 Aug 2023 21:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FC1A4025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7F4bWxX9tWFi; Wed,  9 Aug 2023 21:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01938400B2;
	Wed,  9 Aug 2023 21:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01938400B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8DB81BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80AD14017A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80AD14017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-yHGgOBO2tn for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:43:04 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57E9240029
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57E9240029
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82F59C0003;
 Wed,  9 Aug 2023 21:43:02 +0000 (UTC)
Date: Wed, 9 Aug 2023 23:43:01 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230809234301.02acbc04@windsurf>
In-Reply-To: <20230809212345.1338243-1-giulio.benetti@benettiengineering.com>
References: <20230809212345.1338243-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691617382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAgwK03MsTps13Ytt6ETyWKGzP+bjs/aAJw9U90R06I=;
 b=jhi6lsUg++pD9DngdY8JfdlkdxVarfILG+WMDGwKMkN+m56PoV5wXteN3ouONqsezdCMXf
 OgryX1yXuHujo90KyeutylYVPVs6kvsosK0rHQsW4nC2+DIUAcnQZKm/gaqa0/cavA7lzm
 Bl0IIUokPHEet5Vysy5FD95xYihaBoy0fWHcXuPotBgxYoqIdemm/9Qiksf/w9DXdz6Zhi
 HWZSVn5EBnTN/S22Gvuu8A0raEagjBxH+3rN3K6ymnDg58LubB+RFfjaHk2Ah1zs3bcOkU
 yyOdNWYyW1VragpJ6K778dNYyf39f6rnAQ+LHAT20pfuG/FQitU57KbqwWVhTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jhi6lsUg
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure when
 Linux CONFIG_PM is not defined
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

On Wed,  9 Aug 2023 23:23:45 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch pending upstream[1] to guard structure member wowlan that
> is only present if CONFIG_PM is defined.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d47317640de39baabeefb8d9e04fa7f3e2dc873a
> 
> [1]: https://github.com/espressif/esp-hosted/pull/254
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...st-fix-build-failure-when-CONFIG_PM-.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch

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
