Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7738EC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D754408AA;
	Fri, 10 May 2024 21:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kl3_tSWCXoP; Fri, 10 May 2024 21:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147B842C20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 147B842C20;
	Fri, 10 May 2024 21:11:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6302B1BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E79841FBA
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-BkVYiPtG1R for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:11:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0054A41F2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0054A41F2A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0054A41F2A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:11:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D86BFF802;
 Fri, 10 May 2024 21:11:33 +0000 (UTC)
Date: Fri, 10 May 2024 23:11:32 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510231132.0163f9c0@windsurf>
In-Reply-To: <20240324212451.750780-1-fontaine.fabrice@gmail.com>
References: <20240324212451.750780-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715375493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLewnRSa7106WjBJUHS8tysf/zDiT3RXNCa2IWOsUf8=;
 b=TBVjHkNqqTaYPjDItL3l5fWMJoosQxLGH2du0ejoT5JMh8tsNRF4wea5v+/z2GxhjinNLX
 5zyhU/6USMB3yDyF3+BU0QnkQNgoWULrNqRPij20CKHde8UOswBCvOcopkYb4boZVmmC2z
 H4VqsnqIklCD1peFHTAFyzSaeNRYC9KQKzLZaKbnwK4mp9bXWBJ3VOPww7stHMu1d1ChWZ
 LOLWcHVub8v/WoMn/JzMM7VX06chdozJCOwwkXIWiGDnHjAhK9O3WAXgRI6I5UBhf2xfqo
 vW+8k47iLNG1702KWG+/bJgZT96KbsNb/mMqGBdWU3Gp6kqAOzV6K01uq5PYZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TBVjHkNq
Subject: Re: [Buildroot] [PATCH 1/1] package/wavpack: bump to version 5.7.0
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

On Sun, 24 Mar 2024 22:24:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update hash of COPYING (year updated with
>   https://github.com/dbry/WavPack/commit/b28fdab79dd8af2b8281d77097cf8f25e580e525)
> - threads is an optional dependency since
>   https://github.com/dbry/WavPack/commit/9ef0d37deb4f3f6def663079b18d3beea9cc10d2
> - openssl dropped with
>   https://github.com/dbry/WavPack/commit/c5b545146de8dd296f905183908cdcda682ed88b
> 
> https://github.com/dbry/WavPack/releases/tag/5.7.0
> https://github.com/dbry/WavPack/blob/5.7.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wavpack/wavpack.hash | 4 ++--
>  package/wavpack/wavpack.mk   | 9 ++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)

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
