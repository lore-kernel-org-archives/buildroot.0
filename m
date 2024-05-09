Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE12C25B4F
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B027241C5E;
	Thu,  9 May 2024 14:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ze-Um56KZQIt; Thu,  9 May 2024 14:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B8041B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B8041B93;
	Thu,  9 May 2024 14:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0AA1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B8741574
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gXgIizuA3Vw for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F14B041736
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14B041736
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F14B041736
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:32:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66223E0007;
 Thu,  9 May 2024 14:32:09 +0000 (UTC)
Date: Thu, 9 May 2024 16:32:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509163208.04cd9231@windsurf>
In-Reply-To: <20240508170307.31378-1-fontaine.fabrice@gmail.com>
References: <20240508170307.31378-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UrASqE+55VvDID4l+LbHmgNK2RRoxQ4qR8uYVpxDJo=;
 b=VA3foHRAOqSgNqBf1DxrQlm/tktY3R3hyw3nyTe0MqTnuivArZpR1sEwxBOoC2rxgeTyZ1
 09pb1POdjCkHZY1axOPAEXVNIvz3MwnuVCXh+b1BADi/I8DsN6z01OLykSrk5KPUJYM858
 bMu1B34MnhiZHSXQM6I4E0SAjGyWOeEllwpRUmdTKSc/uInsG8HwhsdP8Wzlow4pOxSoSc
 ZY/3ZGdUgXhrEkgbPdIzfeC6QiKTPFyDLZTNJ/wN0Wz/IXqaxG7GXDcYT1fXujAEciyLwd
 Pnb1ssSqfUl6FHONQLJU9QlM4Mf0D0ril791++ARb2bRebb5bc359zUbC5gcwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VA3foHRA
Subject: Re: [Buildroot] [PATCH 1/1] package/libunwind: bump to version 1.8.1
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

On Wed,  8 May 2024 19:03:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch site to get latest release
> 
> https://github.com/libunwind/libunwind/releases/tag/v1.8.1
> https://github.com/libunwind/libunwind/releases/tag/v1.8.0
> https://github.com/libunwind/libunwind/releases/tag/v1.7.2
> https://github.com/libunwind/libunwind/releases/tag/v1.7.1
> https://github.com/libunwind/libunwind/releases/tag/v1.7.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libunwind/libunwind.hash | 2 +-
>  package/libunwind/libunwind.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
