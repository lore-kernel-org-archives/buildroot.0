Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE55CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACAA860717;
	Tue,  3 Sep 2024 18:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RrZhYA_6O8T; Tue,  3 Sep 2024 18:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD8E160761
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD8E160761;
	Tue,  3 Sep 2024 18:24:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2EB01BF356
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0DD060761
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3WqyDz3NOJY for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE2D660717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2D660717
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE2D660717
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:24:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA2FEFF803;
 Tue,  3 Sep 2024 18:24:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slYCo-0054uu-0U;
 Tue, 03 Sep 2024 20:24:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240810105606.415339-1-ju.o@free.fr>
Date: Tue, 03 Sep 2024 20:24:42 +0200
In-Reply-To: <20240810105606.415339-1-ju.o@free.fr> (Julien Olivain's message
 of "Sat, 10 Aug 2024 12:56:06 +0200")
Message-ID: <87ttewmw7p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: package: mariadb: fix
 test configuration
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The mysql virtual package was removed in commit 8708f3a23a
 > "package/mysql: drop virtual package".

 > The mariadb runtime test was authored before this mysql virtual
 > package removal, but was merged after it, in commit 5356754d1e
 > "support/testing: add mariadb runtime test". Due to this, this test
 > always failed with the error:

 >     Makefile.legacy:9: *** "You have legacy configuration in your .config! Please check your configuration.".  Stop.

 > This commit fixes the issue by removing the legacy
 > BR2_PACKAGE_MYSQL=y configuration directive.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/7540345406

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
