Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EA1CDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 189BC82540;
	Thu, 12 Oct 2023 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 189BC82540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TOR1E45ZxQ4; Thu, 12 Oct 2023 16:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 554D382503;
	Thu, 12 Oct 2023 16:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 554D382503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1386F1BF3DA
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF02F60A81
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF02F60A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obmu4R3TNPYH for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:03:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA09E60A79
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA09E60A79
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB98F60007;
 Thu, 12 Oct 2023 16:03:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qqy9Q-003e6Z-7K; Thu, 12 Oct 2023 18:03:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <fddc853041d6b720991aa3438feef2e9a431a91d.1695649859.git.yann.morin@orange.com>
 <87pm20cg1v.fsf@48ers.dk>
Date: Thu, 12 Oct 2023 18:03:04 +0200
In-Reply-To: <87pm20cg1v.fsf@48ers.dk> (Peter Korsgaard's message of "Sat, 30
 Sep 2023 08:48:28 +0200")
Message-ID: <877cnrakw7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCHv3] package/go: cgo for the target needs the
 toolchain
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>>   <yann.morin@orange.com> writes:
 >> From: Christian Stewart <christian@aperture.us>
 >> Build go with cgo support needs to build some .c files to generate
 >> target support code, and thus calls the cross C compiler, which is
 >> failing when the toolchain is not built before host-go:

 >>>>> host-go 1.21.1 Building
 >> cd .../build/host-go-1.21.1/src && GO111MODULE=off GOCACHE=.../per-package/host-go/host/share/host-go-cache GOROOT_BOOTSTRAP=.../per-package/host-go/host/lib/go-1.19.11 GOROOT_FINAL=.../per-package/host-go/host/lib/go GOROOT=".../build/host-go-1.21.1" GOBIN=".../build/host-go-1.21.1/bin" GOOS=linux CC=/usr/bin/gcc CXX=/usr/bin/g++ CGO_ENABLED=1 CC_FOR_TARGET=".../per-package/host-go/host/bin/arm-linux-gcc" CXX_FOR_TARGET=".../per-package/host-go/host/bin/arm-linux-g++" GOOS="linux" GOARCH=arm  GOARM=6 GO_ASSUME_CROSSCOMPILING=1 ./make.bash
 >> Building Go cmd/dist using .../per-package/host-go/host/lib/go-1.19.11.  (go1.19.11 linux/amd64)
 >> go tool dist: cannot invoke C compiler [".../per-package/host-go/host/bin/arm-linux-gcc"]: fork/exec .../per-package/host-go/host/bin/arm-linux-gcc: no such file or directory

 >> Go needs a system C compiler for use with cgo.
 >> To set a C compiler, set CC=the-compiler.
 >> To disable cgo, set CGO_ENABLED=0.

 >> This happens systematically with PPD, and happens without PPD when
 >> host-go is explicitly built (by running: "make host-go").

 >> Since only CGO support needs to compile C files, onmy add the toolchain
 >> dependency in that case.

 >> When the target is not supported by go, then there is obviously no need
 >> to depend on the toolchain (even if we unconditionally enable cgo
 >> support in only-for-the-host host-go).

 >> Signed-off-by: Christian Stewart <christian@aperture.us>
 >> [yann.morin@orange.com:
 >> - only add the toolchain dependency for target cgo
 >> - reword commit log
 >> ]
 >> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 >> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> Cc: Anisse Astier <anisse@astier.eu>

 >> ---
 >> Changes v2 -> v3:
 >> - properly reassign authorship to Christian (sorry for the screw up)

 >> Changes v1 -> v2:
 >> - only add the toolchain dependency for target cgo
 >> - reword commit log

 >> v1 by Christian:
 >> https://lore.kernel.org/buildroot/20230728052530.1122268-1-christian@aperture.us/
 >> ---
 >> package/go/go.mk | 1 +
 >> 1 file changed, 1 insertion(+)


 > Committed, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
