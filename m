Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB179C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 20:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AFB860797;
	Sat, 13 Aug 2022 20:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AFB860797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7h0wFou1XHXV; Sat, 13 Aug 2022 20:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6573460746;
	Sat, 13 Aug 2022 20:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6573460746
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDA471BF41A
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 20:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A85E760746
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 20:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85E760746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8lfMJwr0kQd for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 20:20:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D497606DC
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D497606DC
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 20:20:25 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so411692wms.0
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 13:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ju962WCB9BZtavVSdQpIW7kE0bIPLZ3cUWBRJtMpNFk=;
 b=IVB3v/qpxZTAHhVcGfYeUQns2woDcYw8nqRDdzaTPXlnLRLoDxjZWFAbOLqcq0nZGl
 27YxdOpshCV7+XIkrHi0wlRSxT2qZZ98RP5r25cKiSO/G1nuODCLDUswMwv00R/c1+aF
 XoI8fgXcV1Vrc6zoLK8y+znpKAKBjVsJhqRqbCccj12LvPBsKVC8vjA81yHyyc2gJlFe
 NItqH/Q9MF/yacYqgyhkEPDkI9wrlAuckB3FF27WqiG+U6PMsmhqgDsMYZds4BMfi3U0
 jiQ2TsHtC3ZAfq4L7T3RMmEBf0GdBkvbsi62IW+hXeXVyGCJJl9qYF5HcXN76wnq9HT5
 jleA==
X-Gm-Message-State: ACgBeo2DfOI2ULmZzCUeAkFfgqtgi7rNHqdHiEdWNCRnn9xvnbAeAvOB
 rOXTiZMLgaib/kRF1qDvcl0cIILGdN4=
X-Google-Smtp-Source: AA6agR7BjUUqC/SOqIhJFSRgQBKQfYBjn2pAJHaQUr53FNxyzVUXBiZAPQzt/awJhtjfYW6M3rBq3w==
X-Received: by 2002:a05:600c:3495:b0:3a3:1fab:d01e with SMTP id
 a21-20020a05600c349500b003a31fabd01emr12711292wmq.150.1660422023311; 
 Sat, 13 Aug 2022 13:20:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00f2efd4a33b7d07e8.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:f2ef:d4a3:3b7d:7e8])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adfeb85000000b002216d6f8ad6sm2814377wrn.2.2022.08.13.13.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 13:20:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 22:20:18 +0200
Message-Id: <20220813202018.2420987-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ju962WCB9BZtavVSdQpIW7kE0bIPLZ3cUWBRJtMpNFk=;
 b=BzHZ7hIt0NHyhTuHutyjOQCUbN5LsLQqQ07f32e0ZqDKxA+2D5hhuVfU7hhJGMxD64
 7tSuIaYkOMumL27ruDzZQvIhQh2wbG7NEzQo+X7gjGcZAg7Wtk/NE61tYyvGjWB4BhVy
 8X8qChcfN5YCBuDmr/zUES8KuKjIL/zBo+94zSh02mPDIUAoSCLfRY9goxrVJj78u744
 +tAqegZMft4+TqsZJ57ZGvi/VOA9Po5ycjRqnc7OtNVIYxvDIiOmnZNfmLbaVp32iadF
 WZR3+arYiyPi24T/dZK1k1Ohlr8cNSK7vGxhC04Dl8WwkADbA6RDlmeYdJHrFf5SuidT
 8WBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BzHZ7hIt
Subject: [Buildroot] [PATCH 1/1] package/lshw: fix build with gcc 4.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since commit
72a009fa98a37825624f70dc2a1cf825a5999a0a:

hw.cc: In member function 'long long int hw::value::asInteger() const':
hw.cc:2462:36: error: 'stoll' was not declared in this scope
       return stoll(This->s, NULL, 0);
                                    ^

Fixes:
 - http://autobuild.buildroot.org/results/162e438e3f9aab9310fdbc3cf7529144ce7cb50e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-error-when-g-version-is-less-than-5.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch

diff --git a/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch b/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch
new file mode 100644
index 0000000000..f15c8bc52c
--- /dev/null
+++ b/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch
@@ -0,0 +1,65 @@
+From 383c80bf486f806438bb11a9c9a9567407cd47ab Mon Sep 17 00:00:00 2001
+From: "E.V.Acacia" <624758472@qq.com>
+Date: Fri, 3 Sep 2021 14:19:37 +0800
+Subject: [PATCH] solve: Compile error when gcc version is less than 5
+
+[Retrieved from:
+https://github.com/lyonel/lshw/pull/70/commits/383c80bf486f806438bb11a9c9a9567407cd47ab]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/core/cpuinfo.cc | 8 ++++----
+ src/core/hw.cc      | 2 +-
+ src/core/spd.cc     | 4 ++--
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/core/cpuinfo.cc b/src/core/cpuinfo.cc
+index 9e41a421..ed1c4164 100644
+--- a/src/core/cpuinfo.cc
++++ b/src/core/cpuinfo.cc
+@@ -465,13 +465,13 @@ string value)
+     if (id == "model name")
+       cpu->setProduct(value);
+     if (id == "microcode")
+-      cpu->setConfig(id, stoll(value, NULL, 0));
++      cpu->setConfig(id, strtoll(value.c_str(), NULL, 0));
+     if (id == "cpu family")
+-      cpu->addHint(id, stoll(value, NULL, 0));
++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
+     if (id == "model")
+-      cpu->addHint(id, stoll(value, NULL, 0));
++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
+     if (id == "stepping")
+-      cpu->addHint(id, stoll(value, NULL, 0));
++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
+ 
+     family = cpu->getHint("cpu family");
+     model = cpu->getHint("model");
+diff --git a/src/core/hw.cc b/src/core/hw.cc
+index 1c1dad46..b266a863 100644
+--- a/src/core/hw.cc
++++ b/src/core/hw.cc
+@@ -2459,7 +2459,7 @@ long long value::asInteger() const
+   switch(This->type)
+   {
+     case hw::text:
+-      return stoll(This->s, NULL, 0);
++      return strtoll(This->s.c_str(), NULL, 0);
+     case hw::integer:
+       return This->ll;
+     case hw::boolean:
+diff --git a/src/core/spd.cc b/src/core/spd.cc
+index a304d061..2ad66b82 100644
+--- a/src/core/spd.cc
++++ b/src/core/spd.cc
+@@ -195,9 +195,9 @@ static bool scan_eeproms(hwNode & memory)
+   {
+     if (scan_eeprom(memory, namelist[i]->d_name))
+       current_bank++;
+-    free(namelist[i]);
++    delete(namelist[i]);
+   }
+-  free(namelist);
++  delete(namelist);
+ 
+   return true;
+ }
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
