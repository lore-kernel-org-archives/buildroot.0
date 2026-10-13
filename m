Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0245CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85EAA607DE;
	Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAVTgQ56lC-s; Tue, 13 Oct 2026 16:43:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8724860789
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909821;
	b=EL4KHm8rj3yH87JTMwtaukMuEHc5/y5PGu0Ys0lhy22A9XtAZM4iSlqy8H2wXK0E6BIZ
	 +uxrTJN5PY/+iQdPmpUlMGaQ1nfBkP5bSvXKIQVfv924/rW9gi2HY2RqJbI/0U0kqCPdR
	 PdYAQMsx7cd7231xQiXScxMk7t2MhQCHVMZoL4zd3jnNPDcdNl1VbsiP+YdjU3hwH6X3G
	 LJIj3EN9IpqWGWUjSej29rDTfgZvkwcTib+MxQByNs3tEDGFtm38QzDbftgE27MITrq0r
	 iZecc0kksTVpiEIN/+p1ortIOOxhAqRfO4lJEXHBpwwNcoI+HhsTVclKLcuj8FOQ0sw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=r9lH3QYEE2+TC49RcWmWCfvijR3aTluH6K1AKnsXCMs=;
	b=NcTPpz3KyyLo6ML1Ak2LbFGBZA/EwAREF51qHeTTH5oqLRcPpHVZ+MTmEfxA1dlbCJ/S
	 wofTSK9T6rkcvzhotL/PCmkfCp1H5kG3k8iT2KMAp8m6ubyER3YoEPp5XFR6Z5q8Rxt4a
	 X/j5OVLIEm3fIEV7SdrRKFgCSqfdo0ZFAtM0+WG7NlePndqgjz4pWzyuHO27dkeB/H/Zc
	 AjAMg2nLxpnsNft+RuyiNCUJN3SJOx24dUjXgGodCAzLPVm2XW0T+p+2K0bnSXZBNZmW5
	 xoKB5UX0wSecREf9VL0tKFVkzXKL1awoGcb+KenUvjZWD6a8asCaw9unUEaorP0yyNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909821;
	bh=r9lH3QYEE2+TC49RcWmWCfvijR3aTluH6K1AKnsXCMs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QruwQUXvCiit4qDl004FejcTkP8MI1fw+LpetslKeid8h8MJrESg7g3IukIk2q6Ch
	 siY9TVrCVHHohhEj96NvWqetw5rOEIciZGklxhuhRrt7NmOkQtX0uYoLTckwnOw3CP
	 RQBjmNC0sOvoKm2VQgRsq4+71Z+2ZGOjn9zY0fCz9TWxf8PLsUNliDsvStVp39aTCD
	 9apUe256PRZGeHK8S+lftR/QhdbNUJ9+mk22W3Qg3I4B5Aa8USRCiDGCz5MyA7JDvy
	 j1iK4k0uVfb9jwMM+JkpD4O8Aqw/gAVHRQz7y8s7fNC8Zv8df7/UyCasWq6kZR/6gR
	 qvFBVDTS19cKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8724860789;
	Tue, 13 Oct 2026 16:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6C9A1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C42F6404D0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwCzhOVZVG_b for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E39E0403BD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909815;
 b=KLfrLPy9le9GziopNqLku1dNwiIMlxgU8pt9eL3FO6AdHECrcpGt0ApzbSjFbUElXDIl
 YtkNM1Zu3TCGuvjHop/YjYBoRjWKJdG3oox8Mx/FUWQWEfCl7LmbXDmcmOPkzn7ZeWQQN
 d3zoZYLztMPrtCeDVvs4k4b0HKQ9xS5/LPqMUsS4GX3o/Di4pnZvunk/nR7K9vygp3CdR
 NV6J591NAEmQ6QuDU4I2DCMAw+DRIGHJS0HFaFEuVKGlSMWj0mEXh7zQlut2XjSts36rC
 m0chlDCvKApEkx0e6WT+TV/fpbAqPjMLxjyfW7VfFB9Cpcy2/lFylPx1a3XAzWW4Tgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909815;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=po+B+3sI1moZhUvwH1SK+hD05jOvLCE6WgHM6NvqPmc=;
 b=qwJ2QkrtS8SKfI52zcV3hD+YD3Bon/befGGNPg3xOndn9xddGcr6+r97YN0rmhOpoBKF
 IBk/3ejYyUS3nZQal/p+ik9Uct9ZhNIpR4uiJ0F2MvY+nCrMBLVJZx/GEYVQAEFiYIe3W
 6vukUb/As4g5wjsyW0inIWrcZmhF5FUg6rxS1Vdwv3YT8FvKcp/XHAWboBrMJEWBkNtw5
 /Y2/HETuaUQkxkAbGXjxj/5qXVfiRR6PjEZLp1OC3C83gqxTjSwXhw493sqvg4IE1KjWU
 ImVnDNwEfqpbHQxsy9oRUjBD6Wq8nev1BBUxpOyA99JySaFHk7uilHoGtR+2PMpWAgQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Vsuyr3+n; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Vsuyr3+n
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E39E0403BD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:34 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-49e09a20082so1779067fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909813; x=1792514613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=po+B+3sI1moZhUvwH1SK+hD05jOvLCE6WgHM6NvqPmc=;
 b=Vsuyr3+n/wmbzWtevYFobRZaQ2zLBbiw5cgBC+JFjvWMOqDuPaYtX0UaZiKBYd7yAb
 2ChZzB96AaV43xqCR42+h0rqhSw7A1959gofRbBsnHgbC/iuwhIYQHcEtuA0rPjkPj6I
 +jJb7P17Bmv4PXjdPQK7/AQ0UyWY0VhfNWcqtSpIikk97AkhfDdZnimT/ZY0jBcbNVOt
 NA7+ClXmm+Z0JIgKyBV9JYeoT81X6EpXLppkR8hqIoICi4Va3yKUK+2LB9C5POh0Vmp2
 g0mDOgDWzK+QBBRDAtr6DvZivrGxEx1CERQlOBfSySnZnmXfPgKaThQgtXC6+6zqZVnm
 kHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909813; x=1792514613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=po+B+3sI1moZhUvwH1SK+hD05jOvLCE6WgHM6NvqPmc=;
 b=1ejNM9L1ZjZMkK78tqP3eVvSAhzl4mIkVKYb3xJSyJULb7xeqR9btIg+QCub44BZI9
 YqG1STD7RFKPNBZovnBkgfC4P3YfrPOb/q0O/rRyRgiCuvovwvbJ3txF7IswGfS5yAgJ
 3oTkVUcyqxpN49lh0GmAtEByb9PYbI/5C4YP77O7dMZiCLj3btSH8mw7DNo/4PymNdIo
 beOFoBVOmQChwnJFMr/CYRxjJshgUkJ4NytqtX3Uh56Ng4yq7a7bLcVO+9a9PbBCmVbd
 xdFMgATDLtqS7vynP0SHECxBf4RZUf869fWCggK/1JZ0VjcPh2Flt4c1Rn8bgc6cOdCB
 zmmg==
