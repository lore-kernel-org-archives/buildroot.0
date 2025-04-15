Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23679C369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D371383668;
	Tue, 15 Apr 2025 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWJgTTrWeygm; Tue, 15 Apr 2025 19:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E6D82345
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E6D82345;
	Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2566C108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0708360B0A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLNUPFXmOgmI for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 084E460C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084E460C14
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 084E460C14
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c1ee0fd43so5759741f8f.0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746971; x=1745351771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FaOdgSauvVVVyHaGxlEynp4AzszO0YZVq/qyKmeqxQU=;
 b=IS/wX8F7vZrHK2TwcyrMmT0Wy0YFa0RcSjswm+RAYvx/CazriO+V+i+oomVYGR7q8J
 pnjBRxbZXTCi69ycI+s4mo3WfV6wH/TcYeDhH39ygx/247/IcClD+FTT88nxUp+FgJLz
 2ovMeuO9d0sAGdlDkV4m3hF/c4egmy1C4X1tNRywlddCzbz52cWWvZGsw8EcGe8nfK+3
 Lh14roF5CynE37eyQJICC6ABIOfWVatc6qi9zZIS5FwHWMuS+L6XUT3rwLxKeYVQlnWD
 ebIfZ12gNprD8zdtWWgWSy6Gk/cw23uZ9OAZ3RKVMz0W/3XguAGq5C2rctzkzobY5sc+
 gbvQ==
X-Gm-Message-State: AOJu0Yw2wIHt2rsQfS32Ep+mQsnmYrhqN7x4fbddWAF2K3t99Gq76Tw0
 zBipUYG10DNzA5MXv8xwxxR0dIKsihZdjstmu3bOC+FLQ8kMKejt1N9CYsNcWkNJDVumE7AI5GJ
 c
X-Gm-Gg: ASbGncuGGkdcf/LIIfKMLMqWY0mB/3E2CGNFVub/cMkf30geSLb6p7sPDnoG2AGCpFF
 dOH8IcgFP2foVH7LBHB6yPgCAVhAKz4djKh19wIc48MnFdyG59e9YOjR6wKVd2x5rS4JqCENJBI
 iikRhUEQVT3KakM/Lhvw7+6+JVgi5LLxJq7tM76hVJ+2E7iqIMXCVSdG9ihJ9vY3eLbm0+4xnj0
 VEJ8st36Aca4T7Fb0JBUBKvNykFZQZcH6E9STz4RdNwBjNyeX/x+JI1yfddeyx16eom6jCxJWYO
 Qb8dPGDQtu9AHDufv2X/67fUozutJo79CRoKD7rdZEO4CCT8LZhxEGM=
X-Google-Smtp-Source: AGHT+IEd261KcmXe4N6jTfL05E0kjPZcX7D0qlOgAYE4U1S+oLKjQW6ylgoCHMnl6Lzt0RUffLpcqw==
X-Received: by 2002:a5d:5886:0:b0:391:487f:27e7 with SMTP id
 ffacd0b85a97d-39ee2769687mr581177f8f.55.1744746970617; 
 Tue, 15 Apr 2025 12:56:10 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:34 +0200
Message-ID: <20250415195547.199428-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746971; x=1745351771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FaOdgSauvVVVyHaGxlEynp4AzszO0YZVq/qyKmeqxQU=;
 b=X/Ue7mp3RDDmuUq5mGBx1bic17Hj0a2amJ/avYAdzMpaoz+MNZ1XDuNCGzqoik2xIk
 MkRCQ7Y2JdyrLKvirGtIPnoSQaKpzn504oFCavzuHJGaBcdKgI+bRg3RAJbezgmi8cCO
 02YghoVKy+Illg8tW7iujl18ek8/Y9ZjXI5OZvU0TwzSzNVTb3gU8JK1MQvu1Af4I9jR
 OYRTNobXVxfC7djhOd982S7G+qFu+GKS3/iq5ko95a73ez1wjZ3cQ4d8d2gmKvr9/363
 oTo1hUFiFS+3D/nGdBCCxyu3bx8Ne8HMXErLlFEJyrcKdwg7PbbQT5MwYMKlQkUoT+w/
 mx5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X/Ue7mp3
Subject: [Buildroot] [PATCH 1/7] package/pkg-generic.mk: add PURL package
 variable
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PURL stands for 'package URL', it's a specification that standardize
how packages are identified and located.

