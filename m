Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D287DCCA46D
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 07:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF304098F;
	Fri, 16 Oct 2026 07:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lcS0ERiz-vj; Fri, 16 Oct 2026 07:07:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFEA04098B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792134423;
	b=MIuBqm70GVuo6ZpGi3NbjksQHzHkxaDOK9mWxkeBun8Lg8La2sldKelnM5inH6cUyIrM
	 490Lueyghokg8134Hz4weV0u/lEl8GcbWhF6yTb4h6lsM60Yt30HuShOC9/uAFANUtMH8
	 RJVfYU+RutwD7WmfwFIVRyt5vzB9Z3WbA1LYT3KXsgbWtkJgCQmndKHf2+N1l0cCceTXz
	 2XSdtx112qfe47aSLnZl+uFmDKBxErttMYZ9sW1+XQCS2rNH8rkEpAajN1sPrDO1M5LUs
	 HiaN+rxTRGJ6n2muG2NyxNzndDB1OXHJGrc1nMJucjK6yEDguMPIlq9bwZG9xV0Fk4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792134423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tcfFCfF1XDLXzW0k2sRXNGdWfpQQR0u7Ya3W6SIhvFY=;
	b=AC8p80NVi/ecEfML4Dd9LJ/C/TKNErLt6pRuXSD33aVn1JfhGRzLVN7k0gw1pgozHyNv
	 oyd6kJRvyuHaDP1HFx5JZLDstx4bLgvk3X9TJ9II7b+6M9dRp84K98TKskx4BPCynCbvB
	 gnsKIXmDmJBGTtpIxLg7ywwC8V1nx4uoy3XTsXxj5hzKEJx+wycqMROv7lXSM5JgSumCo
	 6YOhAhlKhb8iaPtsPKBF+rjbFSJw2LfPUeCVMF+6L5Ph+x+raELG+E0GEfpNBHcdU5qk0
	 1q3flkUN+3MKMTONROWZ11OL8q9zGDACRMKNPoVRnmE4gONkUViUK3jeYzbAp48AQrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792134423;
	bh=tcfFCfF1XDLXzW0k2sRXNGdWfpQQR0u7Ya3W6SIhvFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r2/rj9VUwIEIxhMXA+qcX5ZNgDS86LfxUf/loF5uBv3MIEld62No37UstQ60QBUjN
	 wYVCigTCCG7elTdDTnQCZlx/87beFVBj3qugV8UBrYD9O2o3Z1f34cogclW4XzE/+j
	 FX2LjLcldARVHEuASuHDSsE88CxhOmHMUTIpwvPtNi1+wFsZ7Jf2Dy+4hXGxZZSC8J
	 l5h/XmSHQlVQxSnOr7KASRMgibfalagBYDIsvl79bsYmO0ppxtLIDD9sJ9rYBhLkaZ
	 9cUqm7JKo7kX/FmtKj8id8zQ9uSI85bhMIRad165q30aSdz09YAA4aJqEeqMCCSNTd
	 Px38jxuuwIMKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEA04098B;
	Fri, 16 Oct 2026 07:07:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A37A362
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97DF44098E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXDQ8Rx4m0ux for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 07:06:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6601B40986
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792134418;
 b=B05La2cdaaPU1cUoBRxsBSxezEerk3F3Wxc12qTmA99yXMHwP566EtJ9Y7lNj4p+kXFE
 2Cw7TUiMa6zQ/hc972P/tAHhnQOjePzkxNBIGS4+5/yshUDxnxTsNCj+gfv/GQdk0hfJm
 toZgOeJfzbSA/I6dFayOgy+KE3RPCPOxWdYlEeY1L7d0Yt6ViwrxqfkbgOqur6ahgWKd/
 +VPl6YIE+SBxq5OXM5AOPolD1c+7ciM+2Dic1fi170GbbSV4+W0C427RqB8Y3TuFPlc5G
 xoz0Hy8waT1wYG6oaAhRdgni631kbkBvAQ1twRdfcgM/7PGd0Z96bfgKiCA9b2svRmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792134418;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ov3HLkLJ8mgIggiaJEbgeVjIuv/wGFKSJr+jl+L+UZ0=;
 b=YTuqxgz8brr5FV0/Qd63HWIs9vcuxv7BCNuOJY9bWRJwgsUgLXicC/Fr9EQeCD4kuV+X
 yQoO33KNtApOGZ0b8tLDHtDPAzJc6kCR3HWiVTfnpXXppitVCkWcwLJcFuXfxuhpFf4/q
 D7Lc217+mIEKTENXLjGOEO+EycFSEEI0+gq6V8LwF6EUZ36O2daXkxXOgRQunK6NnZ7Xe
 d1irO++mPBlqZO79sldrdjGWujrreAtztbBKlzGe1qMPiB3H12J+xCyrenLg+zl2lxmWe
 eQ3/EC0Kluk0MMAEsTDnmY1gsTkR3aH25C0KS/aa2wUZYSE0+4rEpAAHWTfIvX9UgkQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6601B40986
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72E21960C2; Fri, 16 Oct 2026 07:05:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 09:06:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ac8b1e33da805eb9607359237df86c174b1c37d
X-Git-Newrev: 5b2ac4d9356c3772c2be6c0b91e98390d3a4e3d7
X-Patchwork-Hint: ignore
Message-Id: <20261016070537.72E21960C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swtpm: disable building manpages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b2ac4d9356c3772c2be6c0b91e98390d3a4e3d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Swtpm builds manpages using pod2man, and fails if it is not
available. The patch adds support for --disable-docs, which Buildroot
passes by default. Found while building in a container with minimal
dependencies.

Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 ("package/swtpm: add host package")
Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-build-sys-Allow-disabling-manpage-build.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
new file mode 100644
index 0000000000..c134b75c23
--- /dev/null
+++ b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
@@ -0,0 +1,63 @@
+From 43eff71dc1673c252352c584e129e5bce312d173 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Wed, 14 Oct 2026 17:46:51 +0200
+Subject: [PATCH] build-sys: Allow disabling manpage build
+
+In builds for embedded systems (e.g. Buildroot) manpages are not
+needed, and building them adds a dependency on pod2man. Allow passing
+"--disable-docs" to configure to disable building manpages.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/stefanberger/swtpm/pull/1186
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5dfaa6b..f7d15fe 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -6,11 +6,14 @@
+ 
+ SUBDIRS   = \
+ 	include \
+-	man \
+ 	samples \
+ 	src \
+ 	tests
+ 
++if ENABLE_DOCS
++SUBDIRS += man
++endif # ENABLE_DOCS
++
+ ACLOCAL_AMFLAGS = -I m4
+ 
+ EXTRA_DIST = \
+diff --git a/configure.ac b/configure.ac
+index 188b1a2..7156a21 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -509,6 +509,11 @@ if test "x$enable_sanitizers" = "xyes"; then
+ 	CFLAGS="$save_CFLAGS"
+ fi
+ 
++AC_ARG_ENABLE([docs],
++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
++    [enable_docs=yes])
++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
++
+ AC_ARG_WITH([tss-user],
+             AS_HELP_STRING([--with-tss-user=TSS_USER],[The tss user to use]),
+             [TSS_USER="$withval"],
+@@ -662,6 +667,7 @@ printf "TPM 2 profile support : yes\n"
+ echo
+ echo "Version to build  : $PACKAGE_VERSION"
+ echo "Crypto library    : $cryptolib"
++echo "Documentation     : $enable_docs"
+ echo
+ echo "        MY_CFLAGS = $MY_CFLAGS"
+ echo " HARDENING_CFLAGS = $HARDENING_CFLAGS"
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
