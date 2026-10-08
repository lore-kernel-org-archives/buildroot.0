Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3887FCA6015
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 21:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1FEF60808;
	Thu,  8 Oct 2026 21:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DW6fMrTqqMw6; Thu,  8 Oct 2026 21:46:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA02360832
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791495982;
	b=InpeG2PmQoCiRZBRk9efiaRmnX1wE+y55/ymsbgsAE62CPGBgqMzJn9J663w9CPM+01w
	 fDBQSmMiPuL/lw/buXDwA/RzN5FWekn1WwGkWnlRROtW2AGGn0XmL/h3/q/0Z4GTRKgid
	 T2gHzHqyTSfzYItpDW9nLgaBVNY5FkYZ+Z99WJuWIKDODrDsonB5Y5S/3/iYCGnbFmi71
	 PUgqvnKTZDkEcQjgxKx65lLkAWt2yunvLUDzkysse4yvLZJBLXjShB7RFEM9heS4sFdQo
	 2SFNejG1mc/+EouHHaTwuQG8sr4HsUMEhFs+gEvXKhZCwOwbxNJ18tefQ93aSCGrkYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791495982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=br5+iFCGnVZ2kK5rfldbFQ0Aqc8eTAnaMlvcdRatUi4=;
	b=ECADpTbi0YhqFJdqKlCA6sGaiwu3/ap/CovuMXz+lPIoIfajGmd5oKsPtVGDE1TjLEW6
	 djHfh/VfRWLWKjWBzly/PieWTUx7VBmINEHVDWfrEIFuu5TlxbkXHinoseoJy+esIOkjh
	 vdASb/KEYMQEACTl4eyJv7cD0wwaIRAChGAuh8VGbhLrtlurLJRS7pu1SQNTGGfS4kPxO
	 Zdho3uAlUsuXD1WN7wn25h17d0a92BEYj/Xp1cGhQfQG0B3JZQZJy9B5Ut4Cx/AuOyMS3
	 X02bvuEuYxn/dMG8q/NRnKSD4YrXqCMh46pD/daZBQlkIzfNIhge1KYnfZzeNM+7QPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791495982;
	bh=br5+iFCGnVZ2kK5rfldbFQ0Aqc8eTAnaMlvcdRatUi4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TFDGQkMcMdHUyTb/R8NhPDZiNQdUaEZjRfgzyKt6+Q1HpDmYix11TtChisNwD6EkN
	 Q77rHeejU4k5IXj5WAeB0IRalW+YlkADVZxHXQDrj08+xS8El8WDYFAKGN48jZ8mhz
	 AC4AKt1/Rn3owMQKK1dV8GrcTKOeOpopSHX0h1rpqGuT1OQN/aKaYuedMY2775KUUj
	 ElwfXUj9EqeJhoX7/OmMIRj+Wyr5pb50tuYgLIoSPz7qgWamMhUMxROf3x+GVIxvUd
	 zvvtOAYDIlA036kQnUa2WYpwK7fG8LWsj39jOjIhZIfsWvJpTnRUpgsYEn6VddyQz8
	 eJRD6aLDYOTTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA02360832;
	Thu,  8 Oct 2026 21:46:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60943228
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 21:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F9B1408F2
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 21:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeLIKoa9YVuf for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 21:46:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE15140608
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791495979;
 b=rsJQmJjgI+3Gn0KenT7Rc92OqQIv7b7/2WzvtW6uxspcLo5AiWIwqdFHsoawgnPCWRDK
 yboLMiGU+0EI/gx03t2+GS+EFY9iQqChFu7eox/GLYHDitjsTqLhWSECZSuU6Hq5txVpY
 kyH9QWtWIwgVMs6B5fRiL7UBdO5WltWSNsjeN3+1zS/g0bdT+4FqHFO0r5Vd53INZi0ZL
 sbv/I69UTqOkXi6UuodaWQK7wgNBsYlH0NPIrIfzmIz0Q142RPw4QGoVQvEayv/fOJkGT
 Rmur6nIUpV/Ii6SGdVMGqqjY53IaC1ttYZMjiO5nwhm/7NaTjr+beqyMjNdeOYtNVoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791495979;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=7/1n2kYhzgQlZ1zxMUDCPB6xSgP9x4QDnPSbKBmUSK4=;
 b=e6QbzOmQPGa0iRPzvLMRnCEjnbS3WIheJn1yGmGVCShM3dQgWMNoCp83dLlmcFI6Gc8l
 mlzg7PpMCWzLCfMPdCfIcSKc9Bb4yPkQoSehXk3pmdCmKleAuHbz3+SvFseuyrvYhgX97
 uQys5XV63Bb1K9DUIw80gO9F/qJKeeeHstkUraVPXVX40iA77rNRHNqCHJYvIucL0DJVw
 bbbzgtdhRlPIhhjnVmaPEJa2rGmfiX/5ZKe2P56TPxnAtwQeZwNMI02cPsgGRY+Hfe9mL
 N3AMW7axnygtBCm9V6WCTNKxumqTcE+qs0Im+KnQ6wEi9W8zjUmoHYMK39HE7H5Kkfw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hC7t208F; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hC7t208F
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE15140608
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 21:46:18 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c2e26719a0fso345561666b.3
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 14:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791495976; x=1792100776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7/1n2kYhzgQlZ1zxMUDCPB6xSgP9x4QDnPSbKBmUSK4=;
 b=hC7t208FKeuo4AaD4EENqHGXeOVuOX7MmAsrAmQpmRG1OwpySCBaoQUnxRZycUXSN+
 ZYqqLF14jKlDLCDygVZQ9dtiGZlUqM0vNPHH0+oTEuwAfUebjnKBirThdupS+Zg2xKiu
 teHW+b0IBt21w1WMk7MJ1P1U/1dLg6e04WM1YdP6/13c/ZDRHgTCsjRA2rajKRdLypue
 FS1YAO/f/Tc2h2Uue2xX1n5KeIinrCXDabCUjwjltWJvFDfsXvRo1cxLy5ClfUfpcl7n
 +iJ+Exi5ygmwK8ONueRHAGSD/C1mDdbA4Zdd8yjnw8oOOltKtuwVRGK2Dw09QojXfBYK
 r26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791495976; x=1792100776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7/1n2kYhzgQlZ1zxMUDCPB6xSgP9x4QDnPSbKBmUSK4=;
 b=IOImhkLardkBUdAhPyPFIh9WNUWhOlyg5XFBeu0jZrloVqeJnXJ2/xxfGkeTwccqco
 O2BEGcJ7qeTwLlWLRX3lENYgKRUX+KgsE7qNbKEsc9Pxv5AFxJkAcMtu2kHWRV1IrN1y
 onJ/oeuKkLrMxgJOMjsCLO4U9jjHJlyKhNMpj3Kb6SJOd6m/GFT8/AoH8qmjAYgbqdCL
 sObuLIg9AEpdRdMtM9ifBlr0ZAv0ZmRfxKmdg3SOtM/zbLIAPCmJYsrcnvbt/74iXe4J
 /mciORlOviWGA2s1oo/San8XBhuyJfMK1oPi1IsNGIaVUBRNzO7kmAeJg6NZdrRRmmIA
 /e+g==
