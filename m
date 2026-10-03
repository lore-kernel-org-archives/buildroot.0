Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1736DCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF6B81456;
	Sat,  3 Oct 2026 14:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdCeRTJjpvDu; Sat,  3 Oct 2026 14:02:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0E923814DB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036176;
	b=AYVLOEC0kLq1DvKaPQgrpPq8KvYRJfVoSx9d/gfezsR0tLSV+TQwL/W96H4FjpUptT58
	 siu1Jttox9hdyGtWb8r1SHhqfO2AKRfdvl2mJrT/qI1oqiZgBaDkDeQxSAC1KEx0wFic7
	 fsEl6vBFW1huar5rbQuJg/xd8TLGS6pJDYpLin/iSFpvvsYUI5Zlu4DtNx6o5kOTtPS/r
	 DE3VvyuQ7bo43XP6nxZr/uw61ZalbqJi8vYjGxfoVsf1j7ClWl18M0F/mv3450oji0MpU
	 GObA4Pg+eZrCPC3SICfz01KpnQYkiaG/S5ryjpNmyZee2fkz15uHo0LmMufhjGdZTcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WDuS6FRI4sW7FLJ7V6sGudVI3aUJI8IB2vIFXvSZbVo=;
	b=K1bdJZaWbx7haey+camMH7zwln0FGNbDQY32nrTfW08uxVTwjKluelKTQKET0kPh6JHx
	 Ru3dSYpztpE6GZvg9BZCEct5KH1gPlzS/B0wxgbPYIphDaflXOyDQlKW8ghdFxeUZRGGH
	 gqB8Txoke42DZ+BGmAjpp67icaAo+0SFObQpOPexi4ySelTH1/I4NmNcoMhITo0mgs2bC
	 mZAxWmlQjk4+cNe3+dq24ePdXna1O/k9QZUkmi0HPoJJkoT2Pd4gJvjN91q0WhmFnXivp
	 9RiqMDP9EW6eL77taWvmHamJuGY2L+7rgbRtuAoPSddg9NaiBeIfCPu4gKUNICOO2jA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036176;
	bh=WDuS6FRI4sW7FLJ7V6sGudVI3aUJI8IB2vIFXvSZbVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n8RAqzly0y2+5XhpU/enkUuAsEn8AIzqzVxxedoGvPZ55c/aS9myw5aAtPklafWBT
	 T8rfZ2kZ63EFaMFCF16d7GrqXfIvJwyKojSmhgJfn/ExEPwdQhvFedi0e0b56rgp7D
	 NZ0uyromPEx+NBmXkKm+9vfyNA+ZiH75A2Z6EUBQhgQ9xNlpkPuPNLRVuKEbESZZUS
	 sJ/+cufeBGJl5+Yf+TJUBFyP0Jt4fBj0l+5LRVyR5p+kwBGchqkuKIEWhE/tgu2cZC
	 WqedLteBK2uUgxDnvD0KXwbq1bgngqJ9PnZI5AZrqBegamkiLokSBna9Fi+qzYdM5h
	 eh5nCDJ0B97oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E923814DB;
	Sat,  3 Oct 2026 14:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3FCD476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C56AA40063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-nPS1VioisH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 103DC40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036172;
 b=VADu0lCHk53bhszljb1PYWLEQT6LCb8sLK7TEQYaYMaT4rPSKLy3or/YO1rcAo0IRMSW
 1OS0lrpEcuqfylQFDW8OjMEbl3S19QwErAYTlIET5aX72Z+8taKd20NmlDcQX+tzRhum0
 H5ShCLPM6zsJ4C6TUFNDajX0FO+zz+kKSUaSSmpMjt/qB5kvNvClE4r+0wegTrIVgAQxc
 VI8A90ELxV/ANcK9V1if3JHx7Kdko3tssseE/g5mlQQLMD40CUTk+qfHTAwhEzXF0Gr53
 bo+eIOsrd68qtbb6aJ97RbKYjqrZRMeRGZcqYoCUiVKGN6VE7OLpjmgAjE9xe21Iymw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036172;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b6IYrBrtDJjYTen9xpRFYJJyXiiI7r1JHLZ1AWWVDQc=;
 b=mqKeOhLW2rQlL0q84WV+k414wOh97Ug1qTSKT+UvFaGi5wFA+QFySDyvoZ4yffymCrK2
 JTESKSBv2MWHrM3kOGLcThmqxlxIxUhq74GvaLOHqhrjdl+MaDdDLVU172qa/e5yBzBYE
 NT/VNUssddbvFcX3FWI+rWWhy0TjB9yJCHhGSdgBjxipz0+GN9jDvXfSu1RkZbPUAOF/O
 Uisu8Ch4LPGdsNYaVNxES19toNzN8m+AHHNDr7XdUe7TtLfcn2rgtCRe3zF0VXolJr4iM
 9M4thPUdrDynErE4iNqyAuCmH2nausOVszHjcUyhFQS0cghPX6Z0JLcUCUSBS9EK4Iw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103DC40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A89788762; Sat,  3 Oct 2026 14:01:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:01:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f66899b1c37b3a5cebdb4c513773d1529ecd4c39
X-Git-Newrev: eb46327db30fcccf1b7fc0f6726340870c34feb2
X-Patchwork-Hint: ignore
Message-Id: <20261003140137.4A89788762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: bump version to
 3.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb46327db30fcccf1b7fc0f6726340870c34feb2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ijl/orjson/blob/3.12.0/CHANGELOG.md

Upstream added code which uses the MPL-2.0 license in version 3.11.6:
https://github.com/ijl/orjson/commit/f12e56208a4a9e56cab3a48f5d761c146393be24

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-orjson/python-orjson.hash | 3 ++-
 package/python-orjson/python-orjson.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f4443fcc9b..14e6c2800a 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,6 @@
 # Locally calculated after vendoring
-sha256  cd415890f20e7f29055b5057d3ff5af7c673ffc3d7e659ec68e9377f13604065  python-orjson-3.11.5-cargo6.tar.gz
+sha256  5cae5a2c983f959e634ddd719faa35ea10b692bced61b4df74d81e281e514fb1  python-orjson-3.12.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSE-MPL-2.0
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 9b5016c9e4..15a2cb7873 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.11.5
+PYTHON_ORJSON_VERSION = 3.12.0
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/04/b8/333fdb27840f3bf04022d21b654a35f58e15407183aeb16f3b41aa053446
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/0f/f3/742fb1f62b825f2c010697eaf4e828004bc2a81e7e806666989c132c7c42
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
-PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
-PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT, MPL-2.0
+PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT LICENSE-MPL-2.0
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
