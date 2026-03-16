Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1678CF53D69
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 15:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F8E607E7;
	Mon, 16 Mar 2026 15:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPsBYcq8prLe; Mon, 16 Mar 2026 15:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD1A607D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773673988;
	bh=irjW81TCZD9u/BpsmY7JpnGSPTnMpupHs70Qn49zycI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WDGs5sAtEdN+yMtDmMKp6CD8RFxCFrLJY1EXb1h4WoIMnpavPahUUUd1uLz/xZkq1
	 kSA0cPmLh3Xg6AOljL8aYzmdJWlD262wWF0otz0Psqpm6NLWxKLOy22uACaeNVSY0K
	 +i5LXbeqOFpKI7bz4f0GLBI6Vxx+5Hdzg6m5T9umGS/KVZ1MX1PYDeM4wvnGgXrVU3
	 WZhYASFmlkzTCjNP6pCTEiYZiRdMB1EVTbVdpYBwcVAVsWeNmkYRGVX3FuwDwYUCfU
	 f6V6/nAmIZNpZdxjH7BWSsADQ85kvuL9UTn4VMBHnFDVm7f0V9pbYRiYMWOKmJQkaz
	 2o1aSkCgf3X5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD1A607D4;
	Mon, 16 Mar 2026 15:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79186D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AF468148D
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 15:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWEhrkajeyhR for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 15:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2AEA81498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2AEA81498
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2AEA81498
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 15:13:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so27034585e9.0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773673983; x=1774278783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZNoFA2nppwa41m1zCdv9qVwpm15XdbyTkmA7nUcuvSc=;
 b=hqiw5ZFS3gJYawWTHM580LDq04e3WUjAgDV+QPDQwo+YcGsnwkPv9xvxink1hHuomV
 hjLdsfXl9P3tSMbb4rMT5yjNWP0gSNvVE6fv4tqxjwd5useurWHXOry+f+uRbhIcuZ+W
 EztkQwHSEjHRKYc0gGanSVojCErjKO9muf0Q1ABV634kyXZXz8I5JxHNaHIhcY4azVbQ
 0jMjz8ujlST+VySuD23SsKTbNVB4HwkSWnJDRgLdiXtfhkt/2f0vXzku4gRmJlUI/s8x
 +KmxAZqk6077AUmZp0BwZweJpt60u+CZB8ifLb0WYLj8PmWQqhDgFOV80yn7UBU1ijgv
 E9LA==
X-Gm-Message-State: AOJu0YxX3/dKqlKmhCZxzozHeDPj0WsmI+OZGosjQLa78S/Bc9wEIwdG
 dpyrV7MUGWvzdLEt8C4lExiaSltsTfJiI2p1apF2L8cHpfm4jYSCHWvnCe6n4Jqnyrwc6Ij09ee
 swP06BF0=
X-Gm-Gg: ATEYQzyPJp0we/zJEzrchNSwHS0XK/R5BhPfdFicA0xhAkUeoEsU5mKw3CCexCPcVQ7
 9VCrFiBceAIV1SlG5fGMY6b0M/6dpSt5Je8fUz5PKzqgJEvFKsK/ez5TYr6jt15Qzsqgsr2Naf/
 sf8d2uEhqzdQgtPlalWzM6OJsQX5fMQxAXiBDtn1FjxfctyVM4/XUNOf1yCCajE5eRfBXYl33kl
 uPAE4vIOuro+XNCDNV66rLZ0C64Cb9+6oPxQJ506gS32JgLtqxL138Tf79MpblbixwFkDqTHBtH
 6LIP80n610eSC7zQd5YL9E9IJKbIj0gB4/gq5p9eN+6kNhqWi3jpW/Rq1MhJvLaBLaHuO9hTYzO
 Z00B8BFUzt7URyHj6Y+I6Khp7m2BkxdAA/Fv3lpP3RLw/cpTWxY014VeKPmFDSm0F7MQTF6xApQ
 AAVO+hpi6tQHmlUN8cH0Dr8ZFtvWlXNiCX4y5xRGejLOniQBqw7inkUwGsbofzPUgy0azymFk=
X-Received: by 2002:a05:600c:8b2c:b0:485:4bd1:4c7e with SMTP id
 5b1f17b1804b1-485567148e8mr224191015e9.33.1773673983118; 
 Mon, 16 Mar 2026 08:13:03 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48557784c18sm214490465e9.4.2026.03.16.08.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 08:13:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 16:13:01 +0100
