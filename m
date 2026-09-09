Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C0C79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 12:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D4B4606D3;
	Wed,  9 Sep 2026 12:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwMYCjMa2gZ1; Wed,  9 Sep 2026 12:39:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5898460756
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788957578;
	b=Oehkj7c6VvVliQBWgjZkpwvatHrb71tr5m9ao1CBE+WyNvUiadgchpRr2wjLBIg+oR6b
	 o343kXGGj9Wia2Gp+8lMHps4iPBddlpdoyH+2rHuMO30BYw9S1L0eoLEUIuOpvV92LUTI
	 iBm6RadqVuDMsoczGC/l49BJePi8JxHTT6Zu/kcijIZRUQEtvH6uHQwXDWkRYzLO7/I1T
	 Ml4IwAChO5fHTsDw1f5bDYLZtKlUGdu3a9bArG5Or+/r3mvCOH64Wx61NVfKbkgtxlsb0
	 hqit80ZjDX0GlIbJfczu23zN4oQ+8eqfTHKH5Ifw3aMNfx6CJWi8gp6GuqkFC2dtfsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tTaa4xvTcZwdHxz6rZ6hPOq1yUF393jechipBwcmoAo=;
	b=FhtE+lmpHuzf2wZObZQIKEFmCkbkbG402x2pXGa2pGklGxmNJ+jGvZeipOFaagPFSNXf
	 ZKs0LcylGr+iMKQ3YLQtOQdIoD+CIoMGt8uQrgkdhbn4vSDLaIT3zf0zx8fJ/36wTLuZo
	 O2DPRBIctNKQqktZOk9F4f8qM4KPe5rbfksYbEEjTcLsm+SHKlw/2zloXX8nNDP2W9j7q
	 ylTE0eqR1rgMZYim1kMoe5E0tyf5Fgm2NeBn2nGwXb3qbDl7d5sf/GZBNp1hCFMH6MOm3
	 DRkpjorlff+kVxnxBJQaXnz9lJPt8DJQhEDXoW/Rpfe8zU/jTk2CXOqJ/PMzafos24Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788957578;
	bh=tTaa4xvTcZwdHxz6rZ6hPOq1yUF393jechipBwcmoAo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XO5OnrFEwiRAnHnPmiAfu/VXGln+5S+TAp0fEsEKGxQ6UxWIzyoMw/k7WFjplQfsW
	 SMI0fL57QjjDvlk7mIhc2la8H73+syTASSYqjlk3sxQnmoKSjFx+et2I3+nc2W0SJF
	 GNSNxIRYiP8UAuf5emuEV95npw9L6JW3B+SfpyaK1njKscqoH7cmDu1SrtJngr4Kds
	 4/kej3tMvrdm50OHHoCB8k+MTsyTukUJ+/fHNcO0v6XpyOeblMTsGICcLCXm/4mwQN
	 wOD/WDNjsLn7yY67Qg0YVII0/Y80SRFNwzv2V08heP/CA5OxQy94yxMg6zOQFhwM2Z
	 gXfZ4DC+b7P9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5898460756;
	Wed,  9 Sep 2026 12:39:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD344CC
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6BE4039C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0m20-j5gpEOv for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 12:39:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EA18440383
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788957575;
 b=ATZtIzSXnjMC/38BzG7Jgc+AzcVgG/jx2Zg6rb+yes2/8GdjJlQvcm3Khmuopy3XWnzs
 juze3cXSNPzgP/JpOiIdGcRuoRyv4k1OuTFjD2mKb1yLkQephA80SaAXKV2E6OT3J/8l9
 1sJTyB/A625y+F9TPUyAdrzgks0SAvbsBmTqrdOmfVKF/2+gMlCRsE2iTZtrHf54iUu+Z
 iKD7CtFVQyx27EDapr+ZafiVT2QT9wMCcLlQPgEVkrV3OTL8SCTlEhRZDacm4GJMmj4lt
 ROHEFY4RIj6krlRrfiKd+gUE1psoikU8QQeXeTmZFLYBCf9OMnkdy+2t425oqz2Y2RQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788957575;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 bh=29l23bPmMO1wa1bNyssBthGoKG8zo1OMbud+DujEoLQ=;
 b=j/jiGkwvomH+/DN9uhK18oPZsU0yisXsfy20qimhplScbZve6UhQut0sdlg5NZgUnESh
 dKwOXAqv/FP9ulzH05llXQXVW8vIA4BFqCuE+P40GZkrn41Gc59zSuc4IfyF2cqLY+Rr6
 yD/SPj2+dVyrn6nAB1uIIvSyT83DGv8usOncfT4cNt4ykoW/KTu46w07KI+gNA7eG2TIy
 ZEQ4YTwYN/5WLqOdOutZk3d9PY+YK/Qh8lPF4I6VZv6e8fd30GheTINV2HYHC6AQfj2Ei
 37kIHLJRjieV4biOych02v9bbDMtYsqRxVJd+Gn8aZtn5sfdh7bMCVMtt/rvsAvNNuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=thewebers.ws; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="QLUVBd/K"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QLUVBd/K
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA18440383
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:34 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4be497b8367so1170268b6e.2
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788957573; x=1789562373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=29l23bPmMO1wa1bNyssBthGoKG8zo1OMbud+DujEoLQ=;
 b=QLUVBd/K+jcAk/g6q0Y44bJGbr6VpXkBnPOwyhEwNboKKVZGGePHDJm6Rg6FPWtfDK
 7d0Jv4vimiIOwbnUOuHCij7D8YQnBRY98OQvuCRubw/DxvfXp6FKRKA6mYEHCpqOwPex
 7f8UVSZQRLC6lDS/56XRUGZCK74XKUdixYuP5s/rgXPmQ140iVKbB4OdCilb5Gy1UgYU
 9avYW5agwvy7cyLQiJOoBdjdYThL/qzmToJOmOtl65ELDD31w4Gnu2gAlvaegY+K1ps7
 tyFyVSE2TLXfR0YLxT9+U+sa8Ov794dSY2W0YCsHAAq7+lHSba9Bxg3JMKR8ClPYweHq
 tTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788957573; x=1789562373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=29l23bPmMO1wa1bNyssBthGoKG8zo1OMbud+DujEoLQ=;
 b=BMcYjWZ0JxNwU+G+vnv8o93v4T/k0UULYPDwN63cDj2qMhb4VlUPXdj2OSyeHPATx/
 gKOrkK4UABjDieffFHDDJS2B5kEjyicdL6a/xfP5xsOOD+rnMwu1O6MOmx7bGG3EaDAh
 yBngiVatnKA6yGT/lwTSnUidI9WApcd0w04ab04pqVd0udkEakYZbQjYss2Mn7N/idV0
 iWgVvRgbFcBKmN3ft9SgYA3Qv2qGnafNrjlRmnJB2dkrsLjmYzlw/uqU+k3Wglu010cv
 dyxsFPb0F5xnFu3BsUF7Q7icYqJ/VpCQw7LyNYXIHg/CV0cZHlV75lU4huHfiycSrvUZ
 aJyw==
