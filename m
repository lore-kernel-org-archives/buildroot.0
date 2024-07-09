Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B014AC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 05:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C12860875;
	Tue,  9 Jul 2024 05:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQ0Ci_BOlWd0; Tue,  9 Jul 2024 05:47:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4DF60A9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4DF60A9A;
	Tue,  9 Jul 2024 05:47:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 046271BF97C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E43A281348
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rx1l313qvV8k for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 05:47:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC63A8133E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC63A8133E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC63A8133E
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 05:47:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18A77240002;
 Tue,  9 Jul 2024 05:47:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sR3hE-005EgF-35;
 Tue, 09 Jul 2024 07:47:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <89efe20c38632a2416a2fb25dbe8c2605fcdf680.1719584657.git.baruch@tkos.co.il>
Date: Tue, 09 Jul 2024 07:47:24 +0200
In-Reply-To: <89efe20c38632a2416a2fb25dbe8c2605fcdf680.1719584657.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Fri, 28 Jun 2024 17:24:17
 +0300")
Message-ID: <87y16bktg3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/libcurl: fix build with mbedtls
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > Add upstream patch to fix compatibility with mbedtls version 2.28.x.
 > Fixes:
 > http://autobuild.buildroot.net/results/66ba878386e4e478645edb6a282e82820b8dad7f
 > http://autobuild.buildroot.net/results/7a4d9595197cf23080a23dfe9bc0e60b8145af6e
 > http://autobuild.buildroot.net/results/9add7283813388daa95b16ef76acb3c4e9ea7c2f

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Correct authorship and sign-off email

Committed after extending the commit message to make it clear that this
is introduced by the curl 8.8.0 bump, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
