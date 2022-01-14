Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C602EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2DF84BAA;
	Fri, 14 Jan 2022 16:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qy4uuWCe8O_S; Fri, 14 Jan 2022 16:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C928884B83;
	Fri, 14 Jan 2022 16:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 759051BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70DA3404A8
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmxQCihXNjAS for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:06:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4661F4010F
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:06:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5113040010;
 Fri, 14 Jan 2022 16:06:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8P5Z-0000Ce-MG; Fri, 14 Jan 2022 17:06:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211210181353.4012562-1-fontaine.fabrice@gmail.com>
Date: Fri, 14 Jan 2022 17:06:05 +0100
In-Reply-To: <20211210181353.4012562-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 10 Dec 2021 19:13:53 +0100")
Message-ID: <87lezi715e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: security bump to version
 1.0.3
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-43784: runc is a CLI tool for spawning and running
 > containers on Linux according to the OCI specification. In runc, netlink
 > is used internally as a serialization system for specifying the relevant
 > container configuration to the `C` portion of the code (responsible for
 > the based namespace setup of containers). In all versions of runc prior
 > to 1.0.3, the encoder did not handle the possibility of an integer
 > overflow in the 16-bit length field for the byte array attribute type,
 > meaning that a large enough malicious byte array attribute could result
 > in the length overflowing and the attribute contents being parsed as
 > netlink messages for container configuration. This vulnerability
 > requires the attacker to have some control over the configuration of the
 > container and would allow the attacker to bypass the namespace
 > restrictions of the container by simply adding their own netlink payload
 > which disables all namespaces. The main users impacted are those who
 > allow untrusted images with untrusted configurations to run on their
 > machines (such as with shared cloud infrastructure). runc version 1.0.3
 > contains a fix for this bug. As a workaround, one may try disallowing
 > untrusted namespace paths from your container. It should be noted that
 > untrusted namespace paths would allow the attacker to disable namespace
 > protections entirely even in the absence of this bug.

 > https://github.com/opencontainers/runc/releases/tag/v1.0.3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
