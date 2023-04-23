Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8542AC77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AF7540AB1;
	Sun, 23 Apr 2023 10:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AF7540AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocD9p5KoI6dh; Sun, 23 Apr 2023 10:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 316AF4059F;
	Sun, 23 Apr 2023 10:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 316AF4059F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2C5A1C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCA7160B65
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA7160B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4Mh3hiRsMZs for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:32:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9184F60B58
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9184F60B58
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:32:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 850871BF204;
 Sun, 23 Apr 2023 10:32:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqX1S-002ar0-Lq; Sun, 23 Apr 2023 12:32:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220918122239.189147-1-arnout@mind.be>
Date: Sun, 23 Apr 2023 12:32:46 +0200
In-Reply-To: <20220918122239.189147-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 18 Sep 2022 14:22:39 +0200")
Message-ID: <87h6t66g8h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-golang.mk: add osusergo and
 netgo tags in static builds
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > CGO (the Go language C bindings) normally links dynamically with the C
 > libraries. It seems that passing -extldflags=-static is not sufficient
 > to make sure they link statically. As a result, a build using CGO will
 > fail with

 > runtime.gcdata: missing Go type information for global symbol .dynsym: size 72

 > There are two modules in the standard Go library that can use CGO:
 > os/user and net. Both of these have pure Go versions, however, which can
 > be selected with the osusergo and netgo tags. Since these two are
 > standard library modules that get used in almost all Go programs, pass
 > those flags in the common infrastructure.

 > It's not entirely clear if this is always the case or only depending on
 > the specific way CGO is used. In the former case, we could instead
 > disable CGO globally if static libs are enabled. However, it turns out
 > that this doesn't solve the problem completely anyway (delve still fails
 > to link, with different errors). Also, it is possible that other cgo
 > modules do still work. Therefore, just stick to adding the osusergo and
 > netgo tags.

 > Fixes:
 >  - crucible:
 >    http://autobuild.buildroot.net/results/c2f/c2f29f55b461899e8e15c0494578304e6f74bf51/
 >  - containerd:
 >    http://autobuild.buildroot.net/results/699/69910fc6b9f474a7eb0ca7ffa27ac5512cc1bb37/
 >  - delve:
 >    http://autobuild.buildroot.net/results/552/55225d5da17e85271943f7adce6f07d014d9717d/
 >  - probably others...

 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
