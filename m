Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABACCD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870E081E40;
	Sat, 31 Aug 2024 17:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqcifOlpzB_V; Sat, 31 Aug 2024 17:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A89C481E2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A89C481E2E;
	Sat, 31 Aug 2024 17:16:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8A851BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3E6060706
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCNgT70lgbFx for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E51A9605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E51A9605E3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E51A9605E3
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:16:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03BF91BF208;
 Sat, 31 Aug 2024 17:16:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skRhp-00GZMJ-1H;
 Sat, 31 Aug 2024 19:16:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240724163806.262384-1-fontaine.fabrice@gmail.com>
Date: Sat, 31 Aug 2024 19:16:09 +0200
In-Reply-To: <20240724163806.262384-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 24 Jul 2024 18:38:06 +0200")
Message-ID: <87h6b0wr3a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: fix powerpc64 build
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

 > Fix the following build failure with powerpc64 raised since bump to
 > version 3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:

 > In file included from /home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/rc4/rc4_enc.c:61:
 > /home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
 >    75 |         RC4_INT x, y;
 >       |         ^~~~~~~

 > Fixes: 21eca49ed5110872407b76ab9337d2877c4cda24
 >  - http://autobuild.buildroot.org/results/2533f8f642f435b40ce687b6df482c51a3fa0250

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
