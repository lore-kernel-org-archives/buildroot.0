Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EFC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E42A141984;
	Fri, 12 Jul 2024 10:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvehHVNcfEch; Fri, 12 Jul 2024 10:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB57B4196B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB57B4196B;
	Fri, 12 Jul 2024 10:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC6B1BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1927381E28
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQWSMjvwA-8j for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E122D81D5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E122D81D5A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E122D81D5A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:55:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEBC3240004;
 Fri, 12 Jul 2024 10:55:39 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:55:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240712125537.34a68c69@windsurf>
In-Reply-To: <20240523170523.1492521-1-fontaine.fabrice@gmail.com>
References: <20240523170523.1492521-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720781740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihFgw4iae80Yz8qNekiwGnjWqqfp51/qcE/UgCwtWmg=;
 b=R9sSd4dtGx6irczE0BxtQj5+IfOk3WN5upIVQ9ptmX73mwdDEXhAkOxPNaS+os9r9xjOqi
 TG4Rn3OdhePyC8TkbuIvKFX+L6mCQRAFsMeJpyCSspPcNfuVsKcQWstdS31rE4qn7fFAhX
 Uwm39hU1PxNrKRNoZobBDGJXiXn216zwk0JYyVMsvDXNVaKacBQnU/5An59d+ZlYmCEiBM
 nT76wKlZ2YixMdCZZhnGh/GdPPgNLv2BlIc1C8ECtkab0dP9woRL7VZuJSQBZFX7OlxjMg
 vA5Sq5eLPdAZs0x+n2auJCNQidtuRuib2Y02xm/wvHwyNT/ryyznEiu9sOLYsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R9sSd4dt
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix build with
 uclibc-ng < 1.0.39
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

On Thu, 23 May 2024 19:05:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
> https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6)
> raised since bump to version 2.39 in commit
> ad276d94a392fb13244e042851a44269e6254d61 and
> https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4:
> 
> sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here (not in a function); did you mean 'PER_LINUX32'?
>   106 |     X(PER_LINUX32_3GB) \
>       |       ^~~~~~~~~~~~~~~
> 
> Fixes: ad276d94a392fb13244e042851a44269e6254d61
>  - http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ch.c-fix-build-with-uclibc-ng-1.0.39.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch

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
