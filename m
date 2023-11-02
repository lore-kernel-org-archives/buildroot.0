Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDB9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE0741E76;
	Thu,  2 Nov 2023 17:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE0741E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNvGKJoy277d; Thu,  2 Nov 2023 17:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 122FE4F23A;
	Thu,  2 Nov 2023 17:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 122FE4F23A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 599421BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309494352B
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309494352B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rI_h3ufhdtS6 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:46:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23FE9414E0
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23FE9414E0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32432C000A;
 Thu,  2 Nov 2023 17:46:10 +0000 (UTC)
Date: Thu, 2 Nov 2023 18:46:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231102184609.72475a8a@windsurf>
In-Reply-To: <20231102171118.4810-1-fontaine.fabrice@gmail.com>
References: <20231102171118.4810-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698947170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukOUc0pviDevcCdIxN7xWQHbWSJgnC4/iBVMxUvqtAc=;
 b=pNPRJ+TAz83YyijYO2WHxVKDnWBVnkN8lMuFjbqUWkwAgThnBFliUh4dRTHpP+Gv0YT/D1
 /uvitucqlQHHqJIG1cg56p3pgbeIzYqTf0zWojfAUj00dl/RQWMWdfbKLbSA56+TQuYWl0
 j+tz4RpF1118mgrNL4xyK2dNLQRdzmZT15+tLP8JrrdOGJ+MUXLwjPLAky0vF2URbL/qat
 2e2PjS0Qin7urqU7ql8njpGwjSo9jx6HxFbPtvkEFev/VU52pg3tO7jzMDWIOyxmr4iDjY
 ViKGuucjMadS+HO0aVHpdQDPUnnn7cSqUq1MCiqlB3ihSuxkUwgHCmAfYF5SGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pNPRJ+TA
Subject: Re: [Buildroot] [PATCH 1/1] package/pistache: fix build with gcc >=
 13
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

On Thu,  2 Nov 2023 18:11:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 13:
> 
> In file included from ../include/pistache/reactor.h:19,
>                  from ../src/common/reactor.cc:13:
> ../include/pistache/flags.h:29:35: error: 'uint8_t' was not declared in this scope
>    29 |         struct TypeStorage<sizeof(uint8_t)>
>       |                                   ^~~~~~~
> ../include/pistache/flags.h:17:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
>    16 | #include <iostream>
>   +++ |+#include <cstdint>
>    17 | #include <type_traits>
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d3b6eb6fb943d69571a311235944df879fccc831
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-missing-cstdint-header-include-1142.patch | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/pistache/0003-Add-missing-cstdint-header-include-1142.patch

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
