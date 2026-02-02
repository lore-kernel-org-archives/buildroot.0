Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07706E7DEFC
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCA5C40927;
	Mon,  2 Feb 2026 16:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jBTPXJHAhnp; Mon,  2 Feb 2026 16:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B844092B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770048785;
	bh=mxC2h5j3dd0DvCAgNo+y90MUjF9S+JEW6mBvBPS6zxE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Ei23Gzk9S/zDcxbD6TRP4RR9FUNCr0kvi1rlEtqLNPi7m2DZVt1CiNayftgwEOybG
	 8Dw8eW9T81AMUfL7uoGp6UAD6aMMMU0B348OhMn0xcIUiU3F6uug10tHmkVdiaz9Cy
	 eScSaZzdOWoIssMA8e8+GSp6bSGCVU48OQLhVav1kdtP1VEkIO4Gs8wrJb6cLA8moP
	 ceVFRmU+KbT4bfoCg25QE6QnWL/G+QQj34FKSyQDW2LsU6W62/KwUglYJv6cjd0MTf
	 E1nmpiPhqehyMwBVQnHf7q73oZKaDtb1zE0dzmNpCzasic4OO2hVjuwAltDKe7+MRe
	 Km+5YfRy2l8Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B844092B;
	Mon,  2 Feb 2026 16:13:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B157149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 607CD402F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bnoa3uEUCtg for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D65A401E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D65A401E1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D65A401E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so4029947f8f.3
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 08:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770048780; x=1770653580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8sWEbaQj5v0w3xuNKZXDX20huO1XXTCspuN0ekjZTdk=;
 b=VDL/ed7p/uRa/WUfwd16RIULfUANcY2CBD08lgM+jNQHbl8wKbdZepkOXapMK+C0bw
 2aWs7MbRqopMXPvYp/4bJRp5XybWYzfec88GcI9dtvKFsGvWsyhb0GieQ021Gnw7vOre
 5pzRGeiZO63xpLBcvMSXKcl5SQEYIpPDey5h3rZI8eGTYuqyMC9NxE4J5/910FSD0aVh
 Fbi6sO/NYlMaDvQu+ZsLQaDNZIUA9xD25N7hRlE9f1szfM0PN/fwzl0vPrgIDM2M7/uC
 R6jDIo1k6HhPyOJjuelrYUpuAOPOmn2+TsDs6JqafZjvUlb4yjCw9zAa7bd3h5bVLy0u
 /t2A==
X-Gm-Message-State: AOJu0YweWhhinUOESW29YvUfbbbJF4X6GvRN+sARKD0uPIdSvACMpuR1
 0h04K6eGGGn6RJigdE1v6pxCstr/vM2obmA0KSjLTiU6AIOGdmN/VegaZTpMoItJpDdhzDJlRqV
 WQEXp
X-Gm-Gg: AZuq6aJ32oNw2ZL3UWBNur9FXFchlpzPnbPGAajFE5jRG9AnwhBus5ugZQRhmo0yaAW
 hFyt/VMBE8ZmtyM4QoiwYUouXU4/WFmYwqk5T2Q60MhzeNzemrosskJOJC49A4HkCYe8nPMquj4
 WVOdG1ZfZIt1ynYNu2Jqfpd6n4q81wuvCi3Al5GSjGwp4OF/gqCucMe0AO1o92ngIZ0AhGjLj0h
 XIC+MD2NT4upCAbFtRbK48yLNPNZ7jTtRCEjtZ19VBBAn0ZEGiS/6+v/DOpPaE7PF+NhV2Y8tde
 7/i76p4WwyRXaFA2q3nhvK4nP4I6V9KE+B1qsBq8rKOjSgkf4izuHm5mkvUwi8pr4qsc3gUqwM8
 exF6/Kt9YT0psKzXgUFMawzsU1D9wz5/gmaxCjiIfccNauJS9BjGrt1cWItzE/Y6WBKGKUZsSwL
 cAFODWq+FDaJnLo2MzgDYvjqnSPt8q+lH5uNP54BH8YXXGVqkkGl82Ew==
