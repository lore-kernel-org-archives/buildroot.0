Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F5AC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 579CD417DB;
	Thu, 29 Feb 2024 15:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fi0AMQcF5IkL; Thu, 29 Feb 2024 15:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6CA2417F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6CA2417F1;
	Thu, 29 Feb 2024 15:19:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 228C51BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F45F60EC8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vPmugiNlVlK for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EB8960A91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB8960A91
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EB8960A91
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:18:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAC2440002;
 Thu, 29 Feb 2024 15:18:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiAs-004mPd-1v;
 Thu, 29 Feb 2024 16:18:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
References: <78273b30-5659-4cc0-91f8-23a8775fedf2@sord.co.jp>
 <87le7zt9qd.fsf@48ers.dk>
Date: Thu, 29 Feb 2024 16:18:18 +0100
In-Reply-To: <87le7zt9qd.fsf@48ers.dk> (Peter Korsgaard's message of "Mon, 05
 Feb 2024 12:46:02 +0100")
Message-ID: <87wmqnguyt.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sysstat: do not autodetect
 sa_lib_dir
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Atsushi" == Atsushi Nemoto <atsushi.nemoto@sord.co.jp> writes:
 >> The configure script of sysstat package checks host's /usr/lib64
 >> directory for default sa_lib_dir.
 >> Specify sa_lib_dir exclicitly to avoid host dependency.

 >> Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>

 > Committed, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
