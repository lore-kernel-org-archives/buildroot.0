Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D767CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A48605CC;
	Tue, 13 Oct 2026 21:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ijruX2sf3ZV; Tue, 13 Oct 2026 21:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A06C606FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791926444;
	b=mKoziI3Hj/cVBT1M425JI0dBGklK+V+FQSNrI87c2NI8sddijJBHvcbrf26Y+CxKcNwy
	 /CwvSsLXh0LX/P+xEwr0QdBtZCizMD6bQexghYeTkiIgajqKJZHYjbJs2boW7QngDemyd
	 38mJYZoGHknQPQOk4HsXgtAEVRg5jO1K2AnFQkwSXbaK00utPTVO1unmTsCketB9BrVjM
	 Ujj4p9NpC9OaPC/pWWMrr9jUwvN2lzDPQAkxZAkFIFrkHovWPFQp4RjFwtXv2bHI0vCVe
	 AKQ9aYGY4FxMWxSHygH4LhWp6nGDQ9xjmZGb8kzDAPoPHXyrXGSFIh+0M7O/i8BfqsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791926444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HFgp65vAt2vIdX/SzRiYSqZqNYtywHf5jiNJWcPuXxc=;
	b=NiAaqSN8add48C/TcinRm/gRDVQDn2O3J5Qgsg5yHRUJYNMxb2y041tGNdMz8NPyh6Wq
	 T19dBM7nu3JgKCkBOYwM883vNdUGPNLLwYNUqFs42pAsgOawtAa25SRGSfHN7LCXwf8y+
	 3A5yvnqHYlH3YjxJlwJkhDLdxkQwiJxeVietmA+JCYQ+9oSjVNh2r9G0pttMEjikfOQsS
	 RU75qzA4SieLEENhU4kUfk9l01zvp0dCpckuR06+eAysiY2F7GPQ3kCi2bEXYBrFtEzC+
	 en5+PFyrJwuk/9FJ9iOYT2REr0fjN9zukrXTkwpcqkvvmsfVG8nWWHcoHdxIyv9SxQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791926444;
	bh=HFgp65vAt2vIdX/SzRiYSqZqNYtywHf5jiNJWcPuXxc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZqXFW04i5/UdWGy1lLmmXSm3iUS5UuZjZmPA1DB6OYhxWjRc0cPfjPuzdi1EZyqBJ
	 h0E1HALEhRWfVu2geP23qXp3XYAQn/YRa3URFxcKCbkoCM6rJV2wiLe6msp9X8x/E7
	 TDXSDSRLYjIbaL/FwIm5C+Wk6IVLs4pliPQvl8pZYnzo9sYZthgKofg9xMbjwHJm7i
	 4UCH9RLZyJh2lB8UrL27vA41/BjkH+qrjI+yv6+w1JrdSVe2pkF96rhf/4EYDp0MEC
	 iGQO+GM28ok6U93sQ4BE75YdeeKBmewrjuv4sLFqkjftFDpuBthF7VOQ8U8RsPXW5e
	 X5tTREopVFtTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A06C606FA;
	Tue, 13 Oct 2026 21:20:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB172AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C53C400DB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In5yiotfTd2f for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1B5E94008F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791926442;
 b=qhCxElHJiX5uMBz8jozSGk8C5P+9TDyYkLKCZtvahozbpCi+xYhrUfmqPchMjCSqleH4
 9L4QNFun0v2hZOwHKJob3mtopNAfIZLOfpTTY3jTcTVQTaCccgH/1Dd2iXNrOZ3VtVjon
 SL5WFvdeg8SUhgsdYiFayFrxuANjTu3Lk5zyO5GtJNlA2yZ/w7QVFAFWtKwaDbxwIKgbZ
 ehcVMep2bWh66IbNlxjeqDkHyylrvDXAXF9/V6Dg9EbOh++uQWp3MBrjhkrRTBsY1ulxk
 LdY735RSYyFJGRbTNlwMVz23rgvpfr9MGbS8uvO5nwtZG+tgCEAI30II/1Gdy2/Pt+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791926442;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=gOkIKCVIm4QAGa2XfoKvqVTaj+7uobWPzw/TCPk4dzA=;
 b=m9V0fyd0E8syKBAvwpAwppKsWaBsEetaUPfpNG9ITeUoL5win5tWP+vbf09P+8ipMQa5
 eiS2wddYQ7UyTHb89pWdEILAMkVVcwT9sxX01M9tnl4Sr5IxBtKQrrG5VsmU1JsZdGkE8
 JVbjWHI6UXlVa+H+0NuHe7ZvZu9M1YsboyxgTSneabVNy6/bsIJldAwb7lZrSfWQSIskK
 PJEyuYTnDRclCUcT+0Z/1GlfClVXdqimkFXUS6vGH0zXMeDH5blPGw3757MrJP1Fm7sPk
 yuPghQkVB951RcrpOuyYLN/+X7zgGBJrauzoR3LVciKoLE1lubc6u1q0n8lhAO7qSAA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GZxLbgE+; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GZxLbgE+
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B5E94008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:40 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-824329dc1ecso2287958a34.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791926439; x=1792531239; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gOkIKCVIm4QAGa2XfoKvqVTaj+7uobWPzw/TCPk4dzA=;
 b=GZxLbgE+R770z2PvuFfVk1UntsGqBdrl6b03iddyexNo2xTxpnxw1UVGpxDBd1bXbb
 LFxSvVwxTc7fn30lzF6gJZV/cKnSRWD/sLwvgqtnRLJZVM78Qp1dlmUa+LbEPmp/Iqbg
 Noxo4e4oqOj0RSokzCYoVHLGP3Mvt4VtJgNLErczDdZB+4zm8D4qjMspKcjndpA+WxYt
 iPuz582HMHkue3tGSsYclXIU4/xN3jNgtHCSVaGXsw8N0Ks5DGJzmh2mbCgp9oAS/HfO
 VX+AyNRXZRg2QF06/iE9dN83dp/pzmmDGrhrQJE32xgYpOTEeIcx5gvOAb9Ea2XMJWWI
 po4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791926439; x=1792531239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gOkIKCVIm4QAGa2XfoKvqVTaj+7uobWPzw/TCPk4dzA=;
 b=eyHFsUldEvYHrEF+TKSfW12q3I7rI7Ham3yOo9Fk/+wX1f7MmgELWUZ+uz4fUcJa3z
 +hZWeVVUZdcuHnQaADK+QbFgsdUkutx4uyXpePfZ+9WZbo+pjCvZCTsTRQ4yXrPq0gAh
 kOzgt3I8ZbTcolMccJYb/jxVS0GOiodUSAq7GZWRl8Nbji2fXN2k8Hq/Yn2iAWWv100P
 1o6wPDYSpum2eiHko5Zi/3k2+HOcUcfsercaKbKTKtedg6LpGUZrgSYNBVTqIGlLahDk
 TmzsaM436pdIefzcfmvFucE/vAjonK6qB0j7/p2MAdN+z7Bg5iwtI6Wd9oNq1hXU6gJ7
 x7+w==
