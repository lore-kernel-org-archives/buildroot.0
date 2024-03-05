Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AF1C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 11:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B296040275;
	Tue,  5 Mar 2024 11:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISN6Z1wGcPUR; Tue,  5 Mar 2024 11:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C26C141597
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C26C141597;
	Tue,  5 Mar 2024 11:29:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A25D1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0745C82256
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsFV6eoeWfrR for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 11:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63DF182236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63DF182236
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63DF182236
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 11:29:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D194B24000B;
 Tue,  5 Mar 2024 11:29:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhSyr-000Bzp-0R;
 Tue, 05 Mar 2024 12:29:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240305085616.7718-1-fontaine.fabrice@gmail.com>
Date: Tue, 05 Mar 2024 12:29:09 +0100
In-Reply-To: <20240305085616.7718-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Mar 2024 09:56:16 +0100")
Message-ID: <87y1awzzlm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: fix mips64 build
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use MIPS64_GENERIC instead of SICORTEX with mips64 to avoid the
 > following build failure raised at least since bump to version 0.3.25 in
 > commit 6a172ffe6b2aa5c59427696775cfa4c189f99c19:

 > ../kernel/mips64/amax.S:76: Error: opcode not supported on this processor: mips64 (mips64) `mtc1 $0,$f0'

 > MIPS64_GENERIC is available since version 0.3.22 and
 > https://github.com/OpenMathLib/OpenBLAS/commit/a50b29c540c25baf8f788131cc905ebe0575f253

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b8da10aeb16343540ce3672faabdaa4d3bffb020
 >  - http://autobuild.buildroot.org/results/32702ccaa2384252058840960d8998abca294fad

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
