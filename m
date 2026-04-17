Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25471F4369F
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 13:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 985B960DDB;
	Fri, 17 Apr 2026 13:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCi8yvKJQ7lh; Fri, 17 Apr 2026 13:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD0260DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776431496;
	bh=K69LuQOixCuGscSt+DwcIdBc7LDfvjZ67oOLbLO2Sl0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nUbDnIlefQyqHryKJaXTNFTWl27R6dXQqOlnfEs9tmrn8PO90Wdh8MLYGRsFMT3pi
	 +hKu/sFoxRbht31uDotYjj/y8gKpfz81LzXAj326QEW/MBcvBLo3r816xUGqOIQ89O
	 PSEULtuKmlH5QFoXtMpiW2LLcqkrzHjr1Jd9pWgD+MkSd+34QazfV8MsmFf03P/HkY
	 lHPrDl5FDF1IgZnfSX6F6LHlB0EO2eBE+pl+kM9cE7eIN3khvDfbXin6F09t6Tuy7h
	 NWZMOV0UpShfzfJzWvWfuxb6PLo5LbwksT602QKQTi3wiK8g9CjUCdm9N920dKbC50
	 WE2kqUrTVYxbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD0260DD6;
	Fri, 17 Apr 2026 13:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29BD8270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 13:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B67760DD6
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 13:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGumBlkzdObm for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 13:11:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BB4060DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB4060DD5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BB4060DD5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 13:11:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so9109795e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 06:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776431491; x=1777036291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFTmFHhAHorjSlx3iB6tBf6HF3NnHSl8uxx/DxAKDDo=;
 b=Uxk4G+cFKriX/mvN09UrV0Lj0EVHGZCmKAZMzNLIp6BjjvL/YhK/7dJ3j/YwhWb3Yp
 R0dZSKZyJUh+jZ8hhAtmNCn53tmEPDSeeDV8cUpeTmWUep0j0swABEJRTP0MyL/6EjPy
 b3M6LMLxMia4IVpjX57CSJaCKpTSdEksi8OVy9eUGhYLCd2En/z018Dlfjd8xuahiHwp
 PyRqw4sMhtA/ZFfy88KMZqKZD0DFfSz4oLsM3gBstQk3jdyq5nFvcLx7Zkndw7LqkWGC
 IoTWqh6ooUuQ8u7XOC/fe95uMnpufWMYfFB5giNxn/QVFmFs32dtac2CRrOxobQsucEm
 R0NA==
X-Gm-Message-State: AOJu0YzphPJe9ssMy/QIMfnYn+M/J90i33J+gw223YvNmePEaJupnpkm
 IiOH6AHXGUerUVE5VEGmgi7Mu896Fy0lGg9cYcLeFGZeWfEjm+2Bya7nEIQtts2awQFVWNZkODM
 R5aD5
X-Gm-Gg: AeBDietwhrxJVEYqR61+QdVQLGimr0wmDdVrpqYQ7S6ZMZxCCS1wQkN3b85Ps0rrUyJ
 lFO01dwBWulGkmCrkPGOLqvo07ZgdnpsvD4B4MUpySUY50hJuRulat3gyKJfWG/Uo09RwrxTD3t
 sNN/G/1QlrezktNLaN/d5bMSfKbIvMTzSQ/CZLw+b8pP5wHuBsETUs9cDlY/VZzMaIAmkbJenPZ
 R1iiVI5Cz9lVZrfJreHGYiMycrR5ZJb9Wj97nv04sWx8awDlH3fm753sN8qNnMsW4+aoMB3OZyF
 XnquhnUSuO5BX3gU2GFdhHKu2n964VVqHRCe2yLHZpqPZfPK+vL/QRtHJly6isIkCgZst86cc8n
 ou6GUsVnkhABmQXm0LbSTCY3EL7r/bdVHJBRahJm+0F1Id+dcHaFIy5hyfoXx8Nnr8d+hNXvXpw
 mBhTt2H8dCiEI2dy39POgyR1NrxqM=
X-Received: by 2002:a05:600d:8408:b0:486:ff92:63e5 with SMTP id
 5b1f17b1804b1-488fb73dc6fmr33174965e9.6.1776431491153; 
 Fri, 17 Apr 2026 06:11:31 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc189f2esm72157675e9.7.2026.04.17.06.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 06:11:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 17 Apr 2026 15:11:29 +0200
