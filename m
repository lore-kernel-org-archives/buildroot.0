Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED7EC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 10:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E66B41F46;
	Sat, 13 Jan 2024 10:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E66B41F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igs_kBAoMdY7; Sat, 13 Jan 2024 10:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF5441F42;
	Sat, 13 Jan 2024 10:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF5441F42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69C431BF397
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 10:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F84C4052D
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 10:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F84C4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nh9zyGh42oiy for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 10:36:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27E88404BB
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 10:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E88404BB
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA4EEC0003;
 Sat, 13 Jan 2024 10:36:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rObNa-00CZRp-0F;
 Sat, 13 Jan 2024 11:36:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240106093517.436661-1-fontaine.fabrice@gmail.com>
Date: Sat, 13 Jan 2024 11:36:41 +0100
In-Reply-To: <20240106093517.436661-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Jan 2024 10:35:17 +0100")
Message-ID: <878r4twmdi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/optee-client: fix build with
 kernel < 4.16
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
Cc: Etienne Carriere <etienne.carriere@foss.st.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with kernel < 4.16 raised since bump to
 > version 4.0.0 in commit 8a8fa2006846cd3480741f03372e17fedb811898 and
 > https://github.com/OP-TEE/optee_client/commit/3ac968ee7c927271e83ea3a4247839649202ab5e:

 > /home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c: In function 'register_local_shm':
 > /home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c:356:44: error: storage size of 'data' isn't known
 >   356 |         struct tee_ioctl_shm_register_data data;
 >       |                                            ^~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d63eb7c8574366377760f5ab2eaec02f46173975

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
