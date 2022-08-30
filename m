Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303A7ECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 22:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A23DD40C08;
	Tue, 30 Aug 2022 22:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A23DD40C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mjJw8jE4pGV; Tue, 30 Aug 2022 22:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF98240BFE;
	Tue, 30 Aug 2022 22:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF98240BFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8A701BF372
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB7440BFE
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB7440BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vvCKUeo_RHvL for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 22:30:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BF474019B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BF474019B
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 22:30:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 711B860004;
 Tue, 30 Aug 2022 22:30:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oT9ky-0003XL-6t; Wed, 31 Aug 2022 00:30:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220727104751.2505442-1-thomas.petazzoni@bootlin.com>
Date: Wed, 31 Aug 2022 00:30:52 +0200
In-Reply-To: <20220727104751.2505442-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 27 Jul 2022 12:47:51
 +0200")
Message-ID: <87ilm9mkir.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-rpath: send
 readelf error output to oblivion
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Somewhere between binutils 2.35 and 2.37, some functionality was
 > added in readelf to parse more DWARF information. Unfortunately, as
 > reported in binutils bug
 > 28981 ("https://sourceware.org/bugzilla/show_bug.cgi?id=28981"), this
 > feature causes a number of fairly scary warnings to be displayed when
 > running readelf on binaries built with Clang, such as the pre-built
 > rustc and rustdoc binaries part of the host-rust-bin package. It
 > looks like this:

 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc:
 > Warning: Bogus end-of-siblings marker detected at offset 2f in
 > .debug_info section
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc:
 > Warning: Bogus end-of-siblings marker detected at offset 10b in
 > .debug_info section
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc:
 > Warning: Bogus end-of-siblings marker detected at offset 10c in
 > .debug_info section
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc:
 > Warning: Further warnings about bogus end-of-sibling markers
 > suppressed
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
 > readelf: /home/thomas/projets/buildroot/output/host/bin/rustc:
 > Warning: DIE at offset 0x1da refers to abbreviation number 5827 which
 > does not exist

 > These warnings are caused by the readelf calls done by the
 > support/scripts/check-host-rpath script. The annoying thing is that
 > once host-rust-bin has been installed in $(HOST_DIR), this warning
 > appears after the installation of every single host package, because
 > support/scripts/check-host-rpath rescans all binaries every time.

 > To avoid showing those scary warnings, this commit sends the error
 > output of readelf to /dev/null.

 > Of course, it would be nicer to only filter out those warnings, but
 > filtering the error output without merging the error output into the
 > standard output is tricky, so let's keep things simple. If there is
 > really an error, readelf will abort.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
