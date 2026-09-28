Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538B7CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1816180D7A;
	Mon, 28 Sep 2026 11:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZPrm_h2Nckm; Mon, 28 Sep 2026 11:59:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 09F6880D7B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790596747;
	b=q+DF9o1VYvpMh/8KAqjH6KCdBSuIRfbIy+H03wjJdIA/VAWkjpufxxQxnPK5yclR0eS7
	 aNIj8D4lLBqN+4L3XXSJJKFf0ZJB05D+iEZZ+ZhrJtPE6AuJBYa14j5/HRNyEodFdLo/B
	 S+xOZtea6wS/quQvg+1qhobMW5N5DgqJbDZ2ZjyK8iq2H5tpfRg+VDnUy00o2JO1aUPoM
	 4a5ak8jcX3nmgaGzvits2NS6zgdUn8ivmmRo5IiFvPFh4sxLdDmVMw148zHo0IP+uO9Bo
	 /X9BPh43/hmatIEN5H29Vd/40NKo1w0lswfXSDeC3RUM69u4yMb17ivjU6DRMU9Lcmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790596747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=luA1oTjc1RL87rrmhUeSyaEubl6ofe0sOZvX+Vd4z5g=;
	b=mv+gyod4L5XRbBa91nrQK9DtFkxLiM0kHZC1OtATDJBbwU7PZ6H6RX73FNfzNIldg6ND
	 i7UMSFC4/UimunmXrKpHYwK7j/9yb7jF2LGIA1yiIdqxPQIYvtLZ54kolmFuLh/ZioS9k
	 E4lDPhIG4ylRXw28FLCTZLs9SmI9OkJJR6p6Qs96YYybRD9NJko0zNXhWDtQ4uVUdTVPt
	 0h7jaTo5YnuLWR79d4w2hUe0OgN8xtFFCTiSYebcHBvg2sAyrsI8fK3oVlE9fubookYTA
	 E8ORx2XX2Kc0tLdQ2H2yf97ujq1TVpqQ0ep0R1/mn4+WaylR8YoqvKw2TVxd9VKacDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790596747;
	bh=luA1oTjc1RL87rrmhUeSyaEubl6ofe0sOZvX+Vd4z5g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EuSADAojUI7ZHYfGvBvMfnxC7ZFqxlOzQKRabKOtIXdjSs6IHBhFCacT8VTS2kFJI
	 8XsteSMkNwTrxNFrsBuE/sQYOX4R3gSap+DJEJC3audrnQZMuXp7qjb0oKrn0oe5T6
	 3RBv/WfQ/U7bBOgJGG1lzqa0hklx9hXgyWJ7r88Z1v4SKIvlmtCLik08GY9WVlyYlw
	 lpJk4M16U1NSbdFH9tKWwWoKyVuWTA70sVM0mRkVDgPjiM6hWVUJfrt89x+WS3GM+d
	 lQHfCnh8R/1YmgbhkQgW0VZ/lNoAUT188VuRgc7A0aXb+a16mLEy7KWfq4+wG/6EVK
	 7tquw//7gtRgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F6880D7B;
	Mon, 28 Sep 2026 11:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDA7622B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C35B1405A2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxcBrXyjYusw for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:59:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DC7264059A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790596744;
 b=lGRr8qKCsiSOA13h3+7Nx2AWozJpAriqOb8f7JOhR3aQC7cdlUA8YUEfXiisjFGZ/zCs
 97o+VNy9D0mmr5LYjKbQ7PJDycihOcf4mWAh/D/WxRZII19iandl7hz5Q2NOsSXk727rT
 oho8p070hGQBUIdJHF3kgwLcPqVlc+2mbGDP6/U5Aj2shgdQT9H/goUe+IZ4ECdkDB4H2
 mnD+iHJRupVIpwK3sI5LwapiQeIttGGw5qnHnysY2kWI3LIiA8nqGJH6n3fclskjbhp7H
 Z23eGFkUMfzEwmDUJUMcO8I2DziFREv8HQFKqEn/GveouPObZtgLk4IOgpGkTehL/hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790596744;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EFNJvlCVBUMD0o9Sk7kQzNl2HXM4SjtGhKNRx2TW+0g=;
 b=JhqIn/j1RQfA/3BChaQ3M+LCDi3pWqzE6HjgAM10PpzMJVOgNx5s8z8by0og7D/KFdgF
 aNsCh8JM/5dFjYSmeEfTSuTqWEy6aktycGti8zbi8VSX8894aCdBDWwEL4FzLRCSnkEJ+
 VuXVxe60qbSUfgjavrA/1/20ZFGCYIPkS+0uT9V2BFhmCSiRiwJhP4JWK4WXJK76a4dno
 A1uBrZXsuNjX3KKYnrMIhlonhu2yslYOYGdrJwk3wuycOQJ/ZMqVRYKgXqxydZ+NJIpPI
 ri76wz6yRV2UyLCxvYNytlb+7Mz7AM0OVq14XQmADtMTll67c1NQ5WxsWGZbnkmZCQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC7264059A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:59:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1B779830F; Mon, 28 Sep 2026 11:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:51:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d4e45d9590c9358e42454fc8c3be5bddccfff2
