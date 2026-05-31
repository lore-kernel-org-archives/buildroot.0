Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8F9CD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 19:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B303A41F81;
	Sun, 31 May 2026 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYEqidKYLpbA; Sun, 31 May 2026 19:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0440F41E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780256867;
	bh=n9RfZEm5niYDln+P0bWKHHKSjTQAzhl0bqoRqBsumX8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PKWFR07KMOlTigpR81TC8odCXWrFG8GUA/lM1BOSymgalwHw/2GkA8fZs9C7uVKu8
	 ARx3/fRfj0W5xXgfGappyNkjE//FHVlS89BglG1uO/FjyVFGbv+n176gyzjddz1GZi
	 z+AkIlCCgwf5I11n2w33Qaj4a1eJJyyiYVW0U72ugK29PpKApMTLKr1fsd8K7JUcMU
	 HXr5HZ4IbRta5hq/Ha5CMiu5d1v+CcsyeRJ1tfgFqv7LF+e3Tc8Bz49wOOkki2qfRw
	 fza4X7pCFF8ofStnJnlhflEMGUmAg+o04oojLTaL/Y6bopi1lJXbsWMxwi416MavdX
	 JMBvLqBPmpauQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0440F41E7A;
	Sun, 31 May 2026 19:47:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F313AF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 19:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9322608F9
 for <buildroot@buildroot.org>; Sun, 31 May 2026 19:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiWuCfFYwGaV for <buildroot@buildroot.org>;
 Sun, 31 May 2026 19:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A24E160F2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A24E160F2D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A24E160F2D
 for <buildroot@buildroot.org>; Sun, 31 May 2026 19:47:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso97882485e9.0
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780256862; x=1780861662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsPebawF2nsWW75fZE0vfKIzuyKdawE9fpvYCFHGJsA=;
 b=JzARhQiliuWs/yg1ZeYuauk8TDe1//wkcjuXam6Mcp+F3g2HZwyiZgiRvKMAUUgcWE
 eZ3vy5oaLTrMgS96S8sClkNSp2wKbwWS+05zlpx7X2pnr7g/YhfpUIx0FUeDq4XCA7dN
 VJn7G1WfnjH/7/7atBzjTK6jRe9XyX9WwHdkENIkkfh/r2Zqug98qUd9bSe2fie8O8xH
 glcYH7dYdskmoRjixtb8V3uLhyjrNJwjDgOWKuLgeBseLcijvCdf9Q20SqhVDsmuMxH8
 CPrMIr7u6Eaq/v3672TfwiyEmVvFXvUnJPlpY+UNSgrMnVZpJ6BlEGweOLwomMjUpy/J
 fK6A==
X-Gm-Message-State: AOJu0YxIgBByB267yj97OOxUJz3z59bKjlHkmEAiW0chUb6IEMscaFDc
 3o8uGED0kMw1y2v8giISfFDQpPcMFSkbrRLT9MDCWeFJuh9SUExbOyPQZzP8qvc24KqDkkYNoOY
 VHexY
X-Gm-Gg: Acq92OGwNPKSMGb8i0423zCzeAoBGQ7SPg7fHCKWrAYIziVTUSBsx83ln5BxdENXyXY
 7YFDt+O3oys00Q/wtFXQxlD7CV6GHRPjj7GZV+Vk35TlgiPAOoDcnSyYXlvC9KwzpAf0rHAExLF
 v5ZBKkqInP1vtdcWtQZFj8mzWDEm0jHSG4dZ8qMWgS3oq+gnguK66GPqYYBNy+9i1/8KOPdD5fG
 2MgSSzFricksEhTKbqR9BgbymYjmUoN36rAD9BxsKCy8rRg6z2pqbZrPZTEBaT5mG96jIBS6zdO
 0e+8s9hTNqh3VOeG3mAt0i+iXUv63miUmz/8ziJQDh5B3YO7dshxM8FtYR0HDjGujTC+oLGEPK4
 H8l+JkH4voAv4O+aOsAiA6yvrmM0tt09pr6+SfoIrQfKVSccbdH2zJP3wcQdacgXnADU8X51ABM
 7uWHT7c8yQ5B1MvqUChREi3pyA1CEVojtjmgrH5h9Bevae8e7Sc37zQnAuXs8V9gHAwh9XkTOZX
 wh0NvFp+DZtd2touc76wRgRPFsLcl9NgGVDVcTMsB49ZCo=
