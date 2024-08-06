Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70070C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CA86061C;
	Tue,  6 Aug 2024 22:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OM_Czw9YabDm; Tue,  6 Aug 2024 22:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 579F160668
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 579F160668;
	Tue,  6 Aug 2024 22:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BDC71BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35DAE40237
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pqfr18OdiId4 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE130400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE130400D7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE130400D7
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:44:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24C9840002;
 Tue,  6 Aug 2024 22:44:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbSud-000AUX-1w;
 Wed, 07 Aug 2024 00:44:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230822192315.8180-1-ju.o@free.fr>
 <cdbb074b-4480-4a10-809a-b15030dc0a18@mind.be>
Date: Wed, 07 Aug 2024 00:44:15 +0200
In-Reply-To: <cdbb074b-4480-4a10-809a-b15030dc0a18@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Fri, 12 Jul 2024 21:09:21
 +0200")
Message-ID: <87a5hpp8zk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] package/kexec: fix link error when
 BR2_OPTIMIZE_0=y
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 22/08/2023 21:23, Julien Olivain wrote:
 >> When BR2_OPTIMIZE_0, -O0 is passed in compiler CFLAGS. This means no
 >> code optimization will be performed.
 >> kexec code uses a trick to detect unaligned accesses at link time
 >> which needs at least dead-code-removal to work. See
 >> put/get_unaligned() macros in kexec/kexec.h. This code was re-enabled
 >> in upstream commit [1].
 >> This commit sets at least -O1 (which include the sufficient
 >> dead-code-removal) when BR2_OPTIMIZE_0=y, to fix those issues.
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/8f8/8f8532f1dfbd71e52c51c00118934af9fa45e7cb
 >> - http://autobuild.buildroot.org/results/528/528fd7baf9b0ad5549d22ec8e0623c5fa1f2d117
 >> - http://autobuild.buildroot.org/results/499/499115439680adfb4b40042468e5bbb65d91ce6c
 >> - ...and many others
 >> [1]
 >> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=0723defb5308ac7fce296f8b596bff4df6803f01
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>

 >  Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
