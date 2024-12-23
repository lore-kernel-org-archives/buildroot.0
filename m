Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A2CE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1766F40893;
	Mon, 23 Dec 2024 16:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQc-FgzpvPdc; Mon, 23 Dec 2024 16:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0525E40797
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0525E40797;
	Mon, 23 Dec 2024 16:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A42FED8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D9340893
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcIh3UQCGOyX for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 511B04088F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 511B04088F
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 511B04088F
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:14:29 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a8f1c97ef1so13780345ab.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734970468; x=1735575268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ESuqqc0xQRX4Ie+rf01W4fQO9UFdYgbz3idtVvCM0i4=;
 b=ZJJqEl1xlsZPO1m37/+InwuBI8HsObsi70YIkA0UKiYP5FBLtwFgNJCYYbkkI8T/Xd
 Q4LdfBeX/Si2qQRN9TqxdxgF9IxKS6hCLht8aVejkyud5YCpUeqjl2UrTKd63J8hh3t/
 hxdWg7PcP5To9icuX45QCo+s9IcHr3Ej6sXOl3VpIxoX08qPPCRUZL9FO8cLvr0KxxQ9
 U0c+V2TWcjzA9jSHa8z0GRL3VdrZQv08xn0PvhQoRg6T4X2DhaU3NrIvNfRXo1nsacdD
 FodEZPJYgjFS/bH3tXj+YtvSIGirHY8b1yc9U1HLLkzlR+/TM7+5XIFikn+hxnj5pwM9
 xQmQ==
X-Gm-Message-State: AOJu0YwF0QZ3crNmoLp1iPAE6MeAAnYnHea9cXNO5yoxkFEbycfyriLF
 1G4gIi2Vspg01mALYAZp6c5kAFhyx5cg5lcyOXXjuucGKG/OnMAnnJYsisFjku0=
X-Gm-Gg: ASbGncuafudUFW92cdp/sGC1hVCrMpxI8irS/RX5hvxa7biWv+KuqtgO7iOUuN95CYg
 sEEAS2AgTD2tkr5PlnYm+yq+YHmu1WZUCyhc+FPsR6P4CtJi/4ZbhrDROSr1yEI2ROq5LbAhfmm
 T+HhTsJvjdYgDEES3n1LgeJA5RBJF4wqKzSZvltfIrfpNxcJQ3k7mNN73/WJ2TGairbipC2MkJi
 NZmGN3xT5japtTUTmnRDmiT9JQ818AfxqP1jGiSBiajIRbx32b2MnU6pcm+tdRLVJuYuUEyIypj
 AeEX6/lAEEDMnfukpLZG5DbDgZyNP4nKHQ==
X-Google-Smtp-Source: AGHT+IHoHYj5Z6dXS6cEHIxskRkFdNaEHkj4a+jKl0MsnAmqPxIgSEUH+glAaHprh3vQGDmw7xuFCQ==
X-Received: by 2002:a05:6e02:3a84:b0:3a7:d5a6:1f9d with SMTP id
 e9e14a558f8ab-3c2d2277184mr113959305ab.9.1734970468032; 
 Mon, 23 Dec 2024 08:14:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1db8f1sm2208428173.114.2024.12.23.08.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:14:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:14:25 -0700
Message-Id: <20241223161425.1858075-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734970468; x=1735575268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ESuqqc0xQRX4Ie+rf01W4fQO9UFdYgbz3idtVvCM0i4=;
 b=NQ1vQjaNsb5c3wvlpwEJ6I7XeEnzoum4E2NRlN1+rU7vt8LbqknRpv/twOEkyuL1ci
 1MHvwb1xHe78C3MYxfwOYrL1N8w4qIW42092rxyzh/mQgxVUDHNWepiA0QXrIDcp/phN
 CHMh7ow5+p9IaCX4asi2ebAQuGbn1Acj/JqqJFqDACMj467vzemlO3pXYcpobwK2f9QK
 Wu4ryRFM3ko43tMUxPfmjxDIaN42dgFbImhLqTSYBZXGFgVjoyQuBzVNPh6B40OIRclH
 VfAQQ0RGAjjOdW9uQ09hn35Qp7QM0gHpC47YS65WHX5GuFJsklzHRceizrtcgbUICkfe
 qOCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NQ1vQjaN
Subject: [Buildroot] [PATCH 1/1] package/python-channels: bump to version
 4.2.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-channels/python-channels.hash | 4 ++--
 package/python-channels/python-channels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index 8f0a529460..0d849f9a57 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5  bfbc466f2e0a06a8834a4be10856ce8c  channels-4.1.0.tar.gz
-sha256  e0ed375719f5c1851861f05ed4ce78b0166f9245ca0ecd836cb77d4bb531489d  channels-4.1.0.tar.gz
+md5  172a3c580efc46ff3cbfacd59084356a  channels-4.2.0.tar.gz
+sha256  d9e707487431ba5dbce9af982970dab3b0efd786580fadb99e45dca5e39fdd59  channels-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index 0e00e7ea4e..83584b469b 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 4.1.0
+PYTHON_CHANNELS_VERSION = 4.2.0
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/7d/73/da9e496657b242308d68cf79c937be125fcca4af61a620d98adfdde66fab
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/96/e2/10d949dca9eb8a85c5735efefe3309033419e7d4f4193a70f6ede58b2951
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
