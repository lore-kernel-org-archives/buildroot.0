Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B951CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 22:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B924080E;
	Thu, 15 Oct 2026 22:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ak3PXZzqCAj2; Thu, 15 Oct 2026 22:29:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D3D7E40839
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792103365;
	b=T6hwXGB4bTel6mCqij1vlgLgo/uiJsjDRzHc/NTotRXX775CfMuIuZlGulOWrtadJO+a
	 8GPPHZ7myEugdS3yfKIc3qyJsYIspVOcej9iL6x8dy81gCV7Aqby/exVshShsVwEOjHOY
	 DPmieoBzOA7FdI295FnC08SRTrkcPjnCF+cxb32Xqit52mbZW0I8s9RCb7P6GY1NGCEX0
	 IBX5W6r4mfvxbdnBxuT7JZLG1jG1E4T1/u7drFEUarQE6HP9qpKQszZltYkNpQ5eJwpCo
	 CIrW4rPofL2iCFr/iSUJ8TWgTSn5DqC3zkHGlMuXSlmN2eSXBeaMCImd5H2y3trtsgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792103365;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xg9YqabsaCe9tJBD6mICqvstmtU6p/C5Ymt++UAwX2Q=;
	b=La081SUX+6mARDxTtzgfy5H7o3GyUOr3fnSd4q+5lVTu4ZoUMDMxGGVijchi8Le0Ylza
	 XPrQ0dudWqNHe8hdg+hwo10e9MmEvNqG2jW+T5F0M/cipBlsOd55HVyaF0saa/ADCWGtt
	 fQxoqSyqw6U2wsssGzWoKsCO1e9tfzzcRyLiuVr8LYOeCik5ERKAamvzDnkLzKM9oVlf+
	 aSGeUo25kbsakl6PiqtbEnH5OIXpWdRHXq1GkQuk/64n3T5YUI5Ymb0rQUQcXcbedlJ7n
	 W+sMp8EVNN6NuSMFP6hDde08hYxsOiGfhhvdWkolt8MhpRHrLz1pJitChcSyLwkpS4Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792103364;
	bh=Xg9YqabsaCe9tJBD6mICqvstmtU6p/C5Ymt++UAwX2Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=G5H4Qfi6yAyfbO/WZLIcbIFCi8ch+rqm1OjLDUCl11mDFy8GHS7XHxK5cB6NL8rjb
	 v5FSiLoDYCzE3MfRjdXxENriVqJexczWVLLTc7JCZfR5oM+ZWbDWoBSLeDrgwXTyk8
	 pBrT4G1nPrc6b6RGXaGLOYkad67Q8VOovGqJP8PMmVAyyUktnx6VUOsmR6g4lw08EK
	 LHSlf5zng+uIi2cYg6OUodRTBjKPyG0tq0XZk0J3aQiDAbSIkEZvXWne/OEXeyTczy
	 sl4dmG37ctGPKDIczuMXydE38riu/7Qd7dWSVF61pbEAWyyjrnCOPE9tBoMeeFzXBE
	 X3ebPKnZd2aaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D7E40839;
	Thu, 15 Oct 2026 22:29:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F09E362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 22:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 650494083B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 22:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kth_7dquQSbM for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 22:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 14CAB4080E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792103362;
 b=lLEAvvCMkgIXaf+rlaELDG1MbTwk04dtd9nXtP7T7p1Q6BcJzzxdpjHvGqrwLM37EgoD
 YiEZNJGJyBUyKiJFaUz6QSb9ayvrAC0M4Mm5ORkuo6VKnMEiorJAMEU1QfyslSIY1wEDq
 NdCAK6zVIx96TJvSSuakvqRLCqo7spz7AgJpuFSDvRGCl8fff+hgyRQoYgvLdzf5BRSZ9
 LXi+qrJif5grOmcvf8etM7b+faWo8O7Wr3pDvWyrjBhTiimab1y5LWc18QICcBMIDZIRA
 Dev3gHXqJPP/yTUE23Q4l4f1h1J6R3IzTJXYxSyxFwTEdIeWTJmAkeatyRP5VPiuF/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792103362;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=D5smGI8w+i4LgUpJUN2QKM5RLrc0RWiR2w0oHpjrHc4=;
 b=pe7drlmZ7JxfB0/9iOcLBrkiS6Lr9sTr/MrP+6don/LGr8EQjcIUg8UwFOQcv9kAkuMC
 0tr/U8xH2VilSEqoDdJu3xUCf0YDwoaoOQFNtcNL6H5ogJt4Kia8YTiQ1fBT5HCJbNwpr
 gkUQRGMiszVqFYY3sqgah/rtIewamxzXVvjRCmMc2shD0/7oYpz8yVLWD6q+I9qB/wAWV
 EoQA5DOYusg9UKxhuKbMWewrBsrle/37mklXRmzNIDY22WSndz+NcOHkoOgAWYsmMKEeo
 8auNwFf1ihOBp/o9FQmr2mB9xwmORqXfqqKaAHhMNy2BAPhe9pZqlX85y8HoALhI66Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Bti6vbXp; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::564"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::564; helo=mail-pg1-x564.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14CAB4080E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 22:29:21 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id
 41be03b00d2f7-cd6028ff33fso2491085a12.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 15:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792103360; x=1792708160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=D5smGI8w+i4LgUpJUN2QKM5RLrc0RWiR2w0oHpjrHc4=;
 b=jPQ2FpLQtKn9O3baYikklE6O/obrj59hT8jaYIKpCAJYyYyy3a886A/hoEByCl3Z3h
 wIQyGI47VEN2ifCnj4+MLAUiEB7J4uwlGFqnpeCK/YTZePUAUFo8wktpAJNod0OfBIkH
 rSCT8ol+IIsb8m5WH9WaoRS8zojm/O34Iz/igIV/ejAX3E4qVa4iekNKl2r75bvdHBJF
 67EeBokSsjjcluifVjAKHPFOaZh4lwpocOgRDL0gTeBrJFFZctflWX6JaZG6rQWxHo4A
 iwbjqml7QftN4FEbcNedhpnyz4JgcwvIUy9vzYw7gWSsqXwgMjkqjoNBiBFzn5AX6ZRs
 xrlQ==
