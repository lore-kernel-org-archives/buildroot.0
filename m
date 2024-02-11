Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E78C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D386684F6C;
	Sun, 11 Feb 2024 22:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntfQXkmGkIh4; Sun, 11 Feb 2024 22:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C82A284F7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C82A284F7C;
	Sun, 11 Feb 2024 22:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3E141BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9127984F6C
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-2IvjH0T4my for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B814684F7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B814684F7C
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:12:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A68FF8781B; Sun, 11 Feb 2024 22:12:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 23:10:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4abcf5872cd14cd2b1633142ffed3794b838ac1
X-Git-Newrev: 687b96db4d3518eadd16f74f7defdc05b1cfb736
X-Patchwork-Hint: ignore
Message-Id: <20240211221213.A68FF8781B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: fix install when tk is
 disabled
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=687b96db4d3518eadd16f74f7defdc05b1cfb736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following failure in the install step of host-python3:
    ...
    /usr/bin/install -c -m 644 pyconfig.h output/host/include/python3.12/pyconfig.h
    [ERROR] _tkinter failed to import: output/build/host-python3-3.12.1/build/lib.linux-x86_64-3.12/_tkinter.cpython-312-x86_64-linux-gnu.so: undefined symbol: Tcl_AddErrorInfo
    The following modules are *disabled* in configure script:
    _ctypes_test          _testbuffer           _testcapi
    _testclinic           _testimportmultiple   _testinternalcapi
    _testmultiphase       _xxtestfuzz           xxsubtype

    Following modules built successfully but were removed because they could not be imported:
    _tkinter

    Checked 110 modules (31 built-in, 54 shared, 15 n/a on linux-x86_64, 9 disabled, 0 missing, 1 failed on import)
    ...
    /usr/bin/install -c -m 644 ./Lib/types.py output/host/lib/python3.12
    /usr/bin/install: cannot stat 'Modules/_tkinter.cpython-312-x86_64-linux-gnu.so': No such file or directory
    /usr/bin/install -c -m 644 ./Lib/typing.py output/host/lib/python3.12
    make[3]: *** [Makefile:2068: sharedinstall] Error 1
    ...

Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14 ("package/python3: bump version to 3.12.1")

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/0012-Add-an-option-to-disable-the-tk-module.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch
index 7fafbedddb..08617241a6 100644
--- a/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch
@@ -62,7 +62,7 @@ diff --git a/configure.ac b/configure.ac
 index c8ae60aa6b5..7caa361138d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4503,6 +4503,11 @@ AC_ARG_ENABLE(pydoc,
+@@ -4503,6 +4503,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -70,6 +70,8 @@ index c8ae60aa6b5..7caa361138d 100644
 +AC_ARG_ENABLE(tk,
 +	AS_HELP_STRING([--disable-tk], [disable tk]),
 +	[ TK="${enableval}" ], [ TK=yes ])
++AS_IF([test "$TK" = "no"],
++	[PY_STDLIB_MOD_SET_NA([_tkinter])])
 +
  # Check for enable-ipv6
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
