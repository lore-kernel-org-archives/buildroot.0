Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDE2C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A3580A60;
	Tue, 23 Jul 2024 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WsKydwzWFb9; Tue, 23 Jul 2024 20:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FC380B6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FC380B6B;
	Tue, 23 Jul 2024 20:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8221BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3939B40319
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZFs83v-zFES for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:21:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E665A400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E665A400F6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E665A400F6
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:21:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D2A3E0004;
 Tue, 23 Jul 2024 20:21:38 +0000 (UTC)
Date: Tue, 23 Jul 2024 22:21:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723222137.7269bb00@windsurf>
In-Reply-To: <20240723193314.333631-1-fontaine.fabrice@gmail.com>
References: <20240723193314.333631-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721766098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKKi6zxbki2gMiDW+9gQKFWWf11gO55jjUjV1/LBW1c=;
 b=j8xVpZXNi6PAeIuAJ9yZRTM425x2r65YAuEv8f7qrFMHQ4qW4Us4XXzfBiaYqIq80Dolhv
 oXl8epWtCaGIxkgixR4M2Z715JiRAvd41li9SuNI32Hg1aRe55EtOkzkJy0C6n4s4qvm02
 937H4w81Ggl/718DjNxVXUZp+ZHiMob0+ySeGk2Hd224xM0Mucq0LDJJQiTq+9Boc3Qpfn
 1WN+OdjBWF3uWZO0eq59GqjcpTrdM+ywQbsCKAl9Hz8e+28RbPDKa16Z188QAUvLGwr1DK
 /yXmLXg0TCv4lsek/lg57EQuAb91Dv5Ehi0qbHcVhhQAgefHH4x0ohh5PnN+YA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j8xVpZXN
Subject: Re: [Buildroot] [PATCH 1/1] package/libdex: needs ucontext
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue, 23 Jul 2024 21:33:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
> +	select BR2_PACKAGE_LIBUCONTEXT if \
> +		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS

This should be:

	select BR2_PACKAGE_LIBUCONTEXT if \
		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS && !BR2_TOOLCHAIN_HAS_UCONTEXT

so that when the toolchain has ucontext support, you don't needlessly
select the libucontext package.

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
