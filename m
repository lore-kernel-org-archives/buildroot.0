Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654DDC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B2CA40BAD;
	Tue, 16 Jul 2024 12:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdLl0fOwfwDU; Tue, 16 Jul 2024 12:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE94440B99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE94440B99;
	Tue, 16 Jul 2024 12:41:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 066D91BF38A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F215140BCF
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yp4M4PqKCktz for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6A0440BBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A0440BBB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6A0440BBB
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:40:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C926DFF804;
 Tue, 16 Jul 2024 12:40:39 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:40:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240716144038.61373dce@windsurf>
In-Reply-To: <20240611152202.951202-3-james.hilliard1@gmail.com>
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
 <20240611152202.951202-3-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721133640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npK6gW1n89iFZboCU2V2HziV7E1CA38CfiuERasLEcw=;
 b=aHWQuIevTRyqoEuPwW47A/Iin49wcdK0Vsst8K0TEz0GzZCfzHPbi2hpDeKbDOieccmjRJ
 RD9bjJPWultgNUpoULtLaZQAHMS+fk+mW7JvTsO72ya9JPHxCK00nd5pcYyMOqi6wdaXQw
 QVb/yucUHsLUDeFo+MDh5thOIKjgrpIvQ1TGeUaPsJdlLU8kjpN89mcdS4yk3IE5pw9zAz
 ExeiQsiYbMqzAnn79fvfEf8LyiDIly03dw37yLWQQo2/VPRKNRhIKdPxkPpWoSbVHa+k0A
 tzUZ3P2U2JOV8qiOODUgCsLek6Lnpmv4RlRXhk8ymqYXdy5rsuPpObJiFt2cuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aHWQuIev
Subject: Re: [Buildroot] [PATCH v2 3/4] package/flashrom: install to staging
 with meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jun 2024 09:22:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This will be needed for the upcoming fwupd flashrom plugin to work
> as only the meson build correctly installs the pkgconfig files
> needed by fwupd.
> 
> Drop Makefile patch which is no longer relevant.
> 
> Backport a patch removing _LARGEFILE64_SOURCE which can result in a
> redefination build error.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...G_INTERNAL-depends-on-raw-mem-access.patch | 35 ---------
>  ...et_enable.c-Drop-_LARGEFILE64_SOURCE.patch | 38 ++++++++++
>  package/flashrom/flashrom.mk                  | 74 +++++++++++++------
>  3 files changed, 88 insertions(+), 59 deletions(-)
>  delete mode 100644 package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
>  create mode 100644 package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch

Applied to master after:

- Splitting into 2 commits: one converting to meson, one adding staging
  installation

- Fixing the build, as it was failing on non-x86 platforms: a number of
  flashrom programmer driver can only be built on x86 and therefore the
  build was failing with things such as
  "output/build/flashrom-1.3.0/meson.build:475:6: ERROR: Problem
  encountered: rayer_spi selected but not supported on this platform"

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
