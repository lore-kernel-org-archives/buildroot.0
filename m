Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA99ECA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B707960E2D;
	Sat,  3 Oct 2026 08:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBRorr53oDsi; Sat,  3 Oct 2026 08:46:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C93CA60DEB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017187;
	b=jJW9WSe+CaWo1dKSSJdZHSBDPM5KKNwYXepnJoLAIzaIj1qHxXD+PceTIIse1UApvytX
	 U5cDdHaLdxPBogtjKVlqJtvCzRsJP+a594JGeLUDsPJZx98InAm8uQjFshzJKIvR7OPrm
	 H2eSg/nkfUpic0A0tc2OifsGknXXv/+N/A5XS5m7C03PzKL1h5nLGABehLs9aRntOBEH3
	 rEq4yTqiPs2FbORAxuX5tzQYFnmFMXmW3E4ZZbXo7q6FXwqTATa0i32fwkofPNhtdD6LF
	 d3lMrOzJuelI4FG4J7LYHiufF75u4PXrVBJAxbOEQXfnqdntZRcJ2G1OpV2c+gc3C/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NPw/dp/GxKJSgv9C/uDbwhHpNqUKlG2z5okrLkbxnh4=;
	b=lt2FBQKdgHDMsRCxxCZqid+0+yAKH+d8I6TiHLTLfJhlzknMOi+iSUYvd8y1hDI9HlwF
	 jaAQPegq8lHbqqNL4ITxDGaaaDEO6B2Rtr9iS8J6eok8s7IE6N+GFJaAmb9URz1OH4Uef
	 PNVx7UyZv+4lqsgUDkXXp/8r5meKi9kEUcfwFMutmIlX2gvdfTVtVUlnQkDNdSN+tLjhP
	 mf/IYHxLQWfYbRt8oj6g9T3jbXaTh5Eg68XluBcf5AcbBZRgjV4nSAWvdb3koVr6ZZ9Rh
	 cZfV3b/X8C5ud0ulkOpVN+ykUJU8kMAEyGfeVpMQmubbQmUrmk/M5Iq/xu8k1VaZhnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017187;
	bh=NPw/dp/GxKJSgv9C/uDbwhHpNqUKlG2z5okrLkbxnh4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hwUe7KT8Xp5e9Azeq2kASWkFVKZ6+XsN4b0fh8Ptbof97XDsnhLLiHuijxAw5ym35
	 s8wpZw37x8Azwy1vwZI+bLZXTjHniO5P1uMmX06wjzm2qud2HT30awAIqAYLJ8p+TJ
	 bqxY1mLqOKsKTx/y6ERFxhR29sI9C9GPO4kb80PXjXSc91DxUCQXSozigPOvkW4MJN
	 sv/6w3E8z0P2/xNMkt2E94NjwHiuAkGoJ6zqFl5pumRRcptBDehKYKRnEdmbU08PR4
	 GnzblvK5m+a5IRugJNJGCgpbauhyL64Q5imQoaQu+pJYud0M4P4ZTStQt9GJAvK5pM
	 sTM9fT2sVzEYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C93CA60DEB;
	Sat,  3 Oct 2026 08:46:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E15C62E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C880A40070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rUIV4lvbm57 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:46:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E085140059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017166;
 b=G2ifReNIZkqaQ80UYt3NkCGbo4Hl5bj+RTGpekRSqiC6RZuaMSRTzkwLaShrhylQAPtP
 sV88ZAb8fmYlVBYuWitkpJS1UsBGuMs8nBYpm8l6KUhjWLeltrNJObGAZPt/e0z/gPIC2
 Pnd+/+2U+eHu+tN3LcCJAFCUJn2BbYRwlcBJCcbCorhrp3oYVDD+aWcbgZPPryYJ8AMPO
 n+q2iZ40CsfKs6QQ9nRwB2hrYpk4wOIHYs+xlR5xQV/wq+P49FWBSrBPsiEVNvZxGAX8r
 N/PPoGLKMPe7sQyPGZwelf4U3cJa36FkPibVAL/G2jInigZwakxyY9UIWuAoRe6Fr/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017166;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=PlUmBahoU7NBjDIGy1YittB+jYz25JD1Z9GZIV2YWUE=;
 b=BNbTMw4amAV9FlCUvLyEY7ZE3u7pB29iTPLPgjSYL6/Ig3z+Lv9ZGHOzm45+93ZVTgc9
 jvK8yfKa8ie3LJ51CAtCT8cAz4ooaB016xmJpqFclKzn73CpkWux1tGz12ytPdi2f8JVU
 qK7t06uXZzVNr8k+2Cknth5pEUcN0IsYwVIHg3C6P0rvgtweRYAri4Q9LL1SiYtuvAgRv
 HediV1QWDH+daIkMOSHsnS5PbZo+KIKp/mQHt1xtuRhP35XBvkmGVjMxO1MEIST3UkflM
 VxWAdeUnl5wg5nZKbHwIZUdHO3MFnfxAoeVvnbbepFrpF3Cw5xwWAt4lffOR6c4OnVw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=e+PElA92; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=e+PElA92
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E085140059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:05 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-81ae6aefdceso487642a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017164; x=1791621964; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PlUmBahoU7NBjDIGy1YittB+jYz25JD1Z9GZIV2YWUE=;
 b=e+PElA92Hf1Xa85aXgenxZD+nU3iB6ZGShjOQmypd5DaO7r7NDgprYM883PEBO7o1M
 1FpnnreKtkqRJyfYjitalXZqcwO9TT4eV8KXdp9ITS/Pklls22zSw3aOJ5TlG6Sgw3po
 O8H210m2PqH2EN0jPW+3HotJOIETh5pH5Ry1RPxAk6aD/0VwizGtwHXlgbPbjZOSjQ8A
 zyRGYxj1HJP+oOoFfpkxKXuTDtPUx5LWPR5bYf//LC88+C5HRcm46kHifZvpUjg97Yr2
 M0JZVEk+cEpy5p0oZZodn42eHjLdU5Pl70Gfso3hOTGPhyRDWZvdxXkzxhw5oWy61egX
 PHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017164; x=1791621964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PlUmBahoU7NBjDIGy1YittB+jYz25JD1Z9GZIV2YWUE=;
 b=RwwcuxKcqcZVD3MB6fqg/iC0L/6XVLBR2FQCiVV9Eg/DGZbOJrpOAkYJuNZkFXKo0y
 fkfx6ZaEZrtSJVywLy/PeWlFgfznsKFg53qH4W8Rkt7Za3e+FrmBkEM9JaHTHVYwVNI6
 K5WFi0pyMAAiE+K2pp+CjRy5jbVKmMEeV074rvLkFK8+WSm2CZjQN7aDcY3mLhhbGeiJ
 xzlGLc/xvfiS0c2U4kGO8MSrrNHfuIPxln2KJuxNyq/oJDcWxMUVCd00j6+A3E7FkflK
 QxqSW1S5nyg+V2aUdB8FCBYblHEewHuOk1iIepOMh1pciSfQd+jiirmAthS8Ybh2DJJt
 1sFw==
