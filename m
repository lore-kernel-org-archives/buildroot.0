Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C88C4167B
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 10:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62BBE421DB;
	Tue,  7 Nov 2023 10:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62BBE421DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LyClBGRjDMRS; Tue,  7 Nov 2023 10:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F86542161;
	Tue,  7 Nov 2023 10:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F86542161
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35D141BF370
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AA15408C0
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA15408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_2rDGOP1j3f for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 10:48:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98CF140158
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 10:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98CF140158
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16890FF80D;
 Tue,  7 Nov 2023 10:48:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0Jd3-00H6E8-1f;
 Tue, 07 Nov 2023 11:48:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1699297749.git.yann.morin.1998@free.fr>
 <c4cb742e3bd2d4c18b6a21338167c17b50fe4986.1699297749.git.yann.morin.1998@free.fr>
Date: Tue, 07 Nov 2023 11:48:17 +0100
In-Reply-To: <c4cb742e3bd2d4c18b6a21338167c17b50fe4986.1699297749.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 6 Nov 2023 20:09:14 +0100")
Message-ID: <871qd1yh3i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3 v2] pkg-download: add option to enforce
 hash checking
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
Cc: "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, when a pacakge is downloaded from a custom location or
 > version, Buildroot excludes such a package from the mandatory integrity
 > check with hashes, because it was until now not possible to have such
 > hashes.

 > We now have a mechanism which users can leverage to provide additional
 > hashes, and so custom versions or locations can now be checked too.

 > Buildroot has no way to know that hashes have indeed been provided for
 > a custom location/version, and so will still happilly ignore an
 > unchecked package.

 > However, users who do provide extra hashes most probably do expect that
 > no download is done without an integrity check, and thus expect that a
 > missing hash not be ignored.

 > Add an option that users can select to make Buildroot forcibly require
 > at least one valid hash, and no invalid hash, for all downloads.

 > Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
