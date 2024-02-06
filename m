Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DE3C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49DCB41C03;
	Tue,  6 Feb 2024 22:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuC3jvAyOkMh; Tue,  6 Feb 2024 22:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513F841FA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 513F841FA5;
	Tue,  6 Feb 2024 22:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28E9B1BF5A4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F57540332
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SR3wR6WEk_CB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A4044031E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4044031E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A4044031E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:33:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2727240002;
 Tue,  6 Feb 2024 22:33:18 +0000 (UTC)
Date: Tue, 6 Feb 2024 23:33:18 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240206233318.593730bd@windsurf>
In-Reply-To: <20231218220457.1705749-3-adam.duskett@amarulasolutions.com>
References: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
 <20231218220457.1705749-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707258799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDJK7h/nnUeKplyGSYrnTOFVLWRq678LTDCX65/YCh4=;
 b=GIfcQMTIV6fYdrob68DBpQjYQ2MJkVgAyiDbZ4ByutXKfMs3Q6kd7E5NyX7MIXdwksOLun
 SqX3OmmhgEDaWurI7X43szG3TlNts3rQrF8JcgddWii98b64TjfYKFcsl+B5fOqVpqeclu
 fhVuvHah4hxixyRoHJruOxZcsSIiQTX9ZDlCa8An7OZ3wnOcvZnEgZpcbBXwrEBuzciRzw
 ZlMye4mYcaCvAi9IQP6sCit1cnhvA4GASvv4qJr0zDG6ucEz7qqBeRxPr1BP91E1So1RI+
 9bSNZofZkW8Sl6aCZsVW0sSZ2ZCr/xTwqZnWkWbsXbFdAfCxeRgwvU/KFZQ4ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GIfcQMTI
Subject: Re: [Buildroot] [PATCH v4 3/3] package/python3: bump version to
 3.12.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, 18 Dec 2023 15:04:56 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Python 3.12.1 has removed distutils support. As such, we remove the distutils
> option from pkg-python.mk as well.
> 
> Tested on Fedora 39, and Debian 11. All 68 package tests pass.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v3 -> v4:
>   - Drop distutils in pkg-python.mk
>   - 3.12.0 -> 3.12.1

I applied, but after doing a number of changes. The most important one
is that I had to reintroduce some of our --disable options: for
ncurses, sqlite and expat. Indeed, without these, you ended up with the
Python code installed, but not the correspond native library (the
py_cv_module__<something>=n/a only disables building the native
library).

I split up the pkg-python.mk change into a separate commit, which is
made before the python 3.12 bump. Indeed, it's semantically separate.

Finally, I updated the Buildroot manual to no longer mention distutils
support. And I did a separate commit to update the Buildroot manual
with other _SETUP_TYPE values that we support.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
