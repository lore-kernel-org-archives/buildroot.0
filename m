Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D24AD13C00
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 13:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4204280966;
	Mon, 26 Jan 2026 13:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aH0lHE5vxMWX; Mon, 26 Jan 2026 13:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0827E809DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769432663;
	bh=bhhN0/slgVZr1XScI5+VXRQhfmxFjBZT4SDWdjP+0q0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CtsA8HL471H045/Kyjq+mN4BS+f9HrBw+4eQU2thHzCo+aL5HEzHqYI9xXhUkwxEt
	 AGmG4QfKBMBHC3wy+pGey8tGzhX/pJDOAAozN/wu4AJQc25EdtrqRhkwqQDnuykCcS
	 /Rrj4WPVUo0Wc62SxTdDfPmPIlXVR5em5mwajB7O5GBHEW1OCAIJg9msxwAJRCeYpd
	 uJnkU86SjerXElkzanUJjlhz7FUC1pnAWR1IFNua/zZNkDnylH1LetuSEGzOv/q4Lx
	 YumiXXgEeKONDWBPuj+9ntWUaUxsgc7zGNd4knZlC7dXoDIaTNqtUvDqGpcWmgku4T
	 1Yg6jjnpFmdxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0827E809DD;
	Mon, 26 Jan 2026 13:04:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C4CD9BB
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2596407A8
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDqps26Dx1_W for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 13:04:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3CAE4079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3CAE4079D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3CAE4079D
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4801d1daf53so49223935e9.2
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 05:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769432656; x=1770037456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5AulIvOlacHgHVFJl8boLKpjIvG1SGQEsh7TXNoyHQo=;
 b=muXv1CcxDRnbQ3o9tAgnzda/St9Ooacg/ObjG8tj7s1g1+laE5L/BZxtvUpAm+Xlzn
 HEY5hVFkX83WrMEEiMIUYPZbwkJxb4BxK5ioVVqeNzCejPDfDhdh3n8ZAY3R76REF8Lg
 tlDSrfsOSuUQHDBr7nhIWGiJm9s05SFkjPi+jH09HdtfDyTG3v+AN+HX51CvGvhj4P+0
 HQyJS4VBpih7RfD2Mi0CXyDaeNrCcmw7IFGzRoQOJhlskeMrTiWruRTrUjdEK609XAEB
 L1rcKQhg+txPZ/qOqbrrCvjffFHH6Zk8Aun61sbNyLd2xXYgpcjvYoiB+cNpk7evBoUQ
 T/Lw==
X-Gm-Message-State: AOJu0Yy4kIvU90MPZxFHTgOeXSR3b8fkbeflw5M9UrtJkQjsN/J8aNWJ
 spwPZyoEXNuzImZjaHCmjavbhJMk/khTUCt15V8eJYgIVjAk/MhFxq9qxmqXVliDo9hdL5I5H6R
 tXCtc
X-Gm-Gg: AZuq6aIE0Ki7VsKtqJ6bqiv8mv3OWZCqEnftQGlKl8KvwsE9h0ocOlFU9Z26CePZoa6
 +GiF02Oaii5BjGN24bGbZsACO56d64ST93oQv/pdINIRS9PypvtH9SLEEs/KGGSLKIuoXDjlcRJ
 nGoYpTDlYTSdncCNkle+FtPgcM1sOI2lLEUK8mgl859GhiEGkWx6FJbfN6Wh6BPbaH2lKc6GgZv
 apfUVCalt4b5BLmkBnh/DZyGOJWLxmTRjqh1IjzldPLtZsYCBE05S1qjlV1gSXCccyrowmmDFbs
 LXoqA5UrBp5BMFugJROWI2m3o92nKbNCumRNdPHI5swL/1H64Ed0QnIZY+BNwzntQ7JfAe6C0gO
 3nNDi8h+FEXsQj6/Ng0LBDr2AZgAuATwTPWQdCewfNi5V9PktzXGauaE/q/ZMMlmzCaySRJEs+V
 sIugmpQsMKCacXNdFlitVmZT/vBAYfR2xXgt343l+0GNJ3C6Xw4kd/vHFpNds=