X-Gm-Message-State: AFq9FYJ7CiO4FQtO2b2ndO50KeYE4a0q+bhl318b+0HOVimeOyh5qSlv
 U9xNH21CegEq/iGImbNRh6trwsJlzIz59JAx/LOtHTVqdmQ5rcbwpb5odUSJB3Ql53Lh9f/tPKN
 HoZ+vevSxpVe1xqXZ6DsyU/k/xT/rfAGZSLkH+NZMWzGJiTQ84F5RbJ2T3vX11Dm4jL9x/RUhU1
 Y8nVhKJOWxTKDzk+Z5Zz4TleNeMyh1sKIRkDMG0cg3pmB8SFPxEa8Ahgw3r2w0XvMr/LufXAwJS
 rguQ6GkAlkLdnk=
X-Gm-Gg: AYBFou3xBJZhzHay5wijTIV2F4NhL9uZh235youJTgmTr1kil9WoPRLzqS9KW3dCd2j
 J7YTfNs18oIyw/W54goEcAfCKXHgUzHG2Kzz389FV0dJgzm4bjk7SMIsdjpNlQOXd4E7O2U+FAx
 ZnNHnkOgYK4O0FTj7wZL5m2l/GGG9rhiB9aCR8HHCfN1Y22mqdhUaq4hnFrZxVProlwnpe9jTRF
 jx6jQN8U4wsJT0qLbjZ2WdqbfXLWb1dhjQzqC9Lls6o/J+UEY0xZWc21elqY+4MiP8t6zhm24t1
 +aJ52Wi/c6AVNpVRGDplx+mjYnBX3Cr6m4tl0I5M1irJq/fHdK5Of0M+Sgy366Ehi2TCiE5aGIC
 W1GZoUrawLaXIq7L0YyYu73wAMIIPgXx9efk2Pqq3PYcxaxb3CaQc3XzzO8NXArpiDRn5b3mZ9z
 w3HHDHkccB5MM5fvaIQSkkUI6biEhnG6U6u4MA5A==
