Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEC2C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02746608AE;
	Tue, 27 Aug 2024 16:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzvqqXwp56zW; Tue, 27 Aug 2024 16:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 111CF608BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 111CF608BF;
	Tue, 27 Aug 2024 16:24:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB9211BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4FF1811DD
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyPjbkdPRCTS for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BDE980AB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BDE980AB6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BDE980AB6
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:24:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 653C2C0006;
 Tue, 27 Aug 2024 16:24:13 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:24:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240827182412.5dbe3d78@windsurf>
In-Reply-To: <Zs1WjXQh8Hog59fF@waldemar-brodkorb.de>
References: <Zs1WjXQh8Hog59fF@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724775853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVQ6O+Ezq3eoMULdaKXFjrJNzqttIvVEtW6rRsx3mHQ=;
 b=KKSzxlZSxIlQIfegXXreEb18qYR+m21kWM4DWIW95BMfBRMj7Bi3Fy1msxdAfZVZDEDeMu
 bFYO1OKuDbeODptIZ3+pH5J7jz5Y8pp1xtdX9xnT4Oej+hl8gN/DznUP62xV2i4zQj+JEI
 kcId5YdBmmmumLl7lkfTUUoEIJtls0amUXXt1Wa99OW7P2+4XF+2QU0ZjMuT5XJ93citLP
 ehxhb2jvFk0hEwCUzhqXvpMNfWR0lFBqd4V+H8mNumTOCsgbxiijmJlcPNB0z/zbtZD+lq
 +SDc0x9UzQAQHkQ02BYrK8tIe9RoX4bLDkr9EZplNk7jFZajj8141TCwuqx0Ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KKSzxlZS
Subject: Re: [Buildroot] [PATCH v2] package/freeipmi: fix gcc 14.x issues
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

On Tue, 27 Aug 2024 06:31:09 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Directly from upstream stable git repository, fixes for gcc 14.x
> issues. Only the changelog entries, which do not apply, where removed.
> 
> Fixes:
> 
>  http://autobuild.buildroot.org/results/b33/b33e72b3348427f2f772e5c29dd3753958597058
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - added Upstream tags to patch 0002/0003
> ---
>  ...ipmi-sel-string-supermicro-common.h-.patch | 36 ++++++++++++
>  ...sensors-fix-header-guard-definitions.patch | 57 +++++++++++++++++++
>  ...003-ipmi-sensors-add-missing-include.patch | 28 +++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
>  create mode 100644 package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
>  create mode 100644 package/freeipmi/0003-ipmi-sensors-add-missing-include.patch

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
