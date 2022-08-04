Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C5EC19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B09DF416C0;
	Thu,  4 Aug 2022 13:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B09DF416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDC1bezJjrft; Thu,  4 Aug 2022 13:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79362409AB;
	Thu,  4 Aug 2022 13:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79362409AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 205BF1BF421
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 13:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC7C404D8
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 13:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFC7C404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnG0Lwz69llO for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 13:38:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B05F40193
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B05F40193
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 13:38:32 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 1FFCF5C0A73;
 Thu,  4 Aug 2022 15:38:29 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 04 Aug 2022 15:38:28 +0200
From: Stefan Agner <stefan@agner.ch>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220804151207.3ad0fbe1@windsurf>
References: <32cdca079efa80b745bb60af23ad9e99f3cabbf4.1659613508.git.stefan@agner.ch>
 <20220804151207.3ad0fbe1@windsurf>
Message-ID: <26aed3ae6ff8f346b8269669817df0ef@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1659620309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WChilrfsQtVH4dMyvzTUT5AA0rFb/iQ5RswUJSI2u8=;
 b=BQ41gayOd29Y5q7G4h04mu5E3R29PAvMmAn1ooLmJGsLPJNioGrl2B3HYDdZYHNL4oX65S
 Z8HN7gzrYXpZs2HN/obz2e5iFBcJqIu3MtGP/JyUb4iJPRrYAFxnuLDWw1e3UIGQsb50SW
 SY6xDBs2gBbOwAAfcWQVOrGrOyCfGr8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=BQ41gayO
Subject: Re: [Buildroot] [PATCH] [master] boot/grub2: fix build race
 condition
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-04 15:12, Thomas Petazzoni wrote:
> Hello Stefan,
> 
> On Thu,  4 Aug 2022 13:45:27 +0200
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> Sometimes buildroot fails with:
>> ../grub-core/kern/emu/hostfs.c:20:10: fatal error: config-util.h: No such file or directory
>>    20 | #include <config-util.h>
>>       |          ^~~~~~~~~~~~~~~
>>
>> Add a patch which fixes the Makefile to correctly generate config-util.h
>> first.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Thanks for this patch.
> 
>> ---
>>  ...ub_fstest.pp-depend-on-config-util.h.patch | 24 +++++++++++++++++++
>>  boot/grub2/grub2.mk                           |  6 +++++
>>  2 files changed, 30 insertions(+)
>>  create mode 100644 boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
>>
>> diff --git a/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
>> new file mode 100644
>> index 0000000000..96e6852e86
>> --- /dev/null
>> +++ b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
> 
> We require all patches to have a proper commit log, with commit title +
> description, and a Signed-off-by line. Also, we need to have the
> upstream status of the patch, i.e where it has been submitted (or taken
> from).

The problem is, this patch is not generated from a source repository but
simply using patch from the release tarball. The source repository does
not contain Makefile.in, which needs to be patched...

So a "proper commit log" as such is not possible. I can of course fake
it and make it look like the patch got generated from a commit, but not
sure if that is sensible?

Best regards
Stefan

> 
> Could you rework your patch accordingly?
> 
> Thanks a lot!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
