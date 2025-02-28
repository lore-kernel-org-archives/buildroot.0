Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF56C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 13:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFBC541556;
	Fri, 28 Feb 2025 13:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jqtia3kP5WSZ; Fri, 28 Feb 2025 13:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B6AC413C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B6AC413C7;
	Fri, 28 Feb 2025 13:57:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BADE94F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 13:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DADE836E1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 13:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id od7z24AEGfwl for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 13:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56CD68386E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56CD68386E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 13:57:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45BFE87CDA; Fri, 28 Feb 2025 13:57:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 14:56:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5297c761baf7430e961f4a406c7447d2e776414f
X-Git-Newrev: eec0f25734f352d84cb9b18f65c5490cd79b94c1
X-Patchwork-Hint: ignore
Message-Id: <20250228135747.45BFE87CDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: fix detecting of
 tty
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eec0f25734f352d84cb9b18f65c5490cd79b94c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check if the script shall read from stdin if data is piped into.
Otherwise read from the input file or if not specified print usage and
exit.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/generate-cyclonedx | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 993d7154ef..365c2b06ea 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -273,13 +273,19 @@ def main():
                 Example usage: make show-info | utils/generate-cyclonedx.py | jq > sbom.json
             '''
         )
-    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"), default=sys.stdin)
-    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"), default=sys.stdout)
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
+                        default=(None if sys.stdin.isatty() else sys.stdin))
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
+                        default=sys.stdout)
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
 
     args = parser.parse_args()
 
+    if args.in_file is None:
+        parser.print_help()
+        sys.exit(1)
+
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
