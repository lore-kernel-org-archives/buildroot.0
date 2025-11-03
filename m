Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F438CCFA08
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C37060A64;
	Mon,  3 Nov 2025 21:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYkXII9emOPu; Mon,  3 Nov 2025 21:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C81A60A68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C81A60A68;
	Mon,  3 Nov 2025 21:11:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27619462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2503C40542
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZ97NG_gI8QY for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADA6140502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADA6140502
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADA6140502
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4710683a644so38566805e9.0
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 13:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762204308; x=1762809108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5T3aa74bAtZbz6zD1kQP3Tyxs4IY4XquYglWk3M1t+0=;
 b=bQVxsq1GGBaV1lm6Ey2ZEuKZNFnV/OWSceYDUfx35hT9swhyS+pf252LEE7Jenn36m
 0cv9mQpyl9RMFihB4fdhuoKBsbZ5MrU7b56F88LSirHbXkc5aE/iRmKFiLVTp3e/SFeg
 Zi2H05euSRfmUwn+FC/AhHWDus0eu3ObEJrByQ8GIv7z3w0T5kg7mtgMLaIOfUmULf4E
 NJlwQiqU6GjxzZ5cyXcV1G8HWoJBVrcTZlUulB6Ctf4sp30CBm43zOfKZqeawEPZ5nCU
 fDSNt+TL+1V5c7sZHxR+MuCD8pWclGS54KSvZ4+C91N/4BdzKToagkz/Od4wb5Y3MAd9
 c+0w==
X-Gm-Message-State: AOJu0YyRQBSJeAVkKj240fPUI9+MdSt2UF9/8/wNQsxcP3MWNfr2jDmN
 jedJ8pHBuHDMrqc8OLCyu5jnIEQo5tEe6MDzeOE1wMVh6y8Cvo/n1QekjmgqviYidq4dzwbs0nE
 fkDk4
X-Gm-Gg: ASbGncvbvwOyFeNMKK1RGAc+rv7ULogeeW2IEsoV6iYB7A7M0w6eOHg2We96pPVu6Ck
 09p/MV6Cre+XaqOxb6aZ+BzXM7l1u3xsDCMXFBE6sJl8N/OeyDLKtPZo6ysqj/4tqjS+aQGIbYl
 cNgFaz6uQGH0bauMs2CyxdJrvnovvA3UpguIYEtXPFuUYsm7mwCO5WUgRSOZHuYFy8x4Y3Y6yEW
 5DgpTFuvA4N+6kolAoi5FtUWh9t8hqjt03UAszWZ2lkw4YC6V7Sfel0eArE+3Dija4MqSqDJ7wb
 74vX7rV0CgKH7sQUZfrW8EhmkDt+xNmTFrhzheWhIUe1JSok7ES22+sXfY/JOArlG3d1cln670L
 qR2dCR/2R1+Ypmquf1Ew0vwDyuHLav2fM3MsWMOEK0AcSdW4jytU2MNsNT6xpy+gsxDojUhUjyy
 SWirwG483QVncwPY8gQynkgoBf1A==
X-Google-Smtp-Source: AGHT+IFXNm9svSg79MlOuTgfS/5d96kyPqWw+XiSPXWdXm2piG85I7PZH/9z4rgTWGQoFeLeMYaTNA==
X-Received: by 2002:a05:600c:1589:b0:475:dc32:5600 with SMTP id
 5b1f17b1804b1-47754c542efmr5558925e9.19.1762204308168; 
 Mon, 03 Nov 2025 13:11:48 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383b45sm179630745e9.9.2025.11.03.13.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 13:11:47 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 22:11:42 +0100
