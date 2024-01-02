Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A65C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179E540AAF;
	Tue,  2 Jan 2024 20:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179E540AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgCnGIpzV0Ju; Tue,  2 Jan 2024 20:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0693F40A5C;
	Tue,  2 Jan 2024 20:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0693F40A5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14D711BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE4E940A7E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE4E940A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MXzBq3dFUja for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74F9840A7D
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74F9840A7D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96E30240004;
 Tue,  2 Jan 2024 20:18:23 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:23 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211823.771e3d50@windsurf>
In-Reply-To: <20240102170802.656262-1-fontaine.fabrice@gmail.com>
References: <20240102170802.656262-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEcdAyopJMgNXktcSRL+ROu161XlcxOXciRjcDoB5VE=;
 b=UnqVFleu87WqJLo3HbiVkSd8+VwtnDpNv+5sMF2qDF8pUDUDwYEDiBCtG+5zTv1DngMkR/
 +XEEDioezrbciPpjC1CyDYj2148DpaLsNRSPP7r3LWPIdi8PbFZXMPMzoS2ecYgx4+MVYm
 t0eXXYo05tHWNdtPxI3uTrqlto/aRuA0BYoOAMWOn6sex5FTbpPAFHHtE26AGrDp83fAGP
 7i4qxBt0vM5jTM4JlXhTmZpyl09sy+nrYq+ALcYfr8rUl7zWEv0ghyMABgo+4Q3bAfIs7r
 0C447wMLGihrdsAcxlCsZo6HwfFT7X5G9tqxfbM2PTY3+jlwl8uQO4hLsjKEbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UnqVFleu
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: fix build without
 MMU
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

On Tue,  2 Jan 2024 18:08:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 973b1eba5a4ee72f040bd471b147267e36be73ad removed third patch
> because of
> https://github.com/openssl/openssl/commit/78634e8ac253a8edf338d329965724dfa8e033ab
> however OPENSSL_NO_MADVISE wasn't updated to reflect the new
> HAVE_MADVISE logic resulting in the following build failure without MMU:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: libcrypto.a(libcrypto-lib-mem_sec.o): in function `sh_init':
> /home/buildroot/autobuild/instance-2/output-1/build/libopenssl-3.2.0/crypto/mem_sec.c:557: undefined reference to `madvise'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4328c025f6f2bcd2ebc5a4368c78e00da0aea1ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenssl/libopenssl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
