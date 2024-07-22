Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AA8C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23139400D2;
	Mon, 22 Jul 2024 12:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAg0LJmhlKJv; Mon, 22 Jul 2024 12:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A124053D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A124053D;
	Mon, 22 Jul 2024 12:30:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 827E61BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D90380F5D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3aHqKBK7nPH for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A72580F55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A72580F55
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A72580F55
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:30:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 228D21C000D;
 Mon, 22 Jul 2024 12:30:01 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:30:00 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722143000.42dfb7c0@windsurf>
In-Reply-To: <20240721165717.1996106-1-fontaine.fabrice@gmail.com>
References: <20240721165717.1996106-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721651401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGB7hljGRP5ThGYea2q7Ce9YVSdKyL+9l+duTv0HEGI=;
 b=Bmid3DXJrtQ5B5SbyDIflaGC/lmcrMuy6Ztw+6z9w+dwj18B6YeGWljJnxAvMsNKl0lwbU
 mFW0BCMZSn9XY170AnIBGpfoaoZwxLHc25S5QucOtqiLWelzZWOtCsl90i3BJ5faUsCskQ
 as0zIjaFNGZ5DvfgXqUK5ds7uZN4mGy0YK3M5w5mzQe1izw26RMl43v9hmFMeokmZtoLOm
 ENykIm+M9578XiSYGB0IJpYo8piIi3/lwD6lnmSeidee4P5V2Mk+Q4kX96uDXUmYOwvOK1
 /Fhje1Dg8ihhjFGjN3b1sC7r7pNxjHaB3PpFYihx9pcT1QWsUHIakGkS1A5KAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bmid3DXJ
Subject: Re: [Buildroot] [PATCH v2,1/1] package/gnutls: disable tpm2-tss
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

On Sun, 21 Jul 2024 18:57:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable tpm2-tss to avoid the following circular dependency if
> BR2_PACKAGE_TPM2_TSS_FAPI is selected:
> tpm2-tss -> libcurl -> gnutls -> tmp2-tss
> resulting in the following build failure of libcurl or rtmpdump since
> commit caff4179a4481233257f5f475ca57ce9061af900:
> 
> configure: error: TLS not detected, you will not be able to use HTTPS, FTPS, NTLM and more.
> Use --with-openssl, --with-gnutls, --with-wolfssl, --with-mbedtls, --with-schannel, --with-secure-transport, --with-amissl, --with-bearssl or --with-rustls to address this.
> 
> [...]
> 
> In file included from rtmp.c:32:
> rtmp_sys.h:110:10: fatal error: gnutls/gnutls.h: No such file or directory
>   110 | #include <gnutls/gnutls.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> Fixes: caff4179a4481233257f5f475ca57ce9061af900
>  - http://autobuild.buildroot.org/results/72e1843de650c9ed4795f1141e9fd485b71a14c3
>  - http://autobuild.buildroot.org/results/918f0f7efa810b17f6d2266a890bf0150cbed146
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Baruch Siach):
>  - Add --without-tpm2

I have applied. However, I think it would be nice to add a comment in
the .mk file to explain why we are passing --without-tpm2, to avoid
having someone else re-introduce this optional dependency. Perhaps you
could send a follow-up patch adding that?

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
