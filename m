Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEFBCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F38FD606FA;
	Sun,  4 Oct 2026 16:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrBbj-HurAQX; Sun,  4 Oct 2026 16:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 18A2A606F6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130087;
	b=QwVjNgK6fLq41OU/uF3Ph3eBNJPCo2xnxkpRMZLNiHKl4S2ffiZHfoRwfhz9W4ToV/i4
	 PBlKc9jtGMZftTKu4bGA+3FVV7/4MhWxJcWIxJZrJuTqs25qHbdt/JeTmwainXjS9crR6
	 5hMnppZooicLlPHUxERtgalZtiuOdTUybVFBjZmWJ/cx1xBAnJB0zg7V04aqyeRHBibBq
	 GkU5xCjkEJpBU2Ye1fVnkf+xvOJtk8oAE+WAqvR1oJqur+Bux3BMYlMZ1ctBSbb36zrr2
	 cpBKad8Z4LsprC/KgSymzcQIceO2r2EPuKqN2Vb5HGz0KDs8g+qOlB5bYmFfQ7q619A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130087;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+KONPuU6dvg7JTw64HxTNQ2hBKKD3JbJh95IGzJtOsQ=;
	b=ACCKtKAOxhxe8GB99JDo2CJUZio7V5WziLG7CnML5+/WGXmpUrj90PZn2a38ysv0yuAL
	 nDsAFU7ZBl19SHo5ET77qbzwPMo7+cm/9uMhUkffPiHvxoy7J+7evzZDQ7uuUEAHoXhdc
	 ax4uRMLyga4MCiqQEA6ESz5j+yW4WURoQw08m1r1XkjGXGDPbJOUHb/1olNI/4L8dmay2
	 0y7JoQHrL0Wy9xoBEZ3ujtdscneYHc0LF4g6qVoImr7w85p37sjB0k8Mx+PPpz4REEnCa
	 60aFp8KPQq5UOkhUScp4bRJXqoDvTFcKjY74sUXoAp4Jvvtnof9Qa5ZD/0qTNLGZVlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130087;
	bh=+KONPuU6dvg7JTw64HxTNQ2hBKKD3JbJh95IGzJtOsQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BXyQkfjDjJmB5ok7rVAh/Ao6iuSUYs76V5O/3RPomSWWY+/0O2k5lNzANbUzAUrTJ
	 AMYa543PKZ5ChdNN0eRd6lS08s/dvsOH6CQJkWvjw3FFESsLJB0ZVbk8nhkIXYWf4/
	 p7BW6SphOr3l2waPqCyyI82at5Zvzms9UA6ICmlAOpgNr6OeozdIIitAeSkZPhXNum
	 bKbhi9KSknGyAdXtNNnNbyvkVx7Edvywjvn4tjhSSQqQImsJfsNtTeUx1FEYWy3gF+
	 DlESEBKzVKFzx5FCyYP3PTK6WqsxglDvhkD0q2rT6UO6i9mlpOVXP6gT2HcRj5MgN/
	 qSywQwEs4Zjjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A2A606F6;
	Sun,  4 Oct 2026 16:08:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F6D5435
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A75D60664
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXQ0cPP_3_xv for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 73C46606DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=PFaORQN7qB5WDGDVA2ebtfZd75aIsloCA1/LY/tMroWsjlwU0eI1/BkkTRK0XMFpkwCg
 jcmE2Me+LsZLNLfVd1mljm5JeGevQEm6dpcIueVtSXr5wupvRqImrVNeP1b/mrZ2rvgN3
 IKoqfXlAQ54Tbkbeh7hiiHA0Qb92XjLtfUuNXju+e0hjrlp4Ssq+nzoAvnVyWXuygdbe3
 2O7DSNdSFIzbGJOSyWhYo40uswnM0fP1kpDzYuHGBaB20BZWaoMZsrlfH50DG71gnFk5N
 yf6BHE0SjyWT555EgLjbTI8NoLJ1s19lxSTndkkm1nkBFnZwkBnBQ1FV7+Rlt89sP7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=60c9RABf0dn+4/ne2E5KmseJ6YzAJ0Un/WrG7/6kY54=;
 b=kxs+DROqA6LC+SezDXyw6mO8TVsvRhBUvnkIPVbsTJTvRC9HLcjmJo1xhcSI9tF8pTiR
 w3uV8NBtW8F8vYt4XbUfGwF+ZyeAa0gJASt/99xolvwi15TKsrNJbVJRVH5e5apK8qv5Z
 TaI2yo4bM0+ETBfu+AmeW6xDTD+Q4UabgRC4NmcD1EVgozXfZDfKKpHkLaguZjw6zeDBD
 uZ0ND1uge/TELE/X1Wud0cMb5Axv3hYMPfup5fG+k/d7Bk62LpbCW++eA32vLjpk8I4en
 /xKILVopjflhOym2EXE9TOSmE9rD3LJOoUSaxKkqfgZarR8qbiGBYDs+uCgjC8SZ+Ww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73C46606DE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B60E8D22E; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:03:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd7096fbbdd7cf3bfc181d1c0c7bba779e0d259c
X-Git-Newrev: a398dc7a543f7d099911b227a28bc4e0c3577423
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.2B60E8D22E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml: bump to
 version 0.19.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a398dc7a543f7d099911b227a28bc4e0c3577423
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://sourceforge.net/p/ruamel-yaml/code/ci/6846cf136e775ed0052cdef6ff02330269c86011/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 5f7c758070..732182a146 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel-yaml/json
-md5  6966b2f273bdb08cf679f521fa0da4c2  ruamel_yaml-0.19.0.tar.gz
-sha256  ff19233e1eb3e9301e7a3d437847713e361a80faace167639327efbe8c0e5f95  ruamel_yaml-0.19.0.tar.gz
+md5  705372657890e1641fd7b5d07cc1f615  ruamel_yaml-0.19.1.tar.gz
+sha256  53eb66cd27849eff968ebf8f0bf61f46cdac2da1d1f3576dd4ccee9b25c31993  ruamel_yaml-0.19.1.tar.gz
 # Locally computed sha256 checksums
-sha256  0ce9ad6a9d4f0829296a72c77d07795dd67f42751e2922be56c051d39ae1c011  LICENSE
+sha256  3e7632bb0dc1150f15f8161f5eec48dec8a99aaa1dfc9e8f63c02931e0fba7f8  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index b1f7a3e039..33f66f7bc9 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.19.0
+PYTHON_RUAMEL_YAML_VERSION = 0.19.1
 PYTHON_RUAMEL_YAML_SOURCE = ruamel_yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/0c/5d/8a1de57b5a11245c61c906d422cd1e66b6778e134a1c68823a451be5759c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/c7/3b/ebda527b56beb90cb7652cb1c7e4f91f48649fbcd8d2eb2fb6e77cd3329b
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