X-Gm-Message-State: AFuF++mtLUQuJo+YOsXyxR0+bxysz8aojYRT9jyMhB5S/fxjjQgIoCRV
 RNryqJEPFrL0h3bYPw99KBbb1zCxH58Ef6fdAwPvnJ5i1qNWwNcEdX58GhJT1Q==
X-Gm-Gg: AYBFou0DdPfgvwQDli7JAitkXbfHOyhToyWGqbxVOdVdKA/PVyRRVg7SiQ8w6FIpUP/
 83OzEs5zxd8qbATLev6kBUN1tcnfdJYxj4xBNTs4QRGFpsaPuVYnKquljaq/gJD2ysiIzEgtX9C
 FFD64I+6YL74QmBgS7WPlSNKMYZGIc3qkI2UByxa5rIDnDj01QWS+cw7ADY2t+nMJoMAZCOvLU/
 4isFja3mN97MDEJncstX0m/0hTVQ6ePsqGasPZB72Zc88Oz+Vk3OB13DQmWCl/cfPg/41NnwRjs
 JprwHdKiai5mv7yfKLHaAzf+/eyuWJvvwwukwfuEdXEZZY9bKw5OZ3O0cFQaxMHULthN8bzLE/D
 kXaGh2CrEyg+p0u7BD9HIkV5KXkBuOsGL9PaLmdOiQgjrKD3IgMmeGnF6m5pHAIMokWN6dzXO7Y
 mxmMiHNQiPBwuY0PX2U7eVOttlrHJ5b+kaKO9Sg1/wyjUtNkTglOMRzNaxBNM9Jm/OKqXIc1DOF
 HyfqdXNyKev/dJo4A5+KqjtQMfeMMSBsRkTcSs2GaB54ZSdLZsaKxwNXP+AZ4FyZ/oa+xjSC1Uj
 kkDmOQXoSMFEISLsHb64qkhExZCYu3v/VT86A3Z5ulCPgFwcFlX475HddI+0OWdWuwfz9sP2HwA
 wJL8tMAbwkm0APvTwCOYG4TGcpBvpuoMhh+hKtU3vCln4QGV7hnP+
X-Received: by 2002:a05:6830:67c5:b0:823:e626:27c1 with SMTP id
 46e09a7af769-823fc440a00mr2221883a34.10.1791017164477; 
 Sat, 03 Oct 2026 01:46:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:46:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  3 Oct 2026 02:44:21 -0600
Message-ID: <20261003084453.545653-36-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/supervisor: bump to version 4.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop the no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/supervisor/Config.in       | 1 -
 package/supervisor/supervisor.hash | 2 +-
 package/supervisor/supervisor.mk   | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 8ba19dc000..370ffd0f97 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
 	  A client/server system that allows its users to control a
 	  number of processes on UNIX-like operating systems.
diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index a61afc4410..43e6fea2e3 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed3ebc12  supervisor-4.2.5.tar.gz
+sha256  4a2bf149adf42997e1bb44b70c43b613275ec9852c3edacca86a9166b27e945e  supervisor-4.3.0.tar.gz
 sha256  4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index eb2a4990b7..7d6eef0cef 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 4.2.5
-SUPERVISOR_SITE = https://files.pythonhosted.org/packages/ce/37/517989b05849dd6eaa76c148f24517544704895830a50289cbbf53c7efb9
+SUPERVISOR_VERSION = 4.3.0
+SUPERVISOR_SITE = https://files.pythonhosted.org/packages/a9/b5/37e7a3706de436a8a2d75334711dad1afb4ddffab09f25e31d89e467542f
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
 SUPERVISOR_CPE_ID_VENDOR = supervisord
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
