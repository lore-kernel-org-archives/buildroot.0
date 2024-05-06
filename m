Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB159C25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 11:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DECE405EE;
	Mon,  6 May 2024 11:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3AVP9N7DixF; Mon,  6 May 2024 11:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 485B9405EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 485B9405EF;
	Mon,  6 May 2024 11:47:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3496F1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 11:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F99980E78
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 11:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB8bJ9qtCXQA for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 11:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E29BA80C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29BA80C98
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E29BA80C98
 for <buildroot@buildroot.org>; Mon,  6 May 2024 11:47:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 445ECE0004;
 Mon,  6 May 2024 11:47:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s3won-001FuP-0Y;
 Mon, 06 May 2024 13:47:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@gmail.com>
References: <20240403211805.3100506-1-vfazio@gmail.com>
Date: Mon, 06 May 2024 13:47:41 +0200
In-Reply-To: <20240403211805.3100506-1-vfazio@gmail.com> (Vincent Fazio's
 message of "Wed, 3 Apr 2024 16:18:05 -0500")
Message-ID: <875xvr17s2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix cross builds when
 host and target use the same SOABI
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Vincent" == Vincent Fazio <vfazio@gmail.com> writes:

 > When python performs a cross compile, it uses a host interpreter to run
 > steps on behalf of the foreign architecture to finalize the build.

 > When performing these steps, foreign modules may be loaded if the SOABI
 > matches that of the host. This can lead to issues if the modules are
 > linked against a libc not available on the host or if the binaries
 > include instructions unsupported by the host.

 > For now, patch the foreign libraries out of PYTHONPATH and explicitly
 > define the path to sysconfigdata so builds can complete without error.

 > This method currently passes all upstream CI pipelines [0] and should
 > also work (with some modifications) for the migration to 3.12 [1].

 > Fixes: http://autobuild.buildroot.net/results/c854080e003e9a7d525325073190b472a8f982aa/
 > [0]: https://github.com/python/cpython/pull/116294
 > [1]: https://lists.buildroot.org/pipermail/buildroot/2024-February/685369.html

 > Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
