Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F7BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 934C160B85;
	Mon, 27 Jun 2022 22:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 934C160B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4w1ZVFVCSoCD; Mon, 27 Jun 2022 22:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9830760A93;
	Mon, 27 Jun 2022 22:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9830760A93
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF5F81BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9789D400D7
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9789D400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWe5Z-6muCBy for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:32:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A75400D6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6A75400D6
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:32:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 84C3F240004;
 Mon, 27 Jun 2022 22:32:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5xHk-00D5pl-Mf; Tue, 28 Jun 2022 00:32:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
References: <20220619162933.627103-1-fontaine.fabrice@gmail.com>
 <20220621164142.4567715d@booty>
Date: Tue, 28 Jun 2022 00:32:48 +0200
In-Reply-To: <20220621164142.4567715d@booty> (Luca Ceresoli via buildroot's
 message of "Tue, 21 Jun 2022 16:41:42 +0200")
Message-ID: <875yklu48f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: fix CVE-2022-31031
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Luca" == Luca Ceresoli via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 19 Jun 2022 18:29:33 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> PJSIP is a free and open source multimedia communication library written
 >> in C language implementing standard based protocols such as SIP, SDP,
 >> RTP, STUN, TURN, and ICE. In versions prior to and including 2.12.1 a
 >> stack buffer overflow vulnerability affects PJSIP users that use STUN in
 >> their applications, either by: setting a STUN server in their
 >> account/media config in PJSUA/PJSUA2 level, or directly using
 >> `pjlib-util/stun_simple` API.
 >> 
 >> https://github.com/pjsip/pjproject/security/advisories/GHSA-26j7-ww69-c4qj
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