X-Received: by 2002:a05:600d:11:b0:490:3d62:f5e1 with SMTP id
 5b1f17b1804b1-490a2963b8emr133291825e9.22.1780256861992; 
 Sun, 31 May 2026 12:47:41 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c3081sm20110598f8f.15.2026.05.31.12.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 12:47:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 31 May 2026 21:47:38 +0200
Message-ID: <20260531194738.1379915-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780256862; x=1780861662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AsPebawF2nsWW75fZE0vfKIzuyKdawE9fpvYCFHGJsA=;
 b=GYBos8ln0mLjh/q30EWY3rbz/8Zz5vXn36UhL1vgb8sDE8hHGfXsccH9bwoSpfF3at
 VEEvuc48d6UYtNWDxpCbW/4UkYenPpEZSGtt39UYoQXxvkoOiBM5K6pSuyPS4LrZzHUN
 4CCz8wqlLMCOcz9MscF7Qjow0qJaesVW5wzrQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=GYBos8ln
Subject: [Buildroot] [PATCH] support/testing: TestXfs: fix build on Gitlab
 runners
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our CI uses "/builds/buildroot.org/buildroot" as build directory.
Unlikely the xfsprogs build system misbehave when a directory in
the path contain ".o".

While generating .ltdep, the sed command used to convert object file
(.o) to libtool object(.lo) replace buildroot.org by buildroot.lorg.

  .ltdep: $(CFILES) $(HFILES)
    $(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep

Building libfrog
    [CC]     gen_crc32table
    [GENERATE] crc32table.h
gmake[4]: *** No rule to make target '/builds/buildroot.lorg/buildroot/test-output/TestXfs/host/include/urcu.h', needed by 'avl64.lo'.  Stop.

Update the sed command to avoid this effect.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335648

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0002-include-buildrules-fix-ltdep.patch   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/xfsprogs/0002-include-buildrules-fix-ltdep.patch

diff --git a/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch b/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch
new file mode 100644
index 0000000000..f17dc51edb
--- /dev/null
+++ b/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch
@@ -0,0 +1,48 @@
+From cddc06c0eef874c01293cdb6e60090771a347c56 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 31 May 2026 21:08:09 +0200
+Subject: [PATCH] include/buildrules: fix ltdep
+
+Our CI uses "/builds/buildroot.org/buildroot" as build directory.
+Unlikely the xfsprogs build system misbehave when a directory in
+the path contain ".o".
+
+While generating .ltdep, the sed command used to convert object file
+(.o) to libtool object (.lo) replace buildroot.org by buildroot.lorg.
+
+  .ltdep: $(CFILES) $(HFILES)
+    $(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep
+
+Building libfrog
+    [CC]     gen_crc32table
+    [GENERATE] crc32table.h
+gmake[4]: *** No rule to make target '/builds/buildroot.lorg/buildroot/test-output/TestXfs/host/include/urcu.h', needed by 'avl64.lo'.  Stop.
+
+Update the sed command to avoid this effect.
+
+Upstream: https://lore.kernel.org/linux-xfs/20260531194553.1378795-1-romain.naour@smile.fr/T/#u
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335648
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ include/buildrules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/buildrules b/include/buildrules
+index 871e92db..3fabbe5a 100644
+--- a/include/buildrules
++++ b/include/buildrules
+@@ -140,7 +140,7 @@ rmltdep:
+ 	$(Q)rm -f .ltdep
+ 
+ .ltdep: $(CFILES) $(HFILES)
+-	$(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep
++	$(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o:,\1.lo:,' > .ltdep
+ 
+ depend: rmdep .dep
+ 
+-- 
+2.54.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
