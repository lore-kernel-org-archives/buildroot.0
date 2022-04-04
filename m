Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74E7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 546BC60FDF;
	Mon,  4 Apr 2022 12:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VitVd2BkBBWv; Mon,  4 Apr 2022 12:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E18260FA5;
	Mon,  4 Apr 2022 12:40:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04C811BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7F334032E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMEh4OSSkjXX for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:40:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67BBF401F2
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:40:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 379AE1C0010;
 Mon,  4 Apr 2022 12:40:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbM0U-005sEW-BE; Mon, 04 Apr 2022 14:40:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
 <20220402141531.1320584-4-thomas.petazzoni@bootlin.com>
Date: Mon, 04 Apr 2022 14:40:30 +0200
In-Reply-To: <20220402141531.1320584-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 2 Apr 2022 16:15:30 +0200")
Message-ID: <87r16dyqbl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] support/scripts/pkg-stats: reimplement
 CPE parsing in pkg-stats
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > pkg-stats currently uses the services from support/scripts/cpedb.py to
 > match the CPE identifiers of packages with the official CPE database.

 > Unfortunately, the cpedb.py code uses regular ElementTree parsing,
 > which involves loading the full XML tree into memory. This causes the
 > pkg-stats process to consume a huge amount of memory:

 > thomas   1310458 85.2 21.4 3708952 3450164 pts/5 R+   16:04   0:33  |   |   \_ python3 ./support/scripts/pkg-stats

 > So, 3.7 GB of VSZ and 3.4 GB of RSS are used by the pkg-stats
 > process. This is causing the OOM killer to kick-in on machines with
 > relatively low memory.

 > This commit reimplements the XML parsing needed to do the CPE matching
 > directly in pkg-stats, using the XmlParser functionality of
 > ElementTree, also called "streaming parsing". Thanks to this, we never
 > load the entire XML tree in RAM, but only stream it through the
 > parser, and construct a very simple list of all CPE identifiers. The
 > max memory consumption of pkg-stats is now:

 > thomas   1317511 74.2  0.9 381104 152224 pts/5   R+   16:08   0:17  |   |   \_ python3 ./support/scripts/pkg-stats

 > So, 381 MB of VSZ and 152 MB of RSS, which is obviously much better.

 > Now, one will probably wonder why this isn't directly changed in
 > cpedb.py. The reason is simple: cpedb.py is also used by
 > support/scripts/missing-cpe, which (for now) heavily relies on having
 > in memory the ElementTree objects, to re-generate a snippet of XML
 > that allows us to submit to NIST new CPE entries.

 > So, future work could include one of those two options:

 >  (1) Re-integrate cpedb.py into missing-cpe directly, and live with
 >      two different ways of processing the CPE database.

 >  (2) Rewrite the missing-cpe logic to also be compatible with a
 >      streaming parsing, which would allow this logic to be again
 >      shared between pkg-stats and missing-cpe.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