Message-ID: <20260316151301.268215-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316151301.268215-1-thomas.perale@mind.be>
References: <20260316151301.268215-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773673983; x=1774278783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNoFA2nppwa41m1zCdv9qVwpm15XdbyTkmA7nUcuvSc=;
 b=A5UZPgtk4DbC6t3cf2CmCUjE+iiA7YUdoSLoPhhbeYCdjUerEifeDkpowtqe8OQTpM
 8FxkCZm5DAQcmrS15o/Pvf0ugy5SS8iZlEZTOu9gDEAM+dg44XH2aV13yICEdfg5578q
 RLk8xRw+NG88SdtqahVKWij2JmUdnYxydQQAYew+x6GfTer4UKXi09EJUw6wjr/rQRZe
 hiRxzL4bWtwRd6V/i7N4E0uTOIzE6PVoewr3Y/s2xxPBJ78q2uYZpKjY5WwWpLBI5T56
 vi29CKWRCJlh5joxNlcl7JCobrhB3j2GvkYdh4xNFtT4+JNdgk4ZmlQXYdMovfNrWSZN
 zbcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A5UZPgtk
Subject: [Buildroot] [2025.02.x,
 PATCH 2/2] package/python-wheel: patch CVE-2026-24049
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

- CVE-2026-24049:
    wheel is a command line tool for manipulating Python wheel files, as
    defined in PEP 427. In versions 0.40.0 through 0.46.1, the unpack
    function is vulnerable to file permission modification through
    mishandling of file permissions after extraction. The logic blindly
    trusts the filename from the archive header for the chmod operation,
    even though the extraction process itself might have sanitized the
    path. Attackers can craft a malicious wheel file that, when unpacked,
    changes the permissions of critical system files (e.g., /etc/passwd,
    SSH keys, config files), allowing for Privilege Escalation or
    arbitrary code execution by modifying now-writable scripts. This issue
    has been fixed in version 0.46.2.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24049
  - https://github.com/advisories/GHSA-8rrh-rw8j-w5fx

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...d-security-issue-around-wheel-unpack.patch | 35 +++++++++++++++++++
 package/python-wheel/python-wheel.mk          |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch

diff --git a/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch b/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch
new file mode 100644
index 0000000000..8640dfa291
--- /dev/null
+++ b/package/python-wheel/0001-fixed-security-issue-around-wheel-unpack.patch
@@ -0,0 +1,35 @@
+From 7a7d2de96b22a9adf9208afcc9547e1001569fef Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Thu, 22 Jan 2026 01:41:14 +0200
+Subject: [PATCH] Fixed security issue around wheel unpack (#675)
+
+A maliciously crafted wheel could cause the permissions of a file outside the unpack tree to be altered.
+
+CVE: CVE-2026-24049
+Upstream: https://github.com/pypa/wheel/commit/7a7d2de96b22a9adf9208afcc9547e1001569fef.patch
+[thomas: change filename, remove tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/wheel/cli/unpack.py |  4 ++--
+ 3 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/src/wheel/cli/unpack.py b/src/wheel/cli/unpack.py
+index d48840e6e..83dc7423f 100644
+--- a/src/wheel/cli/unpack.py
++++ b/src/wheel/cli/unpack.py
+@@ -19,12 +19,12 @@ def unpack(path: str, dest: str = ".") -> None:
+         destination = Path(dest) / namever
+         print(f"Unpacking to: {destination}...", end="", flush=True)
+         for zinfo in wf.filelist:
+-            wf.extract(zinfo, destination)
++            target_path = Path(wf.extract(zinfo, destination))
+ 
+             # Set permissions to the same values as they were set in the archive
+             # We have to do this manually due to
+             # https://github.com/python/cpython/issues/59999
+             permissions = zinfo.external_attr >> 16 & 0o777
+-            destination.joinpath(zinfo.filename).chmod(permissions)
++            target_path.chmod(permissions)
+ 
+     print("OK")
+
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 417db7c167..ae02d21feb 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -13,4 +13,7 @@ PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
 PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
 PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
 
+# 0001-fixed-security-issue-around-wheel-unpack.patch
+PYTHON_WHEEL_IGNORE_CVES += CVE-2026-24049
+
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
