Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F291BCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914C5613FE;
	Fri, 16 Oct 2026 13:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTmAOszSWpSi; Fri, 16 Oct 2026 13:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FCFF613E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156433;
	b=bY+V1nvw49lYAZIZyNxYq1ByM9/tkWDNyluPybzRhfkVway17fZ5Yf1J333U1L6ye45r
	 a5x7LhRoDRwzw5RLJXMbIgyGeq25Pr/ayFazh4O/kgskB4wfOqtBWE/q8NDCgbPChwaYP
	 Q2kC2orZX8AMvm2/6U3uedW0mSIlKjUmohZncSwOSkYMCYfjsKVILh/ZFLUsp2YAFSLSu
	 32K2plQJ3SlV6WArDF/SNhcRnH5Cy2Yi6pkt8ur1M9zmJOxT09EzkOed+PXEd2oRIUWUG
	 F8TYRtdKH8ZYZ0bLdy7We7nWv4pLfaEvo/4hFS8YvH/wfnbGhEIoYtfGlnosGHS6QBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156433;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=BrsGpsDWMFVxnqroFgmwJYGuGauW881s1RA5g/YQCbY=;
	b=DXBpqjnWOuqPn2x8onfOoN4zVIMyA5hfuNW/UAsjjeQGbmGTYhBhX3VRVKbFd2tTzv+R
	 +OVxSKWdyyUJehSG+sDV9rg7H2gcUEVc3xeGMejQlQTbQruYsIqlwos7VIQ555hhAXvYI
	 /p+/tle3od9rk7TBT9LEHmjcR9EctPhgO15I/EFLChdIl4q1Ez2NOG1g8e+Pi/mFRnVYb
	 vjAsGXUEsTd1XCr8iZoh7r4AdPLktV907uaALJRcs7I8fIkmquG5pUXfbTLDgCjVB/Jn7
	 6h8tX0qxqVmBfXGMkligCs9gsSeg/sJNQFNa9hlaDSn8X3K9/m6nOUe0t9t892bJOIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156433;
	bh=BrsGpsDWMFVxnqroFgmwJYGuGauW881s1RA5g/YQCbY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BY75A6Usdm0dVn9ZSXUCAiT+87TlMAQrX/3brkRUJdjj0CCm2/QBMh/QLOgvpEorR
	 1vwVRyP97vQHZo3XtkKDpWWm/KST2j2bfP/UcTiuMV3cc9zQse4JroKGuSzGHIbBTx
	 hveLLRK2AevTfcQt9fC27myZGsNeuLxliRFwTC4jG+NV7Z75oRTTwcHqyEAZ0MJ5P/
	 yRXBLvKee++3BwdqfoeWvB5Oygr76VLyA/Noy69en5C/+KbaD6Lbk6uRpXOs8/zC7U
	 jiVUlAPvv78EFN6Uqz35FX9k7+9PI//60UqPvELw1WA2AXFAQbmhDdFKt2e8J/g2u7
	 j38/PnXV9/MOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FCFF613E9;
	Fri, 16 Oct 2026 13:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E829AF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D83F360F22
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNfpc5cxpMre for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 840D260F42
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=LHFBdvseJ+YD0pWcwpBSwnoKKbHl/MA1quEixBWt3GCqCtJW4iyQEM+4YZcXpzjpJma6
 j6WGK1fPWJytmEqqDTVrC0IW/vxrbA5llzNEQcOc7trtqq8wEmOr9eDBP5jTUwk2OsAdG
 hG1WdJQ705Hipu5yGlpHEFq+ta3YtnMtqFHSo3cr/p/vqEm588QHxmFDIChF/6pNURuO7
 qiPfBs9PZH48YGqhrzJ+h7NmJ7sWK8IOv9OquXa/rLxJ6WtZuwQsNpDshr1RuKKVx7dDO
 UwAk43hwocHFARKfCc7ilhtptNFZNsrZRddFT0uURqMz0vmwwktC00uRGNzFC3XOs+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3AKTOC71NO10cB3Ogv44K1RIIC245KcmaOqNbaF2nVc=;
 b=DJUyx02ZyP4ElLXRCS5XHwniwq0RzgQFXZB2pomT2xBIehVC+By7l/kn+IeB7z88JQ/P
 7wFmepfyLqMTxHPLSwNfxlUv/cT2F9qWAkuuyhW0oTeKhtshKLHY4W1Ct2hKFNSZN/wem
 CuOr3MS7I9ZxpymUftavVPZ6282EdHHIvsCFH+fn43fCjiFiV/mIu9K7AG8R7rt2OnT5Y
 OzuozLPI90ThWBlG0N2mDGpZL9ZFjL5Hh4jb4Sc9vw4Uu9dXhMjsYN/AvGZrb3rfYNb86
 VtGGE+EfKnoqJ7wTfFMxqYUAgLPOxuzgIYnAlJcKlgPp47cUdlQA2Sf6XciktgayQqw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 840D260F42
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74734960D9; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:15 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 99ad4d705901cc9086f414420a9de46cb5922905
X-Git-Newrev: 26330fc1552635a5340d3cc755008a03e3ce02af
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.74734960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
 move license download in a function
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4199564521155726407=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4199564521155726407==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26330fc1552635a5340d3cc755008a03e3ce02af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Move the code that retrieves the SPDX licenses into a function instead of
doing it top-level.

This allows to pass the CycloneDX version as a function argument instead
of defining it as a top-level constant.
The next commit introduces support for different CycloneDX spec versions.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 4ba8e2869bdf86b3fa767a5e49897eb575988255)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============4199564521155726407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4199564521155726407==--
