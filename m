Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8832CCA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C0F81352;
	Sat, 10 Oct 2026 12:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGBiHr5P52K4; Sat, 10 Oct 2026 12:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 72A15812F9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634256;
	b=DtFvLFCiVwVoHz+yKNKu6NwS5vsBVwAJZj6BGjNQcHDn+EO8Ll8psSN8SbT8B3dg8lHc
	 SHwUKYHuuDER2M78FAOepobYNtrrajnq24jfymufY13mapW/QT6iMA8pMBJfdB+8bo/OP
	 f3EdMMNigveOioK1I7Gxqwxn4M3HY1yrJm63Gm+nUSjiuH9CmC9NgUS7GNqyeJkuEwZUF
	 qA4bedu4LjHWxYHPBUyXKX9nhcMzptKM32P2gDvWS2n8nZpPLk85PwrjLBa2V40T5cExi
	 thod7RKI+Fpg15lwgYeCSrCPzw6ZXT5oWUWx2NWKRqTGQYG9V5FCa8yGciDG8tU/0oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L1DQ/9CcG4O3KgHkPp8JKhtGGNcOpzSmS1XmpjODi/s=;
	b=JO+PQ9P6+to2sJbb0/vBW6g9mRlK+t0XpCs2yiepFpYeBrOUoGKNhAbg4FuEYZddqQVv
	 eB0P9O1m4DF1Tz+1Qz4NI9kRxuaPzt5xpO3d2T5HiV+tIpfpZo5WSp1mVM+8FwoSgm0oA
	 0IWVHJmQLVSmij/8RzVwgGM/GjYD7ECOYVW1S5T1vIjErDrbByhUGE73ypR5LcvibQ0f7
	 5D1gGZU6Bfp2zTYUmfckAJHDNKHxPgA43eI3040jLt5HYUsWfKxAj+lEzDp2ZTknF+2w0
	 P1v8r/eHPL46XUigSBuoPojfVuAiaEweBSwDXzFrvLRz543gptEoTUXCHRza7J6RcOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634256;
	bh=L1DQ/9CcG4O3KgHkPp8JKhtGGNcOpzSmS1XmpjODi/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oAPIyPjmbMcwgXcf09L5b6RyxpsW6CK/wN0uau6t7QLWHGn48bth/WTCh2sgdgOtS
	 +3nNT720Ux44gCCJtQO6M8PtqUA+8UpJ3v3ILLY+/ay5JA13dOe6mk+7QioPHqtyCv
	 +tOjFxbmhqyCUMf2xGA6f1ben7x8svLZlVnZxzrJjVbzBhZPsr2zYYB6DuWnTK7EyM
	 C13RhYZgCdr7YlToKk5fX1ctAdqaDm1vvXQuxuB2282IVl/LausjnRxDqy7jI2E528
	 UM1PpIqFyWT+vWjLwtnrTwIlAOabrR2R1PIX9eXDNhzz5dbjINlImXvN+uRR84K+QM
	 9Hlde+2cyEF8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A15812F9;
	Sat, 10 Oct 2026 12:10:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD49022B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C98426067C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NI-YboxfKt0M for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E1FB560663
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634253;
 b=Dl0FyvQoe7eUaChNO7efYDAIEM0Hm6cBO+Vgyv8Fj7WSN9BU7egqNW5qpVn/wUW3e8sl
 86632ksuVAL5BxT4qJOLMx3H9hoKRXsqpOCayh0BGKjUSDrb//DF091b2tm/xM1XB6JDq
 A6tcY5b4UIPRgZfDSZ7WCVmjy/EbewycfgN62PFkkZFSyPARQwBiZWL7ElJz2EtU/xIKv
 qXXdUEXvx8sfjreJYqfpOibdptukb5M3TTYvz2ltPTyr85GCcxgNxgIbyhBiBwaymMYCJ
 kbYZUzSKioUOZh/R40jugF6Q+W6MUbm4xlhojS1l0ayCd9Sd0u3klLWCYMHDj+IFCvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634253;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DDPnTCDzVw4Kf8ZtvJkhTk+uE6XLcrdFgAuTvlRdIZU=;
 b=OJ7C40uNAjUbDP7+493PM7WpwV2Rnxn0WlVJYLFMx9u41f3GThizTkCM+MI4hhuN4Jxp
 J9Gw38Pgd0sRG558jgNB8i1HLU2+sNmMC1DYFA0zlTlq0ejasWkynDR/ae+G60MlgolG+
 EsH24NKVS9X5NDehzjH/mE6Z7xwi1wo+gu2PucWSSn4eisigpBPaYfW9T4Oqv9TvDxq8G
 OaBqYmBuooq2sSdku6c4zXShLxBxG4kTHO7kK5839UdTa+ic/3Ui7LdKUXCwp7H+W1JA3
 fSAAgZQk6Z4xN3w0WUr0XPDD4wYfW2b0BQL8XzwXYsTz3FkGjSOS1Moeluvh05a6jrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1FB560663
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF81191A93; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d8170227e6a89dac0e1dbd716cb32ef5752f38c
X-Git-Newrev: daca74ca28da1e89e68b7740649b16b3199d8a21
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.AF81191A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibftdi: bump to version
 0.24.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/daca74ca28da1e89e68b7740649b16b3199d8a21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the setuptools build backend.

Update license hash due to the copyright year and license URL update:
https://github.com/codedstructure/pylibftdi/commit/88f84ed8ad4aa65dbbc4abeaa67652ccd947a26d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pylibftdi/python-pylibftdi.hash | 6 +++---
 package/python-pylibftdi/python-pylibftdi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index fd7d9f17b0..10dea3f7dd 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  c3f06a398c7e7e2bc9d6ff8476378d5e  pylibftdi-0.23.0.tar.gz
-sha256  bf5b4c6ba73d79a6f6df849c345b00ba763d023201bed9ba51d876a4397b16d8  pylibftdi-0.23.0.tar.gz
+md5  6243ede1ed3c210846084d0c204f0a96  pylibftdi-0.24.0.tar.gz
+sha256  e2229bc10d077f018cbe7b2b490227b2b538643fa6f7bff132cde15549ca129b  pylibftdi-0.24.0.tar.gz
 # Locally computed sha256 checksums
-sha256  d42da8dcd174be0b5a20366aa3427b6c7570528a1992d50df9c6597cb3ecb898  LICENSE.txt
+sha256  a85d0bd07d1efe2c7b24be985d3d9bfd4e9492f5e003e366acd4f99fe95128f7  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index e6c138bbf1..58c1c82c86 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.23.0
+PYTHON_PYLIBFTDI_VERSION = 0.24.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/9d/f0/551ccbd8e989e898707e0e0859344fcf538c2310521847a1035ad3e9b164
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/19/5f/f0e03128161fff27d4f92d57b7fab20fa64e9bcd53627442d2ef43b8882c
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
-PYTHON_PYLIBFTDI_SETUP_TYPE = poetry
+PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