X-Gm-Message-State: AFq9FYJRxXpJ+sBZos8c3UcrkpVat08I2CatzMP5JZrmV7nsqLI94cA4
 GAmKcbJI3E3jjn6xGbC4REGlCN7seXTYwx9RocVE9d4dJiGG2prAE4hZenqzhA==
X-Gm-Gg: AYBFou0/Z4FiKMAwjI7vAk0M8dEXo0hCg4VmYh8BagiEmiumyb8xnjXjanEBhkwVWp4
 WrqjSaNV/zS+5R+VLLiv/TcM6KpRu8n7zqoKdqf1iTl15u4kZBCZfXRAL/XJmtcbRwQS7e9wcoh
 vFwAY7chg5sNEe+X44qMZxCxJ2ZafQJ3ja10YPlDsGjLR55rfU0UKEQ37kHvE+QK2A2m5TinKdm
 OBYLzDlcmXU/W16vusaVaO3bG85KOnWk0aXQvwdQIezdoxcrB8qmCVj1zH6RsmzEjaVFcJcZjID
 M945SBlX/hltY7VYHBafX/GSsKWXWmA+udjG71XEKOaIXuxfzCImtxZfaxejpiIwP7I4QC+EEY6
 TWnuJcJX1brnSl+8n+sjm1IEIUAhSZfSdAQXqhxnIml7HXMxu35gWraB+XOCPK+n3iNH4diqW92
 nSuFZeeSsEycn4Ova8L+jZOwSA2QkFC7Hag+7MEW9s8DrcRSNImW0n/TtLwZlWL7wsZ54lhvfth
 Ht5wkvX9yzNfXGbzvgpQUwd6m2mZeqX8G4e+NqQ9YapD0h/6RFkQBjZ4uobrfXO6NZukVPj0zfp
 gEQ7hg5ZCcRJyJAlmYXE+X936dDiZKtuglJeihTe8Kv78JgX9eync3ca5EkIupPfVAW7RTwbQrP
 VtK81fDmZB9SPUCjcL6U+LvEiaKhPdFNTMDyUwWDy6ek=
X-Received: by 2002:a05:6870:e254:b0:49e:4ed0:11ca with SMTP id
 586e51a60fabf-4a2a8b18a50mr9907117fac.53.1791909813430; 
 Tue, 13 Oct 2026 09:43:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:10 -0600
Message-ID: <20261013164254.1476592-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycparser: bump to version 3.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the license hash for the copyright year change:
https://github.com/eliben/pycparser/commit/ddc78e180b719a2088df7a2a5801de69e82e5333

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycparser/python-pycparser.hash | 6 +++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index b8a15b5e0a..680a4e4581 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  56f3a0a82595b0cb04976cc0d3271a27  pycparser-3.0.tar.gz
-sha256  600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29  pycparser-3.0.tar.gz
+md5  57e8f58d1a6aaf5e7f829f5e3874258e  pycparser-3.11.tar.gz
+sha256  d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2f1c2935e97c2bc  pycparser-3.11.tar.gz
 # Locally computed sha256 checksums
-sha256  0c846399369ea76ddd7b5c44fe6d16497415fcf015f5cbb508c24bf98b81c5b1  LICENSE
+sha256  0a9e78156ae8b96caf1b4f11ac2df424b83de29736f9e757630548a6272fdf90  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 68b7a1f143..973a063e8a 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 3.0
+PYTHON_PYCPARSER_VERSION = 3.11
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/da/a8/c5fdbeee588bb8ada9458774f43adf1bdd30bd59157055142183e769a024
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