X-Received: by 2002:a17:90b:524f:b0:3a8:de1:db07 with SMTP id
 98e67ed59e1d1-3ab3a239c16mr17315467a91.5.1792103359252; 
 Thu, 15 Oct 2026 15:29:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3acc9940511sm103609a91.1.2026.10.15.15.29.18
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2026 15:29:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-139b62317d0so21168761c88.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 15:29:17 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0d:b0:150:c9c5:1ca1 with SMTP id
 a92af1059eb24-16a62600f1cmr31903283c88.18.1792103356404; 
 Thu, 15 Oct 2026 15:29:16 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0d:b0:150:c9c5:1ca1 with SMTP id
 a92af1059eb24-16a62600f1cmr31903247c88.18.1792103355717; 
 Thu, 15 Oct 2026 15:29:15 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-18319d3b880sm431574c88.10.2026.10.15.15.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 15:29:15 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id DEA7F498; Thu, 15 Oct 2026 15:29:13 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Cc: Markus Mayer <markus.mayer@broadcom.com>
Date: Thu, 15 Oct 2026 15:29:05 -0700
Message-ID: <20261015222908.760160-1-markus.mayer@broadcom.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2] package/linux-tools/linux-tool-perf.mk.in:
 fix doc build issue
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <markus.mayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Address potential document build issue when BR2_PER_PACKAGE_DIRECTORIES
is enabled.

The perf package wants to prevent the documentation from being built,
since it won't be installed anyway. The trick is to create an empty
GNUmakefile in the proper place. It did this by using a POST_PATCH hook.

The reason this approach works when BR2_PER_PACKAGE_DIRECTORIES is off
is that the build system ensures only one package builds at a time, so
Linux's "extract" stage and Linux Tool's "patch" stage can never execute
in parallel.

However, with per-package builds enabled, there is no guarantee that
Linux has finished extracting by the time the linux-tool's POST_PATCH
hook runs. This means the creation of GNUmakefile could silently be
skipped if that portion of the source code hadn't been extracted yet.
If, in addition to this, asciidoc happened to be installed on the build
host (/usr/bin/asciidoc), perf would detect this and enable the doc
build stage. At actual build time, it would use host-python3 (not the
host's system Python), which does NOT have asciidoc, and the build would
fail.

  INSTALL libperf_headers
  SYSHDR  /local/users/jenkins/workspace/[...]/libperf/arch/[...]/unistd_64.h
  INSTALL libbpf_headers
fatal: not a git repository: '.'
  ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-amd-ibs.xml
fatal: not a git repository: '.'
[...]
  ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-data.xml
/local/users/jenkins/workspace/buildroot/[...]/host/bin/python3:
No module named asciidoc
make[5]: *** [Makefile:275: [...]/perf-data.xml] Error 1

Turning the POST_PATCH hook into a PRE_CONFIGURE hook solves this timing
problem and guarantees that the "fake" GNUmakefile can be injected into
$(LINUX_DIR)/tools/perf/Documentation as intended.

Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

The primary reason for v2 is the updated email address. While I was at it, I
made the comment a little clearer. The actual code change is identical to
before.

https://lists.buildroot.org/pipermail/buildroot/2026-September/810498.html

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 8c91c2cc6b0f..3271fd5683eb 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -141,12 +141,17 @@ endif
 # distributions.
 # We name it 'GNUmakefile' so that GNU make will use it instead of
 # the existing 'Makefile'.
+#
+# This must be a PRE_CONFIGURE hook, not a POST_PATCH hook. Only the
+# configure step is ordered after "linux" (via LINUX_TOOLS_DEPENDENCIES).
+# For a POST_PATCH hook, tools/perf/Documentation/Makefile is not
+# guaranteed to exist yet.
 define PERF_DISABLE_DOCUMENTATION
 	if [ -f $(LINUX_DIR)/tools/perf/Documentation/Makefile ]; then \
 		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
-LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+LINUX_TOOLS_PRE_CONFIGURE_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
