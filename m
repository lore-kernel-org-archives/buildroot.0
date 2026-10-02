Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD86CA5FE5
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFE740DEF;
	Fri,  2 Oct 2026 20:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHlsD5G6F108; Fri,  2 Oct 2026 20:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5A86840DF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790971792;
	b=GLQdzedbLUFdlr07UoLsHid6RL+PYrN666WcUTS25L7yT2yTSMqmqsvWPW0kbewbkPkE
	 LTnw5rxcWOYF9l0QlgtXvf+fzpEVgBixjGaTRND3JrAi2SnNdD5tuAlxzDouphq3uG7Oe
	 b4z3+2evFR5k0BQnP3qOyV5aPIumg+NYRgY8whPv/KYHcJ1z2VxlZ1ro15kRUHxsgqIkA
	 wccBUwpY17vvbvZJeCLPqm+KgBsggKDAh3AcAbTwe7Bt+gR8Pq6kbyTna2sgsjpKIBUFB
	 G0cHR4aMazHz7zjzb0pavL+xQa1FpTJ7P9BJtKlaf0Ue5NOzGlh+TH/JupADmYivkpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790971792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vafSyc/sZjN/fKok9mz7e1fDOvy1nGycJUmWYcdg3XY=;
	b=EmrJY77z51/LNLydYwSvdb2PAoeMZp+xaS/jDDctspnREhIHbCzGPXkYhG3Tz/23JCJw
	 bIUS3QpmFFDlfJTCRFxiNYe6KB+1fgD9y3nt/S8o0AxGksEOHz3LVnXciRL/im05ZzTlv
	 96M2lQTkrp72rSalD+CpPW/g8HfnL76EUvB7uKmagikuTi4lj4L5aT0m9anbbYFMgWOPY
	 ZV2fy7gZAtJEiYHyGeGKPsznrdjwgIrx8O+RjUVf4MiCfO5N2MytoRhYuEEnIh/0sLUUH
	 Dr9yZAxdjPSx+w17d8cehVSJ6O2+mkH/rtHHCfYA7gjzGG31Yd893VXsMzEj80DVddw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790971792;
	bh=vafSyc/sZjN/fKok9mz7e1fDOvy1nGycJUmWYcdg3XY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eHJrwW1NNsXsiERea6aRdd11io6h5H7Zy59pcFt0i//Dskcl3LTgZBl8DJJyVO1cP
	 mYMUcBT7vq+LeHEJmuqchLIrWcyEw9aSH105klWJ15Iyx+hQeFBYbaQDeuYZ/8K/c+
	 q5OzlgYLuqbWsBIhHZmSLzHGXbFhhX0LJlt7hPCmz9hTPyGBgwtWN/xrZQ9uI8a7ZP
	 TsuOOHBEeSmx0E5UsddN2k3TAFsAmYEPBLRi+/eMui+hh6ymNWyjXts2y3WydaA/oX
	 Pc3eXEL3BLHLRPqtZkb2tmAIOsZIMUWIb9w1Y7dXF8E91iFQumYXQCnpQDRyYuYjF+
	 yZlE1QJ/fN0kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A86840DF0;
	Fri,  2 Oct 2026 20:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 976BC282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88EAE60D70
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iogZ1j2FKJt for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:09:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 996CA60A41
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790971789;
 b=tMVDiG08XNG+hAvmk30vSfc5/d6ExChtZI/PAwP3OK2sgbbrChMJvrBGA7bsgTaRXgSj
 7cbTySjPyaoo/ZNqH3Dczjn7dg1YW1rgcDfaxyQ+ec0pCZ/QWCOregwiFmg06L9ug+IpP
 VDAekoygpXqHJmAPGxIcEN5RqJ/ZZHuZG/cQj7VS+nhCIho5lvhQpcmWszBGSBmXUBrGD
 U0mCBFzVPSkVOhE7ywVdXt/25RK5Eadnz7pStpgfXAMrO32uoNvv7ZfvWJuJ2lC9WMo9u
 nYmkD4V72OxKV8TnxDEdzyG06354zbiHX8mOnnU2vPFRRUABBADvtQeO4oiVX1ZEVmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790971789;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=r1yDlke+yvwKgYj5B8VyFrCMyBg1EQ/fXmIHjtgnl+4=;
 b=nLG8nuLNnUM//UqhWJ9Gh/+moyaFcmB0VcPIPt8cPmoPO39T+PIF+HF48tKssFCpojIJ
 W2EBOa15Ud/en4mISK0ceQ5/gEsLF3PmQNfzjqYj9UQ4UbqkFGkk7yjDKBfX7XdaWIhLc
 xi59HCShAYeaZjLgEgpDJc8KtUlBQIZm43L4PTj8dROrKJ1gq/4BCb/ZiZILeE3IUjKPW
 WurRAdffgO6HTya5ou7XmCmvymXEbRAcBxjoJWGflTE/GSLlqJdxiGp4rRAvTQKO93Mu8
 KPX5I8BCtBsl2ojeastGQoKRN5BETRRh0Z8c4eUMefKp8X3AV0Ib6Pg4Rh2rYehzCEA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nUr7TkNP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nUr7TkNP
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 996CA60A41
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:09:49 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-80a71781323so165864a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790971788; x=1791576588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=r1yDlke+yvwKgYj5B8VyFrCMyBg1EQ/fXmIHjtgnl+4=;
 b=nUr7TkNPYS2oadbR0W0wZUlkRHbPmiunF1Sp5mACRgxUCWF7vOjoUOZL7Wl5uzqoFW
 wu0u6G19v3NXlqG9WKTQ3MACk5CR+yCo+2ZhP27Gg8y/ksAxwTx0CfKz3fNFrLtR7/jh
 NarMtxlKiVrPMAUTJquhgGub/7dvypSSTY8Gvn/RcoAGX7wnKL3EhwwCv5TSl7a8eFD9
 QHICoAnKDSH1y6dyNKxzob44P+xifpYuZB3NsyOb3+hex25C9b8rcS52bx3abslJgHcW
 /7SjvXpZqAo1TKiuarbFKhZntV0zLI7RWRCKunR3DzDSe0+hzSvwDxtJYHWvC/XvPAJi
 EmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790971788; x=1791576588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r1yDlke+yvwKgYj5B8VyFrCMyBg1EQ/fXmIHjtgnl+4=;
 b=Nws9XlYHE6/sL8pfjuYS4RgAqHNCRK5TR9wRCaxzeoszNEM5ANaG308d5CoqYBkmOJ
 4dF/dQS9Hh3yLYqcfORbXq+KzuJdqTZlzWJe7YPPNIuk8DPykHGRc3w8QH63MAg6LMTx
 awpJPOJ2ltqrpEw2PwT9Vx+iyBW8G+xNhqAsldsnqaSRI44WlSi6E1FbtKJS8zCUz3pX
 1WHy3tZfSIPUkFTcUzQEOdDEe6+h6eaOXT2P6K6G3ka0oUV0HpUsYaJAYctE+Oiss/IC
 RlGJ8EnXL1GiMHhel+2L35If0zVeGqG8Om7fyVi69TLNy16NyD25R2CDrKw3i9R45XNg
 lWSg==
