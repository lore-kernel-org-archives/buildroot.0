Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D5BC636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE7A41BD4;
	Mon, 30 Jan 2023 21:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE7A41BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ic12KCLJugqO; Mon, 30 Jan 2023 21:57:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4F641991;
	Mon, 30 Jan 2023 21:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4F641991
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 430711BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2920241991
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2920241991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGEbGhV_PdNv for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:57:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA824198D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FA824198D
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:57:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69675C0004;
 Mon, 30 Jan 2023 21:57:51 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:57:50 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230130225750.28a7fb9b@windsurf>
In-Reply-To: <20230114172506.1258341-1-fontaine.fabrice@gmail.com>
References: <20230114172506.1258341-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675115872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/3Sik9uICg0B1uHK0cXimq2kuI6cInacpsJioL7jRY=;
 b=PxayHRqn7ZrhYuA4RtFO4ZDc/iJcJsc1GJU00+ZU0eyz1WUAMzuYL7vP55HlCnwp3ibxhA
 APzE1RMbUn+tC2glXoZ8pC9dThd3knlRfi5k+ZQdwGOeQC8B/V0+vwmid/OgjvHLCgM/6k
 LQ/JIWRy4fONRywc0pyWkLLLpBLS11b4+u2vS0P1efNhZXP6AHq7klo59E5IF/1D1QWVIe
 4nXXvtNmJgryGNI95toBo/eUS/OnHHH9MrAysEGLnfQxSQJ03xE2f4+PKhSXlwRdnrGCOj
 BBkI7ESbYtOY/HbVCDNH7lx9myZAR0JvGXrRD5rybD3U+3NzSYKiO+p8dgoKIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PxayHRqn
Subject: Re: [Buildroot] [PATCH 1/2] package/ulogd: dbi needs threads
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

On Sat, 14 Jan 2023 18:25:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 3b3dbd0183265c3f7da49b0b331688fb7573383f forgot to disable dbi
> without threads
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ulogd/ulogd.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
