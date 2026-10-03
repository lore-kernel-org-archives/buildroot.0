Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADACCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD2A81334;
	Sat,  3 Oct 2026 15:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGoY23393WIE; Sat,  3 Oct 2026 15:54:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CE78F80CA7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042858;
	b=bCv9YEOWimYWjzL0p2206xKWk3wZMwBbvwixtbqEw0ulTlJdqYOKwlNxqnzUa3092HcQ
	 Uae1EZNhvcVMVZ1mOuuf/7AY5pbMqxWRj1B0eQ7OpNymQjJC3akqJ3GFlS/XG8Vzm01/k
	 qJKduWtkeNciq4i4P3Q+7w8ooVFuftkuKXEMWrQdIq0tGL88uFOtxX0l/lKjh4rZSdqxI
	 vR1WKKJCrRQW9Pi6Jcz68qZ2YYf/OQmULiyHkgMiZ91mCS8Qjqbc9fE6A/OIaBxjevSfY
	 uOzJYVArYn8mr3G3lVmi59FwNrqTeHNqaHkTq1IxO5YmguhXsPXoRKsxdb9Hvf+Cw6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YzEKvm+F4dbIR9x+ukDFMXXahw5UKbzVnfsVDK0ySlY=;
	b=LOr+BkMDzzKri1eHJ37lbZHXy4mZjGU0our8lhhLL/Wua27xoX8ntuCh96KdPDZcZVd7
	 ViFcGUQWmE+zLggQV9KcDdjGYMuq/aa/6n5ZAEKNzLspSmbHAzerAkcNdopuqExMj3pTc
	 8ULVcvuxslbUsV9/byhq1DdLOC4+pPgk5QQg0y+QpwQajfkLPDM6H/NX8GD9DYp77f4PV
	 hmOhzVp/FQSP8yBUQZiMxC+WimhxDXNyg7aH84SnWc6gxsM2VcTh2stKbWLSSwDt9k7K7
	 X3JJDkdI+cfOpUqBUbtcEpwLCt36CsLI5s5XJJqpmGZrBG4Ly6kn1VpjGmwAnp+jEig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042858;
	bh=YzEKvm+F4dbIR9x+ukDFMXXahw5UKbzVnfsVDK0ySlY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r+i1/KDbguHYIW7u7JAltkPO/ZOgLoTTzS5fVgu24VUmGpubCU7ptRnJY+j+xBdQ0
	 nBaBTa9PpuDTHcFFwpCmtkfYVbRSdYH7PV++ipH+6YZT17VMXkPD7fRq1JEu1J7VHx
	 zZsN3HA5qG8v9hFTk2xWw+MZUx7uJYx16i2yPE6rYRSCq4DNehqpGwRZyj9mrBwanC
	 2K7+xKOPimlT7VPdlSA7f+K1dr8DS456h+u81HOgxc/Tq2UL+/t6UThxvR5skCF+ei
	 XnNuVlG2FnFzTvctNW1vtIICk9TxDrdVuxG60PjawIRAZN2SFkURuCK2i+3+LThO2y
	 I8zTYlEkZi3PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE78F80CA7;
	Sat,  3 Oct 2026 15:54:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5417C476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DDE860603
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OyE1WZgFE_t for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 869266064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=KGvaWLvJ9uVYWtyUtK1eGlEIvQlYdIYWYxRZfd7JYXg+WKkbIcgiPE+0DuRhpZwxm3bK
 fmAMLySIoRg+H+kus06js3V0PmhPa+cT2gzttJWLLqVbAsbVd35toUs8Wywjxu8UnmfoC
 ExMAYVrq3sovw/qRien5qZWO1ymmNC5g4bLqEgs8kAPeMBEJmr+CS1gyUMI6daAhbCm7E
 5p6mCZSaDx46sxAjtKumLF45E5raNYipHc+SDbzkSfCFEQHO5cu9MaH++ojNU3HGPltRS
 MmdBJ/Lqhd9YNYqVGFSZmFBVxj3EzKM5usyWU73Dv3q4lIH4OQrm0HVOiJTmcJaD9dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qiv72IIRPYu6UJDqI0+g2xXCoEmC4MgUJJFNGy6prwM=;
 b=MDhEhkOmV61vXcq0avdSdICKfmK1HMlBDEIN05usAOe0Cuc2fDxK6Wg1BX1npo9Z1Zna
 BHufpm/fEPeYVG0k7o52mDsmNiGqllj98L/QYta8F27sautp3DHrbeF/Gt60fNPZfCR+8
 N8JUcsCIrX0EMPQHEPJ4eX1OPe4CBxItC0YeWZeC4KCoES1W7WNEcEaJ3lIb2jY7ebd+T
 1lDY04UYlVqa3v2R+m1VoCncFLi9EWrabGjwpUqmLEq/BxiHWc5/p9ACemaGqV+3TiZjT
 k3jOtUdnOBbdVkPV6nKp2wzJnCQCoWyLOI2ddD9SBCLbVI0AfCc1oh7Tlm8XpJLLnnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 869266064B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C789C8A31E; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f51195e00c24137684d1cd378cfaf519bdc6413
X-Git-Newrev: 30b9a89e233202840fa061218c2f8322e6bb9909
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.C789C8A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wtforms: bump version to
 3.2.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30b9a89e233202840fa061218c2f8322e6bb9909
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index ba68361055..04774b2ce3 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  58a16ec4a96043b429c196bfafa5fd96  wtforms-3.2.1.tar.gz
-sha256  df3e6b70f3192e92623128123ec8dca3067df9cfadd43d59681e210cfb8d4682  wtforms-3.2.1.tar.gz
+md5  94cfcc701458d2bfe1449bbfc7872be3  wtforms-3.2.2.tar.gz
+sha256  7b00c73f8670f35d4edb0293dcd81b980528bee72fd662b182aaba27ae570b93  wtforms-3.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 69e051f150..76bd047ae6 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.2.1
+PYTHON_WTFORMS_VERSION = 3.2.2
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/01/e4/633d080897e769ed5712dcfad626e55dbd6cf45db0ff4d9884315c6a82da
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/e9/91/ed9b517da898e3fb747566aa3c12a734bd64ea7449a0d25ec74ce8f8b8eb
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
