Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF9CE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 14:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91D226058B;
	Mon,  6 Jan 2025 14:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dQCJWOBtKAs; Mon,  6 Jan 2025 14:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9B260590
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9B260590;
	Mon,  6 Jan 2025 14:03:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 958D4DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8394560590
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maECmO9ZDOh2 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 14:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 488DC6058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 488DC6058B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 488DC6058B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:03:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC63AE0002;
 Mon,  6 Jan 2025 14:03:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tUnhb-00CIuC-1C;
 Mon, 06 Jan 2025 15:03:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Reza Arbab <arbab@linux.ibm.com>
Cc: buildroot@buildroot.org
References: <20241211170341.450579-1-arbab@linux.ibm.com>
Date: Mon, 06 Jan 2025 15:03:31 +0100
In-Reply-To: <20241211170341.450579-1-arbab@linux.ibm.com> (Reza Arbab's
 message of "Wed, 11 Dec 2024 11:03:41 -0600")
Message-ID: <87msg4ghu4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/skeleton: create lib64 symlink on
 s390x
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

>>>>> "Reza" == Reza Arbab <arbab@linux.ibm.com> writes:

 > Building on a s390x host, we currently end up with:
 >   output/host/lib
 >   output/host/lib32 -> lib
 >   output/host/lib64

 > host-libopenssl installs to lib64, but since the kernel build doesn't
 > explicitly search there, it breaks:

 >>>> linux 6.6.32 Building
 >   [...]
 >     HOSTCC  scripts/sign-file
 >   /usr/bin/ld: cannot find -lcrypto: No such file or directory
 >   collect2: error: ld returned 1 exit status

 > Fix this by creating a lib64 link instead of lib32, so we get:

 >   output/host/lib
 >   output/host/lib64 -> lib

 > Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
