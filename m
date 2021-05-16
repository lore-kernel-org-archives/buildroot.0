Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4DCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:41:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1E6460F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1E6460F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAAB583AC5;
	Tue,  3 Aug 2021 21:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVflt-izvWY0; Tue,  3 Aug 2021 21:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 208FE83AA7;
	Tue,  3 Aug 2021 21:41:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5031BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D714048D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkzBE_ju5rQN for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFE404036B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 415B68B43C; Tue,  3 Aug 2021 21:09:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 13:57:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ae79f0f4033e2c8c250aacc888f5f44a26aa4c86
X-Git-Newrev: fffc5534854b7077bd534dde9005f34d4b3025d8
X-Patchwork-Hint: ignore
Message-Id: <20210803210938.415B68B43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/scripts/gen-missing-cpe: add new script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fffc5534854b7077bd534dde9005f34d4b3025d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This script queries the list of CPE IDs for the packages of the
current configuration (based on the "make show-info" output), and:

 - for CPE IDs that do not have any matching entry in the CPE
   database, it emits a warning

 - for CPE IDs that do have a matching entry, but not with the same
   version, it generates a snippet of XML that can be used to propose
   an updated version to NIST.

Ref: NIST has a group email (cpe_dictionary@nist.gov) used to
recieve these version update and new entry xml files.  They do
process the XML and provide feedback. In some cases they will
propose back something different where the vendor or version is
slightly different.

Limitations
 - Currently any use of non-number version identifiers isn't
   supported by NIST as they use ranges to determine impact
   of a CVE
 - Any Linux version from a non-upstream is also not supported
   without manually adjusting the information as the custom
   kernel will more then likely not match the upstream version
   used in the dictionary

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998@free.fr:
  - codestyles as spotted by Arnout
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/gen-missing-cpe | 65 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/support/scripts/gen-missing-cpe b/support/scripts/gen-missing-cpe
new file mode 100755
index 0000000000..0b222f2659
--- /dev/null
+++ b/support/scripts/gen-missing-cpe
@@ -0,0 +1,65 @@
+#!/usr/bin/env python3
+
+import argparse
+import sys
+import json
+import subprocess
+import os
+from cpedb import CPEDB, CPE
+
+
+def gen_update_xml_reports(cpeids, cpedb, output):
+    cpe_need_update = []
+
+    for cpe in cpeids:
+        result = cpedb.find(cpe)
+        if not result:
+            result = cpedb.find_partial(CPE.no_version(cpe))
+            if result:
+                cpe_need_update.append(cpe)
+            else:
+                print("WARNING: no match found for '%s'" % cpe)
+
+    for cpe in cpe_need_update:
+        xml = cpedb.gen_update_xml(cpe)
+        fname = CPE.product(cpe) + '-' + CPE.version(cpe) + '.xml'
+        print("Generating %s" % fname)
+        with open(os.path.join(output, fname), 'w+') as fp:
+            fp.write(xml)
+
+    print("Generated %d update files out of %d CPEs" % (len(cpe_need_update), len(cpeids)))
+
+
+def get_cpe_ids():
+    print("Getting list of CPE for enabled packages")
+    cmd = ["make", "--no-print-directory", "show-info"]
+    js = json.loads(subprocess.check_output(cmd).decode("utf-8"))
+    return set([v["cpe-id"] for k, v in js.items() if "cpe-id" in v])
+
+
+def resolvepath(path):
+    return os.path.abspath(os.path.expanduser(path))
+
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--output', dest='output',
+                        help='Path to the output CPE update files', type=resolvepath, required=True)
+    parser.add_argument('--nvd-path', dest='nvd_path',
+                        help='Path to the local NVD database', type=resolvepath, required=True)
+    return parser.parse_args()
+
+
+def __main__():
+    args = parse_args()
+    if not os.path.isdir(args.output):
+        print("ERROR: output directory %s does not exist" % args.output)
+        sys.exit(1)
+    cpedb = CPEDB(args.nvd_path)
+    cpedb.get_xml_dict()
+    cpeids = get_cpe_ids()
+    gen_update_xml_reports(cpeids, cpedb, args.output)
+
+
+if __name__ == "__main__":
+    __main__()
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