X-Gm-Message-State: AFuF++kQ8DklZa0vcQBcuryv7nKtKivaqqfqPqmBHvYfbRKuSNlaX9Ym
 B5MTmHvstfxjnkoe9AK+WCjhCjNsEWvYYoa2QFb4rfjl3WWe6snkqOHZbdvPgQ==
X-Gm-Gg: AYBFou13b2Dh2hom9BlztKjtPCKj/u1yazcWWSbh14RSm5NIEOsEpEyws/cLvkBsU+Z
 ZMoxp/TyzQIP49D9upVCYLONHFv76EdayNtX9ptYI1u+GjZP8Eudkm6DbeWLPFGhl5jRXeZgjiW
 LGEAntDTFzqUq8/G8MC1wzHYX8MJ1pl+HNAGF1rWHsbNOcaNdLJH8gt/+9L5S1BXpBPNlnz3jqX
 2Ghe1ysQi6nBTIH4oJhoqCJVgl/64V6q+MbiUdIkoyauIGujud4HhQZmHOwA+Bi8B4z3QnsA0IW
 WS5gRrSrFlobEeBF1BL2LNcI4ZoQpEQoADJj1FwSnrL0JGXlB3ZCzHu4DA0IF+MyPavdZzxXAMi
 eLolZH/Oy8CVj3nMIksb+PIjKw8IUAI2PvUsuKjtM050YNHG25p98vb7cvr3VfTr5DUfcARHEji
 TTpw29EcJnwXrZxZMo7axHYm8+HyelBhC/WIiA+jz0Bq1XRxJDHvsP0Vu0GJ77Q4bSF0xwBuw80
 QWbx6/Uq5wyWDXoNxvqZD/+IvUpX8w/PtvXNJoCP6eBa0I9
