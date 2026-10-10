Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC4ECA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F3460643;
	Sat, 10 Oct 2026 20:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXcatMUWp-Yw; Sat, 10 Oct 2026 20:26:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5829D608E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663968;
	b=tQ4uXTJzoPWcFTG9jKQKbKjNynnvp0XWimsf8373BZqqFi8foJX/kTSHYv6qo6Z4Cg/Q
	 WEZB7lURWveovEB7WVOmStkx08U8dXCrxrUe2PvZplsobvMypW6J9FwyZE4WH7DLjlIor
	 PDz6fLNCwcsAM7HaHJMDBQtnnmINH9WC/Im5qf5sxDnSXdWozZzrNTzmT/OP4DM/zYzOG
	 pgm2RaXlFsHbVFcpjNFfSUhuws7upaEEschYIUI2kZZHjiy1+nbgR3fg68yeMPA2ImtS0
	 41HPhf+eR2jrmx3Q9P1HN6+wdB28+E7OikQ6EFY4ErkDzvk8kAA3aMQK4aovMfc4oZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gSBjbLaBj2LLCPtE1TZbIlxZQDGXDbgrqo0CKKZbFgQ=;
	b=XdtvYqsZgFRKeHSnQnk/SV4/flpJzkBouCo8ml07CnWCXxbagCuRIk2oruJOwVlXsoy9
	 mblPS8tB/fXwFUmWtpTzMle0JLh5MjRzbHNjANgYxfQuj2z1uQ5sQWb88RosOIkUEBerB
	 koyUu6zB6+WK70kNugyh2IQny49nrSIMdqjonbbkGT4HRced4HskPH86JxCX29cCDj8l0
	 nycmEDnBms40qUUhRvsBEuk+SIaeZgxnObg35p2HmlArrIOHLwby1bDd2QGje+sKsT7vD
	 OGugKqVsF59ZS7OL0nCg6fSC1dBP9J9JWTlFKPSMH48A90dxR6ZQR34I8tMUZKgstHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663968;
	bh=gSBjbLaBj2LLCPtE1TZbIlxZQDGXDbgrqo0CKKZbFgQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZZilw8vfpig6AKY8Rs7d0jK/xhgi3q5oDuEshEaZNBAfrkafLsdY7ffb+ZqIAoAtl
	 utYuNTWEkB1EwFyWsQ1soSZeRN265gjLwqSCrMkYPg+Eu+kkFAIiI+HPWlV3nNw0U1
	 Rg6LmlbtrH1ddj5XyU+JDBxfqtIGWJ5uTWfQft0OdWbD32g6/2nWBPO2zQg9ULyCM/
	 quSv27wJLWgCCDvdWdoNzdrZ8LZYwNRUUp9acKavn60a1jrJX2mP18vjBF6TuDZgoy
	 n4CgLS9NLKS9nVME7WmqpyIvDNIe8AO+DZHPMo7IY0AJRLl5Fx8F6WRl2b0g5ZuCzE
	 gtcTTbm8LIOCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5829D608E9;
	Sat, 10 Oct 2026 20:26:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52654356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 384438108E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnBrJSH9RrZ6 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3382881065
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=jTNOTFGOgJeuDYYCNyFIy3DToeivrnGKoATeTuHehnSqXqJh8ytlre2Nhir9XsHOPaj7
 mRdD+Nyfh3scNpm1NWD2yE47ml3NHGkNoMoAgqaQiA46xRuGGjQkts9nFDO3gKBb6Q0zT
 9hbwn3YqCT+PSLlpmURdjv0JYrwrvhFdLrphqi65XTtfZmKiMwDjjAMTXIFV0yP9px/yx
 27YCJM1pbWYT0mwzVgEXcnEOkWPNZzQp1l2Sonu9qBerDnzFsBaJK8Oq3cInjXSVRCmwA
 X7OPOQjDN8z5+BOa1ENyi9GeNsOrzdyDsBQo5wT7tP9HoNKix2hint1Gt8Heef3eWyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=85ArmJmQIjR38hWZ7NDjQMi0QTLzw9Uo3aJhazdnhNk=;
 b=QakNSLmq+34gviX9oKnzsq5s7th3Xyqz8AWFRmVVb/Jk63n9GWiGL5wPkHJANTkvoMi6
 gAhc+TIOgzWrvZkldYy4IbBpzeqNmvqB8ofoU+hNllfyWgXYCn2ijtqZB7xd5TKE6WNQD
 y5BVEzw3s4Pd2OxKNiOp0LIYkKSUu2RaMZBe+3CpVbwuTfYq8D+Jko85Plu6GJgH9sShB
 SfmhFW+NlRf/lMh6R01b6q+6lYDAWt758Yzfal6UKsnynm7ES7GIzftnCIRQXTGJBIdIx
 B7zKKAgnhnHUxxOdTmfomwfJX+oyWGxdrxso+y/JnbK9CURWU+bPlinas9OnTzHrmOQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3382881065
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5895934B4; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8d02d28fb64f69e97d2169740687f761f93667f
X-Git-Newrev: 4ba8e2869bdf86b3fa767a5e49897eb575988255
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.C5895934B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: move license
 download in a function
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ba8e2869bdf86b3fa767a5e49897eb575988255
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Move the code that retrieves the SPDX licenses into a function instead of
doing it top-level.

