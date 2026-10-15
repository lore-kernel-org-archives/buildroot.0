Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725C6CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1088161215;
	Fri, 16 Oct 2026 13:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swoyEFLC5Cs2; Fri, 16 Oct 2026 13:12:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70DE861204
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156334;
	b=s48GXkeXqfrKB7evBIW3YklQJTsEe4khABrMNQR3DMCtgNtjxicDgOdwPBxUlV1OOJu6
	 UFg5r8YLPrwFivUbk3QNnykFF/OgBhr/USRbzxdlCwbnOgwYpYWOSPupcte9vQoiOL0dx
	 fX8c3nTajN6A5+bFFks1rFCRaQXjbsfFbmUiqSKi0dI9caLZbk+9i5ONHy2OZIa0Zrbp7
	 m2z1qrIKjtrFXCAXfqgKEenLy7fXplgi2mXkdxJjdpuOIWXIF9wyw6VIORZ2LKWQkQ+T/
	 WgmXrgF+hXhKSU/qXNGDvDuQg14S9d1MOxaOxrri9NyGDcpXtNVkujb1H7yH+IZTzgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156334;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=n2SNRG7ugkqxe4AbZudIjkoZSr1PcAB1ZRl4azSNgyI=;
	b=dU3Z8Sj/CQRSj3wtGc+DxB5Roa9csx2C4QPnjPSPfSV73C9u1Pj2mLg1NNfVjk3VFZ39
	 RvHZwTTL56b1x0fwx+5s9Von5kSEoFDvaxlAYz1InCKDJGEscD4dlrdWDDBY25cE/YkRc
	 bf4vBMhL/dgVcVUW05v+92nd2ysTrrI9+U3mofi3EH1aT64X1jkDtbUPJ5q3wjxdCQWy3
	 4Z9SO8a2EV65MAZzNySPBC36Dkdr17TEzg/ehU/boK9/nl7gLrTQTcOauMwZWUK0Yw5H9
	 rxyFJCPQz397jz6mSvaTWx362yWe1xsSkCr1lUoHSxpAVQllbu8pcuAnM1FBdvtB0VA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156334;
	bh=n2SNRG7ugkqxe4AbZudIjkoZSr1PcAB1ZRl4azSNgyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P4oTGJ3oArewgbw+CWqSP2X3quu8RfA12q5n7qII1szXm2ZnYb7NyxB06uKQeg1X7
	 1rBNkC1+ULstp4k0sprC+QdOlXnFO5vUiB5kk79cG5GprY2PsGXWmFOIjreYIJ7KHu
	 fUdbALf618nDv0ZjqycNCmoEePfrQAGiUy126mZUSSzQyAHfhwICiP23Rpb9+uuAz7
	 d1KD0UKjq6f43teCVBz6e9v2LPG7bAhjxfzfrBGbZLcKkvpdOKlffGYJ+7mq+Fd4y/
	 BxHkAz+56y6GrI9uKilZ1vBsL37VxOuYHooDxWITIqY/z6gubLQzQMO2aU/6r4/GpP
	 utatH5otIns9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DE861204;
	Fri, 16 Oct 2026 13:12:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E74D8920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D775760F17
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5ZVNmpzC-Wb for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0DD4860EF4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=mEn7cR0XFTFb1WZneb+BVdlPvF6LemrNJyEpEHsSCWVIcoYRAH8iqd6bduKSRjS93uro
 88sPOJMA3HTvjrUGRSD2XVbvn8oiKMwbZ7slDbyMs7qMtEB+AvRumHBymcCeoRS+xlLNN
 OU5aH2Sh/MNYQ6CWC6EN/l+uFgBS2GuiDiLwlJSproamzNeb2CLY7/RVUAVLJbj7prb6g
 gxmGrtIa0Mtgoo+39aJhgeHx2kYf3nrs6pETUItpfZDBMY74XJQH/0BreLL7u2mHvThQV
 fo709V3ez1BXKSTb/5tOuRAq5G/c9JfY7uVRQ4ESGvofK9XCqDU8Fpvz7RIBDUifuaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gzQ2ceH4AEe4k3o6hGQIEEzReQsR3+T33r2oDPHRfm0=;
 b=UFsWpixHlgKUaahQExTWqIRVMcEjTmuY0MUG0Z0zJvpflDfZ9SpTC44I4n3VvDmR0wi4
 aODBXfKIvI2eZIaC0lc/tDVq7CGXnoOHXXUFv+YxkCzzKk7G/t3/mdTSDBGK+FKl37gAu
 Ztn6Kz3DWyrTe7ji9DxhGPwzgYtUn3xNjOwZTZNcCI2jRkomkDj9j0sR/SbtxV5MSCD1L
 Q11vj3xSzKNTIAKWuzuBGv2CmdJ0yRRmdkg8QgAysdxLvClyo1mqp2cbGf4GLMxxeI0fQ
 P3TChc5CoIMGedr3i5VpVf8w089MaLypW8MWPYzc3JwCySpIw/BW2RVKJ71cHiep8Vw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD4860EF4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F307C960DA; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:20:50 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c4edb8a80510a4edf1e61e384e4a9d3c7f5809e2
X-Git-Newrev: 6f10f8173711820b16145a5cc8d0e5029799a4fb
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.F307C960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wolfssl: security
 bump to v5.9.4
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
Content-Type: multipart/mixed; boundary="===============9077130040293841718=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9077130040293841718==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f10f8173711820b16145a5cc8d0e5029799a4fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

See the release note:

- https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.4-stable

This fixes the following vulnerabilities:

- CVE-2026-15442: https://www.cve.org/CVERecord?id=CVE-2026-15442
- CVE-2026-89102: https://www.cve.org/CVERecord?id=CVE-2026-89102
- CVE-2026-89133: https://www.cve.org/CVERecord?id=CVE-2026-89133
- CVE-2026-89134: https://www.cve.org/CVERecord?id=CVE-2026-89134
- CVE-2026-89135: https://www.cve.org/CVERecord?id=CVE-2026-89135
- CVE-2026-89136: https://www.cve.org/CVERecord?id=CVE-2026-89136
- CVE-2026-93302: https://www.cve.org/CVERecord?id=CVE-2026-93302
- CVE-2026-93304: https://www.cve.org/CVERecord?id=CVE-2026-93304
- CVE-2026-94417: https://www.cve.org/CVERecord?id=CVE-2026-94417
- CVE-2026-94418: https://www.cve.org/CVERecord?id=CVE-2026-94418
- CVE-2026-94419: https://www.cve.org/CVERecord?id=CVE-2026-94419

This commit also updates the LICENSING hash, after an exception
was added in upstream commit:
https://github.com/wolfSSL/wolfssl/commit/94c657013d63124c7d8bf79b29997f614e21673d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix LICENSING hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7de1ed77454587fd17077bb724629a0106b06888)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wolfssl/wolfssl.hash | 4 ++--
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index c259734875..7098c9637c 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
+sha256  7256bfc89b183a75183806c7debfa203443873b0b4a562e1b80d68e01b45ac57  wolfssl-5.9.4.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  84f8096dc7f70cdb6075ccf3722a44654361063eaf3e1ce7885c9875b8465a63  LICENSING
+sha256  d4952a47f020a56e6ee267e0937b5ba0580b148bc5355216dffaf33d5671b960  LICENSING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 779fd2cabf..20244c4e83 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.9.2
+WOLFSSL_VERSION = 5.9.4
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 

--===============9077130040293841718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9077130040293841718==--
