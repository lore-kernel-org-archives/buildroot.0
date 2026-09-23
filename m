Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2848C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC8840AC6;
	Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK_6U-3FR1MD; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1AEB840AD1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276213;
	b=FbPhAe54uQmw+Czms9JRsPqq+gfJ6RrSKDCIOuGTRkl4m943fJzH2weUGxmvCQtaYHPs
	 5OpFTZgx0sTXhxS9mtBBPDiAUMuMBwaF7XWyHrk5tWx0emrK8mnOjdJ0RbtiJP2+tIcnB
	 AB8SbNwLjpptTdA6Gx7CPfi0cM6Y3LtgnTtcMp7lbyeBLXF3AOA0MnxJVQbUruWe7lZtu
	 aFmf2ow81cPv49CsL4ideaBlAON3Tnw4Zh30v94vJCy+S1gAUSfPrZf5amOpXkM6cKA4k
	 Vr+iug0WwEXl3CpF8SHcFoYf0MC99xJSpcys0PBDQ5mOVz5ItBILv3aFvPOKH6R4iTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Lap+kzLisAzura4sCMs/32U2BfbPwopcC9ES9h76l50=;
	b=Yrzr36Wgm/NWOzkSKmlWsg3B1/z5KYhepREV7vAkN5rrDQ/7OH7LIZ43k9sCpL8juT2k
	 mGDfJpiSGHCnTdjVzu1GrCdiXyp3aHc1/uvrnG9+n860SvS/Eq63VQhTn+xkwT0rpAzOw
	 9qpVABxL74Tp+STOwRm1TiYvhN567Vk6IeyERgKo84ykTQvd7eddasFaxr/6/wI/nZl4e
	 ddz3PbLm9SBNZLFIXuS6618nLjxEGhfyE1aEPAZKNmtQ5RA5wL0Hpb3DUULNrv/P4gg7y
	 1EmA57nK3m+qCo7d6xnl5KO5mwo3h1bIesItAq03/U40/mQYfwGn0qn+vP2yQqbA9yg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276213;
	bh=Lap+kzLisAzura4sCMs/32U2BfbPwopcC9ES9h76l50=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rxa5LacYcPs14s6ZR+2KVbRneO9tlySoIMFWicfZtOgJMpJ3LMxw6/Lt+pcmlPcmd
	 XKlnuEOoTbh02NqiksUldSF/3NZmRqoTjavCuqdUOwlq27GnDVwfc5jQxggbL53qV9
	 UgE72KIeGkZj+dq3XDC7PEoDdrWBR3zgIfYwQAB4HgbrWvdmIJ9/sqzNnciwg35WcY
	 uHOpAe5/5DbkgT3vCmWd5r1zh5pEfzbw5H59/tc/rhuIbILDVFC5JCoRss036nj6G5
	 cONkvZCWpral8jeo0ncwCHhEL3GHPBtb8M2wwM65QHj6PKrPj+bBCEq0QA3+XurhWR
	 7f3WfAXMW3TJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AEB840AD1;
	Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AB24328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3077D40AA7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkesrRK7_jtx for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DEB6B40AAA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276201;
 b=cmWmR2yGUAfjUXKBWXF0DCIQN1cfHX1Gp2gorFTrCaa+BPIZoYeX2uNVkO8rHfWUZWe2
 x0RtulTQ23umCZvgQC0kjt8I9wFU/2D77HgP1HTq3VwoOeovgl8m80qkLhUdH3VThXbnp
 BPv26bp4O8UKxBlkMrEPTWq/GE+pdwFyhaiSMPOUhE4Hm+dv5K7pWWecP2j/c+Ae+cZ0x
 aTt1h+f6ptNgPp5OVLYiLe7cYBSRwgLZRhNLY24Uw1/T/miNqDCKUEROkMb/xctMk3Zp0
 B9KE1kgTS/67zDyZfSfeGFIiUtso1krrsfLu3/992c7eNZQSEza4NtNBQmG6cEkf4jA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276201;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v+NGNfVneyAjL+S+SdqoIFh86ugm+qVwlUqwVkRVyOw=;
 b=C/Abi3OUtAOwJ1EJOZ/1CKUr1PYOW9ekMtVOZtGxiyhiGCVOH8vSMoYhS89K0O+ke2Fc
 ok5pCPhYZ06kEj81oxlH0ceC8n5kGy8sL6r3I5hylpL0ET32XJXY1Tewsbe9cSU08pqOa
 QntbZbAlOeEIR5ga0oo02kTSLkhXzDntzosTvK+IENYPKrHuMyo407p2y+sEtek6pqWbn
 gr6MBBn5NN1RbCPUkKZyEFSxD07ld6ipkeyZFtKwtDwjIWMXazLK6TNir5i+4F1htgZJu
 r4qMGsiIEH4tGkesqKyQL6f/aT0n0wa1xab3glU40jdSTxx+FTKrDJJ4ZoCu3uuvExA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEB6B40AAA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 733CA98383; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 16:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 03fe784a0afa0609723971577e3135d0a1f54e1a
X-Git-Newrev: 75063b2556e76cb6287a873c11aa699927fe63cd
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.733CA98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lldpd: security
 bump to version 1.0.22
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
Content-Type: multipart/mixed; boundary="===============6921917758472821606=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6921917758472821606==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75063b2556e76cb6287a873c11aa699927fe63cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/lldpd/lldpd/releases/tag/1.0.22
https://github.com/lldpd/lldpd/releases/tag/1.0.21

Fixes CVE-2026-46433, an out-of-bound read access when removing the
VLAN tag.  1.0.21 fixes path traversal vulnerabilities and arbitrary
file deletion in the privileged process.

GPG signature verified with key AEF2348766F371C689A7360095A42FE8353525F9,
LICENSE hash unchanged.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 03e4bebcd21a8d25c68f1b225498de5db10d8edc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/lldpd/lldpd.hash | 6 +++---
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index f3cefe7b73..46f2b9b476 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.22.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
-sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
+# gpg --verify lldpd-1.0.22.tar.gz.gpg lldpd-1.0.22.tar.gz
+sha256  9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03  lldpd-1.0.22.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index a3015e9e7d..f0cbc7e436 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.20
+LLDPD_VERSION = 1.0.22
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \

--===============6921917758472821606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6921917758472821606==--
