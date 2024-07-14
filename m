Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FB0C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815FD60786;
	Sun, 14 Jul 2024 15:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXvI5deFGAEx; Sun, 14 Jul 2024 15:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9451A60812
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9451A60812;
	Sun, 14 Jul 2024 15:08:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94CA81BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82661811D6
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXIxvJ9NrUGy for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69478811D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69478811D4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69478811D4
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:08:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C30FE0002;
 Sun, 14 Jul 2024 15:08:44 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:08:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240714170843.5643ffc9@windsurf>
In-Reply-To: <20240713200501.564630-1-fontaine.fabrice@gmail.com>
References: <20240713200501.564630-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FsREVTpgiBZp0Tw8QKPTIFc8kSZpQtTjnBvJHNBPnU=;
 b=mcRpDjjRhL54IGwElhZv2ZN0HdAc+c4OsnwvmGT94dwQdu/FHQiRv8ZGYddrnds6m+Wt0W
 B2dABu01s/L8/dfz2tLqJwk/woRg47lXZ7cViGmq7Q5FTMFb8j2WhG0fEqyuz/MJPHRVQ+
 XrdEkfUYdvMKQHXf56+L44KpSm3MjUJhW0WW6YmLLwRgyapoXCZIAq2t5StJFqbLDsqOvS
 MB4Hhhzsct5pCLVbH/a/IFNhHrBJQWN7s81BQw78c+QQ9TAuaNPap4sQRr1Z0XgIWUZUM/
 0Z1M5suNDz/FU8ggJhdXof2m6qovx17GQ3lBFaKXJ2Si5rXnQTbwX2MzjQHMig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mcRpDjjR
Subject: Re: [Buildroot] [PATCH 1/1] package/libavif: add
 LIBAOMEDIA_CPE_ID_VENDOR
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 22:05:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:aomedia:libavif is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/5F25E3BB-870F-4513-96DB-34FF4FCF156C
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libavif/libavif.mk | 1 +
>  1 file changed, 1 insertion(+)

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
