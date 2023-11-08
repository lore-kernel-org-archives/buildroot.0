Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E28C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 06:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83E0E40640;
	Wed,  8 Nov 2023 06:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E0E40640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N85dqzRBPI0q; Wed,  8 Nov 2023 06:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53C0740642;
	Wed,  8 Nov 2023 06:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C0740642
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA6151BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 06:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF8AC81C58
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 06:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8AC81C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Re9nk_vmgLu2 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 06:58:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94C2D81C20
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 06:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C2D81C20
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40CB3FF818;
 Wed,  8 Nov 2023 06:58:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0cWc-0006dv-2I;
 Wed, 08 Nov 2023 07:58:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231019213209.627881-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Nov 2023 07:58:54 +0100
In-Reply-To: <20231019213209.627881-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 19 Oct 2023 23:32:09 +0200")
Message-ID: <87leb8vihd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc >= 13:
 > In file included from /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.cc:25:
 > /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:59:25:
 > error: 'uint32_t' has not been declared
 >    59 |     void set_batch_size(uint32_t);
 >       |                         ^~~~~~~~
 > /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:62:5:
 > error: 'uint32_t' does not name a type
 >    62 |     uint32_t get_batch_size() const { return (batch_size == BATCH_SIZE_UNSET) ? BATCH_SIZE_DEFAULT : batch_size; }
 >       |     ^~~~~~~~
 > /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:26:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
 >    25 | #include <vector>
 >   +++ |+#include <cstdint>
 >    26 |

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c91a74bad542f32693f2e31412fba70446fd3959

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
