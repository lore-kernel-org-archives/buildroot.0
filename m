Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FF7CA0EED
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1592C61B23;
	Sun, 24 Aug 2025 21:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aMlLaWsxF8S; Sun, 24 Aug 2025 21:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FCE61B21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37FCE61B21;
	Sun, 24 Aug 2025 21:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EE86CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 21:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809DD41CB4
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 21:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikx2Rm-xMjnO for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 21:25:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 540B741CC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 540B741CC2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 540B741CC2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 21:25:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b618e067eso270385e9.1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756070705; x=1756675505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Svl0jk8r4HTlnjVoLmE7DV2HCNGC8o7Xb817E0OvHOY=;
 b=Ytx/UUukWyy0/RyPKHiR4vmgmTjbBNi9MTvOx2YjP0PpQOjWFqTZJcHBh/dJH+967e
 usIxYp+hP7yMYOGq6gByyuOFTqP5Mf3iiMvkdAH4tC0UnzghlsU2g43Snj9G1Jh4Hsbo
 yeZF7ntgxxp76CI/iai86ZPdMlHkvuNuy4jbfTKgn4FgbRmE9yfbpsFj/zf8bjam+RVZ
 IIJXIXG5CtoHzuJnwt5ddLuDkTkEM0TKLNemppUKn2RiI4oBYEPLxxVpvhD4EiFtcr44
 xyPRv+ChAxYpDUvFdQzjxaLIsB9G7JLm5sf8FW2Btp81er/ElexvkGJ+NqCZITRhvE4y
 MvAw==
X-Gm-Message-State: AOJu0YyxB0q/5v4Jwa83Xik8UgsrpJ9FvD9HNMBA28TVSINIMshT+gLx
 VoBT8uwxCcytQ8wl43eDDHZA/+V6sm1bELVnNJwMBRMNCEVDwn0RUtvX+kSD7jwp+PwCQWkEHLo
 dqWXp
X-Gm-Gg: ASbGncv1Iqtj1rFFFx1eZrQI9nsdlEUGG0vnVYx5hGU9VvJZf3L93Dy//anUOf1R5LI
 KQ9qmuIXjWUNcm4meVOsWXXUFLhLBR6yoXeAnClVZQnyenrfxmHcDNRrVolEF6GLWpckm+Zl3vH
 CBzxeyWEuAvFoNcfRYOp7BtjpPfg3tr7NphU12WR5IrLrqulj6v2Cxw8n/bCtA0owJLufZcdvR9
 jD8FumMav1ZdU+9RMJk8Y6evPtZasLmHQUVNpremrUQLjnkd7Xwez2RWjWH0ds5bHe8yNtdADa3
 f2Ek3LqikvdYqnwGLhWor4pfqQxHenjSm1Ea+1C9fsalhqfea4uqvZom9SD+r+ngtvERFpdodUp
 y/UoAx8sXcKNg2uAOk9Blc6oMo4c3NRYVGQck4uA1PNonqYtq2ITdHDPUdfvlOBCGyJoYfV0v9J
 be6dAtu6h4kUqpdfCOfyz1
X-Google-Smtp-Source: AGHT+IFDUcrFB/hFVZ81c7OLy3d20vO/IJiqfvacRnUIApYNlCIAqC2j55onXjBwvglSauwIE+ebJA==
X-Received: by 2002:a5d:5f85:0:b0:3c6:c737:d39f with SMTP id
 ffacd0b85a97d-3c6c737dd05mr5437184f8f.3.1756070705075; 
 Sun, 24 Aug 2025 14:25:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7119c4080sm8738975f8f.54.2025.08.24.14.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 14:25:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 24 Aug 2025 23:25:02 +0200
Message-ID: <20250824212502.4134787-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756070705; x=1756675505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Svl0jk8r4HTlnjVoLmE7DV2HCNGC8o7Xb817E0OvHOY=;
 b=dKVCfjo6IKHt5geriX6sx4V3u57AyAVtymtefd/5Y/oILb1a1p/0UKPjr6UMIsSHuH
 fJPWdLK88zfPOSVsJxCtEgUTBd0hmWD4ZnQaHuCV6R3uCd5LMXeZRuNx1wLlmuzelK65
 YycJo0OtHg30T6otBnzQHJYzO2ovSTt3wd9NU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=dKVCfjo6
