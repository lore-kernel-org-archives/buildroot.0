Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15995C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6661081343;
	Sat, 13 Jul 2024 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeLWG43iM5El; Sat, 13 Jul 2024 21:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B7EE81380
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7EE81380;
	Sat, 13 Jul 2024 21:06:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA4CE1BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1456410E1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cl1EunS95euO for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31A9A41295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A9A41295
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31A9A41295
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:05:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46FE8C0002;
 Sat, 13 Jul 2024 21:05:58 +0000 (UTC)
Date: Sat, 13 Jul 2024 23:05:57 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240713230557.40899b68@windsurf>
In-Reply-To: <20240519091627.2195972-2-thomas@devoogdt.com>
References: <20240519091627.2195972-1-thomas@devoogdt.com>
 <20240519091627.2195972-2-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720904758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Byq4FPPHGsppGWT+XLS1l0JY2RFFdxrQ4zSR+g94vU=;
 b=HAUW8J0TDc6n85RVI93oKCQwOzTTyQsYPdZq57gaRuR/4izlF9+imCJnnzSzh4zO99cXsh
 4gwvddbGDo7y9l7+EI3fsoBVKkScxRFnPOjktOXOCepvZwoi5kSFrlgBfYS3ex3ZLBUTYv
 NnJoc24NtfUhyrYRyZ+oGmjfSbvjtxru+9OarjhDZZPtKUOEuUBiBCMFv3xIBtOMppCi05
 DYHVHTJCQ4g1wmWS/+puhMiF0hMHXi/GvaNswl+pWU9/zprbQSGtsNWBrmNzmledigtNQO
 EdFzKjRsnj8a88PHXlQyU5GUmX1i9WgZBoGDDWy6kaQ+Eqf6gQWqMauz2Cc6BA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HAUW8J0T
Subject: Re: [Buildroot] [PATCH v4 2/2] Revert
 "package/x11r7/xlib_libxshmfence: disable on riscv32"
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 May 2024 11:16:27 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> This reverts (partial) commit e39ad96136a8c340b3aea6b036024e28f14584f3,
> and 26642e4cc09666110d5105e7867579a0e48cfa09.
> 
> Fixed by 0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v4: move xlib_libxshmfence to separate patch series
> ---
>  package/mesa3d/Config.in                    | 6 +++---
>  package/x11r7/xlib_libxshmfence/Config.in   | 3 ---
>  package/x11r7/xserver_xorg-server/Config.in | 3 +--
>  3 files changed, 4 insertions(+), 8 deletions(-)

Applied to master after remove a few additional !BR2_RISCV_32
dependencies that were no longer needed thanks to your PATCH 1/2.

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
