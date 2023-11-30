Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7088C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 947C861B39;
	Thu, 30 Nov 2023 08:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 947C861B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvH2joBdghOH; Thu, 30 Nov 2023 08:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2E861B36;
	Thu, 30 Nov 2023 08:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2E861B36
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC6B81BF3BC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE61140490
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE61140490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ur-uoyNZ0mL for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:06:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A863340193
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A863340193
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CFC160004;
 Thu, 30 Nov 2023 08:06:11 +0000 (UTC)
Message-ID: <b6f775ce-730b-4ccc-a5d4-66a21cc08ad0@korsgaard.com>
Date: Thu, 30 Nov 2023 09:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20231122154837.31838-1-nicolas.cavallari@green-communications.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231122154837.31838-1-nicolas.cavallari@green-communications.fr>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: fix disabling the
 documentation
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/11/2023 16.47, Nicolas Cavallari wrote:
> gcc.mk attempts to disable building the documentation by setting
> MAKEINFO=missing, but it is not working.  If makeinfo is installed
> and recent enough, gcc still uses it.  This can be checked easily:
> 
> grep BUILD_INFO='info' host-gcc-initial-*/build/gcc/config.log
> 
> It happens because the root ./configure script will check
> $MAKEINFO --version (aka 'missing --version') and will overwrite it with
> MAKEINFO='missing makeinfo' because the version does not match.
> 
> Having MAKEINFO='missing makeinfo' is a problem because
> 'missing makeinfo' will actually attempt to run 'makeinfo' before
> failing with an error message.  If makeinfo is installed on the host,
> then 'missing makeinfo' will successfully run makeinfo anyway.
> 
> Many gcc subprojects will check $MAKEINFO --version and enable building
> the documentation if it is recent enough.  This patch overrides these
> checks by forcing gcc_cv_prog_makeinfo_modern=no.
> 
> Building the GCC documentation can fail with the wrong makeinfo version.
> It happened at least when building GCC 11.3.0 with makeinfo 7.1.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
> ---
> 
> This patch is mostly useful when backported to 2023.02

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
