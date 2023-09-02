Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CBEC83F3F
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D18240543;
	Sat,  2 Sep 2023 15:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D18240543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQ1pu7B_CWhd; Sat,  2 Sep 2023 15:51:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62F87405BD;
	Sat,  2 Sep 2023 15:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F87405BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BF7D1BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25AA18200A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AA18200A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMV2V60cDf6w for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:51:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31BF581E25
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31BF581E25
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44EB620005;
 Sat,  2 Sep 2023 15:51:03 +0000 (UTC)
Date: Sat, 2 Sep 2023 17:51:02 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230902175102.3bbb46e2@windsurf>
In-Reply-To: <ZOsxD6Z372MejW1M@waldemar-brodkorb.de>
References: <ZOsxD6Z372MejW1M@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693669863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+pu9L8xi+VgghRXigY7FQZGYJsCm48r35sIXKiaaMM=;
 b=JGBqa/psAPD++7aMNlq0piARsdxYfT1nFoHauc49G96HVUhkhVm/1ucjgFdLM179x9JkUQ
 6098YEd17CSFZyzogYaDOZHiEiGhGlhR4QE28dTpiiqMEUVgbD7crJPtEkRi4v3g6JXQEF
 Rm0Swfy2L5hUYQMe/xXhGzeX1E+YWbqhGwXmAe/LC6zG53Dqf4W1iEp/k/hevR7M6/Jvru
 +AygCFCEkTFvlMcKiI75P/CZ1tTURwhAzFPthsenIVPdwABmXM606k3ghphekywUqYoA7S
 xmiCsENgsIruTVtb5AOaonUsauVO2PvJdLKVJgQOv3PDKOU5TCNSx/Kn6nRHsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JGBqa/ps
Subject: Re: [Buildroot] [PATCH] package/pam: fix uclibc compile error
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

On Sun, 27 Aug 2023 13:18:39 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Following build failure occurs:
> opasswd.c: In function 'compare_password':
> opasswd.c:142:3: error: 'retval' undeclared (first use in this function); did you mean 'outval'?
>   142 |   retval = outval != NULL && strcmp(outval, oldpass) == 0;
>       |   ^~~~~~
>       |   outval
> 
> Add a patch from upstream to fix it.
> Happens since the update to 1.5.3 in Buildroot commit:
> f8147e27cdac8f998ec6644a09ce4e8d62b6433c
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/576/576fc4b9ccbc6cff82569692bdec82192e89f036
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...Fix-build-if-crypt_r-isn-t-available.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch

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
