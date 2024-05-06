Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71000C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C3A605F2;
	Mon,  6 May 2024 10:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bvR1JA_a9Ji; Mon,  6 May 2024 10:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AAE860818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AAE860818;
	Mon,  6 May 2024 10:54:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC9341BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9952D400C7
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B71t1_yWtmj1 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C329400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C329400BA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C329400BA
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:54:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A69540009;
 Mon,  6 May 2024 10:54:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s3vzH-001Dgb-1p;
 Mon, 06 May 2024 12:54:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240407092105.276261-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 May 2024 12:54:27 +0200
In-Reply-To: <20240407092105.276261-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Apr 2024 11:21:04 +0200")
Message-ID: <87ttjb1a8s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/libnpth: fix musl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following musl build failure raised since bump to version 1.7 in
 > commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91 and
 > https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=575573b5b63e147b1906240f192dbe37a26ca4b9:

 > npth.c:392:21: error: unknown type name 'npth_rwlock_t'; did you mean 'npth_cond_t'?
 >   392 | npth_rwlock_rdlock (npth_rwlock_t *rwlock)
 >       |                     ^~~~~~~~~~~~~
 >       |                     npth_cond_t

 > Fixes: 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91
 >  - http://autobuild.buildroot.org/results/d986ba27b734679fd70b4e0f23278ebd38e13c5d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
