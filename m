Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706FBC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EB160785;
	Mon, 12 Aug 2024 19:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfebOnBkx3bf; Mon, 12 Aug 2024 19:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5444360763
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5444360763;
	Mon, 12 Aug 2024 19:28:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9F21BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BA5380F76
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQX6egY_7btI for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A64380D1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A64380D1E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A64380D1E
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:27:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15F1D20004;
 Mon, 12 Aug 2024 19:27:21 +0000 (UTC)
Date: Mon, 12 Aug 2024 21:27:21 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812212721.747dc203@windsurf>
In-Reply-To: <ZrBvFLSlPYjjwCKj@waldemar-brodkorb.de>
References: <ZrBvFLSlPYjjwCKj@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723490842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74BmGI/zYdPM3QEhIjl7DOWWuDGgI1ZZXRPOOK9M9p4=;
 b=jza+EAR1zU9DG0qWiNWM4cIYAQjnSEW7krfSiJ385/xBQ7x409d5oPGShIy0W8zwtcI3sl
 snWxUEm1kcqonyZuFxstBXmJyEJyVKB5WwBJQQmB8YmJ2sTG8pkSXyuUN6QtHtIgiKT+iM
 wxlCmgJs9bU+wLpZhvnKxK7krBDDrbdq/6KSjbRhfs2Uzh1MFv3cSY8NKVCZtIL+U8On21
 75S17B1UUTU9GI1uqRBw3oRF9TR07pysb8dLlTqNZQI2p6SDlEXKwexFgy6XYRrzTeV/9X
 gYhkZT2sAmqxvjtMKbCCJq2MLm49bbC6H8Fyjk2+BQSIjKIyeGDuUAL4HSNFtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jza+EAR1
Subject: Re: [Buildroot] [PATCH v2] package/uclibc: fix missing m_tim issue
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

On Mon, 5 Aug 2024 08:20:04 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch from upstream to fix missing m_tim issue.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>   - add missing autobuild url (requested by Thomas P.)
> ---
>  ...are-st_mtim-if-defined-__USE_XOPEN2K.patch | 205 ++++++++++++++++++
>  1 file changed, 205 insertions(+)
>  create mode 100644 package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch

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
