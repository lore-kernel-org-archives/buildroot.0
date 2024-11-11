Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB676D12D61
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD6E606BB;
	Mon, 11 Nov 2024 15:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Byyw6Iw0lsjC; Mon, 11 Nov 2024 15:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97DCB606C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DCB606C0;
	Mon, 11 Nov 2024 15:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 823CC6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FFE780C2B
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5weDo4jd0ClX for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6832880C29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6832880C29
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6832880C29
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:47:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEA5120005;
 Mon, 11 Nov 2024 15:47:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tAWdV-00B3W7-0a;
 Mon, 11 Nov 2024 16:47:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
References: <20240919081820.1363577-1-fido_max@inbox.ru>
Date: Mon, 11 Nov 2024 16:47:29 +0100
In-Reply-To: <20240919081820.1363577-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Thu, 19 Sep 2024 11:18:19 +0300")
Message-ID: <87pln1ai26.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix build without
 BR2_TOOLCHAIN_HAS_THREADS_NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@buildroot.org> writes:

 > Since commit: https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=52afe563206e753f4c45c014fee2459ad0855826
 > postgrsql fails to build with toolchains without threads support:

 > misc.c: In function 'ecpg_gettext':
 > misc.c:541:51: error: 'PTHREAD_MUTEX_INITIALIZER' undeclared (first use in this function)
 >   541 |         static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
 >       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
 > misc.c:541:51: note: each undeclared identifier is reported only once for each function it appears in
 > misc.c:552:24: warning: implicit declaration of function 'pthread_mutex_lock' [-Wimplicit-function-declaration]
 >   552 |                 (void) pthread_mutex_lock(&binddomain_mutex);
 >       |                        ^~~~~~~~~~~~~~~~~~
 > misc.c:569:24: warning: implicit declaration of function 'pthread_mutex_unlock' [-Wimplicit-function-declaration]
 >   569 |                 (void) pthread_mutex_unlock(&binddomain_mutex);
 >       |                        ^~~~~~~~~~~~~~~~~~~~

 > Option "--disable-thread-safety" will be dropped in PG 17, so
 > this patch is needed only for 16.x branch.

 > Fixes: 73dd1d6b9666 ("package/postgresql: security bump version to 16.3")
 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
