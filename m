Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB59C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D548149A;
	Mon,  6 Feb 2023 15:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D548149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSHwY5_SPS4H; Mon,  6 Feb 2023 15:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C12F81496;
	Mon,  6 Feb 2023 15:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C12F81496
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4E381BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E7EE415EF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7EE415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VwB6gZR_bBoL for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:30:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4DE41558
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C4DE41558
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:30:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C9A720003;
 Mon,  6 Feb 2023 15:30:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pP3Ra-00Dxd6-Mj; Mon, 06 Feb 2023 16:30:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, arnout@mind.be, yann.morin.1998@free.fr
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-26-ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2023 16:30:10 +0100
In-Reply-To: <20221127130739.1862398-26-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 27 Nov 2022 10:07:39 -0300")
Message-ID: <87fsbi95h9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 25/25] utils/check-symbols: new script
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

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

Hi,

 > This script checks for inconsistencies on symbols declared in Config.in
 > and used in .mk files.
 > Currently it checks only symbols following the pattern BR2_\w+ .

 > The script first gets the list of all files in the repository (using git
 > ls-files like 'make check-flake8' already do).

 > Then it parses all relevant files, searching for symbol definitions and
 > usages, and add entries into a database.

 > At the end, the database is searched for inconsistencies:
 > - symbol that is part of "choice" and is referenced with "select";
 > - legacy symbol being referenced in packages;
 > - legacy symbol being redefined in packages;
 > - symbol referenced but not defined;
 > - symbol defined but not referenced;
 > - legacy symbol that has a Note stating it is referenced by a package
 >   (for legacy handling) but is referenced in the package without a
 >   comment "# legacy";
 > - legacy symbol that has a Note stating it is referenced by a package
 >   but it is not actually referenced.

 > There is also a debug parameter --search that dumps any filename or
 > symbol entries from the database that matches a regexp.

 > Sample usages:
 > $ utils/check-symbols
 > $ utils/docker-run utils/check-symbols
 > $ utils/check-symbols --search 'GETTEXT\b|\/openssl'

 > At same time the script is created:
 > - add unit tests for it, they can be run using:
 >   utils/docker-run python3 -m pytest -v utils/checksymbolslib/
 > - add two more GitLab CI jobs: check-symbols (to check current tree
 >   using the script) and check-check-symbols (to check the script against
 >   its unit tests)

Cool! It is somewhat annoying that it is separate from check-package,
but given that it needs to work on all files and check-package doesn't,
I indeed also cannot see a good way to fix that.

We should probably add a small notice about it in the manual, E.G. in
adding-packages-tips.txt. Care to send a patch for that?


 > +++ b/utils/check-symbols
 > @@ -0,0 +1,78 @@
 > +#!/usr/bin/env python3
 > +
 > +import argparse
 > +import os
 > +import sys
 > +
 > +import checksymbolslib.file as file
 > +from checksymbolslib.db import DB
 > +
 > +
 > +def parse_args():
 > +    parser = argparse.ArgumentParser()
 > +    parser.add_argument('--search', action='store', default=None,
 > +                        help='print all symbols matching a given regular expression')
 > +    return parser.parse_args()
 > +
 > +
 > +def change_current_dir():
 > +    base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
 > +    os.chdir(base_dir)

change_current_dir() is IMHO not a very clear name, so I've changed it
to change_to_top_dir() instead.
 > +
 > +    warnings = []
 > +    warnings += db.get_warnings_for_choices_selected()
 > +    warnings += db.get_warnings_for_legacy_symbols_being_defined()
 > +    warnings += db.get_warnings_for_legacy_symbols_being_used()
 > +    warnings += db.get_warnings_for_symbols_with_legacy_note_and_no_comment_on_usage()
 > +    warnings += db.get_warnings_for_symbols_with_legacy_note_and_no_usage()
 > +    warnings += db.get_warnings_for_symbols_without_definition()
 > +    warnings += db.get_warnings_for_symbols_without_usage()
 > +
 > +    for filename, lineno, msg in sorted(warnings):
 > +        print('{}:{}: {}'.format(filename, lineno, msg))

Warnings typically go to stderr, so I changed this to print to stderr.

Committed with the above changes, thanks.

Arnout/Thomas/Yann, please update your post-applypatch script to also
run check-symbols.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