PURL is used to reference the same package across different package
manager, tracking tools, API and databases.

A purl is a URL composed of seven components:

  scheme:type/namespace/name@version?qualifiers#subpath

  - scheme: always 'pkg' (required)
  - type: package manager used to install the package, download origin,
      type of package (required)
  - namespace: name prefix, type specific additional information, it can be
      the package author or scope (optional)
  - name: package name (required)
  - version: package version (optional)
  - qualifiers: extra information, could be OS or architecture (optional)
  - subpath: extra subpath relative to package root (optional)

A PURL for the purl-spec repository looks like this:

  pkg:github/package-url/purl-spec@346589846130317464b677bc4eab30bf5040183a

It contains information like the provenance (github), organization
(package-url), name (purl-spec) and version (34658984...).

This patch only introduces a subset of components but can be extended in
the future.

Similarly to the CPE variables, this patch introduces a set of PURL variable:
  - <pkg>_PURL_VALID: Whether the PURL generated for the given <pkg> is
    valid. If set to 'yes' the `<pkg>_PURL` will be defined.
    Similarly to the `<pkg>_CPE_ID_VALID` variable, this will be
    set to 'yes' if one of the following variable is defined.
  - <pkg>_PURL_TYPE: The package type or origin (default to 'generic').
  - <pkg>_PURL_NAMESPACE: The package namespace (optional).
  - <pkg>_PURL_NAME: The package name (default to `<pkg>_RAWNAME`).

If one of those variables is defined the `<pkg>_PURL` variable will be
generated as follows:

  <pkg>_PURL = pkg:$$(<pkg>_PURL_NAMESPACE)/$$(<pkg>_PURL_TYPE)/$$(<pkg>_PURL_NAME)@$$(<pkg>_VERSION)

For more information, see https://github.com/package-url/purl-spec

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f22b6e981a..1e68f48f7c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -745,6 +745,59 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_UPDATE):*:*:*:*:*:*
 endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 
+# If any of the <pkg>_PURL_* variables are set, we assume the PURL
+# information is valid for this package.
+ifneq ($$($(2)_PURL_TYPE)$$($(2)_PURL_NAME)$$($(2)_PURL_NAMESPACE),)
+$(2)_PURL_VALID = YES
+endif
+
+# When we're a host package, make sure to use the variables of the
+# corresponding target package, if any.
+ifneq ($$($(3)_PURL_TYPE)$$($(3)_PURL_NAME)$$($(3)_PURL_NAMESPACE),)
+$(2)_PURL_VALID = YES
+endif
+
+# If the PURL is valid for the target package so it is for the host
+# package
+ifndef $(2)_PURL_VALID
+ ifdef $(3)_PURL_VALID
+   $(2)_PURL_VALID = $$($(3)_PURL_VALID)
+ endif
+endif
+
+ifeq ($$($(2)_PURL_VALID),YES)
+  # The package PURL type or provider.
+  # ex. pypi, npm, gem, ...
+  ifndef $(2)_PURL_TYPE
+   ifdef $(3)_PURL_TYPE
+    $(2)_PURL_TYPE = $$($(3)_PURL_TYPE)
+   else
+    $(2)_PURL_TYPE = generic
+   endif
+  endif
+
+  # The package PURL optional namespace
+  ifndef $(2)_PURL_NAMESPACE
+   ifdef $(3)_PURL_NAMESPACE
+    $(2)_PURL_NAMESPACE = $$($(3)_PURL_NAMESPACE)
+   endif
+  endif
+
+  # The package PURL name
+  # default to $(2)_RAWNAME
+  ifndef $(2)_PURL_NAME
+   ifdef $(3)_PURL_NAME
+    $(2)_PURL_NAME = $$($(3)_PURL_NAME)
+   else
+    $(2)_PURL_NAME = $$($(2)_RAWNAME)
+   endif
+  endif
+
+  # A PURL is created based on the $(2)_PURL_* variable values.
+  # see https://github.com/package-url/purl-spec
+  $(2)_PURL = pkg:$$($(2)_PURL_TYPE)/$$(if $$($(2)_PURL_NAMESPACE),$$($(2)_PURL_NAMESPACE)/)$$($(2)_PURL_NAME)$$(if $$($(2)_VERSION),@$$($(2)_VERSION))
+endif # ifeq ($$($(2)_PURL_VALID),YES)
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
