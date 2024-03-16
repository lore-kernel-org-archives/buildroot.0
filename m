Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4922C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 21:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C08A60623;
	Sat, 16 Mar 2024 21:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkuvOgicdL6l; Sat, 16 Mar 2024 21:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F18360631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F18360631;
	Sat, 16 Mar 2024 21:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 149BB1BF391
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22BD407D9
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmQSeANV6-Ct for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 21:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15E9940776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E9940776
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15E9940776
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 21:03:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D590940003;
 Sat, 16 Mar 2024 21:03:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlbBP-001VRj-0W;
 Sat, 16 Mar 2024 22:03:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231107174651.5995-1-fontaine.fabrice@gmail.com>
 <20240211232733.77d59395@windsurf>
Date: Sat, 16 Mar 2024 22:03:11 +0100
In-Reply-To: <20240211232733.77d59395@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 11 Feb 2024 23:27:33 +0100")
Message-ID: <87frwpnb3k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix build with -O0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue,  7 Nov 2023 18:46:51 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Fix the following build failure with -O0 raised since bump to version
 >> 2.39 in commit ad276d94a392fb13244e042851a44269e6254d61 and
 >> https://github.com/util-linux/util-linux/commit/2fa4168c8bc9d5438bc1dfadda293c7c21b6fa59:
 >> 
 >> libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
 >> libuuid/src/gen_uuid.c:536:33: error: initializer element is not constant
 >> THREAD_LOCAL int  cache_size = cs_min;
 >> ^~~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/7c9b8508345ffaba167c08521fb865d76555be1d
 >> - http://autobuild.buildroot.org/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> ...rc-gen_uuid.c-fix-cs_min-declaration.patch | 70 +++++++++++++++++++
 >> 1 file changed, 70 insertions(+)
 >> create mode 100644 package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch

 > Applied to master, thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
