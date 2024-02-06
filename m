Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E379AC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 23:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF708420A7;
	Tue,  6 Feb 2024 23:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjeec6ATCwC6; Tue,  6 Feb 2024 23:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79EEC420F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79EEC420F3;
	Tue,  6 Feb 2024 23:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 082971BF2C4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021FF420E4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7D977euoPF6 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 23:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A420420A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A420420A1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A420420A1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 23:01:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC3E440002;
 Tue,  6 Feb 2024 23:01:33 +0000 (UTC)
Date: Wed, 7 Feb 2024 00:01:33 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240207000133.71a948a2@windsurf>
In-Reply-To: <20240206180341.3910-1-fontaine.fabrice@gmail.com>
References: <20240206180341.3910-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707260494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLwrIkbomxGMBAJKxvAfdMYSNmeWqoKuqzBS1425ERw=;
 b=aFcN99UpFRaTiVe36tzzVh0ArGZEx3D4SRnfS0nzJrkrJB5FSZecChfxsWJEoYI4KK6ngV
 4l3PrWDkMWcR/vizof8hwYRwSooEsLNc5IiEsHYLXP6tCKVjXR33eb8bOL7A3yL5tFiGaP
 L3HuHDOI2rqHumO4LdVFNBqifDIGzhsIPIEsShuIijh400So7oltPrtwjMB0djbuHGDxXm
 9h/DiBkPtvNLjUL7nTJ4lO4rzcywz/1Fm3DN7Jbz4hZabKrrfqIyqNdA5KjcM4uSW0N7bK
 q0WHrQ4qoqvJhNaZ0NBUnoUft+jG/oo490AYb3/D6soKHP9v7Huxy/Sp8j3Csw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aFcN99Up
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: fix musl build
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

On Tue,  6 Feb 2024 19:03:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure raised since bump to version 1.6.0
> in commit 7794fa4c4e1d19a245bb0367cde94560432a2bc5:
> 
> pam_namespace.c: In function 'process_line':
> pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
>   649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
>       |                                         ^~~~~~~~
> pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
>    40 | #include "argv_parse.h"
>   +++ |+#include <stdint.h>
>    41 |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f07360f33010a2cf19aace266faae14a834bd9a4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-pam_namespace-include-stdint-h.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/linux-pam/0001-pam_namespace-include-stdint-h.patch

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
