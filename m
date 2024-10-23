Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E9ECFA478
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCA9B402D6;
	Wed, 23 Oct 2024 21:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voLkw4lp7ggY; Wed, 23 Oct 2024 21:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B375A402B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B375A402B7;
	Wed, 23 Oct 2024 21:13:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68720972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E5E40A6C
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbpJ5cEkCNNh for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3867B40294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3867B40294
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3867B40294
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:13:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02C71E0003;
 Wed, 23 Oct 2024 21:12:59 +0000 (UTC)
Date: Wed, 23 Oct 2024 23:12:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241023231258.149d7818@windsurf>
In-Reply-To: <20241008215815.3762594-1-james.hilliard1@gmail.com>
References: <20241008215815.3762594-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729717980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZlpeJayPHgclweNmL9/dVq2EtQcwSKS8ZvwY4BQUb4=;
 b=LpMf9wOf2+vNaW1iG3ARHrffqLLqQMMJ5nlRgZv06lGdIQUyjiH3IaiM9vjwmT/ppnFaHE
 rtv9iSRAOjiuQzrASfP8ZIwkqtLltK1xqIhwpQI4e9GAaHkIPWxemNmsiv+mZgb8lFYrKB
 nZtwz399HV7Qvh0mJrFXghxx5dvYDNJnMqzDXhjq16M8fHr4r1VXJ3JRbzOzyDfIsRwlKX
 kcaWQ4SChy0gr8+sVqGKhjFioUzKjDml8HeVoWGH7hmq1b80+x00V6XvoAgYvT+7ANA0zY
 S8Pdp39EcmeeNZN/XRkb4PvJpxE5EGouI6KsK613hccINhQPXrCYguTEUhA5Kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LpMf9wOf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-psygnal: new package
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

On Tue,  8 Oct 2024 15:58:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-psygnal/Config.in           |  6 ++++++
>  package/python-psygnal/python-psygnal.hash |  5 +++++
>  package/python-psygnal/python-psygnal.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-psygnal/Config.in
>  create mode 100644 package/python-psygnal/python-psygnal.hash
>  create mode 100644 package/python-psygnal/python-psygnal.mk

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
