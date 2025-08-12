Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B9EC87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 06:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F420844FD;
	Tue, 12 Aug 2025 06:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyQ6eDJpq2fi; Tue, 12 Aug 2025 06:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5A3844F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C5A3844F9;
	Tue, 12 Aug 2025 06:09:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25023183
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2271F844FC
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sic69_ledZPq for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 06:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C68384503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C68384503
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C68384503
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:09:14 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b423b13e2c3so3948963a12.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 23:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978953; x=1755583753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jOONE5oA6yw9uC8Hi0zAO00Ol5Bxkmr2WEdJhY4myxY=;
 b=Zfmo/TIG7j0JjS4dDNXC6UamU6JK5YIe4SGoWrhKYsmh8SxyU8KjyE1pVV5Vb2KfxU
 +5PBvpnuVQq8n0vvGdxjdJKS6WmeZLyEonRZMvj21bmWaJLDBEtPt8d6P0c0MU+p4NHD
 7QbuWxwQtRBDzvcG4dxttl+5+A3zs38HVjAniezMlFkG0NaZABDf4Homq5jN5Ta704aL
 AEd14FsDLyHubx62ans1GZ+yDx0aiY66lpHL0qEHbPuC0h1ukp5s5DlppTUm+foLCgtk
 UQdrO+IsZXxAZdqg6mjeG5NNZMuw+zBIfcnL3o9DUeYyHboR4zh+ElAcyr6edftpiTk/
 JUgA==
X-Gm-Message-State: AOJu0YwAn1zxveQoDKe67PNJGGkFdYNjn66qcAaOs6ZJWTUzlJ5XekBw
 b3yIlLKrv5wf6AIsGPRe0alKtYgH9l+n1bUX/dWO1QHeVOOgI6Xf4srfFmYbc6bM
X-Gm-Gg: ASbGncsSVyCruIh7bFWfUJWFqN0EmZMbOmDeX0GtIcTGi1EJdOBZvIlqCmORTmhqRnR
 8QfBH263UT5oqEIEVA9JTwDd0cRbTiTm8ypmvZZ/Qc7bZVHLUzI+qpN2tQKgFwydDb39poDSyzy
 Xp/ECxWZ46kZP1BpAl2qszSN/Lp2kfhY/dLoyWlRiCaGRMNhDmpyP/Ey08E9LBQz4dSOqXo+/QF
 QcnDOjV8zbJe9HUaaOJxNIr9i4c7/T+eO4PyKzGTWmEmWN7SvUoa31lLJi3UtGwyu8m84DjEqep
 aGWGJ7kd5EsTcNs7uFz45pdob7PVi7RyInQHpNT2MyuimCsB63/K35nSiPPi4/gWoR8dE84OnTI
 gODZ6MoLEaYf2nbFdCVJSFYnaz9qw8zJjL1kgEkyo5i3rdWwRVUHZpzw4pvlVd148VLV923scPw
 Zm1oy7blFIBgOb1/2F
X-Google-Smtp-Source: AGHT+IEV3UYREZGGo4JfgJYvJdWH8Fh4Cs5QfWpqmiG0mCfDN5g57loHMptyqNpKmxGcQmQW9tji4A==
X-Received: by 2002:a17:903:983:b0:240:80f:228e with SMTP id
 d9443c01a7336-242c22621f3mr225245945ad.52.1754978953183; 
 Mon, 11 Aug 2025 23:09:13 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f101d1sm286774945ad.62.2025.08.11.23.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 23:09:12 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 23:09:09 -0700
Message-Id: <20250812060909.1185349-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754978953; x=1755583753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jOONE5oA6yw9uC8Hi0zAO00Ol5Bxkmr2WEdJhY4myxY=;
 b=MC5S8UGhCsnEtrDHUA6cvvSP+pHQMpxKqHaaJ1j+nfe9djgiMOTczbykX2b/jM0fNf
 EGphXyKcL0qYN3ehkvWUyre84BPB8o7+ZL9xpNFwo+MAF7AlvBlANoexPqvCmf54R0IX
 +47fin3300Puq1vw9m/LFVi3IDaj+ACdpD5jgYNSDRDWEQa9vr3IlMRuE+M+WawFTUxQ
 i2moR7tzm46bqZcxTH9WhrPqudrAIsvQHV4UHcuAGK3Ijane/NSU2I8NWtIrv46Y6uwd
 D4dudspXqBwckHlQbN8GppaX6u/3puVsDzSNVfr6EYkuzldQ5egEjO2Nd3yJWbdwQ0h3
 tzLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MC5S8UGh
Subject: [Buildroot] [PATCH 1/1] package/nut: bump to version 2.8.4
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

Release notes:
https://github.com/networkupstools/nut/releases/tag/v2.8.4

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/nut/nut.hash | 4 ++--
 package/nut/nut.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 7346070f77..0d78324818 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,5 +1,5 @@
-# From https://github.com/networkupstools/nut/releases/download/v2.8.3/nut-2.8.3.tar.gz.sha256
-sha256  d6ca17f0b39003bac7649eb17ab4a713e4d5fcaa8fd1aedca28357d59df095ed  nut-2.8.3.tar.gz
+# From https://github.com/networkupstools/nut/releases/download/v2.8.4/nut-2.8.4.tar.gz.sha256
+sha256  0130ba82ea79f04ba4f34c5249a85943977efd984ed7df6aec1a518d5a3594f8  nut-2.8.4.tar.gz
 
 # Locally computed
 sha256  40885775f43463c404d74bbd00a59fac6c0fe73f838d4520472d721917412577  COPYING
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 379f31bef2..4fc461a993 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUT_VERSION = 2.8.3
+NUT_VERSION = 2.8.4
 NUT_SITE = https://github.com/networkupstools/nut/releases/download/v$(NUT_VERSION)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
