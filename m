Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C91AE77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB3581F84;
	Fri,  6 Dec 2024 09:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5k-T7gOfQMf; Fri,  6 Dec 2024 09:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A89C81FA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A89C81FA0;
	Fri,  6 Dec 2024 09:26:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 416BDED0
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2233A81F7D
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7V-RVzVYaqH for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1962081219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1962081219
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1962081219
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:26:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 704B2FF809;
 Fri,  6 Dec 2024 09:26:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJUbK-006WPI-25;
 Fri, 06 Dec 2024 10:26:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241126182855.38704-1-ju.o@free.fr>
Date: Fri, 06 Dec 2024 10:26:18 +0100
In-Reply-To: <20241126182855.38704-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 26 Nov 2024 19:28:55 +0100")
Message-ID: <87plm56u2t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: improve mosquitto test
 reliability
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The mosquitto runtime test can randomly fail on slow
 > runners, see [1].

 > This commit improves this test in the following ways:

 > - the mosquitto_sub subscriber process is now started in a subshell
 > to suppress the job control messages (to prevent any spurious
 > messages when the job stops),

 > - the standard error is redirected to /dev/null, to prevent the
 > printing of any messages,

 > - the mosquitto_pub publisher process is started later, by increasing
 > the sleep time,

 > - finally, a new sleep time is introduced between the mosquitto_pub
 > publisher process and the check of the mosquitto_sub subscriber, to
 > make sure it will have time to write its output and exit.

 > Fixes: [1]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8453386454

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
