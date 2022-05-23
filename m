Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60C0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 15:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4664195C;
	Mon, 23 May 2022 15:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSlTjCrMzl6i; Mon, 23 May 2022 15:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 329BE4192B;
	Mon, 23 May 2022 15:31:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00B451BF390
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADCD9600C4
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-aVR-Jv1ptV for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 15:31:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D2DF60B97
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:31:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AA2610000E;
 Mon, 23 May 2022 15:31:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntA1p-00DiBy-SF; Mon, 23 May 2022 17:31:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220412204844.24228-1-fontaine.fabrice@gmail.com>
Date: Mon, 23 May 2022 17:31:29 +0200
In-Reply-To: <20220412204844.24228-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 12 Apr 2022 22:48:44 +0200")
Message-ID: <87wnecw9im.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: needs __sync_*_4
 intrisics
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > bpftool needs __sync_*_4 intrisics since its addition in commit
 > 3675131e6c654d7536a184db0184fde7a97040e0 and
 > https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97:

 > /nvmedata/autobuild/instance-26/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 > /nvmedata/autobuild/instance-26/output-1/build/bpftool-v6.7.0/src/libbpf/libbpf.a(libbpf.o):
 > in function `bpf_program__attach_kprobe_opts':
 > libbpf.c:(.text+0xff88): undefined reference to `__sync_fetch_and_add_4'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/919b8351d3783ca30a860df87ae814d5c4b9fd41

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