X-Gm-Message-State: AFq9FYL2Nx4BFoDorb3ICQY4ux6mabqBjqvD/OjPKto3ZwDo8hX0HXdb
 9jGY7ojk0k/j9uDv6aoYjDuMGfo4u/nEJ5bQqGKEV24EpFShzQpuU42HdWK4v7Qk
X-Gm-Gg: AYBFou12/PrjpCSdL83nNwP9wpprSEQr3iE6MjWP5g1CINi9FhlGrHKI82eUWB4WfIL
 8gRPx2zPPfBpMmnRCmKSAn+0fIcfEGGDpK6DDp3Bycx3gM+g9AYk9K4wRsTyWyRKLmORZf5av91
 9D6sY8P9Tag+LwbDvB0oGk/MbbUkTz0A1LbRIhCwrD7JQBDmwJEPqYXzXhbBJzNFPheAkD8vwNx
 4fF9+qbVTwOknBHpZZgabKKdHswazpMjIX6beV1wzuXhcBZj8A4UQodGmt9ibCfIdh08PBtaXAu
 khKWb5sDODK7tx3qKfa3Gpe3awvDFBa0tY4hMGY07FoIwD96HImoSg5AJqT/nWixNQgPXziPjpX
 9bhojX6e2I73Qp9nfY74r0mUwlUy6g+sRaCLLZjnMLmarBScSOqWoJTGDXu/yBUEDzKPrJUYE/+
 c1d3sDp3T/klI2Ul8dlJoRf9tlpJqFUdiBUgfdyKIKhr72AVisOhxrWmT9pdQyZppG+atvDv5qO
 oOVL3/A4ClTDMlS4pa2pz2B+GWjhRtFh/AI8C+gcBf91bMl+RLSHdQUckpHT7JUMbhiDdYocRAD
 kwdTopVupAbaeN97dapeCn/kX2WmsuJMiXIc6IaKaAeERBq5efaSTBj3sCtDEknX6hZsFxsW8cI
 gu+L49pJRCIpWvFrJJrhLp++nJxNxAx3hSVKJeyy8CGI=
