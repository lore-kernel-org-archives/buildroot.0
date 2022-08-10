Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CBBC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 12:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6AB640BEB;
	Wed, 10 Aug 2022 12:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6AB640BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_CEnJcxd723; Wed, 10 Aug 2022 12:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20C4A40A14;
	Wed, 10 Aug 2022 12:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20C4A40A14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B53651BF312
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AEB340A14
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AEB340A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vg3Aetryj_OT for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 12:39:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2BC04091E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2BC04091E
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:39:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50075240002;
 Wed, 10 Aug 2022 12:39:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oLkzy-002Ug8-Ca; Wed, 10 Aug 2022 14:39:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220614171015.878311-1-ben.hutchings@mind.be>
 <20220717194406.6112905b@windsurf>
Date: Wed, 10 Aug 2022 14:39:46 +0200
In-Reply-To: <20220717194406.6112905b@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 17 Jul 2022 19:44:06 +0200")
Message-ID: <87k07gp90t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: Prevent config with
 unsupported RISC-V float ABI
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
Cc: Ben Hutchings <ben.hutchings@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue, 14 Jun 2022 19:10:15 +0200
 > Ben Hutchings <ben.hutchings@mind.be> wrote:

 >> uClibc currently supports RISC-V with a soft-float or 64-bit
 >> hard-float ABI, but not 32-bit hard-float.  Selecting
 >> BR2_RISCV_ABI_LP64F results in a build failure:
 >> 
 >> ./include/sys/asm.h:42:4: error: #error unsupported FLEN
 >> 42 | #  error unsupported FLEN
 >> |    ^~~~~
 >> 
 >> Change the conditions for BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 >> accordingly.
 >> 
 >> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
 >> ---
 >> package/uclibc/Config.in | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Thanks a lot for this patch! I have changed the !LP64F to a LP64 ||
 > LP64D, and added a reference to a build failure in our autobuilders.
 > Patch committed with those changes, many thanks!

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
