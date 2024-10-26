Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC0AD10BF8
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16362400EA;
	Sat, 26 Oct 2024 13:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Cd7KkyHMuR7; Sat, 26 Oct 2024 13:01:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9CD8400F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9CD8400F9;
	Sat, 26 Oct 2024 13:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EFBF5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D1868088F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL_tEqEuh1nU for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4162380885
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4162380885
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4162380885
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:01:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1E2660002;
 Sat, 26 Oct 2024 13:01:17 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:01:16 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20241026150116.691974d5@windsurf>
In-Reply-To: <20240930223133.1202389-1-james.hilliard1@gmail.com>
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729947678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jF9B6UVoyxITVmOLz9UadZ8PWzcBzoNF6UyU7aVYXok=;
 b=fKjQcn+Qj6MMyBEcf/D7roNZU78q3BTOBT+FZX0a8SeoB2cq2x8ZdizdVPQia5qDU2w5w4
 j/S1IP320IxCpGB+c8wJg/QDHM6ERSYVRwqXMTaAfxQvlmxGSCA+fdW3nWABANcxrzLKPM
 jDaTVJ4+mQz90+W9ypZLvQUe/KyQYZSUegO2bO+9Y2waB/kVmO096KAf1Ht9PxeI+dIdC0
 BmMAu7KPq2f9B2jC+b7Ee2AbnD2+aV2kFmMK9ejWr3MAML8tGOQSWpaYTS4IImr94Rbq3z
 zhDMBdsvCKKk3oTmSUOZsSIgG2XOjknHUuhiY3i8xnK3Ynah/kTsaCsluQYEXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fKjQcn+Q
Subject: Re: [Buildroot] [PATCH 1/4] package/qpdf: bump to version 11.9.1
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

Hello James,

On Mon, 30 Sep 2024 16:31:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qpdf/qpdf.hash |  4 ++--
>  package/qpdf/qpdf.mk   | 31 ++++++++++++++++++++++++-------
>  2 files changed, 26 insertions(+), 9 deletions(-)

Thanks for this patch. However, I am not sure this conversion to
cmake-package is really complete.

> -QPDF_CONF_OPTS = --with-random=/dev/urandom
> +QPDF_CONF_OPTS = \
> +	-DBUILD_DOC=OFF \

This is already done by cmake-package.

>  ifeq ($(BR2_USE_WCHAR),)
>  QPDF_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DQPDF_NO_WCHAR_T"

Are you sure this still has an effect with cmake-package?

>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  QPDF_CONF_ENV += LIBS=-latomic
>  endif

Same question (and I believe it doesn't have any effect).

Could you review qpdf.mk more thoroughly and check that what was done
for autotools-package is either removed if no longer needed, or
properly converted to have the same effect for cmake-package?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