X-Received: by 2002:a05:6808:4f28:b0:4b3:7b31:8df7 with SMTP id
 5614622812f47-50c524711f0mr16604541b6e.14.1791926439644; 
 Tue, 13 Oct 2026 14:20:39 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1815fd26sm16116776b6e.10.2026.10.13.14.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:20:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:20:35 -0600
Message-ID: <20261013212037.2419515-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-configshell-fb: bump to
 version 2.0.3
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to hatchling with hatch-vcs and use the PyPI source distribution,
which includes the version metadata needed by hatch-vcs.

Restore the compatibility symlink omitted from the PyPI archive so the
wheel continues to provide the configshell_fb module.

Drop the obsolete six and urwid runtime dependencies. Select curses
explicitly, since it was previously pulled in by urwid.

Update the license hash for the removal of a trailing blank line:
https://github.com/open-iscsi/configshell-fb/commit/36306fd6f839b66e958d692230ead8d49883abd8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-configshell-fb/Config.in           |  3 +--
 .../python-configshell-fb.hash                    |  8 +++++---
 .../python-configshell-fb.mk                      | 15 +++++++++++----
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index ed7f9e0234..2c3fe52dab 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	bool "python-configshell-fb"
 	select BR2_PACKAGE_PYTHON_PYPARSING
+	select BR2_PACKAGE_PYTHON3_CURSES
 	select BR2_PACKAGE_PYTHON3_READLINE
-	select BR2_PACKAGE_PYTHON_SIX
-	select BR2_PACKAGE_PYTHON_URWID
 	help
 	  configshell-fb is a Python library that provides a framework
 	  for building simple but nice CLI-based applications.
diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index e090501056..cfc7be7b38 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  44696b92bea2b44c1d0bf2828477dddeb3b4dfb312ad82ce06d7b704c0985e27  python-configshell-fb-1.1.30.tar.gz
-sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
+# md5, sha256 from https://pypi.org/pypi/configshell-fb/json
+md5  049b7dcbc47e4699241c520b88fc4766  configshell_fb-2.0.3.tar.gz
+sha256  dbb086c16c1603a230f9017ef85baccabfd5d87439a01e963377e50f10220f53  configshell_fb-2.0.3.tar.gz
+# Locally computed sha256 checksums
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 3446a86e8d..e59e7f61d9 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -6,11 +6,18 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and targetcli-fb at the same time.
-PYTHON_CONFIGSHELL_FB_VERSION = 1.1.30
-PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,v$(PYTHON_CONFIGSHELL_FB_VERSION))
+PYTHON_CONFIGSHELL_FB_VERSION = 2.0.3
+PYTHON_CONFIGSHELL_FB_SOURCE = configshell_fb-$(PYTHON_CONFIGSHELL_FB_VERSION).tar.gz
+PYTHON_CONFIGSHELL_FB_SITE = https://files.pythonhosted.org/packages/5c/cd/3575aae7d0302c3a9d7a9999870475c289209a2f5b633a682c94f9dfc08c
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
-PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
-PYTHON_CONFIGSHELL_FB_DEPENDENCIES = python-pyparsing python-six python-urwid
+PYTHON_CONFIGSHELL_FB_SETUP_TYPE = hatch
+PYTHON_CONFIGSHELL_FB_DEPENDENCIES = host-python-hatch-vcs
+
+# The PyPI archive omits the compatibility symlink included in Git.
+define PYTHON_CONFIGSHELL_FB_RESTORE_COMPAT_SYMLINK
+	ln -s configshell $(@D)/configshell_fb
+endef
+PYTHON_CONFIGSHELL_FB_POST_EXTRACT_HOOKS += PYTHON_CONFIGSHELL_FB_RESTORE_COMPAT_SYMLINK
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
