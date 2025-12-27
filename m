Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44D9E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80DCC6067B;
	Sat, 27 Dec 2025 15:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKOPt6ahNk-Y; Sat, 27 Dec 2025 15:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D812606DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766848763;
	bh=+7xF744I7O/VpAbNNbuCN0Cau69zPv/GiAUcRICpq3M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Fgsnx6ygbAUQhgJ8M2lzrmMw9IAv4nAsvKgrpYMstDeI1/D0ywucR9zxDF/6KnFy2
	 NCH1ZDORo/IlQv4ytCY2jUE+apYmtDPB5fPAdLvGtQDugGwyRjKC9J2UXK3arct3Qb
	 dQoWyDqgDNm+UUM64yp0/ZS6SWNRak2r562iq1LoH1NX0LsQM6v4bXyA7yvTS+GaZ+
	 VK19NfkIX5KLIVYrwAghy37uDs/0+2T77eMY7P/Og2HQHMFXcBhC4kRiN0aQsHW6Uj
	 LJGxQK7LZff3S72jVnF9keOk3RDBPuy2rdAivuqp/gvXxUESCPnwXwvKjtLk175z8T
	 pC2STkOotvcCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D812606DF;
	Sat, 27 Dec 2025 15:19:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B084D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B8980F1F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73KgsxZtrecI for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:19:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF53F80E7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF53F80E7F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF53F80E7F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:19:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso76488725e9.3
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 07:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766848758; x=1767453558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5O5P5XQH7BaUB5y43p26JZELK5q/Mjm9rwSvkL2gXY=;
 b=p2mvpZpQgNDuaHmCezKjvd+igPGoqbD/4pDexqFIaYNd2ID7oZy4UR6yH9G3oMqog9
 VvmOVX26Hv2E7vZH53tz9HcnKTv8nPYoDQVpLMWObDLFotkZUZbR5Dn+ByTyV1tXYvIm
 vYoEQy6lU1hyzFJwKFx6xfTQ0RXlcRW9RrLu9X2D9+1zN+yVsXh44suw6dj2c6xVJXLx
 lXzPnZurbOxDjwhLQA4zJ4FkEgh9fnyy71HDNzU9AtpHUIIT/SJgxC1j5DRGuEFS/omY
 CvoUtpxThBcIB+S1x+Uc6XJHOf2CPeFC6whjyxQTFQC56OlWlCXT+IGt7NWjdagoH00z
 6euw==
X-Gm-Message-State: AOJu0YwqqSsIo1VAoXxTS0shiSGMlB1m0nH+qOOnS/yncei5K3Yail1l
 0YZm51TJnSwI/5uPo9j1rBuY75ZW7sLaWKZY8v9MvKekY8yr8VwnOP9+HR2tkXrlDVwVZDxh1iz
 83jLhC18=
X-Gm-Gg: AY/fxX6gCcizu9T0L9QjImiT8f1rLArtTfM9kU26fw0rrEkQsxvwWhWEDGZlNM/fYsD
 wYk06UPGPvB7P+llJiIdEJBIlHHe82zPJzRlFp/IstwB0xHa8tn0LRm2s9WFtOMMaOnXCuQh3RK
 hvYrLRJ+HMVv7lPqjVW3jp/cCDPlArkoTp6FHANd3dU2e9z356MopHDS8ugcU6zya8/fdp58mYo
 En7ZBPtMmL1xVtYb3eoMYKdQuGLauKbzFRrE3xl/hQY5yF4dUGNfk2ckgTAGqT4mM3k3P5getdG
 fkpST/zqEuFP3ak7d0MBR15uFft92IQetacSwj0iKcw5m5ZKA8FEsjhIBb0NFGrrQlxT7WhMdLA
 CieP6QS3v7JW+piBAHf7WvdQFWMaURxsQFYojvtGh/dj01fNQYL1xCl7v/CaQ3ehgZpjIACPBDo
 D/vaLs3vhnJ7V61njSL0oui0yZjdmlkILaYMwjLinyS03dWGda09+zRtDcSS2vL6mt1tLp+NRO
