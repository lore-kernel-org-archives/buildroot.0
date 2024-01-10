Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52F4C4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E0A421DB;
	Wed, 10 Jan 2024 15:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E0A421DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doLkja0o2IUq; Wed, 10 Jan 2024 15:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9770E421BE;
	Wed, 10 Jan 2024 15:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9770E421BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3B1D1BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78219436F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78219436F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cp18ikHYl5bd for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:25:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BE0B436D9
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE0B436D9
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC976FF80A;
 Wed, 10 Jan 2024 15:25:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNaSY-008bC0-0K;
 Wed, 10 Jan 2024 16:25:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231225225420.2531967-1-thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jan 2024 16:25:38 +0100
In-Reply-To: <20231225225420.2531967-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 25 Dec 2023 23:54:19
 +0100")
Message-ID: <87le8xcirx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gdb: build and link libbfd and
 libopcodes as static libraries
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

 > Since GDB 13.x and upstream commit
 > b686ecb5b10be9a33ab8f1bfdcff22eef920d1a5 ("gdb: link executables with
 > libtool"), gdb will be linked against the shared variants of libbfd
 > and libopcodes if they exist. However, this causes host gdb and target
 > gdb to not work, because our gdb package does not install libbfd and
 > libopcodes (to not clash with the ones potentially installed by
 > binutils).

 > In order to get around this, this commit proposes to get back to the
 > situation we had before GDB 13.x: libbfd and libopcodes are only
 > compiled as static libraries, so that they are linked directly inside
 > the gdb binary, avoiding the problem entirely.

 > This resolves:

 >  # gdb --version
 >  gdb: error while loading shared libraries: libopcodes-2.39.50.so: cannot open shared object file: No such file or directory

 > for target gdb, and:

 >  $ ./host/bin/arm-linux-gdb --version
 >  ./host/bin/arm-linux-gdb: error while loading shared libraries:
 > libopcodes-2.39.50.so: cannot open shared object file: No such file or
 > directory

 > for host gdb.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
