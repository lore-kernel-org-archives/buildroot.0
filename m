Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E02C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A480840AD8;
	Tue, 23 Jul 2024 08:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6a5kAN2S-MZ; Tue, 23 Jul 2024 08:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86B4F40ADF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86B4F40ADF;
	Tue, 23 Jul 2024 08:55:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C8331BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 494FA401C7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JztSh6XtAOUJ for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2544402CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2544402CD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2544402CD
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:55:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDE1BE0003;
 Tue, 23 Jul 2024 08:55:08 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:55:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723105508.5cc73fea@windsurf>
In-Reply-To: <20240723081637.548225-1-fontaine.fabrice@gmail.com>
References: <20240723081637.548225-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721724909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4i8gYStT+o4Wb871aR9iyvJ6CtwLFv1MbCbKf5PAU2I=;
 b=ECGvGYH+Qjvb5dteVmD4YG4xIEGGjc2viFTsTwnv/9o6SuQQai2bY+omWg8LMXxZ4N/jRQ
 G3Ywyxm+CvnmTjvXraXT5jhpql5PHvGm5AHj0BfBd9/60fIXSmOOoR3oQiTyxkDgMphGT3
 NlDctUH2W6/Po7IbUY5ROfmzbPiDRaIbSSMgcZ5dXHCezTJlol3X6uMWU6lbNZfH4iw4Yz
 uF3Bpe53Hn3iroF94wKci0mWaW54qdaAq01VLxC/3dDKXVtfX5m9dSishnkgGcatzEV83m
 oCiptbms6IOAfQqegpJdfv2PsjdlSkjTtZViwOW1x7A5vS8grECMGB2jCjipKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ECGvGYH+
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: bump to version
 3.1.3
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 10:16:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Rebase second patch
> - This bump will fix the following build failure with gcc >= 14 thanks to
>   https://github.com/fluent/fluent-bit/commit/1f8a672dbd8121ff5fbbd955dfbdda7cf4357fd7:
> 
>   In file included from /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/flb_tls.c:24:
>   /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c: In function 'tls_context_server_alpn_select_callback':
>   /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c:220:40: error: passing argument 1 of 'SSL_select_next_proto' from incompatible pointer type [-Wincompatible-pointer-types]
>     220 |         result = SSL_select_next_proto(out,
>         |                                        ^~~
>         |                                        |
>         |                                        const unsigned char **
> 
> https://fluentbit.io/announcements/v3.1.3/
> https://fluentbit.io/announcements/v3.1.2/
> https://fluentbit.io/announcements/v3.1.1/
> https://fluentbit.io/announcements/v3.1.0/
> https://fluentbit.io/announcements/v3.0.7/
> https://fluentbit.io/announcements/v3.0.6/
> https://fluentbit.io/announcements/v3.0.5/
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8f9fcc0ec9c915a40fe402d7c643fa83f7f6a261
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...fka-CMakeLists.txt-allow-compilation-with.patch | 14 ++++++++------
>  package/fluent-bit/fluent-bit.hash                 |  2 +-
>  package/fluent-bit/fluent-bit.mk                   |  2 +-
>  3 files changed, 10 insertions(+), 8 deletions(-)

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
