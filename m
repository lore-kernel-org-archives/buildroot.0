Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F17CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B848154D;
	Sat,  3 Oct 2026 15:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uDdgK8qBg3W; Sat,  3 Oct 2026 15:55:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 79EEB81518
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042952;
	b=QHaDJYishYWQh46bfUQM9deBitF0y0WGPtUD0nnvTrg8PozMHZOw147F8rEr3GXXUF6F
	 uUl6tUKmm/Dlq0v5cQoqvrk71RHXmQsh1WqUKTifE60/Cf8A7fHkSBaZolRU8fcka3Q47
	 IncshnbOtY+btyZDDUuq++HPV+a6PDdpMzXGw0n1c3/CO1j3ubYXt9lOUo92k6paPK2az
	 rBqCte7FGBinKtijNT+v++GX0ibFUjDXnJOPa2N/YaAOPmmicmh//sGix1PKt/lu3mByQ
	 i+o2x74HgCvcc+nGd/cRWI7yfHQ8ZJI6nrq6GvK6481Hd9nDcPVTz/mQa4qqa8tk2hA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042952;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ChHucDgzpcmCCsConond4vndbGJlUMsA7DrbU76pqCw=;
	b=I1E6bjXChSPWrguXPpV6rkoZDckSD5QtMio9U88TuQG9igrmhGMmB3M9q51Yy4Tqyhds
	 zXNgKvUccf5z2KDlyyooElzTaPwJUb+YUuzKCRutCKU5iMK0d5RYMJyHYqeOV7z/pWxR3
	 uA1EbgSbsuCDGk7tYFN0mUPWih5giC/t9xrsIKU4PdzhMxvgk3lQulLEMB+x5L9WGkoJS
	 uXgAbFUVRK/17KCiD+M4NsABIufpm8ankCBPWuZmPN/6cHUArra2pZUu7tT+Qs183e0kb
	 4rFQSThi2rxP/6JbcwaotQBhjGtxcsfaNr+8a6iWPS+aApPObLEV1htkf1fPuGRl3Yw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042952;
	bh=ChHucDgzpcmCCsConond4vndbGJlUMsA7DrbU76pqCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rhXjxC5GYn8Zt8mwu1haEu1a6Aw2HOIhl/JEO1IIbMAqYO4ACWvBWH2pi+LV7L+n9
	 h/NZjLJqy2a5GDsXwkz6gk2wThl+OLfxbkIwofbSzgxjjCexP4JiYQi200hRiOwish
	 nsQOfNjeqvUHcXwd5Z3ynkOnJCIEuVr1++D6z8sZ87u9t1LOPaExjQkWXpKp8C1LED
	 600j0Ht8Zn9/qULcP3mb1ZBmKYYxcHiH53RN6Gbpa5blbYI/nv0vPQzc4I+pnoJ3iZ
	 3efV7KreoxQMqlGneF9G5aAUq1VV3VHiJ4mP65dix+wuRWr9wwsJu8TlyBusZ6RxBr
	 bSQ2YMHOkN+QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79EEB81518;
	Sat,  3 Oct 2026 15:55:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 008074B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF986606C7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIU2Fz1_PJVX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B3A66606B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=Re9zgVkXGGW0mb9vb7OxqGWfskxkR2xhL15ugn0wrle7o19HCIXqMuD2ctcSQTYUjBBG
 2b27cVN+tIS03KY66qnCyU1LjhCJAXsv5zb/oyfayuF0otieyosxc8WRpSyJYZU2x2LSY
 CujkeYCUxYyOMxprq0yXY5+WaHpxHlT3isgbiJqfdx+IOKNM91MfHrkmYavEv9eWfuuWw
 oTfjf42LtINb7UZQ9XvQZEzvAzXLdhJrVZdsB4onFqAt2/GYJoTJMsAZ+5IZaSwFu6nDi
 APWGvjzjI2KKJ3e8Tc5oyQLyPQwMH1S5Uia80kV4okb7jH/00CIyMP+wNaoUokA7mEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g+HVu+ojwqZ+p/HTxC4gnGmtnIT8F2OTVNthL0AWxuI=;
 b=aEyuq3zAlTGLIoA95rTSBKqJ8qjWzZLkSHKoVt4b77yGPJ1X9ntiJdyBfsCG+9k0cR8K
 kpyWyyETLHTX70LmSsfvIBLoHHgh0VzcbzaKjLsXv9fY7TglLfT9GiI1+38ETYa3GR6v5
 PKj52uVInVL0lQHIdJs5o+vutT8kxXhzeAKoZiLgD6/Qa+SoGRReu8hUlq+lrVcZVPgIb
 lNRaSPFTAyn/xNGY5sDE2W9qS1jU8o9o0F+1d1reaSJvNNiSa/d2bXrzsOKGCcq7dlJrS
 wsOwXKcXumo1NBScEES2d2ncb3GE4XYLW4C+YgYLJnw9t7GhfdGH17w8l5O6b/xOAQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3A66606B1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 005E988806; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38fb68732c0a7a586893e29831b6f6847138e536
X-Git-Newrev: 7c95a6d9fcd9399298de9ad4b9f4c345d0a0f3f7
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.005E988806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-treq: bump version to 26.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c95a6d9fcd9399298de9ad4b9f4c345d0a0f3f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index 0c2582b4ba..18aa98884f 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  b0a3c2e315375388e820019afc59919d  treq-25.5.0.tar.gz
-sha256  25dde3a55ae85ec2f2c56332c99aef255ab14f997d0d00552ebff13538a9804a  treq-25.5.0.tar.gz
+md5  eb16ad46a399062514b09300635f3b0b  treq-26.7.0.tar.gz
+sha256  43e728e12aca2d897c626cf07dc7b4392749b73de050a7d66e086cb3a6e15da9  treq-26.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index a8e451731f..7ef7fd38c2 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 25.5.0
+PYTHON_TREQ_VERSION = 26.7.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/ed/7b/b9dba8d947584481aad7e29b01f2ea6bbe794a0352e0cdb68e99ab135c31
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/92/13/96aceb81d076eea518bf174048db701ac8b139c7aed1082913318a55a7d2
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
