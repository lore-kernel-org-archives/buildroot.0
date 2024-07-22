Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FC8C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23C3400D2;
	Mon, 22 Jul 2024 12:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsPVwlpF0jCe; Mon, 22 Jul 2024 12:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBEA740156
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBEA740156;
	Mon, 22 Jul 2024 12:46:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE2651BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E114022B
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDDp101i7iuX for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A13264020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13264020B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A13264020B
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:46:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CDDE20012;
 Mon, 22 Jul 2024 12:46:26 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:46:25 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722144625.66f1f99c@windsurf>
In-Reply-To: <20240722122941.63050-1-fontaine.fabrice@gmail.com>
References: <20240722122941.63050-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721652386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aUb2pC3MqB1zPWv7dND21UnxQxlYHyK9g1MBmuCmj4=;
 b=iZHxKH6gSRGpmkThVtzh4v7brbZGHef7dy/QQh0HLBD/5o2vYjOJ/DAWDOkltXU1oqq0Pa
 DSadbfrsNVnpjzjIjTCJ/o1vKWzkX3TGlUSRWRbupv3dKU+HJfwLVxNoa6b0sYotQ4KzEM
 wRPW1ssx6TIgOT+GagJd9tdwlT0MyAWgJODzym2eQEnM4Zd6AsUvbWC7F4MKu7O+WVTfr0
 txxDbGndSrIppG5dF5MT0797VZxz+TPGAJOTq/Bl8+/w4J1K5mA2pZ4tBeKEeH2Ok+rH5S
 bMrlhyJDPxxrIMyFghcJP6/ogWCtppMhwLp2Xh0XFNcCxeyidJyv1xgoQPRg4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iZHxKH6g
Subject: Re: [Buildroot] [PATCH 1/1] package/bandwidthd: fix build with gcc
 >= 14
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
Cc: Nathaniel Roach <nroach44@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 14:29:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 14:
> 
> parser.c: In function 'yyparse':
> parser.c:1196:16: error: implicit declaration of function 'yylex' [-Wimplicit-function-declaration]
>  1196 |       yychar = yylex ();
>       |                ^~~~~
> 
> While at it, update Upstream tag of first patch
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/33364071de4e5e51a2ac2337b82d145f71e0e64a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...c-bandwidthd.h-fix-build-with-gcc-10.patch |  2 +-
>  ...2-src-parser.y-fix-build-with-gcc-14.patch | 36 +++++++++++++++++++
>  3 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 package/bandwidthd/0002-src-parser.y-fix-build-with-gcc-14.patch

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
