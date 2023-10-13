Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3073CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4637A60BAA;
	Fri, 13 Oct 2023 15:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4637A60BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K42GQcMMBY1h; Fri, 13 Oct 2023 15:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 947FA60B8C;
	Fri, 13 Oct 2023 15:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 947FA60B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6D561BF2C7
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF3F94011F
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF3F94011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hYl3buLItch for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:03:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E584049A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E584049A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 337FE24000D;
 Fri, 13 Oct 2023 15:03:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJgn-007KfE-Qv; Fri, 13 Oct 2023 17:02:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230109220041.33943-1-glex.spb@gmail.com>
 <20231001194952.GO2579@scaer>
Date: Fri, 13 Oct 2023 17:02:57 +0200
In-Reply-To: <20231001194952.GO2579@scaer> (Yann E. MORIN's message of "Sun, 1
 Oct 2023 21:49:52 +0200")
Message-ID: <877cnq4lb2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libmodplug: add a patch fixing
 cctype UB
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Gleb, All,
 > Sorry for the delay, now I've handled that patch...

 > On 2023-01-09 22:00 +0000, Gleb Mazovetskiy spake thusly:
 >> libmodplug calls `cctype` functions, such as `isspace`,
 >> with negative values. This is undefined behaviour.
 >> 
 >> While glibc allows it, it crashes on uClibc compiled
 >> without `UCLIBC_HAS_CTYPE_SIGNED`.
 >> 
 >> Adds a patch that resolves the issue.

 > We discussed it during the hackathon this WE, and we were a bit ,eh
 > about that patch, because it is a bit big, and upstream has not
 > responded to it.

 > However, upstream does indeed look pretty dead with no activity in the
 > past two years and only the occasional commit before that, so there is
 > very low risk at integrating this patch in Buildroot, as it should not
 > cause much maintenance issue. On the off chance upstream ever release
 > something new, we can assess the situation then.

 >> Also sent upstream. However, the library author has not merged
 >> any pull request for about a year.
 >> https://github.com/Konstanty/libmodplug/pull/92
 >> 
 >> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

 >     $ make check-package
 >     package/libmodplug/0001-fix-cctype-ub.patch:0: missing
 > Signed-off-by in the header
 > (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
 >     package/libmodplug/0001-fix-cctype-ub.patch:0: missing Upstream in
 > the header
 > (http://nightly.buildroot.org/#_additional_patch_documentation)

 > The latter is newer than your patch, so that's not your fault; I fixed
 > it when applying.

 > For the former, since your SoB-ed your Buildoot contribution, I
 > copy-pasted it to the bundled patch too.

 > Applied to master with that fixed, thanks.

 > Eh, btw: I'm surprised people are still doing MOD nowadays! :-)

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
