Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6617DEEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04FC741912;
	Thu, 14 Sep 2023 21:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04FC741912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0fAlMz0THcU; Thu, 14 Sep 2023 21:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48DA64191A;
	Thu, 14 Sep 2023 21:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48DA64191A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40A251BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 262BD418C4
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262BD418C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ze8uM_Tvtc3l for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:34:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E99E241738
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E99E241738
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F28220003;
 Thu, 14 Sep 2023 21:34:16 +0000 (UTC)
Date: Thu, 14 Sep 2023 23:34:15 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230914233415.1f104059@windsurf>
In-Reply-To: <20230914211839.456969-1-fontaine.fabrice@gmail.com>
References: <20230914211839.456969-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694727256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSbmj8YZzz74glYEmlhTRRXYbX6uQrdaBGtkGR6dTEw=;
 b=CNLEah7nZydCdVEuz0Y3qjC76s9nAQg7Tc2VPB/j9f5HsB8R6Logj4WKHbmCXzuah2dIbb
 ZFstRC2/z96H8V5uETpVDvFVWbwcc56wMOFjHI6eakPpM4qsrRTb+983enBsVD8ydJkqrx
 3RvRoiexwI2gzehC8FUtsAAefRR6rt0ATYoPP+t4NEMqMgBOxNeA/SgadtfAul/LO4lHSG
 IhP4NBkDjRyDlfLVxX/C9FAmXBg6HJvZNEEMaz2WrXDI0NBebDU6PfmEEyZgC/fxuktO8l
 gLdtQ5qhGFiypkPZ4Cfn3BjQ5P7bNnwUTwjc9rQlhsVehNArQSIXV5blRVjZAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CNLEah7n
Subject: Re: [Buildroot] [PATCH 1/1] package/lldpd: fix CVE-2023-41910
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

On Thu, 14 Sep 2023 23:18:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> An issue was discovered in lldpd before 1.0.17. By crafting a CDP PDU
> packet with specific CDP_TLV_ADDRESSES TLVs, a malicious actor can
> remotely force the lldpd daemon to perform an out-of-bounds read on heap
> memory. This occurs in cdp_decode in daemon/protocols/cdp.c.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-overflow-when-parsing-CDP-addresses.patch | 24 +++++++++++++++++++
>  package/lldpd/lldpd.mk                        |  3 +++
>  2 files changed, 27 insertions(+)
>  create mode 100644 package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch

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
