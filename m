Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91633E77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4491C40347;
	Fri,  6 Dec 2024 22:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFhv9TbFy4JN; Fri,  6 Dec 2024 22:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E4204035C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4204035C;
	Fri,  6 Dec 2024 22:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2F56ED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90DAB60611
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7U0IN3SjTPU for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74B676060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74B676060A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74B676060A
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:44:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72207FF805;
 Fri,  6 Dec 2024 22:44:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJh3q-008oET-2o;
 Fri, 06 Dec 2024 23:44:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
 <20241204204806.159596-4-thomas.petazzoni@bootlin.com>
Date: Fri, 06 Dec 2024 23:44:34 +0100
In-Reply-To: <20241204204806.159596-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 4 Dec 2024 21:48:02 +0100")
Message-ID: <87ser04ejx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3] package/android-tools: fix b64_pton()
 issue with GCC >= 14.x
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The android-tools code base uses the __b64_pton() function, which
 > isn't provided by all C libraries. So the Debian patch
 > debian/patches/add_adbd.patch adds an implementation of b64_pton(),
 > but doesn't actually use it, nor defines a prototype for it. Our
 > existing patch 0003-Fix-build-issue-with-uclibc.patch switches the
 > code to use the b64_pton() function... but still without providing a
 > prototype, causing the following build failures with GCC >= 14.x:

 > adb_auth_client.c:75:15: error: implicit declaration of function 'b64_pton'

 > To fix this, we rework 0003-Fix-build-issue-with-uclibc.patch into a
 > patch that:

 >  (1) Renames b64_pton() to adb_b64_pton() to make sure it won't clash
 >      with implementations provided by some C libraries, and adjusts
 >      the call sites accordingly.

 >  (2) Adds a prototype definition of adb_b64_pton() in places where
 >      this function is used.

 > Fixes:

 >   http://autobuild.buildroot.net/results/b25b25337c7ad89c33f8bd20b646850bd993ec53ae9/

 > Even though GCC 14.x support was merged in Buildroot in May 2024, this
 > particular b64_pton() only started appearing on July 15 2024, with the
 > first occurence being:

 >   http://autobuild.buildroot.net/results/1cbe87bbe3c56f28444b3aaba1ba1d05f947d36e/

 > Indeed, it's not before July 15 2024 that we merged commit
 > d201f2f5cd0d1e0389430cda78adead37977a6cd ("package/android-tools: add
 > patches to fix build with GCC 14.x"), which fixed other GCC 14.x
 > issues, which were hiding this b64_pton() problem.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
