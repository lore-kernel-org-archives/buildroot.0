Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE40C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA1F782849;
	Wed,  7 Feb 2024 15:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTHKz7GdNEGy; Wed,  7 Feb 2024 15:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E6F81FD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E6F81FD2;
	Wed,  7 Feb 2024 15:35:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83EE01BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71A6A613F2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luT8y8o-zq22 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A1BB60BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A1BB60BD3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A1BB60BD3
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:35:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fc549ab9bso6638425e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 07:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707320121; x=1707924921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JVtq6sBUKkkLU0JwWf/DoAqtB5taP8UpRKKXD3W98w0=;
 b=mk0v+izc25y6XpeUKNMJFgmwIiBvaRFyeB7I/ZnirR0fOUE0yt4frAGOeRdOjJiQtk
 kYVCjm8in3qkqiJwblxfhjwlykx3WblBlj/HO05fe2rwDxulPTxKGNAtD/fKd5Qm6OOP
 YKgNKYOjr4doSKr07W8OoHBWlqnYyCFGp6uLgzxdQwpK6yOUMRT2l+Iizy5dqMHUo/iM
 +z1iXvBEmNBqaWqkh3mCO5Y22IqEX/abZwkWq0R8RZ4f93m55nMwXe1/CIkdqcn5UoDN
 /bIn6CaI2oJsaiYAjBGd3PZpIMGGjFB1y1MmSWPpVzpROnUHKr/LGDi5juVUe/eu6r7h
 EMHg==
X-Gm-Message-State: AOJu0YzGAQgxQ0XZS257y7uqjca1QkyowVfzA0nwsWIjGZyWpZ3EHBPO
 H+Q9tq1MAJwMU4KBYlZ3+u/r7+dFda+F2rH5CDi4Y4vLq0nuv96hN8ZGwWUwVoyYkdZOzG/R1dZ
 Z
X-Google-Smtp-Source: AGHT+IEy6PC87BldYixCI1jdpqm/6ttB91FWRkZEvpoYgSFwC5flvOWPu5B+bkiw7pjuRsA9aWeXeA==
X-Received: by 2002:a5d:444d:0:b0:33b:49b4:5b75 with SMTP id
 x13-20020a5d444d000000b0033b49b45b75mr3676553wrr.59.1707320120701; 
 Wed, 07 Feb 2024 07:35:20 -0800 (PST)
Received: from arnoutx1.. ([85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040fddaf9ff4sm5703632wms.40.2024.02.07.07.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:35:20 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 16:35:17 +0100
Message-ID: <20240207153519.657048-1-arnout@mind.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707320121; x=1707924921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JVtq6sBUKkkLU0JwWf/DoAqtB5taP8UpRKKXD3W98w0=;
 b=NSrMLf9uBl+Hopk1qrcBCvk6lecheeJUgWvgjw25+evAIK77tjh9XkpYs3qjhlWuBz
 Fazss7cHpqSnWhZo0qTrz+e+ND+wMQX07DUQWVVBsAr7QYTOpHun/EOvTbBNFRKOzyCv
 VEUkKM8a3Lco80CaqNt+uAQpT4ffs3qOf0zJzJ21XQya6hVajBSNpfRxuFtOohME3zcp
 JL9zLrbrlYl0rmGox4P/sZIeoc6iim2RBPx5ooviarocZyu4rFPI/jQydbAPXvPdB/yE
 AOtRIXk9OuN6559mXGLz4fDUZCN9mTwUsOfhTe7rc8S+DTwZNskcyM2DdmmziUDNNYzy
 7faQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NSrMLf9u
Subject: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: remove checking
 the CPE database
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We currently check the CPE database to see if the CPE ID we use
(including the version) is already in the database.

However, the version part of the CPE ID is not actually used for CVE
matching. Instead, the CVEs have a range of versions associated with
them and we match against those ranges.

In addition, NVD is moving to a new API for accessing the CPE database.
It will not longer be possible to simply download all the CPE IDs, and
due to rate limiting, the download will have to be done in several
queries.

Since all of this is anyway of limited use, drop the CPE database lookup
entirely. Instead, as long as a CPE ID is defined in a package, it is
considered OK, without any checks.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/pkg-stats | 50 ++-------------------------------------
 1 file changed, 2 insertions(+), 48 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 05f0cd9e4a..caef159afe 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -40,7 +40,6 @@ from getdeveloperlib import parse_developers  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
-CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
 
 RM_API_STATUS_ERROR = 1
 RM_API_STATUS_FOUND_BY_DISTRO = 2
@@ -282,8 +281,7 @@ class Package:
 
         if var in self.all_cpeids:
             self.cpeid = self.all_cpeids[var]
-            # Set a preliminary status, it might be overridden by check_package_cpes()
-            self.status['cpe'] = ("warning", "not checked against CPE dictionary")
+            self.status['cpe'] = ("ok", "(not checked against CPE dictionary)")
         else:
             self.status['cpe'] = ("error", "no verified CPE identifier")
 
@@ -674,47 +672,6 @@ def check_package_cves(nvd_path, packages):
                 pkg.status['cve'] = ("ok", "not affected by CVEs")
 
 
-def check_package_cpes(nvd_path, packages):
-    class CpeXmlParser:
-        cpes = []
-
-        def start(self, tag, attrib):
-            if tag == "{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item":
-                self.cpes.append(attrib['name'])
-
-        def close(self):
-            return self.cpes
-
-    print("CPE: Setting up NIST dictionary")
-    if not os.path.exists(os.path.join(nvd_path, "cpe")):
-        os.makedirs(os.path.join(nvd_path, "cpe"))
-
-    cpe_dict_local = os.path.join(nvd_path, "cpe", os.path.basename(CPEDB_URL))
-    if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
-        print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
-        cpe_dict = requests.get(CPEDB_URL)
-        open(cpe_dict_local, "wb").write(cpe_dict.content)
-
-    print("CPE: Unzipping xml manifest...")
-    nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
-
-    parser = xml.etree.ElementTree.XMLParser(target=CpeXmlParser())
-    while True:
-        c = nist_cpe_file.read(1024*1024)
-        if not c:
-            break
-        parser.feed(c)
-    cpes = parser.close()
-
-    for p in packages:
-        if not p.cpeid:
-            continue
-        if p.cpeid in cpes:
-            p.status['cpe'] = ("ok", "verified CPE identifier")
-        else:
-            p.status['cpe'] = ("error", "CPE version unknown in CPE database")
-
-
 def calculate_stats(packages):
     stats = defaultdict(int)
     stats['packages'] = len(packages)
@@ -1309,7 +1266,7 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
     parser.add_argument('--disable', type=list_str,
-                        help='Features to disable, comma-separated (cve, upstream, url, cpe, warning)',
+                        help='Features to disable, comma-separated (cve, upstream, url, warning)',
                         default=[])
     args = parser.parse_args()
     if not args.html and not args.json:
@@ -1372,9 +1329,6 @@ def __main__():
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
-    if "cpe" not in args.disable and args.nvd_path:
-        print("Checking packages CPEs")
-        check_package_cpes(args.nvd_path, packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
