Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A34C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 19:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7CB409C9;
	Fri, 21 Jun 2024 19:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-ipZVejPaFf; Fri, 21 Jun 2024 19:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BF22412FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BF22412FD;
	Fri, 21 Jun 2024 19:11:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C6CD1BF976
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 19:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A588605C5
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 19:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0epk9rvYBJ4 for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 19:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91055606ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91055606ED
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 19:11:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C02B8058F; Fri, 21 Jun 2024 19:11:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 21:10:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9959277125ee34c7d778b00e8b83ea78dc74e6e0
X-Git-Newrev: 76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1
X-Patchwork-Hint: ignore
Message-Id: <20240621191119.8C02B8058F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump python to 3.12.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Along with the version bump, a number of the patches have been dropped
or reworked.

Compiled shared module builds are now disabled via py_cv_module_* = n/a
when possible (see PY_STDLIB_MOD_SET_NA). Leveraging this method allows
dropping numerous patches.

Note: this method does not work when access to a compiled module is
wrapped by a python-based module such as sqlite, tkinter, etc. In these
cases, configure knobs are still required to disable these modules and
their wrappers.

Both setup.py and distutils are no longer utilized upstream, so patches
have been dropped or adjusted accordingly.

Patch 0007 has been dropped, the Xtensa architecture can avoid compile
errors by using a toolchain with kernel headers newer than 3.17 [0].
That would require a new, non-trivial dependency to be added, but it
would also need to be propagated to all packages that select python3; as
we consider xtensa with old headers to be a corner case, we decide to
not address the issue, and rather add an exclusion in genrandconfig to
avoid the issue in autobuilders.

Patch 0026 has been dropped, the issue is fixed in uClibc v1.0.37+ [1].
Note: uClibc is not generally supported by upstream CPython.

While we're making assumptions about uClibc, ac_cv_func_wcsftime=no is
no longer set as it was fixed in v1.0.0 [2].

Co-developed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Co-developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[See 36e635d2d5c0166476858aa239ccbe78e8f2af14]

Co-developed-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
[See 687b96db4d3518eadd16f74f7defdc05b1cfb736]

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f61bf8e7d19e0a3456a7a9ed97c399e4353698dc
[1]: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/libcrypt/crypt.c?id=2f6076cdaada2132b670b5ef25ad80c76a916c5a
[2]: https://lists.uclibc.org/pipermail/uclibc/2014-November/048723.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[yann.morin.1998@free.fr;
  - extend the commit log for the xtensa headers case
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  33 ++-----
 ...1-Make-the-build-of-pyc-files-conditional.patch |  32 +++---
 ...gy_getaddrinfo-configure-test-when-cross-.patch |   8 +-
 .../0003-Add-an-option-to-disable-pydoc.patch      |  84 ++++++++++++++++
 ...ructure-to-disable-the-build-of-certain-e.patch | 108 ---------------------
 ...=> 0004-Add-an-option-to-disable-lib2to3.patch} |  93 ++++++++----------
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  31 ------
 ...ch => 0005-Add-an-option-to-disable-IDLE.patch} |  63 +++++-------
 .../python3/0005-Don-t-add-multiarch-paths.patch   |  37 -------
 .../0006-Abort-on-failed-module-build.patch        |  30 ------
 ...e.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch |  44 +++++++++
 ...Add-option-to-disable-the-sqlite3-module.patch} |  35 ++++---
 package/python3/0007-Serial-ioctl-workaround.patch |  33 -------
 .../0008-Add-an-option-to-disable-pydoc.patch      | 102 -------------------
 ...08-Add-an-option-to-disable-the-tk-module.patch |  81 ++++++++++++++++
 ...d-an-option-to-disable-the-curses-module.patch} |  39 ++++----
 ...h => 0010-Add-an-option-to-disable-expat.patch} |  59 +++++------
 ...11-Add-an-option-to-disable-the-tk-module.patch |  77 ---------------
 ...-fixup-CC-print-multiarch-output-for-mus.patch} |  10 +-
 ...x-cross-compiles-when-host-and-target-us.patch} |  28 +++---
 .../0014-Add-an-option-to-disable-CJK-codecs.patch |  30 ------
 .../0015-Add-an-option-to-disable-NIS.patch        |  33 -------
 ...0016-Add-an-option-to-disable-unicodedata.patch |  30 ------
 .../0018-Add-an-option-to-disable-decimal.patch    |  54 -----------
 ...-option-to-disable-the-ossaudiodev-module.patch |  30 ------
 ...-Add-an-option-to-disable-openssl-support.patch |  30 ------
 ...-an-option-to-disable-the-readline-module.patch |  30 ------
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  42 --------
 ...0023-Add-an-option-to-disable-uuid-module.patch |  33 -------
 ...n-option-to-disable-the-berkeleydb-module.patch |  30 ------
 ...Clibc-ng-doesn-t-set-errno-when-encryptio.patch |  42 --------
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |  79 ++++++++-------
 utils/genrandconfig                                |   7 ++
 34 files changed, 446 insertions(+), 1057 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
