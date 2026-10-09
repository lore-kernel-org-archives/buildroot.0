Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B65FCA6012
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 08:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2861F608B6;
	Fri,  9 Oct 2026 08:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77klhMGVBCUx; Fri,  9 Oct 2026 08:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 52DE660892
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791534872;
	b=rwK4onrpDI+o557NGb5aeWnKDW8vAxrgza/LatWE+DJmtKjj9uSJgh4HefWtPaW/Kg2x
	 KRnOPTSP3HfUnf7YCgdoQB225BmMR+pDhRX9Kg0/H3yD2WVENuws7Lh/7/RNrpoYK967Q
	 ExG+I9Vp/EnhFu8I25WBNXGViD3GkCddAtO6jrm5akDqY7YMQgU+yKRJC1mN6zI7hdnee
	 hGke4bjcZKH46Y0guVVA9ke2PCNMspTdB2ktz2dhpqvOxOnsXTG+yiEKuXHqDCLk+7tYd
	 t84jpd8fEG72HPf7sirQDlGA5k8yNSBlQnXlbitcBr7vRLY5i/NeA+Bl/Q9aY8afMVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791534872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7GLhW5JEZl7xPDQWNhxHkie0kXkndo5cbHAD/pvAMmU=;
	b=UeSrY0+KP0vo7Y8yrgqMDuDEwb+9Bbc07WMOpzy1zl+EBmUy6+1znNbEwYT7YaO3uJv/
	 jxwQ99iW1c6tiI99ZyTkdeGAA9bwuHJ+jj9aDG8L10yd2AvVhBFhysdgyXyC70OyDx+4Q
	 3A8YZZku7LsSIUj4gvnyu6eKfhuF7EhwRyYwuMCw1VHTZ6F3LEJuOxNqZXYhIQZbTmFnm
	 w9aOCVktNhdXki/dGj9ElVHDTinfeoB7zkJKfTNnCMf5u5ta7ZP/oLvNbcKRHndGftjb3
	 vfT0lA5CGnW9Bwp7nGG+0COVNdPEhyYf9bpC5/eBqm7GeHfhFweUxyqZLNhNcua4/aQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791534872;
	bh=7GLhW5JEZl7xPDQWNhxHkie0kXkndo5cbHAD/pvAMmU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mi2nUuFKk3LeVJp/RkQLAVpnHY2bARvlHrX505tIhLzBYdottmMq0UppXFJN6PsKY
	 PEmScBg3aO0PL0TFZSB9dSxySD+LJPwpA3TP7kO2vqAwOZiKgqLInjtqqR8XnSmEWd
	 Pm2ARLoGTkHQkk80lbCQI/o3IFdLLkOouHzca0QU2YyKepwc8HSQzJOtLhF59FMkJv
	 L5ZsCiVOWxEaCUmsLKQQ5+o3iKCNMqgcbn4gEJRu8ZWBROMsFN0P35CgKavOKn1i86
	 eUAo/kTSDcIbrM50B3lM/7SSIlJV933O/S1P/QUuC0eH3kI/AwPZd+EH+SRVl5qivU
	 2VYXqNoXNzghA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DE660892;
	Fri,  9 Oct 2026 08:34:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2F6B1C6
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C506C8146A
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9347Z4p5x3HG for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 08:34:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8FA42810DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791534870;
 b=dvF26U+gjlMXbxk7f4fZkB7jX7ZOFnzucxzcrYo9Y6+tFqoEnAytjjKrjDIordUnwVtw
 UU9MRF/GqrYvuwu46vZY1iNmva+sVDLhdMYoQsUl2g4E4KsCDCXMIlU84vulEjQof/O+a
 5xhXVGQowlrlQY9n9myLGY0qfmAELI4om3PbF83poH9/UKbjSLwgcS/bvLYnYosIoNoqU
 ZI0PaMN0jRQO/hugV6bj9D0IcVKHrefBJAj3mC1oUZnVST7KyAWl17Np8a2cZcM6a7OCX
 mJGj4o7IGMC+jEkiU1n1eqcLH1d9evCsH7aJG/5+tAlABHKUxkbEQHisP89nJURsbIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791534870;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=GulWoB7vVPES644ou/82+QGhjNRTMZwn32TQpwrjKRU=;
 b=CTSu/tTf29Gj5tMi8ZUEOVSEpyZqkyUiiUOCX68wXUtrpzcnJAyHywKPt/4J0vtlPkOH
 ol8Pijuts1TIAPW1aaPVfUewAtnHJjpH32LQhJ/2vyn1qKz0klPs8okAM1bsebS9R4O6n
 DWJji5hKux9yX5P0JeB3hVvwUy4z4grrSKddpNlu3tHYJC+TSFai0Q026uvz7FUYfEhD+
 l4BYYGQLmCiEfGN2t1XDSNcrzD4zOlxXbsUeS0staRL5VDErEVDM9rjzykKhIjXNopIKO
 jq5APoshEWio53TqOeYSlo5MSY/Xxs9XbS8jvSwJioX4DVbxVqV1qdFasmC2JzpB0pw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=qhbwxOzh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FA42810DA
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c2e8e738ae0so607185866b.1
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 01:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791534867; x=1792139667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GulWoB7vVPES644ou/82+QGhjNRTMZwn32TQpwrjKRU=;
 b=yQ0gdBUFmVOQIG8lS2CxigmWjxQL4emjrCyZ+77Yc5+njAR8VZ7kQfDK3HR0RkM05s
 EFVF56Mud9Jt87tihJ2I5e9xo4WwsfzfyceOv+nbGbQL41WTRvOETB8Siolym91DZdA0
 nQrI6Vxgtv7ZUOLsLPALRYOKHLF5uPEm50NxxGjgrKxs+ZQePF7glfZNtY67QyCJpbw9
 lycfMRjZun8HAYfWLWwOnQ/NAam/86MO9AuMqk+PS3GhvrAW6EK3cSN/mE3PCm0Vgi7+
 htSnetx5qPmSZGJwKv6wYmQwQBi7Q03Eo6O4DSFfG3u+nPSn99aCTDQRmM2yB50tYgR3
 gtOg==
