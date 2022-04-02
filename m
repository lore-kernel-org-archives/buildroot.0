Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC72C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF1D8411D;
	Sat,  2 Apr 2022 14:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drHOkBMXlw_a; Sat,  2 Apr 2022 14:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994AC84104;
	Sat,  2 Apr 2022 14:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5BEE1BF867
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4C2360BD5
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbITZhUvX8tQ for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:15:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 707AA60BDB
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:15:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 96A6E60005;
 Sat,  2 Apr 2022 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648908940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tfurexu9XbILPjwbbQZHXtBZM1ubzIbxLd5F6s0FnsM=;
 b=CVE2BPVA0D2s7nRv43zJ5NV9OKQgERP6eyFbei2y23EtEdqKKJkGr0uLTcKTi6kqHc2qyq
 y3e7EBEpWxz73u2mcMrmPb9UpUh/aR1jfsi8/XPvqU8xNjoTIsII6/6odVnqwCo4z5+eUb
 GApc1xXp5NsnuDgTmlc5yUOJmj+EtjhRMX8PhWe5OUFqbOg28WoXK4FE1cmMfDGn+gdthJ
 WRlOR3IYR1qHosvijXuUph/jz5T2Y4tQwGzuH0/SIQoDK01nK/5zTzWBVXT2p8EZvmAVXW
 Bb+mqnxIYqSGkdMJtVxsiRpy6lf4ioTMRFtGiZ90bIK/vYfN9yKaeuXlZfyAOA==
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 16:15:30 +0200
Message-Id: <20220402141531.1320584-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] support/scripts/pkg-stats: reimplement CPE
 parsing in pkg-stats
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pkg-stats currently uses the services from support/scripts/cpedb.py to
match the CPE identifiers of packages with the official CPE database.

Unfortunately, the cpedb.py code uses regular ElementTree parsing,
which involves loading the full XML tree into memory. This causes the
pkg-stats process to consume a huge amount of memory:

thomas   1310458 85.2 21.4 3708952 3450164 pts/5 R+   16:04   0:33  |   |   \_ python3 ./support/scripts/pkg-stats

So, 3.7 GB of VSZ and 3.4 GB of RSS are used by the pkg-stats
process. This is causing the OOM killer to kick-in on machines with
relatively low memory.

This commit reimplements the XML parsing needed to do the CPE matching
directly in pkg-stats, using the XmlParser functionality of
ElementTree, also called "streaming parsing". Thanks to this, we never
load the entire XML tree in RAM, but only stream it through the
parser, and construct a very simple list of all CPE identifiers. The
max memory consumption of pkg-stats is now:

thomas   1317511 74.2  0.9 381104 152224 pts/5   R+   16:08   0:17  |   |   \_ python3 ./support/scripts/pkg-stats

So, 381 MB of VSZ and 152 MB of RSS, which is obviously much better.

Now, one will probably wonder why this isn't directly changed in
cpedb.py. The reason is simple: cpedb.py is also used by
support/scripts/missing-cpe, which (for now) heavily relies on having
in memory the ElementTree objects, to re-generate a snippet of XML
that allows us to submit to NIST new CPE entries.

So, future work could include one of those two options:

 (1) Re-integrate cpedb.py into missing-cpe directly, and live with
     two different ways of processing the CPE database.

 (2) Rewrite the missing-cpe logic to also be compatible with a
     streaming parsing, which would allow this logic to be again
     shared between pkg-stats and missing-cpe.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ae1a9aa5e4..cc163ebb1a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -27,12 +27,14 @@ import re
 import subprocess
 import json
 import sys
+import time
+import gzip
+import xml.etree.ElementTree
 
 brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
 sys.path.append(os.path.join(brpath, "utils"))
 from getdeveloperlib import parse_developers  # noqa: E402
-from cpedb import CPEDB  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
@@ -42,6 +44,7 @@ RM_API_STATUS_FOUND_BY_DISTRO = 2
 RM_API_STATUS_FOUND_BY_PATTERN = 3
 RM_API_STATUS_NOT_FOUND = 4
 
+CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
 
 class Defconfig:
     def __init__(self, name, path):
@@ -624,12 +627,40 @@ def check_package_cves(nvd_path, packages):
 
 
 def check_package_cpes(nvd_path, packages):
-    cpedb = CPEDB(nvd_path)
-    cpedb.get_xml_dict()
+    class CpeXmlParser:
+        cpes = []
+        def start(self, tag, attrib):
+            if tag == "{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item":
+                self.cpes.append(attrib['name'])
+        def close(self):
+            return self.cpes
+
+
+    print("CPE: Setting up NIST dictionary")
+    if not os.path.exists(os.path.join(nvd_path, "cpe")):
+        os.makedirs(os.path.join(nvd_path, "cpe"))
+
+    cpe_dict_local = os.path.join(nvd_path, "cpe", os.path.basename(CPEDB_URL))
+    if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
+        print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
+        cpe_dict = requests.get(CPEDB_URL)
+        open(cpe_dict_local, "wb").write(cpe_dict.content)
+
+    print("CPE: Unzipping xml manifest...")
+    nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
+
+    parser = xml.etree.ElementTree.XMLParser(target=CpeXmlParser())
+    while True:
+        c = nist_cpe_file.read(1024*1024)
+        if not c:
+            break
+        parser.feed(c)
+    cpes = parser.close()
+
     for p in packages:
         if not p.cpeid:
             continue
-        if cpedb.find(p.cpeid):
+        if p.cpeid in cpes:
             p.status['cpe'] = ("ok", "verified CPE identifier")
         else:
             p.status['cpe'] = ("error", "CPE version unknown in CPE database")
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
