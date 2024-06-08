Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E44C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 579F4417A1;
	Sat,  8 Jun 2024 07:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssEkrz4CsjUs; Sat,  8 Jun 2024 07:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADC641A41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ADC641A41;
	Sat,  8 Jun 2024 07:44:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC37A1BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C986560653
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xjSpzVOQ7OD for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:44:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD4C560626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD4C560626
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD4C560626
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:44:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7425460002;
 Sat,  8 Jun 2024 07:44:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFqkD-00GUyu-1s;
 Sat, 08 Jun 2024 09:44:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20240510235510.2454216-1-brandon.maier@collins.com>
 <20240510235510.2454216-2-brandon.maier@collins.com>
Date: Sat, 08 Jun 2024 09:44:09 +0200
In-Reply-To: <20240510235510.2454216-2-brandon.maier@collins.com> (Brandon
 Maier via buildroot's message of "Fri, 10 May 2024 23:55:10 +0000")
Message-ID: <871q57ang6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/zip: fix build with GCC 14
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
Cc: Jan Pedersen <jp@jp-embedded.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > Builds with GCC 14 print the following error
 >> zip.h:726:10: error: conflicting types for 'memset'; have 'char *(char *, int,  unsigned int)'

 > This is because with GCC 14, Zip incorrectly detects that the memset functions
 > exist. Which enables the ZMEM flag and declares its own version of memset.

 > This is because the ./unix/configure script attempts to compile a C file using
 > 'memset' but it does not include the <string.h>. This was allowed in gnu89, but
 > in GCC 14 -Werror=implicit-function-declaration is enabled by default[1].

 > We forcefully set '-std=gnu89' so that Zip will compile everything against
 > gnu89, which suppresses the warning.

 > [1] https://gcc.gnu.org/gcc-14/porting_to.html#warnings-as-errors

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
