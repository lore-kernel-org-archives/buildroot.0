Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AE2C25B5F
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B528B40497;
	Sat, 11 May 2024 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LK3-Zc-hTHD; Sat, 11 May 2024 20:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A406640BD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A406640BD9;
	Sat, 11 May 2024 20:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C13F1BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A445403F9
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln24pFo9KSMt for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:52:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B003440BD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B003440BD1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B003440BD1
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:52:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 616AAFF804;
 Sat, 11 May 2024 20:52:35 +0000 (UTC)
Date: Sat, 11 May 2024 22:52:33 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240511225233.63ae5325@windsurf>
In-Reply-To: <Zj9dqE81OyLJmnGa@waldemar-brodkorb.de>
References: <Zj9dqE81OyLJmnGa@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715460755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrXhNiLVyMb/Oa+D7UWAxGvaMIzMfGkrJK4rEMWGhVg=;
 b=WWgK7cxrs6HsGYJl05YALfeCLI0aUUoJE6a1n6BAB4kbZeXFE9H0kUvaO7FE/4ZK2Lvn4O
 1jPH094+eML4xddk6RXiX5Jo4SNx3BybKJ1m3N0AeWFGxmAv0Ul6UyP2HCvvosR0GVxzVE
 Qkub+I/ex3KrvxphPcCWZFv6tVq1JvYZPXjP7fkJGBof5hHOluGkgSRTqZYss7LC4iOFfQ
 O83pSncyDBdIq7q4CqAoSjmhHhbKYuByTF8ZxqpsYIU5oOFmgCTHbcJlPbgvHa7VFvGJgi
 wur0++htCZyJLRoFeQ8CzxILH8WhPvCz1Ty8zqMWOV9cCcZN/DFyVxvQfSTOXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WWgK7cxr
Subject: Re: [Buildroot] [PATCH 3/3] package/gcc: remove version 11.x
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 13:59:36 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Now that gcc 14 was added, we can remove the oldest version of gcc.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .checkpackageignore                           |   2 -
>  ...-mcmodel-option-to-handle-large-GOTs.patch | 204 ------------------
>  ...-cmodel-large-when-building-crtstuff.patch |  64 ------
>  ...TRANT-for-OpenRISC-when-pthread-is-p.patch |  35 ---
>  ...le-split-stack-for-non-thread-builds.patch |  26 ---
>  ...-machine-names-in-__has_include-.-PR.patch | 124 -----------
>  ...ine-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch |  49 -----
>  ...add-.note.GNU-stack-section-on-linux.patch | 105 ---------
>  ...emove-crypt-and-crypt_r-interceptors.patch | 140 ------------
>  ...libiberty-Darwin-Fix-a-build-warning.patch |  37 ----
>  package/gcc/Config.in.host                    |  11 -
>  package/gcc/gcc.hash                          |   2 -
>  12 files changed, 799 deletions(-)
>  delete mode 100644 package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
>  delete mode 100644 package/gcc/11.4.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
>  delete mode 100644 package/gcc/11.4.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
>  delete mode 100644 package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch
>  delete mode 100644 package/gcc/11.4.0/0005-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
>  delete mode 100644 package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
>  delete mode 100644 package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch
>  delete mode 100644 package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch
>  delete mode 100644 package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch

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
