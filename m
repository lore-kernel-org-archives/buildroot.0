Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2B4C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC824101A;
	Thu, 24 Sep 2026 18:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uediQ5heqst8; Thu, 24 Sep 2026 18:58:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 542F040CBA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276325;
	b=avYdgk4JB/WiJiMBkC4JyhWdB6i0EI1sGoZ/s9DsMiURWrbO8aZQQ1/zx7r2D8OLRnnB
	 eGGBQYerMt7RzZU4HyL+p6zRQawYB8/uuTrI6Aw70ejGw9FOforvTVkN8degej0OJZeXP
	 eLVGgSWxPvO0Ha27FVh8KYBswvcEaCdMPr8D4/pK1zG/A7bjxeFyRU0qLCPqhpEWDJOC0
	 LnCj8m60OV+JU6tq6o4MYfJ3HUQY2BETyZ0vt/C1drUwWU9EG9gH8S4Wv7TlF6b+Vc5M9
	 mp8eRVPObCSuyhccQYXECW3hehnVuvZ46ud7HcdGLER8smxc4jkHBAQwwo9y59YYBIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276325;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NoxVQh3xg+BeV97/SHIG+N9+1UX3mBEybxfz4bLx+Gk=;
	b=TeMLb38v2c1MpjR8mjnfXOR3JF6/X4PMYo5SXg8Pc0hbKxoye8XpFAyIgSD3QHrAMiWf
	 NJDkIu4AL/YrBwIc7UCraakpJ7dhtVonrDteLKXV4yzPGVr5Aydux9uTI3bFntRhCVqyO
	 C52dpBrjanw/cV7rFhijtaLMnQdSrGcHzpu9aNFUxHTQowAWTND5bgmsCBH6bXPFkpHh/
	 FZ5gRrFAAcSOWDdwd6YejwNOtZteOY1vMjtBrrL6TcqlDs13hT6Hmf69wWgkjeVNAncYX
	 Lz0VGeFLp7mMnfm8zEAjfjTHe1jX5aCbQ/nusIb8MmgeZg1m9n33mt0maJ5Q00ZahlA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276325;
	bh=NoxVQh3xg+BeV97/SHIG+N9+1UX3mBEybxfz4bLx+Gk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gCAitjvxqo/eWWBKAiEcE+msbL51DfoQpqs1vgCujLCwPeyiXkZm09QudKLo0m4Z8
	 BTxEUzEQeTZLvSGlJPY6NiO6NH0kZ5ju3uVuA5Fqmpiaz2t63DNoNIRvuKGLxnUG/C
	 Qh39grX0b6VGeOuVJZAJ/9h823KXJUUFH2QSCDH4QlbeDZfkTXEADCxo+mIVfN9z5G
	 FKyNnf6//pZiOJ3JFFbkFYT7nXlB0Zfq8mcgNwV5F8O6P5JuMmHBSeCOmHgLLRqIsa
	 JBCugCf4s4HDHJvp1gRsdpXMJOdacPKldzr30lTPvvr+Kl0EFNqKHrnqLIdeml7qWf
	 gzkmrBJRf3VUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 542F040CBA;
	Thu, 24 Sep 2026 18:58:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF9F9328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D218C404C6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFFRRIcUbaqS for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D5399404CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=PV5F2e5EvwOzYgGryNVm+SpUdwkNQV6ibTn3mZ9YnnlwSMfn0QrCgSFzCPkEWtx/Wkz+
 aNWfUXMCF+ZGaRXym4wVwdKcgeZlZ5SorhEVvvKdG7jaPx37HbIljxyW+1wbyXhZMVnom
 WLoW6KVT/cCdBsS5YmHotTQcK8o7Bu48Hjf0Ac+frhV87OFFNH1D0qnZMCcy1KrGygN+y
 CMeqvzxBCNGS56lAuqi5S3wgVd9Hv3ooRyMslgqDGLevrmmBu1TuUZhQWvSAfZXAi/O4q
 xwiFTe6ghtxMBSYEm+BAFtXm7NIWK9mFj9KW77ML5iztB5FWBL7oNl8qEFc77Nlralg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5s6N6reM69h+j94EQ64YwFoyOqMHHgGFQaWR4xZNYks=;
 b=Nnv24OqTSCOCin5f9Wb2SSLOIUA+wJWYxJ0LeJ1nSsMetxcnCJ63vDGAkGG3S1fwtjj7
 1TsE3o8mn4BL9JZPD7678cTY/wRrKuDHfwZeY61uJQvpci/29B4bIWbQzpMke+AdcTUAm
 05qZx0VlOylrf9Kz9t9CTYwrj2G8lsb7mCXdZuJ+SE0/U01fpx5tNK938Bi7YdKSshJ5l
 /1aOuqN8fsYmvhvGoYsrBeakBSaldRKL6oY/2RcppENgVx4KTAhOKVf+dql86n2DvpzXa
 DFsyNHQq1OfOetybZwnkHTfuINiLGPRvn4cGRlxU+KLZCXkD8QODWO9/HCkZZ3YlaZQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5399404CD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78D7498361; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:49:57 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 874dfd0e1ae5693d961d94f17cd2c34332ebb191
X-Git-Newrev: 8b24e3a6e93c06a9ba376461b75ba7701a8da6f5
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.78D7498361@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gerbera:
 propagate icu's dependency on !BR2_BINFMT_FLAT
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
Content-Type: multipart/mixed; boundary="===============3377962125622291327=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3377962125622291327==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b24e3a6e93c06a9ba376461b75ba7701a8da6f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

gerbera selects BR2_PACKAGE_ICU, which depends on !BR2_BINFMT_FLAT,
but this dependency was not propagated to gerbera. In practice this is
not an issue because gerbera depends on BR2_USE_MMU, and only noMMU
platforms can use BR2_BINFMT_FLAT. But for the sake of completeness,
let's propagate this dependency.

Note: in the Config.in comment, we handle it like an architecture
dependency, like is done in package/icu/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6b716763e9618c287d325bd3b42afb61a1a50769)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gerbera/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 3078d2017f..0219216276 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
+	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_CXXOPTS
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_ICU
@@ -32,6 +33,7 @@ config BR2_PACKAGE_GERBERA
 
 comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8, host gcc >= 7"
 	depends on BR2_USE_MMU
+	depends on !BR2_BINFMT_FLAT
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \

--===============3377962125622291327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3377962125622291327==--
