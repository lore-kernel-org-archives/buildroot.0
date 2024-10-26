Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9702D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D6C940167;
	Sat, 26 Oct 2024 19:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ahrs6Iv8rsLa; Sat, 26 Oct 2024 19:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF11401A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF11401A3;
	Sat, 26 Oct 2024 19:03:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 595065C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 487A281158
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01VGVd0z-xg8 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC3A6810F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3A6810F8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC3A6810F8
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:03:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7AB6C0002;
 Sat, 26 Oct 2024 19:03:51 +0000 (UTC)
Date: Sat, 26 Oct 2024 21:03:50 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: buildroot@buildroot.org
Message-ID: <20241026210350.1066020f@windsurf>
In-Reply-To: <20240919125820.3583-1-tianyuanhao3@163.com>
References: <20240919125820.3583-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729969432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNJGzfJInhBujyKlwsmgxOAMOTq0vX0R/HCnmIzlUeU=;
 b=OYIm4MM/3uvZ0kfOy8Y4y0IsqXPX4IZ2fngbfSa2SovtELHT6VqU0JVEraPaTu5Gt3hjaR
 uxdTwf0UHqeyd2Nv2Lf0+T9yMdDETYnIfwKNzkGA5kqYZQyRICIJJ17yqWJm6n5lKjnShv
 c4IXfqILbAJTj5Ttv4LHqAr3e5YmQyk01PlXDDNqGbcnP1i+3OsV+7xOJLWV7LF06rSo7Y
 fkX3t82GTwmMFab98lLHweVZYmhYA+hGlaJyIGkLobWqMq9FP3YGlmY9xiXTbWKubmrj0U
 PBlJoGJCyF8x8MEavVblHKtukD/YW55jJTJeTBJAUKwcrryEn6JXhPqkg7Gjcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OYIm4MM/
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: set the permissions
 with CHRONY_PERMISSIONS
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

On Thu, 19 Sep 2024 05:58:20 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Fixes:
>   chronyd[241]: Could not open /var/lib/chrony/chrony.drift.tmp : Permission denied
> 
> Refs:
> https://github.com/jens-maus/RaspberryMatic/blob/3.77.7.20240826/buildroot-external/overlay/base/etc/init.d/S46chrony#L44
> https://github.com/troglobit/myLinux/blob/5ab2ec53d70904b1c3f2570afaa31eeaa4c4487b/package/skeleton-init-finit/skeleton/etc/tmpfiles.d/chrony.conf
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/chrony/chrony.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks. It would be good to add a runtime test in
support/testing/ for chrony.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
