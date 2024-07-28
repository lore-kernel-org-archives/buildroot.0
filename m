Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2023C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADB6A401AD;
	Sun, 28 Jul 2024 19:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bu62UzO8hC5s; Sun, 28 Jul 2024 19:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA81403BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA81403BF;
	Sun, 28 Jul 2024 19:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5931BF94D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED75F402F0
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSQ83dntJS8l for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 971E1402BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971E1402BF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 971E1402BF
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:57:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8120BFF802;
 Sun, 28 Jul 2024 19:57:48 +0000 (UTC)
Date: Sun, 28 Jul 2024 21:57:47 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240728215747.001bd5b3@windsurf>
In-Reply-To: <20240727165028.708320-1-fontaine.fabrice@gmail.com>
References: <20240727165028.708320-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722196668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12/lwBhN3MGjqTRzYJcNelNu+IS91cM492nK/1BJ0gI=;
 b=jI4NfXowhoOZokfthM3tn2U38p6kYGBCTjUi0mZ5CBQWQw/2XoLFgLqJipuxo2TjkF4/AL
 4sr5Qlx+y8fAepHXYb73hNPVNTxBBsxjy0dJMC1a3MRFZCyz0pxSSOStDJq+fOrEUg1VAk
 q2m6gPQzjDsjeVTbPTPi7R5a0V6DbFCKlkTjeq8teETZz1cVC/THlIixSyIl8yk2EXBUza
 Om+AKCSUTpQql2Kb+DHwQeQPd/CaJS5YPBti9601NVaQ6OupMza8Czo02orqMEnMYzBWwX
 +EJXJz2vrK+k7YjjhMOIXrGBC5p40aD40iJuuRZH57n03tts1kzJJ4Lgb0fboQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jI4NfXow
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/gtkiostream: add BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Jul 2024 18:50:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gtkiostream only supports little-endian since its addition in commit
> fab48302865e5c0c98d91b696bc90e75e38189bb resulting in the following
> build failure:
> 
> In file included from BitStream.C:23:
> ../include/BitStream.H:35:2: error: #error "iobitstream not tested on big endian systems"
>    35 | #error "iobitstream not tested on big endian systems"
>       |  ^~~~~
> 
> Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
>  - http://autobuild.buildroot.org/results/aec24d92cc2196596413cf509d686f1f8d1eca95
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - User BR2_ENDIAN instead of listing architectures

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
