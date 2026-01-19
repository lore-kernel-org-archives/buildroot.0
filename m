Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0EED29C39
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E72D611F8;
	Mon, 19 Jan 2026 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6CIKxD8U_hz; Mon, 19 Jan 2026 15:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A91E061215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768835816;
	bh=rmgM8ryyKIcfMT+61ywcZSFcQZNcTgvbzoBrf0k/2uA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lf3CGgvBB1Apaep7bLEi4bKSwkjrEkfvbOEmMDmgwn3plECWYuPXICKY3xTOSDwaV
	 b8zD7YVclxzzHyFbVW38TfRMjHcWqVWvacREVpSfitUHImefZsm0iZy/CoIIYfdqEb
	 +LhGGOACA+CmQ9AOQb+qTkDzp3FAW8Wzo+kWDfJHMnZqA4WAYIwb5mJXvx4uZwqAom
	 LVknkU4QAb8gBPRVuigWANCKeFwqL9arrKvDT1fYO39lGWM3fn/fX+4EH8Gmir9ItI
	 MRjA4zbTDN5YkJE/RQzV/SslWrl1eGJzj6+Wp9FOkIVZ1dOmcp4NDFQlH4CIvIvgJF
	 7y1oWKfAglP7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91E061215;
	Mon, 19 Jan 2026 15:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E53F3160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D332E83B84
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BHnqPfMyv8a for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:16:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C17A883B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C17A883B83
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C17A883B83
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo35755165e9.3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 07:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768835809; x=1769440609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5LvwGTHvepZ4ENB5umXzmFP0PW7TsBF/ptqaUQxRkN8=;
 b=FaWZX0zhIAwobnTK7efVBgggUSSlN+axnssHimpcvLDYEHOMfylC3hdxroG4pEXWjN
 C0oUYh3rl65TsheCQ/Gl46EXQYHAtywk3KiOLtaIs+GT2DJzLyZzD6EuEoqon6Cq5HHA
 Fd81xI+kJbzE8bJOd40NdkCeFCAlL4x2LI+5/URD/RP/zQ2wmm8rm29MZFxBEyjcAiaF
 +OdwXr7dAG09nSjlRKeXR/bU57X3I1isgJtCmOmNBMbb2L+L333czxaWkAOtNN0dQbDh
 dmcc6/iLytOKMzGyWUKPNn/BhKzt6vw1tXh3TyMpnjVe8Yeb0Sba8J0OVLhB1NDTOl5h
 SlQw==
X-Gm-Message-State: AOJu0Ywwv/1eEggyEE0bdz/LXGbxaAqqNl4xBPvQqeohVpEKGR1tMwhI
 jlr6mtJGQkEwLW5TaQu4Jtab9WipD+jnmqVHKcFF2LVdrO/whYVkv/B8Z5oHUoC7JQwaJP8dfdz
 PXVH0
X-Gm-Gg: AY/fxX5HyxL9K9ZV0lxM43QL1+CNLWNSpRWbQz5LjoGT6cg/m+UjWxK6jS79ys70APs
 ZPed9eK/r8z2b8yZ/bmc4HrZgRRFaCQcGZ3hbeSiY7X5jj0/SyOh8ZKxP1aiDZoFjPGn62+dXNc
 K5/FHOybO52wYu7OqvDKySAB5C3e1snVA8/ei+UtU79zj3J98ntWxjqCH0jUgusLdK/RG3/9TmO
 ITjg4x1g7BiulfV1eMVfbEiQYqzNCEcUULCLt0y1ubFGPniTRg0d7ZUhY+k6naehv0M9zhgRj2k
 z+WwuiwaNnejxfM0F7aP9HjDjXZFVeTyDoG1MhFmXVYgG2AUHZ6JpLhd88qGpuahgO0giwkeq3d
 nDurnp8mJYjRlQV+FvCGJmUzZKJxk0kA2hGrhby0ODMslqW6LuiBS6IYTzltmJE4Xa7Lei+qGBZ
 jCNGvQTlC/069p27cedODEi3KYHKC54gORdtMsj8rWSXnrIPoH
X-Received: by 2002:a05:600c:540f:b0:479:2a3c:f31a with SMTP id
 5b1f17b1804b1-4801eaae2b0mr142878215e9.1.1768835809523; 
 Mon, 19 Jan 2026 07:16:49 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm253324295e9.6.2026.01.19.07.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 07:16:48 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 19 Jan 2026 16:16:42 +0100
Message-ID: <20260119151644.100529-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119151644.100529-1-thomas.perale@mind.be>
References: <20260119151644.100529-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768835809; x=1769440609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LvwGTHvepZ4ENB5umXzmFP0PW7TsBF/ptqaUQxRkN8=;
 b=g2Us3N/0dcYTmX/wE5KyIWs0WevJGSQZs1CqzSGaApJrvdc1svpwzfEcSlZlHzwXt3
 xHFC4tN+98rBo3eMTtnjITpP49QZ53zykcoUOXstPVXctvXUZ6HaTykfW9N5oV/QuiuP
 7mj9mYdsXDrEsbQz1NmXbwcHvPWfc+v28Csz8BQBh3p9VEYOnOFfrM3H57IoRjVRta30
 BsXo23QQ/BlZxPMn46VDcIVnTrWP+CSvaT5UC8Az2web6sSLM/ubdXojOWo8+T2ZocZW
 pmCmNjWmBXImMaLe8b4TYIGbNFqe+k65EZB3Jl9HvVAdFiTcNXx2leLxX9mbGmsuL8Zw
 8o6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g2Us3N/0
Subject: [Buildroot] [PATCH 4/6] utils/generate-cyclonedx: fix dependencies
 w/o virtual
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
 utils/generate-cyclonedx | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 04ce8fc3a1..d224b3a24b 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -336,6 +336,22 @@ def cyclonedx_vulnerabilities(show_info_dict):
         ]
     } for cve, components in cves.items()]
 
+def br2_virtual_is_provided_by(ref, show_info_dict):
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
 
 def br2_parse_deps(ref, show_info_dict, virtual=False):
     """This function will collect all dependencies from the show-info output.
@@ -355,7 +371,9 @@ def br2_parse_deps(ref, show_info_dict, virtual=False):
     deps = []
 
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
+        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
+            deps.extend(br2_virtual_is_provided_by(dep, show_info_dict))
+        else:
             deps.append(dep)
 
     return deps
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
