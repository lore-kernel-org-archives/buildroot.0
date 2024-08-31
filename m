Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97188CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DDF281D02;
	Sat, 31 Aug 2024 16:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNwdJNE4mxvw; Sat, 31 Aug 2024 16:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7624081D4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7624081D4D;
	Sat, 31 Aug 2024 16:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4C001BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF0D6400B9
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beSR9OeR_Ho1 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B1B040021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B1B040021
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B1B040021
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:58:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FC371C0003;
 Sat, 31 Aug 2024 16:58:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skRQw-00GXTv-1W;
 Sat, 31 Aug 2024 18:58:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240723162533.549929-1-fontaine.fabrice@gmail.com>
Date: Sat, 31 Aug 2024 18:58:42 +0200
In-Reply-To: <20240723162533.549929-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 23 Jul 2024 18:25:33 +0200")
Message-ID: <874j70y6gt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-apps: fix build with gcc >=
 14
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Workaround for glibc 2.31 added by commit
 > bbe170dbcf4ddb63e76299214e2c18b16e5cf016 back in 2020 is incorrect as it
 > writes new_time (a pointer on time_t) into timespec.tv_sec (i.e. time_t).
 > This mistake raises the following build failure with gcc >= 14:

 > dvbdate.c: In function 'set_time':
 > dvbdate.c:313:18: error: assignment to '__time_t' {aka 'long int'} from 'time_t *' {aka 'long int *'} makes integer from pointer without a cast [-Wint-conversion]
 >   313 |         s.tv_sec = new_time;
 >       |                  ^

 > It shall be noted that gentoo also spotted this mistake:
 > https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files?id=81e99f1c753d1cb564be29b22dcd8927830c4b9a

 > Fixes: bbe170dbcf4ddb63e76299214e2c18b16e5cf016
 >  - http://autobuild.buildroot.org/results/e99b9ebf602d307fbc32f2a367e95177f53a68f9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
