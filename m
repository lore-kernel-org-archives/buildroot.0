Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0256CCA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6475F80DEE;
	Sun,  4 Oct 2026 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOexqz9AXX5c; Sun,  4 Oct 2026 16:08:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7A59680D92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130088;
	b=WhqNsZDDjlGlHuccW3aT++q+RDkFFIk1ZM5F5Ft1j65VR2rarPHwO4NqQciPZNE/Ra+Y
	 qdGgGx9DfAll1onZULuxPJmVa951aYyD1xNbfRk5RbfsJ4Ln5qKJdPUaAvI6RR1a4D9lk
	 6KgK6AC0gevijOavLio7SWodT5ROIHt2AMzrA+HMMQHRp2B9WNcPSW3J035wd4QxG5D7w
	 3uplxulL4DzbwMJ6wVoaTzYKL80bvladvByGirKqHsyVnaDPHvL96q7iM06ayR3hUCSZ8
	 rXYPo79NmZqg7gyn/vCvf18l565W4h0ChP4JThT+RP02fYXu2wLPVliEDw3kHczetDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vBJylp61DehL39bZX4wC0eilD39u3Gtm5TOr89aeFbA=;
	b=JcYBrTf+Iq1lSlEVrPoSinX009nwhl9NV6diYKbDKe0RiwNYvtLY7kTlXNTMCsMrihdL
	 YWEit6roM+ZEuQtDe/yspKjAuMJiHDvrr2zQyoj1nrOUbZcw+XsDPHyaXnOIfT+ToOWQJ
	 a/25AuEeFj1cSg+dgq8M1BJTDthpRdW9kf+hqb0HBHEhjp7XNsdFkZyasy1Vo6bRiKgR0
	 MkOWXeCjfWoRSQR/EUeVQGQAaODXFl4Z2W5Pek7t0aG8JBoI6l7z+LAhZRhtnIus/TVsn
	 il+tpYSsd1sEr+vW8g65mmoNTmtEVcoUYixWNpLMoKynCwTuua5sVDGiHajy4DWDSdA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130088;
	bh=vBJylp61DehL39bZX4wC0eilD39u3Gtm5TOr89aeFbA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kc3IEHwxwcaozHeNLlM6MsIdeVS6bYIjOkmEAai7hjJ5jZkO5XNWY16kicq/yQoAX
	 1gDJU/NsO/5yw1xdyvhS7hFB6BREwl9hVoj2qRY8SSpGwx8Pb7TIQFfgtLgUsPDBrL
	 /HoURx+DbHL2hrdSwqmjZQy06zZs7aP+jn8iK5yYGH/yf5JmQqMoERAiOTGvEWA7Zj
	 qXxhLD+xS2kiJ/ZBj9tpjl5dIr+orI/DgWVr/acxYtN9XWUfQJZDkJkWJ2iatJsJP5
	 nTtExiH2Ii/8XkyKpKba2Sv5o2zPLU70TujbmiUaUYoFwV3R7SnW2C+Iv03zNmXcAp
	 LR6aPkzfIYwGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A59680D92;
	Sun,  4 Oct 2026 16:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61169498
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4509E6065C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x75gAF5xjEzx for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 507D7606D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=KTNK/lg71am2fTPFuYXUfa14VuSuibSdldKcFQNK50oIwMlmttm3pZqdD989YVWiCLiV
 P/TMSgiAB4nYanw7DaD+WDpDyX08cwNrK4UiTgXo+5tl/Dz6WdvoCro+dQJ/MK653QEm7
 Ygh9aQgZdisoRJMoDMI8+cBtNu8MUI1xyynmWLZOO7ZZ3OJDP2M+fUzXhIjmgz36lBCMc
 WCfUU+sAm31zoXdTQTOYdJiyfHJDhR60X+qlPiHrelddoVJBcYyll/haYTczzcLaBtuk1
 8ZtK7Z1ibHwhth+rcCmRnBGbY7sqY08Ts2ZUdRRo1yVvIRdoQ/Zdq0Dh34X9CnWOQ6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=I0oJhKIuZlvsBr7bMVAPamfQicvgzWhJ/92hw8489zA=;
 b=ROMJLfiHLL1GHVko9D4GleY2033fFjDWs2pFvTOrdMeRKQy7XUFMyZKFKKbmwNC3wSAN
 q4BiGvPMXR+IhcmG2PPR09DtrjTpjeeB2KrMwSxC4HRpKCWWdLpTkTkaJAiZmLeEfJbIW
 EdgXSBjE2a3swKkdwU1ZeIYKqzMeX6s9ncaf7R1jpF34ZcbZF7T0pZu7vWsqtha6BydVq
 5QIm1KOeuvQgHyzaZf3S1juHRv2HY/HaClVmsPf02mO1p5iF0HLOkDF+jmXMzLWELKdBB
 QpqyEa6IVTbgFdxBg3QHj2VPQ1KH1YnBBlsPk6dHr/Gur0jASFFwoyh1+CRWyG+9X6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 507D7606D5
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 137B48D21E; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:03:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b46eec503e7e46f8aeb319d0660ecebcb6bd3521
X-Git-Newrev: 74df9b364621f9e220b5aae8b9c9a9dcb6329f81
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.137B48D21E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyspnego: bump to version
 0.12.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74df9b364621f9e220b5aae8b9c9a9dcb6329f81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 4b8763a73b..bec18ee01f 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  2af96f8b2faaa4c35026332382c1b5bc  pyspnego-0.12.2.tar.gz
-sha256  448a491a9bf0e5fb957567fe46e6809fa836aa40dfcccebcc740bb64acb1be1c  pyspnego-0.12.2.tar.gz
+md5  5e85a37c48b666c15928e9102dc1803a  pyspnego-0.12.3.tar.gz
+sha256  c4982c9f92e6aa5979c9d9a142a21339ff82ebcfbdb4e0649320cb050961a3cd  pyspnego-0.12.3.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 7592eea3ba..312eadd9e9 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.2
+PYTHON_PYSPNEGO_VERSION = 0.12.3
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/03/c4/790211e7a2180509dc29137c488c7b038ef89bdf83db0ce4da802f64f9d4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/fd/8f/30bb9568554899a6147bed657762a3c707e2d3dcaabf3492161cc9550bb4
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
