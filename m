Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FD1C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF603431B2;
	Wed,  1 Nov 2023 16:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF603431B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vacYrVEkYx5B; Wed,  1 Nov 2023 16:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7CE1431AD;
	Wed,  1 Nov 2023 16:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7CE1431AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17E311BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2ECD40936
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2ECD40936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOU3ZJi3cQx4 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:50:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBD15408AB
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD15408AB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D01240008;
 Wed,  1 Nov 2023 16:50:00 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:49:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101174959.3c6d1707@windsurf>
In-Reply-To: <20231019213209.627881-1-fontaine.fabrice@gmail.com>
References: <20231019213209.627881-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698857400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zz+LM240GXNcOMeqeB5eqWggrYKgJYi6hyb009PkpA=;
 b=OJJ6V7LghW6OrOTCdhILFa9TkSxPlBfhSKB5YPMPQfiuNcUDEPsc42pdHIC3MpMotPiMbz
 ujC0X35tV3BOZGL9d6bq+dhy3Gh4Tlrjy8n0Lky8/Qv5sJKnheyewGu67lZSQrct7cknpW
 vgvL8+2KDgrfMdnSsk3RrjcfGF4rN8AI5s09+/I18SFKl0wxZbulP0ZX2MJQ1uK0x1GRN4
 vmxvPhm2Se4+Fyp3vCgOF7Nbh9dOjtSewJl+2ul7POO7huhkYzdV//SDz9T2dvlYiGJkal
 iyOcv3cGzW86lvwhCnATX8Hbi9l1gUYqJ7+vu+CsEYdH/ZDDQtnaqJ1qqKQ+dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OJJ6V7Lg
Subject: Re: [Buildroot] [PATCH 1/1] package/snort3: fix build with gcc >= 13
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

On Thu, 19 Oct 2023 23:32:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 13:
> 
> In file included from /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.cc:25:
> /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:59:25: error: 'uint32_t' has not been declared
>    59 |     void set_batch_size(uint32_t);
>       |                         ^~~~~~~~
> /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:62:5: error: 'uint32_t' does not name a type
>    62 |     uint32_t get_batch_size() const { return (batch_size == BATCH_SIZE_UNSET) ? BATCH_SIZE_DEFAULT : batch_size; }
>       |     ^~~~~~~~
> /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:26:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
>    25 | #include <vector>
>   +++ |+#include <cstdint>
>    26 |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c91a74bad542f32693f2e31412fba70446fd3959
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ix-cstdint-related-clearlinux-errors.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch

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
