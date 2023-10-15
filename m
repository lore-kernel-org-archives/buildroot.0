Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A71CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 08:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 178B4404E2;
	Sun, 15 Oct 2023 08:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 178B4404E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnpylm3R4nXC; Sun, 15 Oct 2023 08:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 619AE405AE;
	Sun, 15 Oct 2023 08:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619AE405AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 175381BF35B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 08:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2F3740AA2
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 08:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2F3740AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2Q3etIn0vLR for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 08:58:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95DF440A82
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 08:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95DF440A82
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FB8B240002;
 Sun, 15 Oct 2023 08:58:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrwx3-008fDz-Is; Sun, 15 Oct 2023 10:58:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231013210830.143696-1-fontaine.fabrice@gmail.com>
Date: Sun, 15 Oct 2023 10:58:21 +0200
In-Reply-To: <20231013210830.143696-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 13 Oct 2023 23:08:30 +0200")
Message-ID: <87lec4xnwy.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: fix libgpgme static build
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

 > Fix the following static build failure with libgpgme raised since at
 > least bump to version 2.2.9 in commit
 > 7a2afdb7b1180bed3b6ad92c22c908805467ead3:

 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/11.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-11/output-1/host/sh4a-buildroot-linux-musl/sysroot/usr/lib/libgpgme.a(assuan-support.o):
 > in function `my_usleep':
 > assuan-support.c:(.text+0x260): undefined reference to `__assuan_usleep'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0680dbc95601fcd8cdf07b926ea5e9be2079c7bf
 >  - http://autobuild.buildroot.org/results/b4f2d1ad77fb8b97accc4150d8249de145cb9cf4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
