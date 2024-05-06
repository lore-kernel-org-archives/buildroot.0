Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C70C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67445820E1;
	Mon,  6 May 2024 19:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAjOb5_xwB-j; Mon,  6 May 2024 19:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A60E82103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A60E82103;
	Mon,  6 May 2024 19:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5611BF28B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34416608BE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsANTF3Evjhw for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E96EA608B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E96EA608B8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E96EA608B8
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:33:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0D07C0004;
 Mon,  6 May 2024 19:33:04 +0000 (UTC)
Date: Mon, 6 May 2024 21:33:03 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240506213303.69b9fa83@windsurf>
In-Reply-To: <20240506081959.330708-1-fontaine.fabrice@gmail.com>
References: <20240506081959.330708-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715023984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vR5K7WEwFVx9old9PO6vteLXIdBAe5UqAQgqBrPUE/I=;
 b=E6KhL/Ytei8fcEfvyDupfwTJ6R5n6q9ugCvigpvWQp1daWymZbKzw6S3Py9S4mE4hgAzpO
 yTJcFobPfXzTxrdgWZ/HEKnKVCCmngD9ZRqx9Ehi6m2H/I1BEOqJ7rqM+A9/vtmdSGIOpb
 nhoqU0uXzDDOSEj7CMdbkJ6nGl9/GL/I8Y0Qke831AB7HPMTmvJqy1nhPl4q8srlUr6IIb
 uwZJf5MBj/9nkDgzTfFUAyvyIvhz1Pv3PDfhLTAaf3mVfRg2+slFtbELJ4bvqG4ALF9Ath
 UYTWelU53FFPByFyFxyR4Tth4w3dXgiFTAgntSG5qcXVKLe2QTR1vArfrqjJJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E6KhL/Yt
Subject: Re: [Buildroot] [PATCH 1/2] package/libhtp: security bump to
 version 0.5.48
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

On Mon,  6 May 2024 10:19:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2024-23837 and CVE-2024-28871
> 
> https://github.com/OISF/libhtp/security/advisories/GHSA-f9wf-rrjj-qx8m
> https://github.com/OISF/libhtp/security/advisories/GHSA-ffr2-45w9-7wmg
> https://github.com/OISF/libhtp/blob/0.5.48/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libhtp/libhtp.hash | 2 +-
>  package/libhtp/libhtp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