X-Google-Smtp-Source: AGHT+IH7mVMzTSa5KRjhVGckC1vATJEljqpisdSw+S1iCe6Tfff/Ya3yKFgmgOGfaoatDMHTHtCNzQ==
X-Received: by 2002:a05:600c:608e:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-47d1956ec9dmr297435675e9.5.1766848757839; 
 Sat, 27 Dec 2025 07:19:17 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b1bdsm50664087f8f.8.2025.12.27.07.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 07:19:17 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:19:15 +0100
Message-ID: <20251227151915.225508-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766848758; x=1767453558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C5O5P5XQH7BaUB5y43p26JZELK5q/Mjm9rwSvkL2gXY=;
 b=L7ikWhr9SqYNeTHdVcPDtdbqIbSGixfPAZ+s1+OvtocI7/UmONA5tgspn5qVYEBS17
 ECLSBn7MDjUoQvsPPEg7N1jmbr0QUiYPVSSGBHtz0gl9+Xkyv3DMN1eel1+IN8lOguE1
 GUCMyBP0rWszdBGuKKEC2VQ41LTFVhTUQDvRvpVUQD8X/mmPKKqqfdmgdngF1xD6mS1s
 iT3l45mvCSuI2dEJvq/Y8SeZZcTTJqlxvwJ8aQ0RPyL/xIoKmCQMaNiUQ3rq786LfLcL
 fwWZccxnBekr3z9E/p7WBHgiULJuxBS2n5ppuG/8vVNWPb/n9I+cEC8KFEq3x2tfka+g
 R8dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L7ikWhr9
Subject: [Buildroot] [2025.02.x,
 PATCH] package/python-filelock: fix CVE-2025-68146
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

- CVE-2025-68146

A Time-of-Check-Time-of-Use (TOCTOU) race condition allows local
attackers to corrupt or truncate arbitrary user files through symlink
attacks.

For more informations, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-68146
  - https://github.com/tox-dev/filelock/commit/18a99880087934252e7c0c994640f66e80e34be9

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-vulnerability-in-lock-file-creation.patch | 27 +++++++++++++++++++
 package/python-filelock/python-filelock.mk    |  3 +++
 2 files changed, 30 insertions(+)
 create mode 100644 package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch

diff --git a/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch b/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
new file mode 100644
index 0000000000..a1656e1fa1
--- /dev/null
+++ b/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
@@ -0,0 +1,27 @@
+From 4724d7f8c3393ec1f048c93933e6e3e6ec321f0e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Mon, 15 Dec 2025 15:52:12 -0800
+Subject: [PATCH] Fix TOCTOU symlink vulnerability in lock file creation (#461)
+
+CVE: CVE-2025-68146
+Upstream: https://github.com/tox-dev/filelock/commit/4724d7f8c3393ec1f048c93933e6e3e6ec321f0e
+[thomas: Dropped the windows part of the patch]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/filelock/_unix.py    |  2 +-
+ src/filelock/_windows.py | 38 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 1 deletion(-)
+
+diff --git a/src/filelock/_unix.py b/src/filelock/_unix.py
+index b2fd0f33..25cbeca6 100644
+--- a/src/filelock/_unix.py
++++ b/src/filelock/_unix.py
+@@ -38,7 +38,7 @@ class UnixFileLock(BaseFileLock):
+ 
+         def _acquire(self) -> None:
+             ensure_directory_exists(self.lock_file)
+-            open_flags = os.O_RDWR | os.O_TRUNC
++            open_flags = os.O_RDWR | os.O_TRUNC | os.O_NOFOLLOW
+             if not Path(self.lock_file).exists():
+                 open_flags |= os.O_CREAT
+             fd = os.open(self.lock_file, open_flags, self._context.mode)
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 44599ee865..48025d8345 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -12,4 +12,7 @@ PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
 PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
 
+# 0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
+PYTHON_FILELOCK_IGNORE_CVES += CVE-2025-68146
+
 $(eval $(python-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
