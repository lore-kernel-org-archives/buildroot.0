Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA76C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9465A60ACF;
	Tue,  6 Feb 2024 20:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEZB-QwDU_uL; Tue,  6 Feb 2024 20:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5B9860B53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5B9860B53;
	Tue,  6 Feb 2024 20:49:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3AB01BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD94681DE7
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Stag537hZVTI for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F82381DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F82381DE1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F82381DE1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:49:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3285520003;
 Tue,  6 Feb 2024 20:49:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXSNx-00ECEf-16;
 Tue, 06 Feb 2024 21:49:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240111224003.243443-1-ju.o@free.fr>
Date: Tue, 06 Feb 2024 21:49:36 +0100
In-Reply-To: <20240111224003.243443-1-ju.o@free.fr> (Julien Olivain's message
 of "Thu, 11 Jan 2024 23:40:03 +0100")
Message-ID: <87h6il5ndr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add a postgresql
 runtime test
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

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Since commit 2a8065e "package/postgresql: bump version to 16.1", the
 > postgresql service fail to start at runtime with an error:

 >     FATAL:  could not load library "/usr/lib/postgresql/dict_snowball.so": /usr/lib/postgresql/dict_snowball.so: undefined symbol: CurrentMemoryContext

 > See: https://www.postgresql.org/message-id/flat/1266022.1701958693%40sss.pgh.pa.us

 > This runtime test works with postgresql 15.5, when this commit is
 > reverted.

 > Patch tested on branch master at commit 66414ed with commands:

Given that this is now fixed with 16.1, it should work there as well.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
