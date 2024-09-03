Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BFCCD3448
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A5F6073C;
	Tue,  3 Sep 2024 16:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1q-8p3zrcNU; Tue,  3 Sep 2024 16:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6065560634
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6065560634;
	Tue,  3 Sep 2024 16:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3EE1BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B2A84016D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6ICn8MbYjho for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:26:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C26CC4022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C26CC4022A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C26CC4022A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:26:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E939F20004;
 Tue,  3 Sep 2024 16:26:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slWMR-004gh9-1D;
 Tue, 03 Sep 2024 18:26:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240723132058.629476-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Sep 2024 18:26:31 +0200
In-Reply-To: <20240723132058.629476-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 23 Jul 2024 15:20:58 +0200")
Message-ID: <87zfooog94.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/pistache: needs NPTL
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

 > pistache needs NPTL as it unconditionally uses pthread_setname_np since
 > https://github.com/pistacheio/pistache/commit/b283c32963a7cb0500cf69555d320a6e9e252850
 > resulting in the following uclibc build failure since commit
 > 82e61bed8208857d5d13c384c89086c4dd4e1e79:

 > ../src/common/reactor.cc: In lambda function:
 > ../src/common/reactor.cc:512:25: error: 'pthread_setname_np' was not
 > declared in this scope; did you mean 'pthread_setcanceltype'?
 >   512 |                         pthread_setname_np(pthread_self(),
 >       |                         ^~~~~~~~~~~~~~~~~~
 >       |                         pthread_setcanceltype

 > Fixes: 82e61bed8208857d5d13c384c89086c4dd4e1e79
 >  - http://autobuild.buildroot.org/results/b2b22e4f9684aca0246650673fd8c33019712ddf
 >  - http://autobuild.buildroot.org/results/1597bfe2a57cd3aef54d331447dd81cae020d434

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
