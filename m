Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C42CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FAF40963;
	Sat, 10 Oct 2026 09:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_PWKtJXNDDi; Sat, 10 Oct 2026 09:21:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 52AA940952
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624102;
	b=n1KYage/X2mf7tpejc8i9/4K4/Q8K+qs9p6XyDOHHo38eEHq8lA+Rls/izMfoWFpR4pW
	 MfQkkHmSgxn5kbHx3sV6EenZMxU5i05pyj+m4cTFzci5Ry0k3Fp8isSiUs9esQAcsAKtz
	 ef3vCPu9aYi67A6Z7xHe7Xitb4S6kJvBh2k9ZutRxkRE6ZMGZ4T0JB6lNv1jk4LVmlpKY
	 rW2JZ3wVc6iwLJxN/4UGc2KhI5FFTy0RTT8OK3TF4YpFD3JpYMVNsTbtzZjAIx0lul/Id
	 J8o5mOccspNgKNuHXN2exb3RmFVwhteZCPTpgvUAeQX5Ihe69SI97tyXUQX3ajoMmug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=iOdOmABoE2ybbtC6crMVsoxY39jMe/Tsd6tRy7KqVSQ=;
	b=pu9UgmLUWgt5/3MgLwLrOUI2p8SBvbA9tA5XpoGQt1jPKTLkMhoAkcmul42g0HPryeNe
	 ycZj96jDvlD++i1OQ5+X5x4w+QKXTcFyOUtZ/AbOG6YRAlwOhUfuJKuztxrQSwCsVI9I0
	 inqpsXJ+/GOZCs2fu2Gg0J5EhChGcFfafTG9/YQZ09NCTxoyoH0AGhlu0uC/xzOjzCoSi
	 muX8GoKxTct9ctE4VyyJ2i80PzwEaodRxLGcgSolIR5cIiSDmpClGvq8fYjfUjNJMdmlc
	 LaKkMpWG5DUD6HXaknV63vyHIPwyEB7p4sPTZsDrM/dKhP/xkuJUyt4G0AnRsfaNr5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624102;
	bh=iOdOmABoE2ybbtC6crMVsoxY39jMe/Tsd6tRy7KqVSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HyMr7EJ/b/MsYMRQXdFWcYFTk/LWCtW1530EqxCL2X/p9AJCakdafsmE7L+ni3/Yc
	 Usitmf5iEJTS2/Qsk/FS7KpZJQB8kHBxIruhK6IMEaTy2wKAkoKiH2s5KIZMGtdXeE
	 BlQMdoa1NY9LPYnu7q6I93rUlT+IL4dUNUUgg6iIw3Iwh+k10PxQ3EoxOOHt1jjUJm
	 5ZBelW0azk9eLGn/cRfj0WmJLXauwwEgN1T2nWHIpnY87lXD/h1yCFsb4Zex5lAv+7
	 kMl9dPKLdzHt45GLWcDAESeaxJ9BQPB8jrd4qGAQaiUNzXZL5Al2Mg8OOAYGR4qLIi
	 NsbQ5aMsC8H/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AA940952;
	Sat, 10 Oct 2026 09:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6FDC356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 861426064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k71MAaTmoGwp for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2DB5860623
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=mXofsVp3sptkxJwLiVUIGBQAGF1OeDB1zYcC1q3vpAKcJuM1fNAmzzhNxiTmsCTmOiud
 sRZYNX5KJnbJVF2jjHgMPnstY1nTl2oU5/IhA/QCEdeseuN310+28cI9DxkzmRfPq2kA9
 EwKnGVrLQCSCpxduT3k763a9+qvmi1eVrteMtPj4XDZdD3CJ/fJGlmpJoz4/bvFSS8ey4
 wpfC1Idz/LB2Ds9zSQTIoKNQS7Lq88gzJlvexSx13+CzmWzk7DxPq7zSFw3+/aietHIbO
 aF8/XMRob41TI+ka4B0a1N/ersfg03v2qv8BxgocHA93InaCyDffER/nyDed5BwvMtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NKswWPalzfyKnCh1Do8QHUeN8ubom0Nzvq663S7+No0=;
 b=jNS/yWVOgl8iobAzAN3xYHzE13LrQnAJHWUcY5+awlAsKXphC6Ou//Wmc4L6VlGhty+2
 LNn1mC9Fc2g1RzfSB5LoH0QFmy4CH6LKBja4Kfz9OHtUvpB5LAZC0naU3x8cLzqDm1ukg
 nOUtQD+7J5YCpAOFe2ziHgotqIhQ8rEIh1jiGhuurpPoRxWPlqPsJWJQsXNqU2bfx4LVf
 04iGs92jPLnomsjM9c+nuSVl7Oa/y29sxQe5ddEaUuu8S9OzUVmv5Vq/vESY/h2S693T9
 h9GXQpe6NeeI27K2FE5/OdFpvEf4g5GzmAu7d7mxkaBg+mUNESxmCJO0WI8SuCWPVwg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DB5860623
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01BBA8F065; Sat, 10 Oct 2026 09:20:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:28:08 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 110319c4a9d604c0f7d0d5fb6b0bafa04a1eafc8
X-Git-Newrev: 9c1a024d42b53438d784e0347abdb05a098d1500
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.01BBA8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libopenssl:
 remove patch 0002
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4669606600997439358=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4669606600997439358==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c1a024d42b53438d784e0347abdb05a098d1500
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Patch was committed upstream in a slightly different version
https://github.com/openssl/openssl/commit/098404128383ded87ba390dd74ecd9e2ffa6f530
and was first released in version 3.0 which was added to buildroot with
commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5.

Added Upstream: tag to patch 0001.

Renumbered patch 0003 and updated Upstream: tag.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7dab0537a0c414a5282f1918550f06a2dbfcdd2b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore                                |  2 --
 ...roducible-build-do-not-leak-compiler-path.patch |  2 ++
 ...se-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 37 ----------------------
 ...s.patch => 0002-Revert-Fix-static-builds.patch} |  3 +-
 4 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 557894847a..b6bbda1728 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -504,8 +504,6 @@ package/libnfc/0001-autotools-make-example-build-optional.patch lib_patch.Upstre
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

--===============4669606600997439358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4669606600997439358==--
