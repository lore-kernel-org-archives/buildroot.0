Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFFCEE3F00
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D65280E07;
	Tue, 12 Sep 2023 18:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D65280E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hvhMk3Rc2Da; Tue, 12 Sep 2023 18:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8103780DBF;
	Tue, 12 Sep 2023 18:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8103780DBF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4471BF2A5
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 559594056D
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 559594056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTd7XzObb7EC for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:28:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E0BE4042B
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E0BE4042B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40589C0003;
 Tue, 12 Sep 2023 18:28:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qg881-000X1j-98; Tue, 12 Sep 2023 20:28:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230814063639.1145396-1-thomas@devoogdt.com>
 <20230814112336.GC421096@scaer>
Date: Tue, 12 Sep 2023 20:28:49 +0200
In-Reply-To: <20230814112336.GC421096@scaer> (Yann E. MORIN's message of "Mon, 
 14 Aug 2023 13:23:36 +0200")
Message-ID: <87v8cf5jq6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 next] package/llvm-project/compiler-rt: fix circular dependency
 warning
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <dalang@gmx.at>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2023-08-14 08:36 +0200, Thomas Devoogdt spake thusly:
 >> make[4]: Circular include/sanitizer/allocator_interface.h <- include/sanitizer/allocator_interface.h dependency dropped.
 >> make[4]: Circular include/sanitizer/asan_interface.h <- include/sanitizer/asan_interface.h dependency dropped.
 > [--SNIP--]
 >> It's not clear why this cycle happens,

 > Well, it is rather easy to understand:

 >   - include/CMakeLists.txt unconditionally declares dependency rules
 >     between header files in ${output_dir} and ${CMAKE_CURRENT_SOURCE_DIR}
 >     without provision for them to be the same directories;

 >   - this triggers the above warnings from make, hich arbitrarily breaks
 >     circular dependencies, which in our case happens to be OK.

 > See how I extended the commit log for more details.

 > And this is actually a fix for an issue that already happens on master.
 > So: applied to master, thanks.

Committed to 2023.02.x and 2023.05.x, thanks. Luckily git is smart
enough to notice that those don't have the llvm-project/ sub directory
and do the right thing.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
