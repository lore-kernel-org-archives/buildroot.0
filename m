Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1E1C021AF
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 19:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0136F817B0;
	Sat, 14 Sep 2024 19:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kf_osAdt9JVT; Sat, 14 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C15784222
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C15784222;
	Sat, 14 Sep 2024 19:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A16DC1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA4F4055D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ps40hboLDVJx for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 19:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 634A74050B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 634A74050B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 634A74050B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 19:58:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E2E520002;
 Sat, 14 Sep 2024 19:58:53 +0000 (UTC)
Date: Sat, 14 Sep 2024 21:58:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240914215852.07cc6a2e@windsurf>
In-Reply-To: <20240914185110.2757653-1-giulio.benetti@benettiengineering.com>
References: <20240914185110.2757653-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726343933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgu38uwUqnQ8VuHkBpZk51n0UzY5Ew3Lq88RctWpGGs=;
 b=eqIarK+15wtDZ5KYk5jHrsYua9/aaIjK8t+3dsqatoH+m1gZ5f6RmjD3FXEQ6Vh0WlsVzl
 tKVuSKEfO9QeQH22H3EMRDmiakVrNVmNIhZ6Cz1OTV7DbR9B85Mawolcqpmi2KwNTGECOU
 GRI+BgyzGsvBpjk+3duHQ81Vlthqzbe+/ns7XnVll1OrmlC9AsfJaJzKHEeE9r++ndoSP+
 NhB9Sgq6sJDLxVdYPSj+2rGWAHJiB2bS1VbyNSqnoF0SsNsXgdVHZvbA27zj6zal96Hkey
 BYEvfm/glgg5b4arrSbXWNxBBF0ZUWbhXe3wMrI9koIkSZtrppc092eKtz5a2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eqIarK+1
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2024-08-21
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 20:51:10 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> With this version we can build with Linux 6.11.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8821cu/rtl8821cu.hash | 2 +-
>  package/rtl8821cu/rtl8821cu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