Message-ID: <20251103211146.57344-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103211146.57344-1-thomas.perale@mind.be>
References: <20251103211146.57344-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762204308; x=1762809108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5T3aa74bAtZbz6zD1kQP3Tyxs4IY4XquYglWk3M1t+0=;
 b=U7YQEjkdvoQzu5YC57wI6XQfUCrbg7iby3xg29qYUm7PcLanAtmdDuXS4yg94y99ne
 M3UPBgMNVAPmcwV5teJPUqg15BLCPSVUaytFEjxIKkGkZ6YAywAQuHOkNINAFEsV4/yE
 V15o1D8y1QCx8ST0KR7svKQHObfrtDedvxQKmKPSN/hlwHB8RbPkpMKYYbjgeb6x3ErI
 3yF0usNieRl5yWhHbE4t8J+2iZjQXqTQeJiafsbhb3NU3OX2heXRkZ26UrU66XsNM4YN
 oqQxtV6xtNp8+Csk+B1UCA85pfQyb3YESyAIPX/UCl12EvhC0s1cqRRMv8Mdkv2+IuzV
 KHDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=U7YQEjkd
Subject: [Buildroot] [PATCH 2/6] support/scripts/cve.py: fix CPE matching
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

Given the following criteria: `cpe:2.3:a:oneidentitty:syslog-ng:*:*:*:*:-:*:*:*`.
The former `cpe_matches` implementation would match with the following
CPE: `cpe:2.3:a:oneidentitty:syslog-ng:4.71:*:*:*:premium:*:*:*`.

The 'hyphen' ('-') meaning is "Not Attributed" (NA) a criteria with no
attributed software edition shouldn't match with a CPE with an attributed
software edition.

This patch also create a distinct 'CPE' object that aggregate the
function specifics to CPEs like it's done for 'CVE'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve.py    | 130 ++++++++++++++++++++++++++++++--------
 support/scripts/pkg-stats |   2 +-
 2 files changed, 104 insertions(+), 28 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 5ff67585e2..25481a6367 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -39,22 +39,98 @@ ops = {
 }
 
 
-# Check if two CPE IDs match each other
-def cpe_matches(cpe1, cpe2):
-    cpe1_elems = cpe1.split(":")
-    cpe2_elems = cpe2.split(":")
+class CPE:
+    DISJOINT = 0
+    SUBSET = 1
+    SUPERSET = 2
+    EQUAL = 3
 
-    remains = filter(lambda x: x[0] not in ["*", "-"] and x[1] not in ["*", "-"] and x[0] != x[1],
-                     zip(cpe1_elems, cpe2_elems))
-    return len(list(remains)) == 0
+    ANY = '*'
+    NA = '-'
 
+    @staticmethod
+    def compareAttribute(left, right):
+        """
+        This static method compare two single attributes part of two CPE.
+
+        This is an implementation of table 6-2 of [1].
+
+        Attribute that are empty will be matched to the '*' (ANY) attribute.
+        According to [2] section 6.1.2.1.1 the empty attribute is inherited
+        from CPE22 and now bind to ANY.
 
-def cpe_product(cpe):
-    return cpe.split(':')[4]
+        The hyphen '-' bind to the NA attribute (see [2]).
 
+        [1] https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7696.pdf
+        [2] https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
+        """
+        if left == '':
+            left = CPE.ANY
+
+        if right == '':
+            right = CPE.ANY
+
+        if left == right:
+            # 1 6 9 - equals
+            return CPE.EQUAL
+        elif left == CPE.ANY:
+            # 2 3 4 - superset
+            return CPE.SUPERSET
+        elif left == CPE.NA and right == CPE.ANY:
+            # 5 - subset
+            return CPE.SUBSET
+        elif left == CPE.NA:
+            # 12 16 - disjoint
+            return CPE.DISJOINT
+        elif right == CPE.ANY:
+            # 13 15 - subset
+            return CPE.SUBSET
+        return CPE.DISJOINT
+
+    def matches(self, target) -> bool:
+        """
+        As an example let's take the example of CVE-2023-... for syslog-ng.
+        One of the node as the following CPE criteria matched with the Buildroot CPE:
+
+        cpe:2.3:a:oneidentitty:syslog-ng:*:*:*:*:-:*:*:*
+        cpe:2.3:a:oneidentitty:syslog-ng:4.71:*:*:*:*:*:*:*
+
+        vendor: EQUAL (3)
+        product: EQUAL (3)
+        version: SUPERSET (2)
+        update: EQUAL (3)
+        edition: EQUAL (3)
+        language: EQUAL (3)
+        sw_edition: SUBSET (1)
+        ...
+
+        This operation results in the two CPE matching.
+        """
+        if not isinstance(target, CPE):
+            target = CPE(target)
 
