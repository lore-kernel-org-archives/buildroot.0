Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B28C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377D641C33;
	Mon,  6 Nov 2023 21:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377D641C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ik9dBt9UOudV; Mon,  6 Nov 2023 21:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6828D41DA6;
	Mon,  6 Nov 2023 21:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6828D41DA6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B595F1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DBE182085
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBE182085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tITKF8uE2SD for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:27:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3932481FA9
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3932481FA9
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB244E0004;
 Mon,  6 Nov 2023 21:27:39 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:27:39 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106222739.25adad96@windsurf>
In-Reply-To: <20231105095108.777043-1-fontaine.fabrice@gmail.com>
References: <20231105095108.777043-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699306060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/pXOqSx9DhwcGc7XOUZZx/dZX9MFl6AJ93wOXUv2lY=;
 b=kTkNVAOVy02VFwo+H0AdQlr5pHSOutW0ofP2uYtKBsF4Wsrg4yQfxqFfK627URH6NVlw59
 3yyy7QBIsZF+hV/omv+lOBY+TKhBHL+4gFo0s2/ABxmmRW/yn+b3QWtvyUvPCMn/E5WZh+
 sWlhE+VAXnqhsBz/xYwxeypqXWPNHI2kkGMnRxC5l4nfRzSymnnqwiXM3qwH618Ix5XdDQ
 mqDtNxaG5GljMwFFR/tUqN+5umvRt6v34YjvUlOz2eTWDlMYeDBcjWOVYBLxVJ4QrhEW87
 Jb425ynzMh49PzAo0bIG/76MzQYlucrCTiEf2608St0IDemyUGK2BDTjLt0oIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kTkNVAOV
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix build on sh4
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

On Sun,  5 Nov 2023 10:51:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure on sh4 raised since bump to version
> 1.3.0 in commit
> 
> /home/thomas/autobuild/instance-3/output-1/per-package/flashrom/host/bin/../lib/gcc/sh4a-buildroot-linux-gnu/12.3.0/../../../../sh4a-buildroot-linux-gnu/bin/ld: libflashrom.a(internal.o): in function `internal_chip_readn':
> internal.c:(.text+0x8): undefined reference to `mmio_readn'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f74a9d315fb519f284428234713f43fcf4e35fd0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...G_INTERNAL-depends-on-raw-mem-access.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch

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