Message-ID: <20260417131129.220250-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776431491; x=1777036291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dFTmFHhAHorjSlx3iB6tBf6HF3NnHSl8uxx/DxAKDDo=;
 b=UpW89zH74zSnlQ/MK9FUWJPTdvCPs6SddZjDDf6o3fOpu6L2MQyy6BHZ02hw/U6U7K
 mZIX5LVYoyTbBXyh3+v2bsiUQ8udAuKvKpQFNaOGM4f+BZfTnAykgVegACd1yhxI8K6u
 sZbz2OK4SJWqhrZ1T1XTaXBObrvoV3D7719tS58KEHYY9xpaVuDruMP72P4WaMdySe+7
 XyPHDn6h7Y24x5HhOAmMs1J6zameqxPIFgx2cTZv3MESpTkNOENr1saMC1sfKjRn5P76
 zTd1/T1CcyJqz9k8hJ6dgOKob6yeZ7Hhf1eGON+k5nK2G/Ux8sRkaiY3nqN7V7Di/WCf
 024w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UpW89zH7
Subject: [Buildroot] [PATCH 2025.02.x] package/freetype: patch CVE-2026-23865
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerability:

- CVE-2026-23865:
    An integer overflow in the tt_var_load_item_variation_store function
    of the Freetype library in versions 2.13.2 and 2.13.3 may allow for an
    out of bounds read operation when parsing HVAR/VVAR/MVAR tables in
    OpenType variable fonts. This issue is fixed in version 2.14.2.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2026-23865
  - https://gitlab.freedesktop.org/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...r-overflow-in-array-size-computation.patch | 54 +++++++++++++++++++
 package/freetype/freetype.mk                  |  3 ++
 2 files changed, 57 insertions(+)
 create mode 100644 package/freetype/0001-Check-for-overflow-in-array-size-computation.patch

diff --git a/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch b/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch
new file mode 100644
index 0000000000..6951880854
--- /dev/null
+++ b/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch
@@ -0,0 +1,54 @@
+From fc85a255849229c024c8e65f536fe1875d84841c Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 3 Jan 2026 08:07:57 +0100
+Subject: [PATCH] [ttgxvar] Check for overflow in array size computation.
+
+Problem reported and analyzed by povcfe <povcfe2sec@gmail.com>.
+
+Fixes issue #1382.
+
+* src/truetype/ttgxvar.c (tt_var_load_item_variation_store): Do it.
+
+CVE: CVE-2026-23865
+Upstream: https://gitlab.freedesktop.org/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/truetype/ttgxvar.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgxvar.c b/src/truetype/ttgxvar.c
+index 2ff40c9e8..96ddc04c8 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -609,6 +609,7 @@
+       FT_UShort  word_delta_count;
+       FT_UInt    region_idx_count;
+       FT_UInt    per_region_size;
++      FT_UInt    delta_set_size;
+ 
+ 
+       if ( FT_STREAM_SEEK( offset + dataOffsetArray[i] ) )
+@@ -666,7 +667,19 @@
+       if ( long_words )
+         per_region_size *= 2;
+ 
+-      if ( FT_NEW_ARRAY( varData->deltaSet, per_region_size * item_count ) )
++      /* Check for overflow (we actually test whether the     */
++      /* multiplication of two unsigned values wraps around). */
++      delta_set_size = per_region_size * item_count;
++      if ( per_region_size                                &&
++           delta_set_size / per_region_size != item_count )
++      {
++        FT_TRACE2(( "tt_var_load_item_variation_store:"
++                    " bad delta set array size\n" ));
++        error = FT_THROW( Array_Too_Large );
++        goto Exit;
++      }
++
++      if ( FT_NEW_ARRAY( varData->deltaSet, delta_set_size ) )
+         goto Exit;
+       if ( FT_Stream_Read( stream,
+                            varData->deltaSet,
+-- 
+GitLab
+
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ad8cd00ec8..51b0471d4f 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -15,6 +15,9 @@ FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
+# 0001-Check-for-overflow-in-array-size-computation.patch
+FREETYPE_IGNORE_CVES += CVE-2026-23865
+
 # harfbuzz already depends on freetype so disable harfbuzz in freetype to avoid
 # a circular dependency
 FREETYPE_CONF_OPTS = --without-harfbuzz
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
