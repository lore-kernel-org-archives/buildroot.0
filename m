Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67569CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3306540FF6;
	Sat,  3 Oct 2026 10:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4pn1unH2t8u; Sat,  3 Oct 2026 10:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33A1B4111B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022044;
	b=HMo+Us6Tlto6tjxBopO9LzbX2FdYNWwPtvIOCPUT1ab+KIntrlRvSFcX9l9tKThHedRD
	 4Gb6PiMTN4XXoyb+8BkJI+ln8kLYNw2SgHK8EvgmsclJcsjhwOOC765i7eBkImtEwqVN1
	 gHFxkq2BZSHTsg/Ypo3ep5QLLb6X4avygrrSpvetM3ht7UPASqdcJQ7O9V1rstOS4bEFc
	 3AriRl9Ea3T6XWrF/oGeGeQ/Q2qmHey2BsF/pxP01hRJxXQMpZ68Ieyxv1XGSqEm3pijL
	 ColLyMOc7f53RC8LPytoTZlMhtYvNkVF4MkAVvuTtdRbP0J6ySCiRztrL4mIoby/TQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xq+HPqC068Z9TjLtDWVqu3z2T0tJesIB+/igeZJ3l6Y=;
	b=rRYy9DA7DHPC/CFK/qh/rQ//fDH2g2iZg2VzbJqp/Mmn8MGkr5zJTbrVenn6Ln1PJi3u
	 rg1rmXiP3UHuN/n7SMEowMQKYwi6GyzooJCh0PcYo2sXBqmA5B6Fb7FEE3+NXVyUs3vfa
	 MOiv2fzt0861OX9tvfX24ZGsF1dEeH7WTTwQQDLoIcD6MDEDDgCoXJZu+UcOzm8co69bM
	 rIUABK5iDLLfDT/iPubIzlzsIoITvBaoKXXDBibKoHq+zdckZ1AkIuYKJkDt6jSKVmH8C
	 +I63ocXmU5Acpz1WZ2VXwti5WNzf1KjrKbW6cdZt/+K34Ogm0NvEHpbmXhSaNVqk75g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022044;
	bh=xq+HPqC068Z9TjLtDWVqu3z2T0tJesIB+/igeZJ3l6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YpjNeM7hSDNEC1HSGA5SipPfculc2Kh2KVR2ZHRDn8IA/OcuSjOPsnGgsyli0wcdr
	 2Tq27LildUIuMEC7BWr8YpjU3GrSDcBaN6E+3okrqyrL8dC4omUpTb/WETTF2nxzua
	 2jw1n9qDB8/KXygpRscg9a8TTF6mR6FNI2ZReBv7useWeL24CiVVCP2rAZO5PEUe6A
	 s+xrVxCv4oae5LrJIGitCWATr5WJj7V8B3wQoLqAfE9KQov43xO1cUH8XwRsVAEOck
	 zSJvHXU1+wPG10rRFBLWALwp1iyKGsnCWN3OQrLhPyymOvgtAtIwh0JmZIXrSbm18a
	 c/npmaNihNlJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A1B4111B;
	Sat,  3 Oct 2026 10:07:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16D64335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1352D60E7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTuKAmF79Msu for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AA0460E7C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=IA3sPEjGzJLs3lqqO90fKx5TNHiV4SNipu87NHOK2pguuyhG9rFvNbZ+PoRAkcpKQ9B+
 dgIcvat6N2twa6q5c4DjthzKqHZervw6WaHrqgFbgwwE6XRsp3YEsnyO+WU6y6/CMN5+s
 Xq0UcgocvBrHAGoPTgGMmfMJepHIYuSIHKYSYDLJy2dy8Y2XAzLo0Da9AkAPKvXmA5fw8
 JwWDu0oUgfvJ8Sr/wTzGPZPBQVk0y7gJgf2BzNRDX4ej5T+4BlLHCwskLFgrgErxueRyP
 qWH8uYytKUmQQg2S39xElbccTL3WAGfdoN3M6qHNLCqZAyepl3ZpFNVV9mtMkY/fK6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gdSfJ4psI9zrqkUtEC4hNOrNLkJGEUokSs3n1USopM8=;
 b=MbQTkjm+5Mw/nuprHcSYtJAI30MNly3rKwIGCrKiVVplCTUqdJx/89+sMoCKLUkENGCd
 2iWRl80WA5MHkjQT3eX5vzvhUjiB9/lzU8r9BmWUBq0h/Z0Cy2g9TGUo9lZb+JMglNTHS
 GMvZsmdfQXp7cZv26Jd6D/pFfZDRK38pll28+P0HPym/RFu3sKyxZK6CiN3hl19jCzRPO
 awXCpt+ma5JUBPF4fPP73/kx2ikyXOobxNODYt2NtW9BLehUsbexptDsJxLZ8Cqgqr2h7
 Eieooc3Go2bFCyZ/KE/mXwkcX0lI62DPoGb8C/QNUPlk+aXdtuX18cAgwVCUINSuk3Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AA0460E7C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8EE28191C; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea899e79ab5ef529d665151647830b1fe25971ce
X-Git-Newrev: feff121cce8a5503f6843e1cc0cf63f31f98e3d2
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.D8EE28191C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crontab: bump to version
 3.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/feff121cce8a5503f6843e1cc0cf63f31f98e3d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 5533d82a7a..d7b94ad577 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  9edf7e8e5d9fbea6aa8a9c045bee93b6  python_crontab-3.3.0.tar.gz
-sha256  007c8aee68dddf3e04ec4dce0fac124b93bd68be7470fc95d2a9617a15de291b  python_crontab-3.3.0.tar.gz
+md5  db7bcaeba9f5e01b67feca4f799d354d  python_crontab-3.4.0.tar.gz
+sha256  d2b5ad91f7a641d774661b7f3ba52258fd68273862c88713f4cc092ba614e707  python_crontab-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 248ffca405..5910d9984f 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 3.3.0
+PYTHON_CRONTAB_VERSION = 3.4.0
 PYTHON_CRONTAB_SOURCE = python_crontab-$(PYTHON_CRONTAB_VERSION).tar.gz
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/99/7f/c54fb7e70b59844526aa4ae321e927a167678660ab51dda979955eafb89a
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/49/3e/f61917a63b20d0ce0dfb58e44192201892a1cfe9d4167264b93fa5485594
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
