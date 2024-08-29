Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75028C761AE
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3843240B67;
	Thu, 29 Aug 2024 06:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqeIVW-uDFR6; Thu, 29 Aug 2024 06:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D33040C6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D33040C6B;
	Thu, 29 Aug 2024 06:15:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43E2C1BF867
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F5A40C6B
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cOgwXlc4pRE for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0621E40B67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0621E40B67
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0621E40B67
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:15:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DE0A240003;
 Thu, 29 Aug 2024 06:15:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjYRL-006GBj-33;
 Thu, 29 Aug 2024 08:15:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240720195505.1052184-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Aug 2024 08:15:27 +0200
In-Reply-To: <20240720195505.1052184-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 20 Jul 2024 21:55:05 +0200")
Message-ID: <87ttf36eio.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/zsh: fix build with gcc >= 14
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc >= 14:
 > termcap.c:45:14: error: conflicting types for 'boolcodes'; have 'char *[]'
 >    45 | static char *boolcodes[] = {
 >       |              ^~~~~~~~~
 > In file included from ../../Src/zshterm.h:1,
 >                  from ../../Src/zsh_system.h:932,
 >                  from ../../Src/zsh.mdh:17,
 >                  from termcap.mdh:17,
 >                  from termcap.c:38:
 > /home/autobuild/autobuild/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/term.h:764:56: note: previous declaration of 'boolcodes' with type 'const char * const[]'
 >   764 | extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolcodes[];
 >       |                                                        ^~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/fe2f7170465e96cc1de3dae139a25f615331f4b9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