This allows to pass the CycloneDX version as a function argument instead
of defining it as a top-level constant.
The next commit introduces support for different CycloneDX spec versions.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 60 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 44b9b80847..290c3f96e5 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -23,12 +23,10 @@ import re
 
 
 CYCLONEDX_VERSION = "1.6"
-SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -45,28 +43,47 @@ VULN_WITH_PEDIGREE = set()
 
 SPDX_LICENSES = []
 
-if not SPDX_SCHEMA_PATH.exists():
-    if not importlib.util.find_spec("_ssl"):
-        print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
-              file=sys.stderr)
-        exit(1)
 
-    # Download the CycloneDX SPDX schema JSON, and cache it locally
-    cyclonedxpath.mkdir(parents=True, exist_ok=True)
+def br2_retrieve_spdx_licenses(version: str):
+    """Populate the list of supported SPDX licenses for a given CycloneDX
+    version. If the list is not present locally it will be downloaded
+    externally.
+
+    Args:
+        version (str): CycloneDX version
+
+    Returns:
+        The SPDX license list supported for the argument version.
+    """
+    SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{version}/schema/spdx.schema.json"
+
+    ret = []
+    path = cyclonedxpath / f"spdx-{version}.schema.json"
+
+    if not path.exists():
+        # Download the CycloneDX SPDX schema JSON, and cache it locally
+        if not importlib.util.find_spec("_ssl"):
+            print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
+                  file=sys.stderr)
+            exit(1)
+
+        cyclonedxpath.mkdir(parents=True, exist_ok=True)
+        try:
+            urllib.request.urlretrieve(SPDX_SCHEMA_URL, path)
+        except urllib.error.URLError as e:
+            if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
+                raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
+            raise e
+
     try:
-        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
-    except urllib.error.URLError as e:
-        if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
-            raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
-        raise e
+        with path.open() as f:
+            ret = json.load(f).get("enum", [])
+    except json.JSONDecodeError:
+        # In case of error the license will just not be matched to the SPDX names
+        # but the SBOM generation still work.
+        print(f"Failed to load the SPDX licenses file: {path}", file=sys.stderr)
 
-try:
-    with SPDX_SCHEMA_PATH.open() as f:
-        SPDX_LICENSES = json.load(f).get("enum", [])
-except json.JSONDecodeError:
-    # In case of error the license will just not be matched to the SPDX names
-    # but the SBOM generation still work.
-    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
+    return ret
 
 
 def split_top_level_comma(subj):
@@ -528,6 +545,7 @@ def main():
         parser.print_help()
         sys.exit(1)
 
+    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
