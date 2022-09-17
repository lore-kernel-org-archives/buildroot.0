Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B992C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D4B41D86;
	Sat, 17 Sep 2022 12:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D4B41D86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hu0wnkxtfhDI; Sat, 17 Sep 2022 12:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F36041D5E;
	Sat, 17 Sep 2022 12:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F36041D5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC9451BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5CEB41D5E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CEB41D5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ehi_sjl7AEY1 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:25:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C25141D5D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C25141D5D
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:25:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E28D31C0004;
 Sat, 17 Sep 2022 12:25:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZWt8-009Ggq-Lv; Sat, 17 Sep 2022 14:25:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220607202828.1130778-1-fontaine.fabrice@gmail.com>
 <09686b20-b8ca-d698-7416-f24a8c01a376@mind.be>
Date: Sat, 17 Sep 2022 14:25:38 +0200
In-Reply-To: <09686b20-b8ca-d698-7416-f24a8c01a376@mind.be> (Arnout
 Vandecappelle's message of "Tue, 23 Aug 2022 22:58:46 +0200")
Message-ID: <87leqi2nnh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jpeg: SIMD needs VSX with
 little endian
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 07/06/2022 22:28, Fabrice Fontaine wrote:
 >> SIMD needs VSX with little endian to avoid the following build failure:
 >> In file included from
 >> /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolor-altivec.c:25:
 >> /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolext-altivec.c: In function 'jsimd_rgb_ycc_convert_altivec':
 >> /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jsimd_altivec.h:93:26: warning: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vsl'? [-Wimplicit-function-declaration]
 >> 93 | #define VEC_LD(a, b)     vec_vsx_ld(a, b)
 >> |                          ^~~~~~~~~~
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/be6d5ad0cee4ee19eb25e595d44555a1af6e073b
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