X-Gm-Message-State: AFuF++lHnwmhPgn0dKr4AAD2Q9/qyqt/MpGon+9/vcxOU6+uPl2IDlrE
 kVEUFJpE+V2T0fHZAS77cvEzn12VI+2nW+9OZuJIRsste7uTpZNIoAAudzSIvw==
X-Gm-Gg: AYBFou0sKLAswGLU6iuETytXbhomCM70cZuX11o5n7fbxvYMp7SVeT4nYa93kzxchIo
 xYXUJOkdjstQPmx5fZZ+zUNHT8WlGu/QD+Emggvzl35UR50HBlop/6yHOxlVvFoCQJ2ZprUBBzn
 qL5/CX3rKX0QD0RHjaZC+EWvd991OsdXoQJ9z+UspVtlx7Y8trt6AFb82d69OwIfjf1CkqxAyCw
 LBQ7tsu2hOcZRgVyz0iFFEmpsIO6ZLx7FgUys0LCYYopSxk37gTpt9gYUR0IzKUHljYywgwLPAN
 Q4ofOFThgOfCVUqOUzfbCUBiBNjqOJXEzefumphCna9hM+4B8q5bN5b+5yQq+BoqX9tU/8c/18h
 SofcQyIs6LUQvCW73QN/FyncQh5+WLOoVaXromTJ8U9jA3l5SeW6yH3pW8hHBCwwVEkdQl77kVW
 QnvwLzqrB+PROzqgYXW1yOi7ernYHxTrdSOu1J1ZYKwz7VWf1mghUlzeNx3ydY+h+UXcr9x1MCY
 av+6TVGoO7IrnfUhIHnJtMvEH7PKzsTvm6emXCnEZ2whSP0ejbdxL/t9jRwEnPA7vXtvLIMi1tP
 XJqkGciWOphj7dhgekoCg/qme/s+/Epxdqtv7GJZm/94xMtm9CGWRWFiIdt3KfEzZaXQcA44gN7
 3SvYgj9UG1lQh+GIz3hLMrvauraG2mcRmIG03DldnOuk=
