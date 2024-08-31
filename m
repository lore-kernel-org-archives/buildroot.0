Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F5FCD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCED281B23;
	Sat, 31 Aug 2024 16:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0-je8fDh6nP; Sat, 31 Aug 2024 16:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88BD81B48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88BD81B48;
	Sat, 31 Aug 2024 16:46:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F26831BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED17E6072C
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIhQyeX5VBju for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF780606EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF780606EB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF780606EB
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:46:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49E3F20002;
 Sat, 31 Aug 2024 16:46:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skRFO-00GWQE-2D;
 Sat, 31 Aug 2024 18:46:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240722220922.590401-1-fontaine.fabrice@gmail.com>
Date: Sat, 31 Aug 2024 18:46:46 +0200
In-Reply-To: <20240722220922.590401-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 23 Jul 2024 00:09:22 +0200")
Message-ID: <87plpoy70p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: fix glibc build with
 gcc >= 14
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

 > ac_cv_func_strerror_r_char_p is hardcoded to no since commit
 > 74b9bf9945921a7b0504b4b546a4bc26f2adcc45 back in 2005 however strerror_r
 > only returns an int with musl. With glibc or uclibc, strerror_r returns
 > a char* or an int depending on _GNU_SOURCE value resulting in the
 > following build failure with gcc >= 14:

 > strerror_r.c: In function 'rpl_strerror_r':
 > strerror_r.c:207:9: error: assignment to 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
 >   207 |     ret = strerror_r (errnum, buf, buflen);
 >       |         ^

 > To fix this build failure, don't hardcode ac_cv_func_strerror_r_char_p
 > to let coreutils pick the correct value

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8bc649ca5490b0c29c90383edfa2e693f154ebc4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
