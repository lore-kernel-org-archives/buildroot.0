Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00096CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 14:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A296683C64;
	Sat, 23 Aug 2025 14:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCFxelfM8jLY; Sat, 23 Aug 2025 14:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A06083C6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A06083C6C;
	Sat, 23 Aug 2025 14:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21E5571E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12F0C83C6C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cja8F6UFMktf for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 14:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 328DC83CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 328DC83CDF
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 328DC83CDF
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 28EAF1A0D24
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E9BCB606A7
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:38:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 139E01C22D0E6; 
 Sat, 23 Aug 2025 16:38:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Aug 2025 16:38:42 +0200
Message-ID: <20250823143843.50035-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755959928; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=StYi4FBA07j7xJ3n2X/HLUD2aqyaytAQhNdv5M0fK3w=;
 b=KUgTfcYHvCOxF43SvK5ZGAJ422+bLDayRr9dNyE16tXM6LT5gH/JBa5zhr6xesIW67jDvA
 UObiE8psWaeHdEYMobYCNmiFYvCVhxftnXeJijieya041Thb1BUT13vrk9UPeYScjWvgAz
 Jj6mc69QD4hohUwRBbtdbruKwnAD3uisTFtaNKoXtu+aottJn9A++I0NMoFY9ewetgGEUG
 1QYJSdBCnhVYAdy2x09Xk4MD5dO7j+VwNOMMd8MwlgSbb1K4lWkGQhqHjpZjnYLvrIpuhz
 s05QaFZo0bkQtpnkk2mBniwGcNQOxEw7NhYvxhIQf5NEeWpfxDblH2ihjwh62A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KUgTfcYH
Subject: [Buildroot] [PATCH] support/scripts/cve.py: handle CVEs with
 'configurations' but no 'nodes' inside
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The each_cpe() method is careful that some CVEs have no
"configurations", but some CVEs such as
https://nvd.nist.gov/vuln/detail/CVE-2025-32915 apparently have a
"configurations" node, but no "nodes" inside the "configurations",
causing an exception:

Traceback (most recent call last):
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1382, in <module>
    __main__()
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1371, in __main__
    check_package_cves(args.nvd_path, packages)
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 679, in check_package_cves
    check_package_cve_affects(cve, cpe_product_pkgs)
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 638, in check_package_cve_affects
    for product in cve.affected_products:
                   ^^^^^^^^^^^^^^^^^^^^^
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 185, in affected_products
    return set(cpe_product(p['id']) for p in self.each_cpe())
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 185, in <genexpr>
    return set(cpe_product(p['id']) for p in self.each_cpe())
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 173, in each_cpe
    for node in nodes['nodes']:
                ~~~~~^^^^^^^^^
KeyError: 'nodes'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
This should be applied to all maintained branches: next, master,
2025.02 and 2025.05 as we run pkg-stats daily on all those branches.
---
 support/scripts/cve.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 1cbe24c02d..ba41762fa0 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -170,7 +170,7 @@ class CVE:
 
     def each_cpe(self):
         for nodes in self.nvd_cve.get('configurations', []):
-            for node in nodes['nodes']:
+            for node in nodes.get('nodes', []):
                 for cpe in self.parse_node(node):
                     yield cpe
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
