Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A19AC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 423BE606F3;
	Wed,  7 Aug 2024 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpQoFfw9MwnX; Wed,  7 Aug 2024 20:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E053606C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E053606C8;
	Wed,  7 Aug 2024 20:59:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3CE51BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E11E160805
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMe22NsmAZMg for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C159960811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C159960811
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C159960811
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:59:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A64F21BF206;
 Wed,  7 Aug 2024 20:59:06 +0000 (UTC)
Date: Wed, 7 Aug 2024 22:59:05 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20240807225905.63f4c0b2@windsurf>
In-Reply-To: <20240807145517.3019024-1-zgyarmati@zgyarmati.de>
References: <20240807145517.3019024-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723064346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXPo8UlndfVtGdaf/GWUF0x5KyYFLDDqTtwmHWJ5JXI=;
 b=RMLRB46RVSEjdP1Aepm4LVVo9pbGvWwF8s7y5h3Z2XF7QtS+RKJRt71akHjiKAF90vjcBN
 ULKesaX5akiy3KvKVZyiIGWorqAddbSstG5np/TuRMe68Eylh/YzdKVH9f1bbvUaNyaUA+
 17ftdQ8wtpwH6nRMz2IP5B2Pswi+AJhgA5tIrbUjlLbSMcOgCr9wfVCxlJv8QijQmduCx2
 D98Htu7MO/loK0wSagNXKB0Vz1F43F+QqLKsSZviE1V2X6BtbQxnyMt6dOxphpxB8JuHP1
 7fCMUDQ24giaY92fHvV1KnriNYGkhuinsKzNCpGq2qUCqtjS7m1VBsGfHxh6xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RMLRB46R
Subject: Re: [Buildroot] [PATCH 1/1] package/grantlee: bump to 5.3.1 and
 enable for Qt6
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

Hello Zoltan,

I have applied, but after doing some changes, see below.

On Wed,  7 Aug 2024 16:55:17 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/grantlee/Config.in     |  8 +++++---
>  package/grantlee/grantlee.hash |  2 +-
>  package/grantlee/grantlee.mk   | 11 +++++++++--
>  3 files changed, 15 insertions(+), 6 deletions(-)

First of all, I've split into two commits: one doing the bump, one
enabling on Qt6.

> diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
> index 779306bc2e..a64f8a589b 100644
> --- a/package/grantlee/Config.in
> +++ b/package/grantlee/Config.in
> @@ -1,8 +1,10 @@
>  config BR2_PACKAGE_GRANTLEE
>  	bool "grantlee"
> -	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5
> -	select BR2_PACKAGE_QT5SCRIPT
> -	select BR2_PACKAGE_QT5BASE_GUI
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6

I've added parenthesis around (BR2_PACKAGE_QT5_JSCORE_AVAILABLE &&
BR2_PACKAGE_QT5) to clarify the priority of the operators.

> diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
> index 6508aa70cc..57061fb03f 100644
> --- a/package/grantlee/grantlee.hash
> +++ b/package/grantlee/grantlee.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  139acee5746b957bdf1327ec0d97c604d4c0b9be42aec5d584297cb5ed6a990a  grantlee-5.2.0.tar.gz
> +sha256  ba288ae9ed37ec0c3622ceb40ae1f7e1e6b2ea89216ad8587f0863d64be24f06  grantlee-5.3.1.tar.gz
>  
>  # Hash for license file
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB

The hash of the license file had changed, perhaps you forgot to check
"make legal-info"? So I fixed that up and explained the license change
in the commit log.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
