Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5AAC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 728314015E;
	Mon,  6 Feb 2023 15:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 728314015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peDKlKcFuxez; Mon,  6 Feb 2023 15:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE2241620;
	Mon,  6 Feb 2023 15:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE2241620
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 525151BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CA5F40489
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA5F40489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlOybI7k8nBf for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:30:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45C7740491
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C7740491
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 300A183C98; Mon,  6 Feb 2023 15:30:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 16:30:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b95f7591bd83a0e483d2b6db49258d2ea8b44f3d
X-Git-Newrev: 0c5472ace2490b2db7f26a79d12b01a8bb5a42dd
X-Patchwork-Hint: ignore
Message-Id: <20230206153040.300A183C98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-symbols: new script
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c5472ace2490b2db7f26a79d12b01a8bb5a42dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script checks for inconsistencies on symbols declared in Config.in
and used in .mk files.
Currently it checks only symbols following the pattern BR2_\w+ .

The script first gets the list of all files in the repository (using git
ls-files like 'make check-flake8' already do).

Then it parses all relevant files, searching for symbol definitions and
usages, and add entries into a database.

At the end, the database is searched for inconsistencies:
- symbol that is part of "choice" and is referenced with "select";
- legacy symbol being referenced in packages;
- legacy symbol being redefined in packages;
- symbol referenced but not defined;
- symbol defined but not referenced;
- legacy symbol that has a Note stating it is referenced by a package
  (for legacy handling) but is referenced in the package without a
  comment "# legacy";
- legacy symbol that has a Note stating it is referenced by a package
  but it is not actually referenced.

There is also a debug parameter --search that dumps any filename or
symbol entries from the database that matches a regexp.

Sample usages:
$ utils/check-symbols
$ utils/docker-run utils/check-symbols
$ utils/check-symbols --search 'GETTEXT\b|\/openssl'

At same time the script is created:
- add unit tests for it, they can be run using:
  utils/docker-run python3 -m pytest -v utils/checksymbolslib/
- add two more GitLab CI jobs: check-symbols (to check current tree
  using the script) and check-check-symbols (to check the script against
  its unit tests)

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Peter: print warnings to stderr, rename change_current_dir() to
	change_to_top_dir()]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                             |   2 +
 support/misc/gitlab-ci.yml.in          |   8 +
 support/scripts/generate-gitlab-ci-yml |   2 +-
 utils/check-symbols                    |  78 ++++++
 utils/checksymbolslib/__init__.py      |   0
 utils/checksymbolslib/br.py            | 140 +++++++++++
 utils/checksymbolslib/db.py            | 205 +++++++++++++++
 utils/checksymbolslib/file.py          |  83 +++++++
 utils/checksymbolslib/kconfig.py       | 139 +++++++++++
 utils/checksymbolslib/makefile.py      | 100 ++++++++
 utils/checksymbolslib/test_db.py       | 286 +++++++++++++++++++++
 utils/checksymbolslib/test_file.py     | 152 ++++++++++++
 utils/checksymbolslib/test_kconfig.py  | 438 +++++++++++++++++++++++++++++++++
 utils/checksymbolslib/test_makefile.py | 304 +++++++++++++++++++++++
 utils/checksymbolslib/test_util.py     |  15 ++
 15 files changed, 1951 insertions(+), 1 deletion(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
