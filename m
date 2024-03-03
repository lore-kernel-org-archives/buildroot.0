Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584A6C5475B
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 22:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD2B240135;
	Sun,  3 Mar 2024 22:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUUU3zSFaMER; Sun,  3 Mar 2024 22:19:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCB374013C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCB374013C;
	Sun,  3 Mar 2024 22:19:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CEFC1BF292
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 22:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A2384070D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 22:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kixrf0_NrhoJ for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 22:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6345C406FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6345C406FE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6345C406FE
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 22:19:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C8511C0002;
 Sun,  3 Mar 2024 22:19:13 +0000 (UTC)
Date: Sun, 3 Mar 2024 23:19:12 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240303231912.76c9702f@windsurf>
In-Reply-To: <20240303171115.1140763-1-ju.o@free.fr>
References: <20240303171115.1140763-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709504353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpX/wzG/bj0mEsu2+RmBbxRuqlAg0PuwI5pXXOI6TX4=;
 b=TZaar1i3bYIj3EZoT+UkhRt+dT7P3/ay3s+WBTp5ONhv3cVX3PCyXUWUw9w3evsxqUxZh6
 ctieHreY4ibgHbFSNqrDKXMSKnOUkV1X0VpnvQhdTGCCZRa4SlLOZ4CBVIkmDTFhcswITF
 ydW3wBWITGrhBJLlNSnXjhefIOOOg+5VH76pY8ceFfKs4fgb9R1QuJ7di1CYEEo6qPrK5O
 22Cfbo9l9JQwN7HSBBCdMymtMUZkhxG/RjanvqdJD5PGhG3uygTxwdGpjWc6GcFb8pTX/C
 /hjM15QGBtQaqmG8RLPgLUVyyvUDewEdYVl31z2mP6foJ7JKWdYVhDjRh+zrRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TZaar1i3
Subject: Re: [Buildroot] [PATCH 1/1] package/efivar: bump to version 39 to
 fix build failures
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

Hello Julien,

On Sun,  3 Mar 2024 18:11:15 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Those failures were introduced in commit f24029b561 "package/efivar:
> bump to version 38". This is because efivar introduced a usage of the
> qsort_r() libc function, in upstream commit [6], first included in
> version 38.
> 
> Musl libc added the qsort_r() function in upstream commit [7],
> included in version v1.2.3 (2022-04-07). So external toolchains
> including a Musl older than this version will fail.
> 
> This commit fixes those build failures by adding a dependency on
> !BR2_TOOLCHAIN_EXTERNAL_MUSL. Technically, this dependency also
> excludes external Musl toolchain _with_ the qsort_r() function, but
> there is currently no way to check that.

I think we shouldn't do that. Instead we should update/change the musl
toolchain used in the test-pkg testing. Possibly by using a Bootlin
toolchain instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