X-Gm-Message-State: AFq9FYL6W1pG0I3CihDY7goQjWZFGWCK3N0waMHGA9h7UC2dKnf4RjDC
 oZjkVenAERG61CpPczHH2299aqPRiolD8t//ov9gwQL11GojOILBhLlfX5mqZw==
X-Gm-Gg: AYBFou0mpQIfD7acs4YKK8QxsI5byAN0PapYR5qeKT+scq4NmkBm9cTn3+lac5CzvjC
 3IsJyooiGZuUsg3z000jOgMVUoDF+ASxi4jCAhAA73vPgTf1U+dPgrzy2TFCmysUX+5UOJEK8NB
 uZrQhTr43Z8zugAudE1y6ULchI5LagQCp9lMRhjXZFqaTpdoNNOyjxKdRn69Yxpje0cvKrfrIjT
 q0OPRT4ftcagDlWVmVY2qbLctGUPqA94OwlzK26r3NH++udIj+lUMbUXlZlYPwHfONnTUHEK+VM
 CyKPqBgw7TypbTgjxx4zcc57lxB2XTPd9LJYxObC2XR2LID/L/b3ekrXAl0okSdsjqwPbXnEYgJ
 a/wYffkhkuWfRPbvrSfcXZlVbaNFbllz5VeYlCw5TAXu2zimtDBXM/D87So9iIYHDTdbfrJuew2
 j3YzDpYvjyoXaE9QmjxqEkQMgOfg8LvfaZo2b727WJD3oLqUkXzi5mOGhE+xbSOHXewPNzLR2he
 9DWsN4joP2aSGWel97WxpiajOCysBbfA4nEUjCpuNvQeDU=
X-Received: by 2002:a17:907:6c12:b0:c2a:cf73:63fe with SMTP id
 a640c23a62f3a-c31a9a074b7mr107716466b.6.1791534867047; 
 Fri, 09 Oct 2026 01:34:27 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a3ae32sm63836966b.28.2026.10.09.01.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 01:34:26 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Oct 2026 10:34:19 +0200
