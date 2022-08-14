Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80534C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C1F82A28;
	Sun, 14 Aug 2022 10:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C1F82A28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrTsoZaKqTxI; Sun, 14 Aug 2022 10:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46F3D8191E;
	Sun, 14 Aug 2022 10:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46F3D8191E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 060CF1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E26C68191E
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26C68191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHckU0BOCXDH for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:17:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDB0818BE
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBDB0818BE
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:17:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF94E240005;
 Sun, 14 Aug 2022 10:17:05 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:17:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814121704.68cd34a4@windsurf>
In-Reply-To: <20220812121913.51447-1-fontaine.fabrice@gmail.com>
References: <20220812121913.51447-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660472226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8LyBQFZZM3xdFOq0bEeNNDjllr5EbQtU2rH22kyj+0s=;
 b=RJ196f5cFHPGsvcZ6CtOsdwenX+F40K2m44qCqUZlifccfoTZomijWAypIepIUia7eWEgm
 LsBlXKPYQal0iVb0N42JdTUa8yU4UMmBh3JXoz/+2dAFXu0eKPuGiEI9XJUZl05ye9WQcE
 ExQyGQ4h6Ukau/YdpuA+lR3TR+6BX088IoSgD/TEeHnzmdMld4jJK3lcmIy5VnJbc/pyvV
 ZpOw3Fe1jKqN8BGeWjK21xX42TizhDHt12Vt1F19vkQTlLOf9GT5PZAYn8XmW0zfo2rmr3
 uQe0f2I8UwGY+9CCYtsFFKsw6MPQH26sB+LGbtAgNPh+pgVGgpOSL1INYQIohw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RJ196f5c
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: fix build with gcc 4.8
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

On Fri, 12 Aug 2022 14:19:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 raised since bump to
> version 0.4.12 in commit 86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb and
> https://github.com/OpenSC/libp11/commit/639a4b6463278c0119a2ec60b261da3e5330fb33:
> 
> p11_attr.c: In function 'pkcs11_zap_attrs':
> p11_attr.c:167:2: error: 'for' loop initial declarations are only allowed in C99 mode
>   for (unsigned i = 0; i < 32; i++) {
>   ^
> p11_attr.c:167:2: note: use option -std=c99 or -std=gnu99 to compile your code
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4391020fb5738cc8c26dc53783a6228bbf76473a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rc-p11_attr.c-fix-build-with-gcc-4.8.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch

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
