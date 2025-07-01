Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9672EC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6972680DB8;
	Tue,  1 Jul 2025 20:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_SUEk-yxNyw; Tue,  1 Jul 2025 20:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D6EA80D07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D6EA80D07;
	Tue,  1 Jul 2025 20:32:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D58E128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FA4C80251
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8OMzL9mGKVE for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24E5D8499F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E5D8499F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24E5D8499F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:32:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso42644645e9.1
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 13:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751401951; x=1752006751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tuPUnp5bdQ3oMFmBm7tkVKpFKPAFt7mizJGQXH7VbV0=;
 b=Pe9Zc5CiTM0lQvmoRkFAe626hLHABR83UOSrp04w9jy6oPP89X2PeddYHOC6GMT7rS
 mC0xM4swa+CWMgrWE3PiX0GyL12dOjF78AYJtKScCB/1JwsgJ/fGKR/wxsTOYoETgjZQ
 XnYKC1aWeik40vn8OQnqQCZZrlKpjacPucZbH1orZE7G0F6IZjwrzyKGXxpjzs2nMWD1
 PBjxWu52cyfsRDmExCuWBsN1CXlL6AogQ5bnQpSKE1vrbA3DtxirnvbNl2TIV2nARyFS
 +81sMcDCG3eJd/6aCbyWhPYGqO0n1U+7h9nzmGVS141CRTrn3scG9ZQ1olgeJ+eYiv63
 5qMg==
X-Gm-Message-State: AOJu0YwuEFRvxUnNh56b8vdBCQ+bNSFwJ2mvYktDwEVJyUsig+VnJZjR
 Xvn/tIhC9ZVQVF8BnC894RqPF1u29lGRW94L+y/JnjoGTRTaVSythLm+W+3lxkeXdmCAOsJtXlE
 lTDaI
X-Gm-Gg: ASbGncsyW0l18PbAh8n8qWKdD3dQWlCHF9MjWS88GcIISMHceecs0jg/7a1SgfrnxU0
 VV0GFEL185iIdln1+SV436lY1Zsk5v6yt4896w5xy5wNJFqHEWtEJ0YtJxwnWWMdgWl8lygEv1Z
 2krfeng5Pmfy/16EdNl5KCx4LDYQ4voWr4gl1YPHNet3rr7jOffyYYrHlB0FDgMsw9YajVlIS3J
 OHMAa0TC0wl/XzRbg/9DnUDwIUrLeqwpti9l0c17XCUDccaOKBpnWPZqpW+lrCOCiLrSlEV6KCF
 K+toviWmdwTyqSDDkzji8JQDUcfnbIHoTU+JELJA3F5NpiLSLCkTBul1cxEa3YKeBtj3T/IHPXb
 pLTUS6rIM7w==
X-Google-Smtp-Source: AGHT+IHXuT7sACGaKHC1lkYwom0l32dDWC7to0izUhUdPEBw8MHY5d6n9gCMfW6H1GnjPnpJ/Is1Qg==
X-Received: by 2002:a05:600c:8718:b0:453:6150:de50 with SMTP id
 5b1f17b1804b1-454a3725a21mr4508905e9.28.1751401950504; 
 Tue, 01 Jul 2025 13:32:30 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453b35309casm18277775e9.1.2025.07.01.13.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 13:32:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue,  1 Jul 2025 22:32:28 +0200
Message-ID: <20250701203228.1075726-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751401951; x=1752006751; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tuPUnp5bdQ3oMFmBm7tkVKpFKPAFt7mizJGQXH7VbV0=;
 b=c/oBjKo0yxKGOZzy2HZI+N/PM8GX7vueQdAv0LzyrNi2QFm+PWBH/kE1b4UMKhFIjk
 VVkaRsE3wimGLuKh3bIP/I7BFJUuX1HGI7F1sxp/uTXux8KvuK+JYlU93beRUFtwl7tw
 hKt7Fnt3UEjNnWP9a4VJGAHMRMOo8O3gTISXbshjrHtaz5p/Aq0IJ1FBsrUk5bY9zC8b
 ISJrdaqVinVM79uZE+Ij8SYNkJ52bM+Nvm023OD0xTJYL5pgshCzlvxN4/2F5wIcQLxo
 Rc2agEa1wVjNU52AIMPElokQ3rjhHcGyS+ffNdVRtZH/OIIlzUW4lRkxtZXzr583tkzH
 vhkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c/oBjKo0
Subject: [Buildroot] [PATCH 1/1] package/daq: fix build with GCC14
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

The daq package fails to build with GCC14 toolchains:

```
daq_nfq.c: In function 'SetPktHdr':
daq_nfq.c:395:37: error: passing argument 2 of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
  395 |     int len = nfq_get_payload(nfad, (char**)pkt);
      |                                     ^~~~~~~~~~~
      |                                     |
      |                                     char **
```

The issue can be reproduced with the following config:

```
cat > daq.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_DAQ=y
BR2_PACKAGE_LIBDNET=y
BR2_PACKAGE_LIBNETFILTER_QUEUE=y
EOF
```

This patch port a patch taken from openembedded meta-networking [1] and
is tested with test-pkg:

```
$ ./utils/test-pkg -c daq.config -p daq
```

[1] https://layers.openembedded.org/layerindex/recipe/37594/

Fixes: https://autobuild.buildroot.org/results/c69/c69ab134463a18eec65ded836aecf89a5cb4a75c/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-fix-incompatible-pointer-type-error.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/daq/0003-daq-fix-incompatible-pointer-type-error.patch

diff --git a/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
new file mode 100644
index 0000000000..a15d325cd6
--- /dev/null
+++ b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,31 @@
+Fix daq incompatible pointer type error when gcc option
+'-Wincompatible-pointer-types is set:
+
+| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
+| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argument 2
+   of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
+|   394 |     int len = nfq_get_payload(nfad, (char**)pkt);
+|       |                                     ^~~~~~~~~~~
+|       |                                     |
+|       |                                     char **
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch?h=master
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ os-daq-modules/daq_nfq.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
+index 4de94b6..a6de2f3 100644
+--- a/os-daq-modules/daq_nfq.c
++++ b/os-daq-modules/daq_nfq.c
+@@ -391,7 +391,7 @@ static inline int SetPktHdr (
+     DAQ_PktHdr_t* hdr,
+     uint8_t** pkt
+ ) {
+-    int len = nfq_get_payload(nfad, (char**)pkt);
++    int len = nfq_get_payload(nfad, (unsigned char**)pkt);
+ 
+     if ( len <= 0 )
+         return -1;
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
