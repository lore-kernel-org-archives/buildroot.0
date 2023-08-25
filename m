Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835EEC71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 12:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD6D61451;
	Fri, 25 Aug 2023 12:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD6D61451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scfDwHkIyr2K; Fri, 25 Aug 2023 12:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6198C61441;
	Fri, 25 Aug 2023 12:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6198C61441
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C183A1BF309
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BD2883B97
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD2883B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jn8WIf4FhktY for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 12:56:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FFA883B22
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 12:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FFA883B22
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3504B1BF203;
 Fri, 25 Aug 2023 12:56:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZWMA-002snK-1R; Fri, 25 Aug 2023 14:56:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Charles Hardin <ckhardin@gmail.com>
References: <20230620172305.4176-1-ckhardin@gmail.com>
Date: Fri, 25 Aug 2023 14:56:06 +0200
In-Reply-To: <20230620172305.4176-1-ckhardin@gmail.com> (Charles Hardin's
 message of "Tue, 20 Jun 2023 10:23:05 -0700")
Message-ID: <87cyzbcmc9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/unzip: configure with
 LARGE_FILE_SUPPORT by default
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Charles" == Charles Hardin <ckhardin@gmail.com> writes:

 > Buildroot always enable largefile support in the toolchains, and
 > thus the associated definitions are always on. This leads to a
 > problem in the unzip that on a 32-bit arch with these flags being
 > passed in

 >    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64

 > But, the LARGE_FILE_SUPPORT not being defined will cause a size
 > mismatch on the comparison of the zipfiles.

 >     $ unzip test.zip
 >     Archive: test.zip
 >     error: invalid zip file with overlapped components (possible zip bomb)

 > Simple solution is just enable LARGE_FILE_SUPPORT in cmake to get
 > an expected extraction.

 > Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
