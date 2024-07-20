Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C1AC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C994340281;
	Sat, 20 Jul 2024 21:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daVk6BcDXE1z; Sat, 20 Jul 2024 21:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9407040290
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9407040290;
	Sat, 20 Jul 2024 21:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7522A1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6297140151
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpCdZny4FGfx for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E87E400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E87E400D8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E87E400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:05:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBDC1C0002;
 Sat, 20 Jul 2024 21:05:40 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:05:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230540.64c0b0e6@windsurf>
In-Reply-To: <20240720193142.770839-1-fontaine.fabrice@gmail.com>
References: <20240720193142.770839-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=til/OF39nm+r0s9BZ0C/2n0WxIzxh92kid3UKc1CdQ0=;
 b=Bq/BauxDG95rXu0/JfuTgpbHXnJiVt1q276NnfgQZfcet4V8w1kAQB0AJU915iiLsD29IN
 EoAC86uIkBZAoWaKna6p/1nCFUhOK9H4mUJWHGwHqIoYog08H9GQsQnHfQqWkTcaLQpJYv
 Ikj4IhoKcKCYq5UdP5PRAnUklUU7bFoUPyRJrVf7VRZFEpEa/Qzthjf/hYaKgwDQcb8eUM
 Wi7FJ3r6NVRGI9DI2aJdikJWLLl5PGOHUe6uXPlxd3MZM27731jGEthe7jeiFl9qJ0EQdL
 RsejTd19QXOTOMFzMl8j8IffwGog4t7BtHU3U/nxRymgCPaID+QhjxmmkrmknQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bq/BauxD
Subject: Re: [Buildroot] [PATCH 1/1] package/openswan: select libxcrypt if
 needed
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

On Sat, 20 Jul 2024 21:31:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-7/output-1/build/openswan-3.0.0/programs/pluto/xauth.c:36:10: fatal error: crypt.h: No such file or directory
>    36 | #include <crypt.h>
>       |          ^~~~~~~~~
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/df7cce809e3e4aa92e700a3fc5105c6c20f21f6b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openswan/Config.in   | 1 +
>  package/openswan/openswan.mk | 4 ++++
>  2 files changed, 5 insertions(+)

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
