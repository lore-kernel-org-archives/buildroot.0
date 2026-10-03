Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EB5CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA364411E8;
	Sat,  3 Oct 2026 10:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kl6aT14Jkqgb; Sat,  3 Oct 2026 10:07:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A3EB3411F7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022074;
	b=EI96Zfb9taMCN3QNyabQhHuQ+9Ng2/yjh+f66veMnXTEizJIz6MycKleD2ZrTrqLGQ9a
	 ykmN7Dq/1hH6p4Wm+4Mr/dztKRzS35qF0I0zeTt9C3ZrWOCNRIAIe4Wsj9/1KKF4CVXwS
	 CcgQvyhLstSz02eP+IwLlczMgq55vy8XIEMTnSvvf/17Bi22A6D1B3IhNQgcBiyJQ5Hpp
	 zPLl0Ua/NOdR079yDSCQuBhKMEJuqPmicW+MGzg3QDdqop7TAiceC3LKMxb+N6LZL95CH
	 bYFmOIRlo5uNQVHb5+GaEb6rCUdPgBH24KrDj4OgljhYLxr4TS617kWQDIQ8aroJBWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RMeCqE058qVKGmfi3or7wLXnfAMAuTZjNlLnDGoRHmU=;
	b=crO7xJV+jyg420DiXFkfQQIK4KuJw8Z+Q6O/cPJ8E9sQrXvd/DfEhUWGSo+EtTe6qVF5
	 fVf2F4/gtwBYkk72MFwW/IyhU/a+DRLitiGC2F65HwoAMvfjO0i62ZoTHmYyJyeMzFyXq
	 KUi0NkWsl7d537DmGU1zlYth5XmZiZDaeTTCY25kz1ohh50NI8KGT2km3G1D/U6kutJ2z
	 NyEiVapFKOKZI8uk89PNvV0VJAIfZw6Bq+RIQ23rIZKePNt97ybkFSQn3H75TYjw87Rqz
	 j6BSHyM/bwYSZdjY6u8SfxP2FnN9fKw2P1iDoXCx/Y58po5gkBO2dBHhvh0L3uYbyGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022074;
	bh=RMeCqE058qVKGmfi3or7wLXnfAMAuTZjNlLnDGoRHmU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bFKKhXtJ4/xBJ9w6DdiEtFBtAGepRST1P991O/7JyQ2earAVa2yIAj3qwmrme7KIh
	 CfOXQjWDgVI85FA7A2xgLq6uWMW9MvS0n/6Dt9rP8RdKMrXBYs3wc5Rgfm0rCNOsDt
	 Q1I4pSPVns83vAGo3fy85CDroUJLtZhCVIlbtZ6RiqgHkkIf2EsSinfhGnEm/B1pSk
	 c0079atZR0GYndfx0MQKUCuDgOFGQT1KjrwC4cTgCBPQ1aQ+qzXo0FYoi5sok7lHj/
	 3vbLrkrZGmMgIQuqOUz+q14NKnf6g34dXAsmS2k34urep9kQHX4XH8lHe/poc6i+NU
	 sgjRl9BDfFE2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3EB3411F7;
	Sat,  3 Oct 2026 10:07:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ABAA476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 297CC60E7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_iAuYQtGxEC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CEAC460E87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=Zdu1aULi46zIPW1c0Twawg8b6ro4w7mXjwz+3IKo+YYIY8ZEjtwfzEEbiXROhc0hxcl3
 OLmHVcKdyJuQyLjbzWXU5RyuFdbHHcW7CZQ2GLriHe90zpY6aA/kR4SeAXpO5MoI/0Af3
 W6kVc6a/f/PefrET33Ig4ltWj3VoLQ46kXPs4s+/im+Fj3Ow705Lw3qR5pqSC68EAWnqJ
 6P7f/Nxr/JBmjRhwX0CW+EWQG9SxppfHb19EkqI7mNzbXVGTWSxGQJdop3cIN6FZhluKr
 J7W/EM2Gz2tvC4KMnKlhnBq+1yUXLgLGBNIP03ezspQUJKDG5mrWmlTJF3X/W//FL8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KlaL0fMOaG//GUQxiZtW5MSMPKBaVvuczzxagIsn7BI=;
 b=TNrLtO999K8GzJISfOvdr27ownNk4yusXKsmcCjY6IhDp1ahQl595R455oUHKmY/WmGI
 egp7D0MDNWLDg+ppPqJjXRpA9HATljF+XfA4j0efG+V3rZcKHYAePLzF6KqZlWiKq1G4K
 h7xpMqxbyUi7cxdTYxw90cnCvyWA4r0z5+f0CyW2gYLEH21En+JbcxYoc0fNNx3FVikFt
 wtQ9EnPs8O0aECeDkOQYIG6ENWQlcSCXqLvjkiCWUtn8xvPrlH//jKk/ZEarINAJw1jI7
 zJEaYnPu7jiwdpVPnGXUGgTJDDY5tL7fX14+xVNr8rZ2j+rMQnk/Ya94lOprG9Y/DdQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEAC460E87
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38ED78875A; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4bb4d8cd854eedea47920b92b236e2cf610e131
X-Git-Newrev: ca1487188857755f87caf47d039b2763d8fa2a3a
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.38ED78875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gunicorn: bump to version
 26.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca1487188857755f87caf47d039b2763d8fa2a3a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/benoitc/gunicorn/commit/95b7ffeeaa75612d24d873f3fedb733c1a51b09a

Drop the no longer required python-packaging runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gunicorn/Config.in            | 1 -
 package/python-gunicorn/python-gunicorn.hash | 6 +++---
 package/python-gunicorn/python-gunicorn.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index a670dd4814..76c3338999 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
-	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index 5639697c51..7e78324243 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gunicorn/json
-md5  18b666db62a890579170639961c5b064  gunicorn-23.0.0.tar.gz
-sha256  f014447a0101dc57e294f6c18ca6b40227a4c90e9bdb586042628030cba004ec  gunicorn-23.0.0.tar.gz
+md5  c7a1a922dbf9bf8bc4fe6df851cb8272  gunicorn-26.2.0.tar.gz
+sha256  62b864895d9ebff0b2f9867ba04fe811c93121596540830c9c916d0769668447  gunicorn-26.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6646cdbba2e99e3421dd18c22173579a1fde347e831dae6adee80eefe331e951  LICENSE
+sha256  1457e30a8f71334f34f241b9f267e7f5556544937bc2c1751bc58b52250c0543  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index 8e3b87fd51..909806c087 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 23.0.0
+PYTHON_GUNICORN_VERSION = 26.2.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/34/72/9614c465dc206155d93eff0ca20d42e1e35afc533971379482de953521a4
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/d9/8a/e4ef6ee11701b6cd64702848415ffb69eeff85cb388a3c6c7fe86f22f3f8
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