X-Received: by 2002:a17:907:f447:b0:c2a:f7f2:b732 with SMTP id
 a640c23a62f3a-c31aa0bee0emr4282366b.45.1791495976343; 
 Thu, 08 Oct 2026 14:46:16 -0700 (PDT)
Received: from PECS-93BMLD4.foss.net (254C2641.nat.pool.telekom.hu.
 [37.76.38.65]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a3bbe2sm2523766b.27.2026.10.08.14.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:46:14 -0700 (PDT)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu,  8 Oct 2026 23:46:08 +0200
Message-ID: <20261008214609.721718-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/shapelib: bump to 1.6.3
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

Also removing the gcc-15 bool keyword patch as it's already in this
release

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 ...-failure-with-GCC-15-bool-is-keyword.patch | 39 -------------------
 package/shapelib/shapelib.hash                |  2 +-
 package/shapelib/shapelib.mk                  |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch

diff --git a/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch b/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
deleted file mode 100644
index 1fde0c7594..0000000000
--- a/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bf455986557e88cce6a2a85448798e1dc05541f2 Mon Sep 17 00:00:00 2001
-From: Bas Couwenberg <sebastic@debian.org>
-Date: Tue, 23 Sep 2025 15:59:57 -0700
-Subject: [PATCH] Fix build failure with GCC 15 (bool is keyword).
-
-https://gcc.gnu.org/gcc-15/porting_to.html#c23-new-keywords
-
-Upstream: https://github.com/OSGeo/shapelib/commit/bf455986557e88cce6a2a85448798e1dc05541f2
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- dbfadd.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/dbfadd.c b/dbfadd.c
-index b464432..e0a6ef5 100644
---- a/dbfadd.c
-+++ b/dbfadd.c
-@@ -45,7 +45,7 @@ int main(int argc, char **argv)
-     const int iRecord = DBFGetRecordCount(hDBF);
- 
-     SHPDate date;
--    char bool;
-+    char boolean;
- 
-     // Loop assigning the new field values.
-     for (int i = 0; i < DBFGetFieldCount(hDBF); i++)
-@@ -64,9 +64,9 @@ int main(int argc, char **argv)
-         }
-         else if (DBFGetFieldInfo(hDBF, i, NULL, NULL, NULL) == FTLogical)
-         {
--            if (1 == sscanf(argv[i + 2], "%c", &bool))
-+            if (1 == sscanf(argv[i + 2], "%c", &boolean))
-             {
--                DBFWriteLogicalAttribute(hDBF, iRecord, i, bool);
-+                DBFWriteLogicalAttribute(hDBF, iRecord, i, boolean);
-             }
-         }
-         else
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index 3759917148..6c8642030f 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4b74a36ced94e9a7bea401157e664addcc5be251e7df7f88d4674361da012c21  shapelib-1.6.2.tar.gz
+sha256  3ff5ead18ca6d2fe249f0e80b361e1ad6782165115268ed4a58c780a60c1e0eb  shapelib-1.6.3.tar.gz
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  LICENSE-LGPL
 sha256  3f46082162242563bf4f43b091871cb19064bc5a398c6d2b024f6b64c6710516  LICENSE-MIT
 sha256  15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 08bf3c9f94..c1478caf3a 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.6.2
+SHAPELIB_VERSION = 1.6.3
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
