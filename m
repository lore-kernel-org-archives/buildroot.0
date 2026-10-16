Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE986CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8ED60FBE;
	Fri, 16 Oct 2026 13:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBG8uiKXUNC1; Fri, 16 Oct 2026 13:10:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 52A4C60FCF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156234;
	b=hNBX9tHvUfLzxhB2Pj+nywOdrYeZZBtZhS4ZLXF0BqigGXcCSxvnkgaGTYzM9lcibzlI
	 zIQCa5c8k1t0tNLs27RZGnfm8gpSwy8bxvzHw5yYX9s801KouYKI86y4tXXfE/b6cL3C/
	 n7dcnCRoCVdZifvutuR6AWXRkOwcC0jKYgvs2s1Z7Dl4So1K51eZQA0kSO04IFczGD7hx
	 tDsn/9DR4eanqUHLjagPXyHaIM0IE7OOHaEeog4XfFrxWNFrVZuNbaaJ1mgGwIbIUW39e
	 b/FG/9uxqwpRf+Bl213Zub0DIrdpxw4iiRG4XLY4PgzIQl6ih2qrf8XZFipBABl7E9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156234;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pjgoAbCBx3mcTQ7Yk0I+dOEBCw5GuiLXZKVuc+GSktM=;
	b=Pe4Lw2V/q9bIZu0KHpZSUhm2miXTiXIqRF+u0zr54CN0lVZP666OWM209blB1+DMETwN
	 gjp+x/xW2bmyI0a3dQ9L4XWfytTiJoC9YuyV05v9AjNZpVkttb7AMYm2C/CWCZqKOqveF
	 bcvse8Vl9xVzhu+Vjztdiu1qmPFLr2rSW+dnYhAay1YtB4F+7nwVeQAOyZxeq4VZt3PQ3
	 SVjjTI3HX1nycb02Pg0ozlq2xLC+DMTXPRc6S973mNL7nCGcq0YwKZrXdPw9dyOXUZ2M+
	 rtA1Jc9V9sgPqlAImZbbafLHlWCowDd3fr3VJ2SCjecYWk9K+ADrLz7C3D40UYi3ijQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156234;
	bh=pjgoAbCBx3mcTQ7Yk0I+dOEBCw5GuiLXZKVuc+GSktM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RT4ixTmy0NCSKqasuHNQtK0SkEUIKxYnh0XD2QZKXR6Xp1tscyT3v8pHCrQnNo7Pe
	 Mv7Oxb5ddUANTI29PS4fTMPxi8/WY7QE3Sxk4Mtq/TAQrtqyzGPbo5bl/pOvBLt4wT
	 hsQPPtofE5ADhaMzTSQocyfjh+xMFHaUntdM5sW28cGsCK/Mu95BVoXIilX8+xeFyj
	 vjCyWAhlmr1AKhf+bcxB/+hCeUTKAxRt7Ga/5FlYnV1nDPUiwiwel3XbI/aReWrnYW
	 RA9sbproFh1ri5DsrdEE1bbyIcdXkYflKQMyK+11dKqKRPmsZWqcjvl9S2UF/tpVt3
	 QcRwoZOYVtZWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A4C60FCF;
	Fri, 16 Oct 2026 13:10:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 900ED255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C6E80772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0lBAusBGvRq for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D8C6814BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=pzUC7BqWFybps1VKaIit4f1TcEzalZ+AKOI7a6x7+KVRQn8U7AmzRASioqVqUXwQ5THr
 Vm66rXiPp8kcBEy/bLhrpdyZLENMj95XqwViJaHhvyrId7csXPT2doBuZpQohMFgibvam
 uD79V5K87MH25e7cw22pXsa8iJhMQmVN48Rt0w9IiVQh3rEPxCUmhLtYb4R0gGx2nbCAe
 ZAY6VDGi+yPhYXTiY2DkSrfCNEuPKgVmFZG1wJATKWKcdCZ6t7pZqWQIBYiLd1YKutwtI
 ZlMxc/wqMoedDdaMoQ22FUo3A9H5gZA8UCP94levaBV1H4JttGaHRm9o+eebxC5Jnjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iImG0jBAtiNf+jq4mzwO4SfkoiKZ48fs+Ke+RUKqYFE=;
 b=IuoXH3wywnpIGL/zWKsZodn7K7OAEu0lOw27elsjnVVa+i0Rq9szDWUM4zLkIOvqWzOo
 1JFEYh4Ig71RxNY1y+bYdV9fSJgHcU4oqLuZFL1PaYzY9ZGl4MO5XEAMOEZ6bS553PGNm
 gu1xYmeZkNAgrRfRnPmZ8Ql4GjLxrPzkw/5VJrAjMHNuLH/1z4cslwubMxm1ZlkosseF2
 HgxtLBZRjqXuLfZ6C6P6zLeUaEtQlR4RVU/h3O+EYJ/yUZ3JRGgoYaNxZgCxKVn1Q9lfg
 jY+USCWbeqD1JHKlPMhub0JF3XXhOtfXtMC7/ZIHhDvYcE/omryoGPQh1bm4TrRJ4Tg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D8C6814BC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EB74960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 94bb5ba1e486df811a1826ae23ff7b9d46823b84
X-Git-Newrev: 15eb5bac0faadf925edfe5d7fcb0f0382f6c4fc0
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.7EB74960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4152511925915272696=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4152511925915272696==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15eb5bac0faadf925edfe5d7fcb0f0382f6c4fc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============4152511925915272696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4152511925915272696==--
