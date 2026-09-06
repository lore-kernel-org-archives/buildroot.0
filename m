Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FD8C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 17:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26A9D80BF0;
	Sun,  6 Sep 2026 17:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjIdVJBhqDqz; Sun,  6 Sep 2026 17:02:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1A9EB80AA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788714151;
	b=LA6iN/XvO55wMAikjzPHuy41pjtRLqOK3LaIy7Zsyel8nvLqhdCoFtL9vGPo9lFSKBeT
	 JhZC3uHwHjhTsExNR4kzgENmDftSn3Xg17YNlcDQ/75bgSiLyqM3kDzAExQ9sL8MTxNSC
	 8z3vRvVVJZoglq55xGNkUcXQTtdWzYAcknsaLpyYhUhV3vlVZKKK6H7IYzm6WtaurKFsV
	 x5cU6Dew0t6rUW0EE0sBo9hxmXLm2/PriDKMDxJb6uc5zNvN+Z4V2X1OIvZqwxz4RVWCq
	 jKfi7ToIhOtHV5JrKz2GJmM5Iqobq6vpr6HrlWHM8JWv34y+hoJ+VEE5zpfihnrQLng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788714151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n9nmTOsSDNpxDkeJ5x/vzYvhTv4oIZHEReTfipdax1c=;
	b=p/HbfZITuNxf9QjZXSAt4VKvbBLHoVV3OS/weFfOKZsSqsKEMMOtxoR9B7HxdoS6n/Iv
	 vmezclO3jfyrFztr8V0OxtThoLsZzDAD1TVCccwcPSgFs1VAdCI0fin33IPZ8rFozMg4o
	 p7mqoLB8XNKmV5Lf7JfPcMimevKLRfwbJnKx4mrNh2blkDZj4qCWq1oabf1UiHavfj7qY
	 bUxbmr7Rw4Crnq5Xv8/fHvrLKRN9hEzbrpHsL+l5I8etWFVDvnpEK5j+GJTPWg843kv5O
	 rHIm5geuPaN6iGu/MndPnMJ3YNZr9AtRf9YY++az8xCdSyiHvAo7ZZlnQ/SQnQF8r9g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788714151;
	bh=n9nmTOsSDNpxDkeJ5x/vzYvhTv4oIZHEReTfipdax1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qey8l3ePFmzwiOOe88ZwNf8DMzvIevZChJGs7xcWnk0VAP2V1zDU1fS9WhHxIE9uR
	 xeT45YAHWodaRSLX5rAs3tiGKvSHb93W3HeIBHefgX36fDy1XI9h9oUam2SeIf4/87
	 tDU2Md0EffZvo02303jxDefr7liv44OBgV+W6jheqsWsRx3CqVwLRDP0t4Md4Xvi5v
	 2B9/Q4x/i08o+sAXIgJjLx2xbaiBPJqfCIpaNmVM4b//7NLnFRZZeFDZWZkre0ciHA
	 mk+6byLOgtubO6YGZO5yco/P3ffatLLnAfoGo3KcxP7mOak2Ez9l4zh8K/6WGvPK0+
	 ys6KAeII8XqJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A9EB80AA2;
	Sun,  6 Sep 2026 17:02:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E363970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5384B80AA2
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijz2Gq64kSNp for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 17:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5938280A9B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788714148;
 b=CRgsp34EavMAveGQ/AeEdfQsCziE+i3texSK5tf8Sz6/XI+E4iuzgp4yY1jr22HO8trj
 vnJaG8+wXN59jKnX/2IskJWZ6axT62c5HvowKpK+EWlVp0+kennQedhWjkx2RIZXi33ME
 85ASgPDjwwJbiegMdcJbKaXRjwS1iCXK3wkt9SW3NUO/IFXKrBo50fwu1e5JWbUq87rHY
 BvwMXQp7Of+WJ9LmGlYQgvPh8EJd4fE1D6vzOXPM++VpEqSE84d2tZv9UjIvzu3y4jwtH
 DYLJHN2HIHZIUyX2qMTzn4Rop9QkVsu79agH5CtG0dpwPzFrG29q6yC/IaUJWU2D5Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788714148;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LG7KNuI4ets7dtJFSL3VaBLvjwqSV6cIuMh47M3GWns=;
 b=h2Hpe7E9Be6xHs9kR8/MgfCdxKXrP+CNLhYXl83yj2388M0N+uR/wxyHBO9rXIyDvR4c
 Gds/ZLXGqgN6z677XjyK2H4eNwIXPJB5UAQK33nNRaNsnaIHejdBh+Q2qd5U+fKtHRWps
 TpUFnW22YHDpHZ8WLyZn6A30nMPOG7yIIicfV8VOoNjtOxZslHr2wbTlfLSmRc/xxKCCW
 3m/NQB5Legq9uHH6+KGwbvkFcyn2WBbzB4MKUIgRE8abu5NdPyGv2DHi0kWmAUyKZ4Xph
 RDNvaokwpqkyABJYX/VafaKzn+aHgTwxh84GrGjxNRi0WZSUPqeklzPqkTNqp9casmQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5938280A9B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDCD195448; Sun,  6 Sep 2026 17:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 18:55:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 490c380155e564fbe9cd346681f078da3f911ce1
X-Git-Newrev: d9e8462570c5b4698254195083d05dbbb9807692
X-Patchwork-Hint: ignore
Message-Id: <20260906170126.BDCD195448@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openldap: bump version to 2.6.14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d9e8462570c5b4698254195083d05dbbb9807692
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/openldap/openldap/blob/OPENLDAP_REL_ENG_2_6_14/CHANGES
https://www.openldap.org/software/release/changes_lts.html

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openldap/0001-fix-bignum.patch | 4 ++--
 package/openldap/openldap.hash         | 4 ++--
 package/openldap/openldap.mk           | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openldap/0001-fix-bignum.patch b/package/openldap/0001-fix-bignum.patch
index 1c71cd3165..33224356b4 100644
--- a/package/openldap/0001-fix-bignum.patch
+++ b/package/openldap/0001-fix-bignum.patch
@@ -11,7 +11,7 @@ So, keep the check for the bignum header, but check against ol_link_tls
 which means that openssl is enabled when we find the bignum headers.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Bernd: rebased for 2.6.13]
+[Bernd: rebased for 2.6.14]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
@@ -28,7 +28,7 @@ diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
  printf "%s\n" "#define USE_MP_BIGNUM 1" >>confdefs.h
 --- openldap-2.5.15.orig/configure.ac	2023-10-23 11:03:46.292215101 +0200
 +++ openldap-2.5.16/configure.ac	2023-10-23 11:05:07.245355497 +0200
-@@ -2327,7 +2327,7 @@
+@@ -2328,7 +2328,7 @@
  	AC_CHECK_HEADERS(openssl/crypto.h)
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index de2fee536f..0ee1152a75 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,5 +1,5 @@
 # Verified by locally checking against the SHA3-512 hash available in
-# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.13.sha3-512
+# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.14.sha3-512
 # Locally computed
-sha256  d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656  openldap-2.6.13.tgz
+sha256  806dcd21d366428187fba3278da773d5930f774852c9e92517f950d585f19107  openldap-2.6.14.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 6d30a22f54..b29cd384ef 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.6.13
+OPENLDAP_VERSION = 2.6.14
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
