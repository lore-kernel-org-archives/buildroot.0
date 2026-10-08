Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA8BCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5022B40848;
	Sat, 10 Oct 2026 09:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xxs-JKYQYww1; Sat, 10 Oct 2026 09:27:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 62B924060E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624457;
	b=jMODNMLfNL+DYhBmrx1H56iSzwsScxiNXRDXqFSqeoICsOnj9CvoQi2pFDcWaaRHUNsC
	 phjbbkb0liNf5YQKUtFyQGNnPyIY7oCaWsawsIhPG7EoPiV5AInS2+ZUDMB9KMEII1z40
	 7F5tuGuxbfwziuNm5PQQ2ZryDBb25xFFXUpmx5G4SD0DamvHkYfnlziPLqExSyRyRLKaN
	 HaPfU7dA8bqQQwivUej8Wp7GvDGccbtTA9Hgf2c1YAgBkC5a+NeOfQaSKzNtxPzTBiLF8
	 KWZfs3AjjHLi1MfY6UDxsdbmxJ42IzSa5Fu3z0V8lrF2f18A3jcEslpFZtIIOQUG9Ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624457;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=w927V6OFeFg/H4JOQ6taLduX/ub4puASJX3REKAqYw4=;
	b=ZniuCnBRdVRV3oUl/eQw/GWQH/CVR9RwGGdBe7VM5LiL4EJbrqaFi9jHCbV7iDSEbVuM
	 ne9OeCOl/QRcSh6obkccZphcRC00dq2jdaqONGY8INC4BxG81ydu60XmkZlb6LeZ4bEHv
	 A1czqe9RgiYEcHnEOx7VZ1pEXpCrfY+sOf51ch3UB+100QDpvtj7BwoqYrbPlzWxfreqz
	 EqbB9TNW1J0ADANdY96bM9aGTXcUzg0CPfzSbPwVcdH8SpZUti3ulJeNWyOqs41YWdH1R
	 2uEJo5Yj5ZN4Ytr5SkJNnnr65X7U8LNqNz13EGaQmSoxbhawyWDwt3KeRHEgarzj1kw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624457;
	bh=w927V6OFeFg/H4JOQ6taLduX/ub4puASJX3REKAqYw4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ETY+YaPmYyL82CiN0WYI+5LA98kcs7ODrsc6EaWNeqCCwQRiJ4rg3MvEHtcxHN8cR
	 mNoTe/Rh9uBMb9AQBhkdQHbGBw6SekLZNXJ0QN76Z9MF6stp565Ru8zY7abykKRzSy
	 WNn7obYZ7YyZt64ycyTN5NPkyco3g06H4ReHsh+zl8R51uptljjn+MPPopbYVXxr/K
	 T/ht0epzbI19J3Se12v6irv3dM3b8DtwKRG81mSWINMSEYcll5AQEqhRyhwj18Nc62
	 zQwg2otjCWdfVt8gtjTHF8QrlSA+FAhhH5lbnA1q7rXOcTNVXioGTKpoYO84RfqkZC
	 PWNSCvZXS433Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B924060E;
	Sat, 10 Oct 2026 09:27:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E6439D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14A5E402E7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPYGggoNq4Xr for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54B0C409C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=E5wIZesgdB/YV90nTPDYUaajzDbPp2jY1+FJUAjkr0wccZ/0cBjAgT4PlOJ4hDdA54L9
 ZaW20ESUZo1cYPP0J13cKS/1vXKR1sc4seCW7r6/KHsq+++5vpduhQj6JVobSu2zInIwv
 kXX5if++8O4P2r+SevBY4BfTaHBBuxy+cFT/rhlcLWTjNBSMY5wCB6XzcWSIQQqgF8NEE
 TwdLOgYpnd21SyV/ctc/+lpYeenMDLEyeGcBFySCNEP2afqETYMoPHCN/4LmhS3cOZYGb
 JZ6jZ0tDetiwOL4rFSgIvziY+5fgiQS/20aYG+8Bh6XqpXTawCoLOpqQypCy4rDkbcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=I4/jxJa81YnWBCcHiFQyXibaXIpYfuYoQoSjR3xCyW4=;
 b=XLCBCDUOs5UJvsS/z9gVn2G2kcmNvFrZ0BQ6cXuvCyaKrpwIW7kJA6+ORGRls2XfQzIV
 bSG01wQLyfOLRD6ZJSCGfG0nesfCvWwyWMU9kbnXdkphqggmqcD5EixduS0PIc39Y9M6k
 7M0OiOwnhvK5xg+k1tR6SHso8OZNoSKhnlE7gF1EXx2FkxODY0Y6w4ceEGqvc5BCMunvh
 fPSfhannz9e/JzyWjSQDrjqR07fBNEdLVmZD0TJkuom9bTjuAJwGtJJ8rKHxnyK2+7GcN
 GbGnl5z5yEv1bJPWB/OkPj+/hwj9EmKR+qhTd+DzaNB5uPurPpnLyc0YH2e4b/G2enw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54B0C409C0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DEB48F1BF; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:49:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4e0db0269a5e60d30ada0cf97bfc5064c8fbd503
X-Git-Newrev: 886d11f39e38e95f755721c2d39cf61e29e6e0bc
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.3DEB48F1BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/{glibc,
 localedef}: security bump to v2.41-167
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
Content-Type: multipart/mixed; boundary="===============7961059873937705473=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7961059873937705473==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/886d11f39e38e95f755721c2d39cf61e29e6e0bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerabilities:

- CVE-2026-89092: https://gitlab.com/gnutools/glibc/-/commit/fa3ea0362354af7370abb5fe8c6f31a32a73af8e
- CVE-2026-97399: https://gitlab.com/gnutools/glibc/-/commit/f247c0a2fb5b3e48a771d2d23efc9a45c64e957d

(alternative to commit c71fccc7a9ed80ab38c56d54b788bfe92090df35)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index b4549549a0..5e7549cc42 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  b369d2b38357104ba1b3848bfe4139c6a4dfdaea28ac31b3cf2a3985fb008a93  glibc-2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc-git4.tar.gz
+sha256  8b3bbb074671878413901ece2b757b6196f07953f2205ba95ec1a6f79b799790  glibc-2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 34a6175855..0c702cc1d4 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
+GLIBC_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 3412db3c58..a4b871ccc7 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
+LOCALEDEF_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git

--===============7961059873937705473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7961059873937705473==--
