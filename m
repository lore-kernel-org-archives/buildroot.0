Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FD2C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 23:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5204093E;
	Tue,  6 Feb 2024 23:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNeSXqp_Yngr; Tue,  6 Feb 2024 23:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87FC341868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87FC341868;
	Tue,  6 Feb 2024 23:09:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 526881BF3D9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C55A4032A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbh0kvqSV8A5 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 23:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E92944031D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92944031D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E92944031D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 23:09:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF0801C0003;
 Tue,  6 Feb 2024 23:09:23 +0000 (UTC)
Date: Wed, 7 Feb 2024 00:09:23 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240207000923.7a16983e@windsurf>
In-Reply-To: <20240107172201.734515-1-fontaine.fabrice@gmail.com>
References: <20240107172201.734515-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707260963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Qi0LDl0uuMEIXkDq4cwtiQPH0vm0gnPCoYA+yVpxr4=;
 b=AEfN10MWCkThn3eVYmVK4tWw3E6k9cS8KLfFxLPkbHF66wX0UWWeIKEACvAL3IE65P1Fmd
 JLOH3wbchw33z5SN7aFwa0BTEdvcVbhQLo/sffZZx4k6qZQBRA6Ohybu1R01xxyfLQT3La
 INlj6sF3C/3RHHouQzTqCc7utirpfcM5rFHs6j+1EAI4+jM1JXTWmeY10AHcbfe6NtZWSn
 mvSuAtotsIDyAwfB5R2R2oQD40AdJyjDAboMCqCZh9eBOYgs5wocvMqWqvzEbuH5+9Qolv
 W5cE6qwW4nC9wusR0YaSu8K1+/AHouzcM4EBRBlhd/Z3V6vVlsU4AbpdPV0mLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AEfN10MW
Subject: Re: [Buildroot] [PATCH 1/1] package/stunnel: fix build without psk
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jan 2024 18:22:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without psk raised since bump to version
> 5.71 in commit 059259eabbd8d15c1e60c0c3b8631d0c02b93898:
> 
> ocsp.c: In function 'ocsp_init':
> ocsp.c:112:20: error: 'SERVICE_OPTIONS' {aka 'struct service_options_struct'} has no member named 'psk_keys'
>   112 |         if(!section->psk_keys) {
>       |                    ^~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1707beea413a8da8713ad2dc59db947329da45d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch

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
