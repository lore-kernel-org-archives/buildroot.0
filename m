Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FCEC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 10:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2CA980BCC;
	Mon,  5 Aug 2024 10:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29hRxB8smoHX; Mon,  5 Aug 2024 10:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D294C80BD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D294C80BD0;
	Mon,  5 Aug 2024 10:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84BD91BF3C2
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 10:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71B8B40150
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 10:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzyfPzBRXD2H for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 10:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08314400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08314400F1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08314400F1
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 10:02:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC429C0003;
 Mon,  5 Aug 2024 10:02:07 +0000 (UTC)
Date: Mon, 5 Aug 2024 12:02:06 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240805120206.6da2d1a9@windsurf>
In-Reply-To: <20240216131815.318315-2-buildroot@bubu1.eu>
References: <20240216131815.318315-1-buildroot@bubu1.eu>
 <20240216131815.318315-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722852128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0aGU2oVmuZrIxiW1PPhCaKzwUx5GxrdzwtnT1zcZXY=;
 b=FXlSF7EjvtjGpTJpewbHKbIC8GaMEB1kg7YnGcs26eVqUFbV8hnGv20n/HR1by/yH3WpzW
 CGhtbyX10lWBFb0IJWqBMWww7fedbXG0w/js0WSauzm/ECsMwVnO+2C0KDHyILg+mNxp32
 P+KgzHFiPZeie20yjtcpeEN7t21oHdHOV4ss9idh5tUJjU/8sfLvrqLtbDoDbvXX2RLaNp
 tbrKcCg21ZWMj/XmFUjFIme/bvpksswx4/d8itobuUzRPdWjbT2bcjFssvy6gaDw6Wu3ZQ
 xAxmCAZPs+feUlKug/KaLL352Ac0zx35X01ukAwvAUmmZsXK7iidfcv2T3usIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FXlSF7Ej
Subject: Re: [Buildroot] [PATCH 2/2] package/python-whitenoise: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Fri, 16 Feb 2024 14:18:14 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
> index 0973467a2a..ac1dc81359 100644
> --- a/support/testing/tests/package/test_python_django.py
> +++ b/support/testing/tests/package/test_python_django.py
> @@ -36,6 +36,7 @@ class TestPythonPy3Django(TestPythonDjango):
>      config = TestPythonDjango.config + \
>          """
>          BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON3_PY_PYC=y
>          BR2_PACKAGE_PYTHON_DJANGO=y
>          BR2_PACKAGE_PYTHON3_SQLITE=y
>          """

I'm confused about this change. How is this related to whitenoise?

I see in reply to PATCH 1/2, you mentioned:

"""
The django test (and the whitenoise test introduced in the next patch) 
actually both currently fail because of a problem with django 5.0 and 
.pyc only installations. [1]

This now has "release blocker" priority at django and a proposed patch 
(that I tested locally but hasn't been officially submitted to django 
yet) so hopefully this will be fixed with the next django point release 
in a couple of weeks.
"""

But now PATCH 1/2 is merged, but not PATCH 2/2. Could you clarify this
aspect? Is master broken because that snippet of PATCH 2/2 should have
been in PATCH 1/2, or?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