Message-Id: <20261009083420.1298439-2-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009083420.1298439-1-yegorslists@gmail.com>
References: <20261009083420.1298439-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-setuptools: accept PEP 561
 stub names as package-data keys
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The validate-pyproject schema bundled with setuptools 80.9.0 only
accepts importable module names (or "*") as keys of
[tool.setuptools.package-data]. Recent typeshed stub packages
(types-python-dateutil, types-psutil, types-setuptools) use
"<pkg>-stubs" keys and thus fail to build with:

  ValueError: invalid pyproject.toml config: `tool.setuptools.package-data`.
  configuration error: `tool.setuptools.package-data` keys must be named by:
      at least one of the following:
        - {type: string, format: 'python-module-name'}
        - {predefined value: '*'}

Bumping setuptools to >= 82.0.1 is not an option for now, as setuptools
82.x breaks older U-Boot versions using binman (see commit
aa8e6bc395fe "Revert "package/python-setuptools: bump to version
82.0.0""), so backport the relevant part of the upstream fix instead.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 ...-561-stub-names-as-package-data-keys.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/python-setuptools/0002-config-allow-PEP-561-stub-names-as-package-data-keys.patch

diff --git a/package/python-setuptools/0002-config-allow-PEP-561-stub-names-as-package-data-keys.patch b/package/python-setuptools/0002-config-allow-PEP-561-stub-names-as-package-data-keys.patch
new file mode 100644
index 0000000000..9bfc3a7a06
--- /dev/null
+++ b/package/python-setuptools/0002-config-allow-PEP-561-stub-names-as-package-data-keys.patch
@@ -0,0 +1,42 @@
+From 7bed5f151ec5bf2f41fa81133ae368a808dc2d69 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 9 Oct 2026 10:08:52 +0200
+Subject: [PATCH] config: allow PEP 561 stub names as package-data keys
+
+The pre-compiled validate-pyproject schema only accepted importable
+module names (or "*") as keys of tool.setuptools.package-data, so
+"<pkg>-stubs" directories as generated by typeshed's stub_uploader
+were rejected with:
+
+  configuration error: `tool.setuptools.package-data` keys must be
+  named by: ... {type: string, format: 'python-module-name'}
+
+Validate the keys against the package-name definition instead, which
+also accepts PEP 561 stub names, as done upstream when the vendored
+validate-pyproject was refreshed.
+
+This is a minimal backport of the relevant hunk only.
+
+Upstream: https://github.com/pypa/setuptools/commit/2235bd0831aa35ec1d0305fd8a7d7ad23731e29c
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ .../_validate_pyproject/fastjsonschema_validations.py       | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/setuptools/config/_validate_pyproject/fastjsonschema_validations.py b/setuptools/config/_validate_pyproject/fastjsonschema_validations.py
+index c69368a..848bc02 100644
+--- a/setuptools/config/_validate_pyproject/fastjsonschema_validations.py
++++ b/setuptools/config/_validate_pyproject/fastjsonschema_validations.py
+@@ -317,11 +317,7 @@ def validate_https___setuptools_pypa_io_en_latest_userguide_pyproject_config_htm
+                             data__packagedata_key_any_of_count4 = 0
+                             if not data__packagedata_key_any_of_count4:
+                                 try:
+-                                    if not isinstance(data__packagedata_key, (str)):
+-                                        raise JsonSchemaValueException("" + (name_prefix or "data") + ".package-data must be string", value=data__packagedata_key, name="" + (name_prefix or "data") + ".package-data", definition={'type': 'string', 'format': 'python-module-name'}, rule='type')
+-                                    if isinstance(data__packagedata_key, str):
+-                                        if not custom_formats["python-module-name"](data__packagedata_key):
+-                                            raise JsonSchemaValueException("" + (name_prefix or "data") + ".package-data must be python-module-name", value=data__packagedata_key, name="" + (name_prefix or "data") + ".package-data", definition={'type': 'string', 'format': 'python-module-name'}, rule='format')
++                                    validate_https___setuptools_pypa_io_en_latest_userguide_pyproject_config_html__definitions_package_name(data__packagedata_key, custom_formats, (name_prefix or "data") + ".package-data")
+                                     data__packagedata_key_any_of_count4 += 1
+                                 except JsonSchemaValueException: pass
+                             if not data__packagedata_key_any_of_count4:
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