X-Received: by 2002:a05:6820:c8a:b0:6d3:54b4:897a with SMTP id
 006d021491bc7-6df35f2adb0mr3031308eaf.85.1790971788217; 
 Fri, 02 Oct 2026 13:09:48 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a2c4a26sm2694272eaf.3.2026.10.02.13.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:09:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 14:09:44 -0600
Message-ID: <20261002200944.3853721-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-serialx: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-serialx/Config.in           |  8 ++++++++
 package/python-serialx/python-serialx.hash |  5 +++++
 package/python-serialx/python-serialx.mk   | 16 ++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-serialx/Config.in
 create mode 100644 package/python-serialx/python-serialx.hash
 create mode 100644 package/python-serialx/python-serialx.mk

diff --git a/package/Config.in b/package/Config.in
index dcca214383..32faf03298 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1420,6 +1420,7 @@ menu "External python modules"
 	source "package/python-sentry-sdk/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-serial-asyncio/Config.in"
+	source "package/python-serialx/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/python-serialx/Config.in b/package/python-serialx/Config.in
new file mode 100644
index 0000000000..bfe2f72cea
--- /dev/null
+++ b/package/python-serialx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SERIALX
+	bool "python-serialx"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Serial library with native synchronous and asynchronous
+	  support for Linux and other platforms.
+
+	  https://github.com/puddly/serialx
diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
new file mode 100644
index 0000000000..36ef9681f7
--- /dev/null
+++ b/package/python-serialx/python-serialx.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/serialx/json
+md5  e9646009ff5c2b7149cb7ef63df94c65  serialx-1.11.0.tar.gz
+sha256  38a4b60212d994449c9f3314c523ec629f1ccf629f4767b3867c7a5381366ab9  serialx-1.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
new file mode 100644
index 0000000000..b0bfd48a61
--- /dev/null
+++ b/package/python-serialx/python-serialx.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-serialx
+#
+################################################################################
+
+PYTHON_SERIALX_VERSION = 1.11.0
+PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/9b/c5/8c3f3e7985ca108fab641cc453ae015e1f6f15344064b99f115281c8bbdc
+PYTHON_SERIALX_SETUP_TYPE = setuptools
+PYTHON_SERIALX_LICENSE = Apache-2.0
+PYTHON_SERIALX_LICENSE_FILES = LICENSE
+PYTHON_SERIALX_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_SERIALX_BUILD_OPTS = --skip-dependency-check
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