-def cpe_version(cpe):
-    return cpe.split(':')[5]
+        for selfAttribute, targetAttribute in zip(self.parts, target.parts):
+            if CPE.compareAttribute(selfAttribute, targetAttribute) == CPE.DISJOINT:
+                return False
+
+        return True
+
+    def __str__(self):
+        return self.cpe
+
+    def __init__(self, cpe):
+        self.cpe = cpe
+        self.parts = cpe.split(':')
+        self.vendor = self.parts[3]
+        self.product = self.parts[4]
+        self.version = self.parts[5]
+        self.update = self.parts[6]
+        self.edition = self.parts[7]
+        self.language = self.parts[8]
+        self.sw_edition = self.parts[9]
+        self.target_sw = self.parts[10]
+        self.target_hw = self.parts[11]
+        self.other = self.parts[12]
 
 
 class CVE:
@@ -127,8 +203,9 @@ class CVE:
         for cpe in node.get('cpeMatch', ()):
             if not cpe['vulnerable']:
                 return
-            product = cpe_product(cpe['criteria'])
-            version = cpe_version(cpe['criteria'])
+            cpeId = CPE(cpe['criteria'])
+            product = cpeId.product
+            version = cpeId.version
             # ignore when product is '-', which means N/A
             if product == '-':
                 return
@@ -160,7 +237,7 @@ class CVE:
                     v_end = cpe['versionEndExcluding']
 
             yield {
-                'id': cpe['criteria'],
+                'id': cpeId,
                 'v_start': v_start,
                 'op_start': op_start,
                 'v_end': v_end,
@@ -181,30 +258,29 @@ class CVE:
     @property
     def affected_products(self):
         """The set of CPE products referred by this CVE definition"""
-        return set(cpe_product(p['id']) for p in self.each_cpe())
+        return set(p['id'].product for p in self.each_cpe())
 
     def affects(self, name, version, cpeid=None):
         """
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
         """
-
-        pkg_version = distutils.version.LooseVersion(version)
+        if cpeid is None:
+            # if we don't have a cpeid, build one based on name and version
+            cpeid = CPE("cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version))
+        elif not isinstance(cpeid, CPE):
+            cpeid = CPE(cpeid)
+
+        # Always prefer the package version of the CPE ID.
+        pkg_version = distutils.version.LooseVersion(cpeid.version)
         if not hasattr(pkg_version, "version"):
             print("Cannot parse package '%s' version '%s'" % (name, version), file=sys.stderr)
             pkg_version = None
 
-        # if we don't have a cpeid, build one based on name and version
-        if not cpeid:
-            cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
-        # if we have a cpeid, use its version instead of the package
-        # version, as they might be different due to
-        # <pkg>_CPE_ID_VERSION
-        else:
-            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
-
         for cpe in self.each_cpe():
-            if not cpe_matches(cpe['id'], cpeid):
+            if not cpe['id'].matches(cpeid):
+                # If the node CPE id is not a subset of the target package we
+                # don't check for affect
                 continue
             if not cpe['v_start'] and not cpe['v_end']:
                 return self.CVE_AFFECTS
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8710dda795..ec46d373d5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -670,7 +670,7 @@ def check_package_cves(nvd_path, packages):
             pkg.status['cve'] = ("na", "no version information available")
             continue
         if pkg.cpeid:
-            cpe_product = cvecheck.cpe_product(pkg.cpeid)
+            cpe_product = cvecheck.CPE(pkg.cpeid).product
             cpe_product_pkgs[cpe_product].append(pkg)
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
