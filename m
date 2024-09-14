Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE1C021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 779728415B;
	Sat, 14 Sep 2024 18:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ch1BfzeQNYTu; Sat, 14 Sep 2024 18:05:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80BB98415E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BB98415E;
	Sat, 14 Sep 2024 18:05:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70C121BF283
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FBD8403BE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sga_B_1FFnAQ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:05:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26AEC400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26AEC400D1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26AEC400D1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:05:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA81820002;
 Sat, 14 Sep 2024 18:05:32 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:05:31 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240914200531.7852c5f2@windsurf>
In-Reply-To: <20240824141935.209950-1-ju.o@free.fr>
References: <20240824141935.209950-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726337132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3QBAR+Qq/JufZjsQTwK5TGzvQOkDdvksWssy3rE7xc=;
 b=ep++1LsyluiAff3AK8zT8V8q38XeCfn1TiWjoVti4JBUVbNI2xudZBZCHV7OWxdEBaxZ0c
 YV/6n9Kq+OW8ACfOenobVYGldRvzoG2q5GVfK8kTMfxZ2rlx+agE3h7E6aeHnAUYknoebz
 LPLLCH8nnpM5ocXMcSkulZbUDNtGhUchpk6rnFLXsexFcFP/Yp5nxMEPCClcyzsSI6RsSx
 QydYS+gsc92M1LTC/nlnFMtS9gNBo6N9vXvemJ49LKNhH7s11gPrBA1DkDt45UbZBRddH9
 fQFM/bG5hM5g24G26Eh/zJvUDvAEgyaorrhgXuVrDDoviKTvzDcYxZsyCaPTnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ep++1Lsy
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add pv runtime test
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

On Sat, 24 Aug 2024 16:19:35 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7657843473
> ---
>  DEVELOPERS                               |  1 +
>  support/testing/tests/package/test_pv.py | 57 ++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 support/testing/tests/package/test_pv.py

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