X-Gm-Message-State: AFuF++nbOJaDqWxikPPxsrpWYogeC1VYIeswCF1iXZjdua3j+LtmiZen
 Zst+ilciKhR3yYFu8lN0aEz76oN9OXqX221E9bQrz1NxquFRqf7GFSWehzpySw==
X-Gm-Gg: AYBFou3IZ2s74f0ZAhNgOyrLqbWB1eW2uV48DqWQmV3wbKEM97tnHMG38afQD3tm1yI
 pnQjcuWEk/HVpXZgy8INdq5pf8zjtm2zylHHRLyNAeHhyKmc4duFdYmcvhyRbeTTpLuD/oUwB40
 +T0wAhDjtKdX6BMEHrPoGDbK4kSfRHNhxQjmZIT8iONTfsU3cp2Q08MBj13tOncTOhxNjYTBpzt
 l4edDq9F/Sy7MWqhMIa9ikA9CvKMBDEJp4IkHFJqxLOT3ZkQ4AAbi9pV11np544ea2CBiCzWqcp
 GyhynDrGT3GK/L5qLrGL2ziPb1xLFaQaiORhYT+TaJTNtbh+S9lqCnrbfqFmbCDGiRkLWabqR/8
 phq9xrepUec3U36sJOrvgwL02Y52ROwBq4bygJpp9P0rfrld+uo5VBX9jrQrvc10gohX1cuzT4h
 kBOrcEhD1F8nSZ27Ji5Yt/YxXo8Y3+BPkEYPD+fHQbp1mt4sF36Z/Gw7eR5XG5jD8wuNJhP60Qf
 v2oewVRnlWrrETgRY0kJloFkZp91LVPbUMLwEHv
