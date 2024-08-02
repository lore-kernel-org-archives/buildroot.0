Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD5AC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88082606D3;
	Fri,  2 Aug 2024 21:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50vG_G2FXcGL; Fri,  2 Aug 2024 21:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F3E61315
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F3E61315;
	Fri,  2 Aug 2024 21:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8461BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8306A400B5
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6_E4c7Wx2py for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DFE340286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DFE340286
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DFE340286
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:41:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 455FE20005;
 Fri,  2 Aug 2024 21:41:20 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:41:19 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240802234119.40238af4@windsurf>
In-Reply-To: <20240725073908.598145-1-fontaine.fabrice@gmail.com>
References: <20240725073908.598145-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722634880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkfCz0gZ1MX+o7RQuv/dTUoSZXsgByLNkWHWKSijlwU=;
 b=XP4QqXilWhxwTqWrZterv6XkXo7cAws6WlJWY9xDeXKMCHJx0p2Xi5IesR2M9PEfj6AFhO
 tqqCtam/yC49SaiA1xyjs0lN4O4y6HuruqwP74/iY8aSu6zDBmwcoT0z0z7W2eEHeAWm7A
 se5k9/wM4hZC/V+wpecm456jE9U11zhJriJzmKoSvAabvSA3a85sTslW2wlrokv40m2Asy
 wRaK4/6bj4nnagTW0DzqkPZ3nHqG1ZpNbF9W3c+2Iyl/tw4+E1ekbiTcGFOeR7vzGJ10F6
 CE9MkWqCJKrJE1COY19h/c/OJOaPDxVH6Sd7cJ6CoBxkJun3rWTHpdkTr/aMpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XP4QqXil
Subject: Re: [Buildroot] [PATCH 1/1] package/mokutil: force libopenssl
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 09:39:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mokutil unconditionally uses X509_get0_subject_key_id resulting in the
> following build failure with libressl since its addition in commit
> 2e6e121496bfcbe09c018558be13733077b6df9b:
> 
> /home/autobuild/autobuild/instance-18/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/13.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: mokutil-efi_x509.o: in function `get_cert_skid':
> efi_x509.c:(.text+0x4e6): undefined reference to `X509_get0_subject_key_id'
> 
> Fixes: 2e6e121496bfcbe09c018558be13733077b6df9b
>  - http://autobuild.buildroot.org/results/88b549734eae4b25de1b8e1c4f04bace0a7e7418
>  - http://autobuild.buildroot.org/results/05ac319bfb2a252f3dcdc5d04761f276afb53b6f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mokutil/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
