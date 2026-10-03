Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233A0CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0BEE60E19;
	Sat,  3 Oct 2026 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJus44D0foDT; Sat,  3 Oct 2026 15:55:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D9A9360DA2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042915;
	b=OUZNtXPixR1zAtJQejiEWpKhB/ogS6vTuJFzxx2fqnajBhNZRLHn2q9jhOHbGgitNB7R
	 K1HwLboN9VfmCIr7klOtxZhwMrPmiuss0DRZU/Uzxc8q9ltw+BYApMfdWIa995vWZjfGD
	 FWXFAiWwr6YRK6ulTphzLq2LIZN+FhIKGAmU7m8my21anUxhumtm3z7p5qDoy2DB0mij6
	 zE+NVtt1f3+uz87EoWpjMqXdmIE+fFbK24STlHOCnQYnAmPMt56oP+QIYqFSsE77II5yj
	 5A/d77DUxnUsK5BdoYHIWTjAAjar92VWml9lg1pHNWbRqElQKbv9PdohPav1IfDDP0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lr6i03WnPcef8x+Jdcvm2CuWftzKFjyRqZy1MDuNT58=;
	b=J2iJFjvG8VuqAv/wCTsD+eLHwLU0UJw+vCv2NFzS6h66YTU4x7OszUWLJBOkfEh0kumt
	 sm6TNcxaLkxJ+i7QduNNYDQwSYCiPsmJ0CEAHdLhw4H6nz+T8WQiMu44Yt12mfoQvA7EI
	 iR0fCOBpFege9OEyY7hW4M2A5NvrrqKz8myaFyq24IaiUCmM8hme5mLtcNizrQF9UQ+o0
	 +LZLFR7PtyN65S4thTdUkXTMIxjIh81dHavjZAfAQQ2Ktz9Iz2iONzU5ALTOl/jL3lrBI
	 kh63RY0EjLpHP7FhuVbEEmtDK636wuMvGYIjMAYnbHyBrukdMABIa2pQBsjPaayVoVw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042915;
	bh=Lr6i03WnPcef8x+Jdcvm2CuWftzKFjyRqZy1MDuNT58=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Letax7cDreIGganEClhO9YahgKLC1pEj06ntxR+sX21JnRIiI6I4RwKTEPFPWI/EV
	 TsYbGJfL5ENK8nde/pulT9foLdLT3bwAPSewcU89is24Nojt2WkhrAFXBX7Zaokn9L
	 ulpdkXaLJ7xwCxkeAm8HY8f+7MVsmFaXyxfczxowlI55xzmz9EpCFMbxjverzMZdWl
	 gKLznIRUllG8gyhtcVQQDxk0TrlaYuR79vOShIfzh1nb3V0BvB+wPLs9R+OtYiil9c
	 yxT/NUg9J/2ep5cnxQLwmJKnwUmxldUgQ7vlKDTXVEhoYsKRliZsEU1Xlqk1DmkiWO
	 TGFIli95O+EWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A9360DA2;
	Sat,  3 Oct 2026 15:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C81EA10
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90FB36068D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Z5J_VtCZfCu for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E6C6C606A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=E8i3AWV9yfc7Gd5DqbznQh8lgrEDk0Lc9c+5PR+t5g3vGWW17Jl2H2Qm7ic3xAMBA0NB
 PWMrOdBxRIzdAKDsUAw+Wat/0jy5j4ybNpngHXcC8O2imsQb2ksd63tJdwA1p4dHLHVWn
 xrzhX5gN59FwXqvigRCoN3w1B2uZch/JEM2cMhNwWI8in81MjlSbhnj0/FY3cLPCBOV8B
 X/L05YTFI/b7TzVK9ako7hitLIZkL01VbNyW/UB9uuG/zsPd+CeAzE/bVDOiNevUv4VQd
 WqZNingB/zyLdAAh+rGfG7uTJkYOfolWLy0LVZYvn2TcGmR2K390WlQ3Ss/TNBmB8Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2f4bVEwAS4fAyzW/NcE5VEu9rJHd2slFuFEPCc4oNok=;
 b=mMcA+6OA7sPdLcnEUM+wK/3sG/gbk467TMEpnOclC2m973HeNL0jkpbswLpfjmGIFi2r
 UeTyXzfzKhVCvqujmqYxdgmEq+ciWObbEm0n701IokJrS0cyxC/1XBxCmcVS4GF6Q3vpt
 94v2pCHh525L81cF+KF7c1xZOnJseysxGendBUp2ilIHo5K5UwV7OzDxVbpMB+ej37Cr8
 TPM3I2i4ezH32POCLvIXRUf0ENh7VDeBN15DfpKviol8F+uHkcnoBASS9UFZ17NhUGgj1
 83RIxadiyQVrubmAuAYELlAum7+d7qYvoKNVFekMOVY9iN7t7k8YLnnPJDhDpSQLCBA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6C6C606A2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31E6B8A309; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d3f78cf91762f62718160be68931a8de0b8d671
X-Git-Newrev: c5d9c6be18b1ca30caa5000642942e09a2c5d579
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.31E6B8A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-regex: bump version to
 2026.9.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5d9c6be18b1ca30caa5000642942e09a2c5d579
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index c99fc9dd62..e30af29b65 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  b9f15f11cde393d1959851ee9775fcda  regex-2026.4.4.tar.gz
-sha256  e08270659717f6973523ce3afbafa53515c4dc5dcad637dc215b6fd50f689423  regex-2026.4.4.tar.gz
+md5  b3113da02f37c37ae91946626ec4410e  regex-2026.9.10.tar.gz
+sha256  1e321e2c84f0e52c457f5ea5944f796d6e8e09cb99738ea98dcc1bfe402a128d  regex-2026.9.10.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 44c12789bf..169e62b080 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.4.4
+PYTHON_REGEX_VERSION = 2026.9.10
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/cb/0e/3a246dbf05666918bd3664d9d787f84a9108f6f43cc953a077e4a7dfdb7e
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b9/5c/f403115361de25809e8f785686ec7096e30fef73be9ae35aa51da4e80abb
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
