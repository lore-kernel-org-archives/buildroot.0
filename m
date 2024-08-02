Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55ACC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 18:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F80B84584;
	Fri,  2 Aug 2024 18:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2-h1rCCfIZK; Fri,  2 Aug 2024 18:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B60A84591
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B60A84591;
	Fri,  2 Aug 2024 18:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFA9C1BF5A6
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD14B84591
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTBgZBC-j9l8 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 18:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9630B84584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9630B84584
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9630B84584
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 18:07:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63C52FF802;
 Fri,  2 Aug 2024 18:07:08 +0000 (UTC)
Date: Fri, 2 Aug 2024 20:07:07 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20240802200707.48234f45@windsurf>
In-Reply-To: <20240802173923.2474734-1-geomatsi@gmail.com>
References: <20240802173923.2474734-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722622028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIhs7AMwzJB6eWDFruQ/rbgr8MVlXwNWQlN83PJ+ZaU=;
 b=T+cC5V3Ozwm3zi2pMToBxa22Tr4JHv7bT9NYIsh/8pF12LiSC0RmFAogGL55BfVbfk8q3V
 PqLpjAFoUp9gQogM42UHy/0GT06NwTd+H2QG3p1Vnzzbsz7z8xpNuA+JOuSxog5RzpUzaR
 jk+hHiuAWUK7hIdoShgkkLscoRlPA8UFhpKAr2rCEG8LVSaM/DLaYGm3KOqcod7DtpD9/C
 KChSwMVoHBUe50eb9tMW00WvTxHHHIle5XzM4fQpsjlXQIUV+qymlKQeo7PnNoEpqZQgDk
 V3PS6v/6FWq+dSNTNsrHDAHNyuFp435zUapVAQRHs7OXqonuXWlkGpxgj/Vj1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T+cC5V3O
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: bump version to
 2.11
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

Hello Sergey,

On Fri,  2 Aug 2024 20:39:00 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Update wpa_supplicant to the latest release v2.11. Drop all the patches
> as they are already included into the release.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  ...le-options-for-libwpa_client.so-and-.patch | 68 ----------------
>  ...se-a-less-generic-name-for-IEEE802.1.patch | 79 -------------------
>  ...384-512-KDF-for-SAE-if-SHA384-512-is.patch | 64 ---------------
>  package/wpa_supplicant/wpa_supplicant.hash    |  2 +-
>  package/wpa_supplicant/wpa_supplicant.mk      |  2 +-
>  5 files changed, 2 insertions(+), 213 deletions(-)
>  delete mode 100644 package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
>  delete mode 100644 package/wpa_supplicant/0002-wpa_supplicant-use-a-less-generic-name-for-IEEE802.1.patch
>  delete mode 100644 package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch

I've applied, after fixing two things:

- You had forgotten to drop the entry corresponding to patch 0001 in
  .checkpackageignore (this is listed by "make check-package")

- You had forgotten to check the legal information for this package,
  and the hash of the README file had changed.

I fixed both small issues and pushed your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
