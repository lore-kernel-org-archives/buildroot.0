Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9B2D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA5F4094C;
	Sat, 26 Oct 2024 16:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmzzS04R1sef; Sat, 26 Oct 2024 16:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7C240CAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7C240CAB;
	Sat, 26 Oct 2024 16:40:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C7C5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6BD140C13
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RCUUO7v7Awh for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:40:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9148D40C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9148D40C0B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9148D40C0B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:40:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 276101BF205;
 Sat, 26 Oct 2024 16:40:08 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:40:07 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241026184007.0d0bd27d@windsurf>
In-Reply-To: <20240815135649.462812-1-ju.o@free.fr>
References: <20240815135649.462812-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729960808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2guwPWJkMfhi29PDqd/c4i16xzfyExDrhuKuz94kg0=;
 b=NgINQfJ2s4zIwpmYpjMDaBsYcFxmdhfgDRaOmIS/DtepxUQYxUA6qqC4cd1ZuZHCG4vwDO
 +gKpzKLWED7XBJ5w8bNGHWmHo3jx7mgvyegVkzSty2Q+KYpWCXRQAYq+bLtVR6GwrIfmmA
 sGWTk8Zbj2oR+QiZYv3Ijvvo346/uNgoHR2KI4LuH3x65uGQ7kv+5NoH8UCU8JVhwjXX5u
 LGQ9WIuz9qs0/PxZGxjv/r2utTvic0PlDn/ViVUaP0wQPl07CPPSow20PvLGQjiujcJ0Ra
 c6euJjRNhycWghW6B4i0uXiWqLLXsQmEywESFWtGR2H9SWEG7FsA0Y+v3EPAsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NgINQfJ2
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add unbound runtime
 test
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

On Thu, 15 Aug 2024 15:56:49 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7592103034
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_unbound.py | 79 +++++++++++++++++++
>  .../rootfs-overlay/etc/unbound/unbound.conf   | 17 ++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 support/testing/tests/package/test_unbound.py
>  create mode 100644 support/testing/tests/package/test_unbound/rootfs-overlay/etc/unbound/unbound.conf

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
