Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29311C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E8160B83;
	Tue, 15 Mar 2022 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHMWC6qmRTjn; Tue, 15 Mar 2022 20:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77E76068F;
	Tue, 15 Mar 2022 20:59:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 985681BF263
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84853404EB
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3LUPzEXlRok for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:59:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AD4E404F0
 for <buildroot@uclibc.org>; Tue, 15 Mar 2022 20:59:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B18EB83F8B; Tue, 15 Mar 2022 20:50:29 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 15 Mar 2022 20:59:11 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ps.report@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-13971-163-IBtfrhunrg@https.bugs.busybox.net/>
In-Reply-To: <bug-13971-163@https.bugs.busybox.net/>
References: <bug-13971-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 13971] ip6tables-nft build does not include
 MASQUERADE target options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=13971

--- Comment #9 from Peter Seiderer <ps.report@gmx.net> ---
Re-add bug description from one of the duplicates:

> From mbuil@suse.com 2021-07-08 15:27:37 UTC
>
> Since 1.6, iptables supports the MASQUERADE target options:
>
> MASQUERADE target options:
>  --to-ports <port>[-<port>]
>                               Port (range) to map to.
>  --random
>                               Randomize source port.
>  --random-fully
>                               Fully randomize source port.
>
> When building iptables-nft, the MASQUERADE target options are included in the iptables-nft binary, however, they are not in the ip6tables-nft:
>
> $> sudo ./output/target/usr/sbin/iptables-nft -A POSTROUTING -s 10.244.0.0/16 ! -d 224.0.0.0/4 -j MASQUERADE --help | grep random
>  --random
>  --random-fully
>                               Fully randomize source port.
> $> sudo ./output/target/usr/sbin/ip6tables-nft -A POSTROUTING -s 10.244.0.0/16 ! -d 224.0.0.0/4 -j MASQUERADE --help | grep random
> $>
>
> Those targets come from the files libipt_MASQUERADE.c and libip6t_MASQUERADE.c in https://git.netfilter.org/iptables/tree/extensions but for some reason the ip6 one does not get included in the binary

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