X-Received: by 2002:a05:6000:2c01:b0:435:e460:235b with SMTP id
 ffacd0b85a97d-435f3ab32acmr16306678f8f.59.1770048780133; 
 Mon, 02 Feb 2026 08:13:00 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1048a54sm43785229f8f.0.2026.02.02.08.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 08:12:59 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Mon,  2 Feb 2026 17:12:54 +0100
Message-ID: <20260202161256.104871-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770048780; x=1770653580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8sWEbaQj5v0w3xuNKZXDX20huO1XXTCspuN0ekjZTdk=;
 b=ER9MrKPIC9dcp/xRUaa82ao8ftreshTY/ha93jrrKdlliVGqwih+hkJVR8SXQS6XIi
 Q0D3JrT96NvurbGw/iQcvDZXK6ZnNrUA308CwU29euwNQld5XqCYOCcrOHn6fbJ8/tJ/
 Asrxnt0AsEQCvx1AJ4YYZn/p/f10viv+IXGoOP9TKzXdUOeQIy8fwevDcz78etat0IwU
 qR5RZvfAY00PDTzc/n95rlkads1gaYVqAp2od2nJ7q9fW5+CMMwVejTe7zLGOokXKI/f
 5cvZfhDovFTujCLXgxrdySDZKC+NnjiXNpa3HN+YwPnQ3svwMlXJNYZ0o2Efhk8xjG2/
 idFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ER9MrKPI
Subject: [Buildroot] [PATCH 1/3] utils/generate-cyclonedx: move license
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move the code that retrieve the SPDX licenses into a function instead of
doing it top-level.

This allows to pass the CycloneDX version as a function argument instead
of defining it as a top-level constant.
In next commit, the CycloneDX spec version might not be known when the
top-level code is executed.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 44 ++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3..1f7a26e870 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -21,12 +21,10 @@ import re
 
 
 CYCLONEDX_VERSION = "1.6"
-SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -41,21 +39,39 @@ BR2_VERSION_FULL = (
 # 'resolved_with_pedigree'.
 VULN_WITH_PEDIGREE = set()
 
+# List of supported SPDX license expression.
 SPDX_LICENSES = []
 
-if not SPDX_SCHEMA_PATH.exists():
-    # Download the CycloneDX SPDX schema JSON, and cache it locally
-    cyclonedxpath.mkdir(parents=True, exist_ok=True)
-    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
+def br2_retrieve_spdx_licenses(version: str):
+    """Populate the list of supported SPDX licenses for a given CycloneDX
+    version. If the list is not present locally it will be downloaded
+    externally.
 
-try:
-    with SPDX_SCHEMA_PATH.open() as f:
-        SPDX_LICENSES = json.load(f).get("enum", [])
-except json.JSONDecodeError:
-    # In case of error the license will just not be matched to the SPDX names
-    # but the SBOM generation still work.
-    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
+    Args:
+        version (str): CycloneDX version
+
+    Returns:
+        None
+    """
+    SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}/schema/spdx.schema.json"
 
+    ret = []
+    path = cyclonedxpath / f"spdx-{version}.schema.json"
+
+    if not path.exists():
+        # Download the CycloneDX SPDX schema JSON, and cache it locally
+        cyclonedxpath.mkdir(parents=True, exist_ok=True)
+        urllib.request.urlretrieve(SPDX_SCHEMA_URL.format(version), path)
+
+    try:
+        with path.open() as f:
+            ret = json.load(f).get("enum", [])
+    except json.JSONDecodeError:
+        # In case of error the license will just not be matched to the SPDX names
+        # but the SBOM generation still work.
+        print(f"Failed to load the SPDX licenses file: {path}", file=sys.stderr)
+
+    return ret
 
 def split_top_level_comma(subj):
     """Split a string at comma's, but do not split at comma's in between parentheses.
@@ -404,6 +420,8 @@ def main():
         parser.print_help()
         sys.exit(1)
 
+    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