Subject: [Buildroot] [PATCH] package/python-aexpect: backport Python 3.13
 port
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The module pipes is no longer part of the Python standard library. It
was removed in Python 3.13 after being deprecated in Python 3.11. The
last version of Python that provided the pipes module was Python 3.12.

A new 1.8.0 version that include this patch has just been released few
weeks ago [1].

[1] https://github.com/avocado-framework/aexpect/releases/tag/1.8.0

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294894 (TestPythonPy3Aexpect)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0001-Drop-the-use-of-pipes.patch          | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/python-aexpect/0001-Drop-the-use-of-pipes.patch

diff --git a/package/python-aexpect/0001-Drop-the-use-of-pipes.patch b/package/python-aexpect/0001-Drop-the-use-of-pipes.patch
new file mode 100644
index 0000000000..a952ddc8fb
--- /dev/null
+++ b/package/python-aexpect/0001-Drop-the-use-of-pipes.patch
@@ -0,0 +1,70 @@
+From 3753ad491bf5847a11a7f4baf3ecaa490e0e9111 Mon Sep 17 00:00:00 2001
+From: Xu Han <xuhan@redhat.com>
+Date: Wed, 31 Jan 2024 14:57:37 +0800
+Subject: [PATCH] Drop the use of pipes
+
+`pipes` was deprecated since version 3.11 so let's replace the use
+of that module with the alternatives.
+
+Signed-off-by: Xu Han <xuhan@redhat.com>
+Upstream: https://github.com/avocado-framework/aexpect/commit/f2b888b1bd453a46820d38b62fd2b5db1228e4b7
+[Romain: backport to 1.7.0]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ aexpect/remote.py | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/aexpect/remote.py b/aexpect/remote.py
+index d7e09ec..2bfd92a 100644
+--- a/aexpect/remote.py
++++ b/aexpect/remote.py
+@@ -47,7 +47,7 @@ import logging
+ import time
+ import re
+ import os
+-import pipes
++import shlex
+ 
+ from aexpect.client import Expect
+ from aexpect.client import RemoteSession
+@@ -217,8 +217,8 @@ def quote_path(path):
+     :return: Shell escaped version
+     """
+     if isinstance(path, list):
+-        return ' '.join(map(pipes.quote, path))
+-    return pipes.quote(path)
++        return ' '.join(map(shlex.quote, path))
++    return shlex.quote(path)
+ 
+ 
+ def handle_prompts(session, username, password, prompt=PROMPT_LINUX,
+@@ -621,7 +621,7 @@ def scp_to_remote(host, port, username, password, local_path, remote_path,
+                 r"-o StrictHostKeyChecking=no "
+                 fr"-o PreferredAuthentications=password {limit} "
+                 fr"-P {port} {quote_path(local_path)} {username}@\[{host}\]:"
+-                fr"{pipes.quote(remote_path)}")
++                fr"{shlex.quote(remote_path)}")
+     password_list = [password]
+     return remote_scp(command, password_list,
+                       log_filename, log_function, timeout)
+@@ -664,7 +664,7 @@ def scp_from_remote(host, port, username, password, remote_path, local_path,
+                 r"-o StrictHostKeyChecking=no "
+                 fr"-o PreferredAuthentications=password {limit} "
+                 fr"-P {port} {username}@\[{host}\]:{quote_path(remote_path)} "
+-                fr"{pipes.quote(local_path)}")
++                fr"{shlex.quote(local_path)}")
+     password_list = [password]
+     remote_scp(command, password_list,
+                log_filename, log_function, timeout)
+@@ -717,7 +717,7 @@ def scp_between_remotes(src, dst, port, s_passwd, d_passwd, s_name, d_name,
+                 r"-o StrictHostKeyChecking=no "
+                 fr"-o PreferredAuthentications=password {limit} -P {port}"
+                 fr" {s_name}@\[{src}\]:{quote_path(s_path)} {d_name}@\[{dst}\]"
+-                fr":{pipes.quote(d_path)}")
++                fr":{shlex.quote(d_path)}")
+     password_list = [s_passwd, d_passwd]
+     return remote_scp(command, password_list,
+                       log_filename, log_function, timeout)
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
