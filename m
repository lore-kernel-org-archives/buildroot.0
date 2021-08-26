Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FAFC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 11:35:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0E9610CA
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 11:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F0E9610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A82605F4;
	Thu, 26 Aug 2021 11:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WweBbSj30Q12; Thu, 26 Aug 2021 11:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CCEB60672;
	Thu, 26 Aug 2021 11:35:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93AFF1BF3B5
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 11:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 823A6404DC
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 11:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XydQQpQLGGs7 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 11:35:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C64ED4012B
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 11:35:40 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 95CDB440E88;
 Thu, 26 Aug 2021 14:35:29 +0300 (IDT)
References: <20210824203841.1554763-1-jonah@petri.us>
 <e8372342-ccd7-9be9-5e78-da1a31ad9162@mind.be>
User-agent: mu4e 1.6.3; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Jonah Petri <jonah@petri.us>, Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Aug 2021 14:24:25 +0300
In-reply-to: <e8372342-ccd7-9be9-5e78-da1a31ad9162@mind.be>
Message-ID: <87fsuwa16g.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Arnout, Jonah,

On Wed, Aug 25 2021, Arnout Vandecappelle wrote:
> On 24/08/2021 22:38, Jonah Petri wrote:
>> Some 3rd party vendor toolchains have multiple files which match
>> these glob patterns.  In this case, the shell script failed.
>> Switching to use find and xargs solves the issue.
>> 
>> Signed-off-by: Jonah Petri <jonah@petri.us>
>
>  Applied to master, thanks.

It looks like this breaks the ARM aarch64 external toolchain. Both ld.so
existence test and ld.so listing command are broken. See this libnl
failure:

  http://autobuild.buildroot.net/results/afe/afe44f4b6a3c53e5864cfb10b04529011e72cf5c/

I have no idea why we don't see much wider breakage in the autobuilder.

The patch below fixes the build here, but I'm not entirely sure it is
the correct fix.

Since this is a risky change and we are close to release, I'd suggest to
revert this change in master, and consider it again for next.

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 5ed149d57d31..3aefd1d0096e 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -135,8 +135,8 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \
-               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
+       if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
+               find $${ARCH_SYSROOT_DIR} -wholename '*/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \

baruch

>> ---
>> Changes v1->v2:
>> 	Add SOB
>> 
>>  toolchain/helpers.mk | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>> 
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index dfb2581ed5..5ed149d57d 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -135,10 +135,8 @@ copy_toolchain_sysroot = \
>>  			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>>  		done ; \
>>  	fi ; \
>> -	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
>> -		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
>> -			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
>> -		fi ; \
>> +       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \
>> +               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
>>  	fi ; \
>>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
>> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