X-Received: by 2002:a05:6808:5092:b0:4bd:1fd5:9595 with SMTP id
 5614622812f47-4bd1fe4e591mr10846949b6e.39.1788957573183; 
 Wed, 09 Sep 2026 05:39:33 -0700 (PDT)
Received: from penguin.lxd (138-28-90-168.fttx.imoncommunications.net.
 [138.28.90.168]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b971c8ed6asm16218585b6e.17.2026.09.09.05.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 05:39:31 -0700 (PDT)
From: Matthew Weber <matt@thewebers.ws>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr,
 Matthew Weber <matt@thewebers.ws>
Date: Wed,  9 Sep 2026 07:39:22 -0500
Message-Id: <20260909123925.29971-1-matt@thewebers.ws>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] support/scripts/check-host-bins: check
 shared libraries
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

Shared libraries installed in HOST_DIR/lib do not have a program interpreter,
so they were skipped by the existing ELF check. Detect ET_DYN ELF files as
well as executables and scan HOST_DIR/lib.

Accept $ORIGIN as a valid RPATH for shared libraries in HOST_DIR/lib, where
it resolves to the directory containing the library.

Assisted-by: GitHub Copilot [VS Code]
Signed-off-by: Matthew Weber <matt@thewebers.ws>
---
Depends on v3 of the check-host-bins series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=520240

The test script is available at:
https://gist.github.com/matthew-l-weber/34fae15a4319a81462961eadf0e31164

Review of v3 found that its new host-library check scanned only
HOST_DIR/bin and HOST_DIR/sbin. Its ELF test also required a program
interpreter, which excludes ET_DYN shared libraries in HOST_DIR/lib.

Test 3g builds a shared library in a synthetic HOST_DIR/lib with a
DT_NEEDED entry for a second library that is deliberately not installed in
HOST_DIR/lib. It verifies that check-host-bins scans the shared object and
reports the missing dependency.

Test 3j builds a shared library whose dependency is installed in the same
synthetic HOST_DIR/lib and whose RPATH is $ORIGIN. It verifies that this
valid RPATH does not produce an RPATH diagnostic.

 support/scripts/check-host-bins | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
---
diff --git a/support/scripts/check-host-bins b/support/scripts/check-host-bins
index 098e35e592..cddf6a08b2 100755
--- a/support/scripts/check-host-bins
+++ b/support/scripts/check-host-bins
@@ -1,6 +1,6 @@
 #!/usr/bin/env bash
 
-# This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
+# This script scans $(HOST_DIR)/{bin,sbin,lib} for all ELF files, and checks
 # they have an RPATH to $(HOST_DIR)/lib if they need libraries from
 # there.
 
@@ -36,16 +36,20 @@ main() {
             printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <( find "${hostdir}"/{bin,sbin} -type f 2>/dev/null )
+    done < <( find "${hostdir}"/{bin,sbin,lib} -type f 2>/dev/null )
 
     return ${ret}
 }
 
 is_elf() {
     local f="${1}"
+    local magic
 
-    readelf -l "${f}" 2>/dev/null \
-    |grep -E 'Requesting program interpreter:' >/dev/null 2>&1
+    { read -r -N 4 magic < "${f}"; } 2>/dev/null \
+        && [ "${magic}" = $'\x7fELF' ] || return 1
+
+    readelf -h "${f}" 2>/dev/null \
+        | grep -qE 'Type:[[:space:]]+(EXEC|DYN)'
 }
 
 # This function tells whether a given ELF executable (first argument)
@@ -129,6 +133,7 @@ check_elf_has_rpath() {
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
             [ "${dir}" = "${hostdir}/lib" ] && return 0
             [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
+            [ "${dir}" = "\$ORIGIN" ] && [[ "${file}" == "${hostdir}/lib/"* ]] && return 0
             # This check is done even for builds where
             # BR2_PER_PACKAGE_DIRECTORIES is disabled. In this case,
             # PER_PACKAGE_DIR and therefore ${perpackagedir} points to
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
