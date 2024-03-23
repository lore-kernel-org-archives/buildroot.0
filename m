Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C4ACD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570F3404D7;
	Sat, 23 Mar 2024 12:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Ks-Evr4rTzi; Sat, 23 Mar 2024 12:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 622854061C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 622854061C;
	Sat, 23 Mar 2024 12:46:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7427D1BF3E1
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DC574179E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qR6uJc0d2k1o for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 209024176D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209024176D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 209024176D
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:45:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 085D1240002;
 Sat, 23 Mar 2024 12:45:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro0l2-006sOO-0z;
 Sat, 23 Mar 2024 13:45:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240321211245.508853-1-fontaine.fabrice@gmail.com>
Date: Sat, 23 Mar 2024 13:45:56 +0100
In-Reply-To: <20240321211245.508853-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 21 Mar 2024 22:12:45 +0100")
Message-ID: <87wmptyv3v.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix btrfs handling
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > btrfs handling doesn't depend on btrfs-progs but on kernel >= 4.12 since
 > bump to version 1.7.7 in commit 79e01ef9506a6cdc4836912607dc594ae7b1999d
 > and
 > https://github.com/containerd/containerd/commit/024a748c092cbddde0918f2e93a646ce50116e11
 > resulting in the following build failure:

 > In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
 > ./btrfs.h:19:2: error: #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
 >  #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
 >   ^~~~~
 > In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
 > ./btrfs.h:22:10: fatal error: linux/btrfs_tree.h: No such file or directory
 >  #include <linux/btrfs_tree.h>
 >           ^~~~~~~~~~~~~~~~~~~~

 > Fixes: 79e01ef9506a6cdc4836912607dc594ae7b1999d
 >  - http://autobuild.buildroot.org/results/d6afeef47daae1783dcce3e2b6a0a16e3e5d5fbd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
