Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8836CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9188260F00;
	Sat,  3 Oct 2026 10:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yreF0f52fg0; Sat,  3 Oct 2026 10:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A13B860EFD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022393;
	b=g35zVWV0JfS3sS085Jk0bhtxW1pSeCPHktpxSAfcjJX1nYBz9DpNalZQYxDcaTxqmjL/
	 zD6kdXCkze6L9UFslXtYDOdemXO9mGfM63wlC1E2eOV+04uLGLqreFNsr86z5vCglcNup
	 iXP6WO+OBAHhfEdycJfR15JLZ5Q0deR8RDLlNf6iLAyZemtJDxH+KmDRRwHq5518MzE4B
	 WF83uAO8RwXoz8AOy6bUbypdIuIKYS7t3P4QApCjmhtOdinEVLfurB4NbdSS22Ib3PO/Q
	 cy0fLRRulHqRgKMDm0aJRkMv/MdafIoPwxsdl3Bmn7Lz9gPNi/bt1HbBsKfOxdzDxwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MLoNeaUQpSjuRH9ZdS1n7To7MT7v00uh+ruOtawFP44=;
	b=b5e95FUhXD1t8hvhqdIy3shjSK/bpLXSkOMy962N+YIp67BFydyGi9hvfbJZHZdsg1Yy
	 l02laRFa3aTJc33wl4uBVcuRTDc1nI0xWbkZ+HRY3FtGKN1Kt/JM/OwfRD5bonU+Z5LqY
	 0HyIcBj96wPTDYsc1IeNRgW+tG3IkTI/wL0kJFyONzdFFlhLw4e6070RftVm9TVlFYreN
	 g533RammXXOM31VwMClUZohMiRWMpj/bx7QXi1ny3oTUZVZajnU2ahSm/51l6i+KaAE3e
	 Akq94y+nPycofWixd6p9jsqCO/8VUPD1Go4Px092G7vfsfbrC3/3GiZ15OrkkVfULPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022393;
	bh=MLoNeaUQpSjuRH9ZdS1n7To7MT7v00uh+ruOtawFP44=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KlA4JPJtgyiKsakyfsoCfTPBsBWAQZzB7kwSAupORVeKV7McKkwJoWkN3L+DelrTa
	 pby8mDcnAW5S8oPWx/ZzFB/xFPwYSKIf7ok8mm5If01eth4QphqbOd4yqJa2dQb+ZX
	 y7Vvx2AIvsxagwg+q9sYoMrIZeJ80RqhYUuP+fWodp0Sxdn5YMTlUxA1FL4VffghE/
	 OAVPcfQoNk/T5egb6x1UeQq6uN0QffVS6j87qWtZtR4pY8aLAWlctiy2oC6wZ2j5Vz
	 AM0OieT29IRL37HjbLSr/WeditXhmvShmUJ+AKh8V9sRuCreZE86TuVxtID0meuLFF
	 /L5I/2IypByRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A13B860EFD;
	Sat,  3 Oct 2026 10:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69752179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31AFB80F76
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQsbKAsEinOK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6304480F6D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022383;
 b=s4rIEusSqFSisELclGZM0m7pqkEMVKXPlfebYSqkHDGo16W34wnV7p6RT1AxRrgoPDbx
 wXB/BOzYqvOydcbJBOB46GgOvqHrfXCphHQKBJps06N/jtgWDmNM10MQebsYjbNdQ00rU
 Rn/W5PTFOxLDSnX5aG+lMCGB6TURL2Ke7/mqByap3RkOdet53/XzWi5a1CI+dmd0a9CiI
 sG+5uW1GXu/SVo6QRh48nVOvPK0jDr6EY8rvADAdUZfGKXfF/HuAtxt3OnXB/FdWJDpU9
 efPgWojUCu3fEA6gL8lHuIZ7GLXbAj1YsHgwWepnrM4Rg+KyiVvqZ1v32fKOVRgMoVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022383;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=l8Y9rXE9BjXiJI43mfLlJHsgtRNRuiEUs2PBau3pop4=;
 b=c1lcS2P26x6F7L2meIblpTwgXMOX1GqQnRHdDg+DTSUFX/6aDGjCilq3zNqKidm4YIPQ
 Idh2ft9iZZ2SWacZljriF/2o3PYAzxuVPCVSvMBsPQvG6koEADPr3TqqXQHVfEU1A3YPu
 stSGoyMBNM50iuqiLYAIEmXN+fynzKpSuirVnB45y4RDkdQDhV4W7NHeKOEVzFazET1AK
 xy85OqSENtEUJzWJ4BUA8qlkbtdXbk2XDLaOKk9fyJzhLIrsesQCBhxHdjYgX6ftVSvUy
 t5kRCrWJ/n/y+PMRcGfdXndDBSbDtKJD3lNeB6s5ettkFHYp1mGT8qFpqJyx1ELx3pA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6304480F6D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B30C788EF9; Sat,  3 Oct 2026 10:11:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:11:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ce9f112d804e7047df13286c8333c54455cf51b
X-Git-Newrev: 35e22d45d561d2c70b5ac8a4588c48233ecfe726
X-Patchwork-Hint: ignore
Message-Id: <20261003101148.B30C788EF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mdit-py-plugins: bump
 version to 0.6.1
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35e22d45d561d2c70b5ac8a4588c48233ecfe726
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-mdit-py-plugins/python-mdit-py-plugins.hash | 4 ++--
 package/python-mdit-py-plugins/python-mdit-py-plugins.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
index 4537d908af..bb29e571e4 100644
--- a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mdit-py-plugins/json
-md5  8afddf3e020778a9d4490f43ce469d2a  mdit_py_plugins-0.5.0.tar.gz
-sha256  f4918cb50119f50446560513a8e311d574ff6aaed72606ddae6d35716fe809c6  mdit_py_plugins-0.5.0.tar.gz
+md5  78fcde535f69c580e9bdc4393ef2a8bd  mdit_py_plugins-0.6.1.tar.gz
+sha256  a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0  mdit_py_plugins-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
index dcbec98089..c324f1badf 100644
--- a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MDIT_PY_PLUGINS_VERSION = 0.5.0
+PYTHON_MDIT_PY_PLUGINS_VERSION = 0.6.1
 PYTHON_MDIT_PY_PLUGINS_SOURCE = mdit_py_plugins-$(PYTHON_MDIT_PY_PLUGINS_VERSION).tar.gz
-PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/b2/fd/a756d36c0bfba5f6e39a1cdbdbfdd448dc02692467d83816dff4592a1ebc
+PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56
 PYTHON_MDIT_PY_PLUGINS_SETUP_TYPE = flit
 PYTHON_MDIT_PY_PLUGINS_LICENSE = MIT
 PYTHON_MDIT_PY_PLUGINS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