X-Git-Newrev: 7dab0537a0c414a5282f1918550f06a2dbfcdd2b
X-Patchwork-Hint: ignore
Message-Id: <20260928115752.A1B779830F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: remove patch 0002
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7dab0537a0c414a5282f1918550f06a2dbfcdd2b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Patch was committed upstream in a slightly different version
https://github.com/openssl/openssl/commit/098404128383ded87ba390dd74ecd9e2ffa6f530
and was first released in version 3.0 which was added to buildroot with
commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5.

Added Upstream: tag to patch 0001.

Renumbered patch 0003 and updated Upstream: tag.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 --
 ...roducible-build-do-not-leak-compiler-path.patch |  2 ++
 ...se-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 37 ----------------------
 ...s.patch => 0002-Revert-Fix-static-builds.patch} |  3 +-
 4 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6d2a024e07..bd3766988d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -502,8 +502,6 @@ package/libnfc/0001-autotools-make-example-build-optional.patch lib_patch.Upstre
 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch lib_patch.Upstream
 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch lib_patch.Upstream
 package/libodb-mysql/0002-mariadb-FTBFS-fix.patch lib_patch.Upstream
-package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch lib_patch.Upstream
-package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch lib_patch.Upstream
 package/liboping/0001-fix-utf8-support.patch lib_patch.Upstream
 package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch lib_patch.Upstream
 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch lib_patch.Upstream
diff --git a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
index 9353c1ae90..f4baf916e3 100644
--- a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Reproducible build: do not leak compiler path
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 
+Upstream: https://github.com/openssl/openssl/pull/5218 (rejected)
+
 [Rebased on openssl-1.1.1.a]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
deleted file mode 100644
index f74576beae..0000000000
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b57cc2e4ee21babacbffc243626de72c248068ea Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Sun, 5 May 2019 18:30:55 +0200
-Subject: [PATCH] Configure: use ELFv2 ABI on some ppc64 big endian systems
-
-If _CALL_ELF is defined to be 2, it's an ELFv2 system.
-Conditionally switch to the v2 perlasm scheme.
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/8883)
-[vfazio: fixup for 1.1.1d]
-Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
-[rebased on openssl-1.1.1i]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Configure | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Configure b/Configure
-index 15054f9..ac3206e 100755
---- a/Configure
-+++ b/Configure
-@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
-     }
- }
- 
-+if ($target eq "linux-ppc64" && !$disabled{asm}) {
-+       $target{perlasm_scheme} = "linux64v2" if ($predefined_C{_CALL_ELF} == 2);
-+}
-+
- # Check for makedepend capabilities.
- if (!$disabled{makedepend}) {
-     # If the attribute makedep_scheme is defined, then we assume that the
--- 
-2.25.0
-
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0002-Revert-Fix-static-builds.patch
similarity index 97%
rename from package/libopenssl/0003-Revert-Fix-static-builds.patch
rename to package/libopenssl/0002-Revert-Fix-static-builds.patch
index 10ca97a240..daeece2a0f 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0002-Revert-Fix-static-builds.patch
@@ -5,7 +5,8 @@ Subject: [PATCH] Revert "Fix -static builds"
 
 This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
 
-Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
+Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-3791009156
+(rejected)
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