X-Received: by 2002:a05:600c:8905:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-4805d9664a3mr46524795e9.5.1769432656549; 
 Mon, 26 Jan 2026 05:04:16 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470cf1acsm359603435e9.14.2026.01.26.05.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 05:04:16 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 26 Jan 2026 14:04:14 +0100
Message-ID: <20260126130414.59175-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130414.59175-1-thomas.perale@mind.be>
References: <20260126130414.59175-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1769432656; x=1770037456; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5AulIvOlacHgHVFJl8boLKpjIvG1SGQEsh7TXNoyHQo=;
 b=hrJraKo1zW7G8qViBZeH3T9ZYuvH+uik44Y2qiQKaRpisvTwKO7+LRfEjxYZFb62uu
 gMsdZAh5hH1b8UO5s95DID0SV8P2PF9dHHmAF4sAwK83MUi8eN1PCCbcQfOV95+A9BEh
 ThY3TWrro5p8QYDwZ0eJOOWdBFgCYKPoTx/amyXDFyhvtGf9WWKrUdtqDkmRDUXR6TYA
 olr7DtPqG502rwQsj/t9JslPFfVT5a0XW5EiBFz+SZQlsw/ISbrkhOLnyat2G1tAfSaY
 0KcW7CwjBeqf0csZHE9v6+wzweCpQHqY7KfARUlZsPWGdmjWm9bXdMIm79aoG6RXKw+D
 BykQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hrJraKo1
Subject: [Buildroot] [PATCH v2 4/4] utils/generate-cyclonedx: fix
 dependencies w/o virtual
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

Since its introduction in [1], by default the `generate-cyclonedx`
script doesn't include buildroot's virtual packages in its 'components'
list, unless using the `--virtual` argument.

References to virtual packages present in the 'show-info' output are
filtered out in the resulting dependencies.

This patch fix the default CycloneDX dependencies generation
without virtual packages to reference the packages that provide the
virtual package instead of just dropping the virtual package itself.

If we use the package `lbase64` that depends on the virtual package
`luainterpreter` as an example. The 'dependency' entry looks like the
following:

```
{
  "ref": "lbase64",
  "dependsOn": [
    "host-skeleton",
    "skeleton-init-common",
    "skeleton-init-sysv",
    "toolchain-external-bootlin"
  ]
}
```

The `luainterpreter` dependency is missing.

After applying this patch, package that provides the `luainterpreter` is
present:

```
{
  "ref": "lbase64",
  "dependsOn": [
    "host-skeleton",
    "lua",
    "skeleton-custom",
    "skeleton-init-sysv"
  ]
}
```

In the case of a virtual package provided by multiple packages all those
packages will be listed. This happens when generating an SBOM on the
entire Buildroot packages.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 -> v2: use set to avoid duplication of dependencies

 utils/generate-cyclonedx | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 04ce8fc3a1..2b6c6d63d3 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -337,7 +337,25 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps(ref, show_info_dict, virtual=False):
+def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
+    """Retrieve the list of packages that provide a virtual package.
+
+    Args:
+        ref (str): The identifier of the virtual package.
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
+
+    Returns:
+        list: package list that provides the virtual package.
+    """
+    return [
+        name
+        for name, comp in show_info_dict.items()
+        if "provides" in comp and ref in comp["provides"]
+    ]
+
+
+def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
     """This function will collect all dependencies from the show-info output.
 
     The dependency on virtual package will collect the final dependency without
@@ -352,13 +370,15 @@ def br2_parse_deps(ref, show_info_dict, virtual=False):
     Returns:
         list: A list of dependencies of the 'ref' package.
     """
-    deps = []
+    deps = set()
 
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
-            deps.append(dep)
+        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
+            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
+        else:
+            deps.add(dep)
 
-    return deps
+    return list(deps)
 
 
 def main():
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
