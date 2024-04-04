Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B63CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 12:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A8441806;
	Thu,  4 Apr 2024 12:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGvL_5c2ie_6; Thu,  4 Apr 2024 12:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C78A841810
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C78A841810;
	Thu,  4 Apr 2024 12:44:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 481F51BF3D8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42DA060FA0
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMRZO2vgzK03 for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 12:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFCF660F22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFCF660F22
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFCF660F22
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 12:44:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4156c4fe401so6284795e9.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 05:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712234692; x=1712839492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7JOeo7j9Pxmz0sUpOFSCRrCAgMke4Jnz6RO5DUYdPRk=;
 b=m0xN+yiokMFvwqf0qxh+TbpD0OL5RGW0ElSIVydaUtdGPDV0DmtXUjvBSzuYQD5t2y
 T2VAp8SqDHytvwMObq+YXH7qu+GuuQ9CJJsGIzEhwGMWS7sYvzL5tosM7klwbDYhulAV
 BZQuSxb8ntKx42oIqOKlrhBYPFZW6tP5CepF8sjol5VzLv/QTDq7IEeNTa7ZlhyGCfJN
 e+KI+DbRRYm+N2zZtXQtMHAdygzHWaOrlpwi7FG1ALZWKO1y2Ocgo5muAdg7AbEpfY2l
 2iJKaWRndi/czvAzvLkGN5wPoDuu7Z+pSfgnIYy4qj8VqgFXdxxWlPK6VF8OGEatu4qB
 PJrQ==
X-Gm-Message-State: AOJu0YyHg2PWm28m0a+L03F4tFlQIOA9dwJuw/oEzDqQwg+qGsJfEFlo
 YgZ9N92+OgTxRfCDycbmctOE36SFcsuTIWDLR6AzBxncbjlKKGVcWQFUFUtuFb3gWXMonUw23RC
 n
X-Google-Smtp-Source: AGHT+IEd1zJMa3rSpRs2f3F1A8daQl1umfR4O7PIuaX0fsDCRDmzK2zBGrWXz+L0Z8c7SAYypJt5ww==
X-Received: by 2002:a5d:58c8:0:b0:33e:a1ec:bb69 with SMTP id
 o8-20020a5d58c8000000b0033ea1ecbb69mr1608876wrf.40.1712234691589; 
 Thu, 04 Apr 2024 05:44:51 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b00341dc343e21sm19913663wrx.65.2024.04.04.05.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:44:51 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 14:43:25 +0200
Message-ID: <20240404124329.768546-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404124329.768546-1-thomas.perale@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712234692; x=1712839492; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JOeo7j9Pxmz0sUpOFSCRrCAgMke4Jnz6RO5DUYdPRk=;
 b=GEwFZ0rHDjzk0EOW7kU54BNcJgYKmiG65a0ZQT0bXfB1pv2os6VZJ55BHAaMWnIIlZ
 GWzIbkm5EsGqyaLN+nZgvOWTS/G/O5iwVNEi5O14+u39seZ9+1QuVh2yj2U/Q2WCmmht
 TxZ81bl9hUyKURBzordGNi5aEx49+Mt5HRMP/G2/gGUfgihLDQGuHPp+wtrwuvZgFMZ6
 r9XGwyEgwz2oqVhfJI6EjXP+HS+biECoxZ3aE6cX4IoCFe+0/AtdMfhXbvKjzYT7XTpX
 q4p9Fl1EEmH9geCX+/QJ8Qpepxb4J1K+iGRXq+am8taM2di8IFH+7hJaQEJDf1TZZuZT
 vVaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=GEwFZ0rH
Subject: [Buildroot] [RFC PATCH 1/5] package/pkg-generic.mk: add PURL
 package variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
  - namespace: name prefix, type specific additional information (optional)
  - name: package name (required)
  - version: package version (optional)
  - qualifiers: extra information (optional)
  - subpath: extra subpath relative to package root (optional)

A PURL for the purl-spec repository looks like this:

  pkg:github/package-url/purl-spec@346589846130317464b677bc4eab30bf5040183a

It contains information like the provenance (github), organization
(package-url), name (purl-spec) and version (34658984...).

This patch introduces an auto-generated PURL for non internal packages
(packages with a `<pkg>_SOURCE` variable), with the possibility for each
package to define their own PURL by defining the following variable:

  <pkg>_PURL

If the variable is not defined it will be generated as follows:

  $(2)_PURL = pkg:generic/$$($(2)_RAWNAME)@$$($(2)_VERSION)

The type 'generic' is used by default but can be extended in the future
to support github, gitlab, etc ...

For more information, see https://github.com/package-url/purl-spec

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 577a148c1e..0966b714ff 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -754,6 +754,18 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_UPDATE):*:*:*:*:*:*
 endif # ifeq ($$($(2)_CPE_ID_VALID),YES)

+# If no package url (purl) is set, a generic purl is created for non internal
+# packages.
+# see https://github.com/package-url/purl-spec
+ifndef $(2)_PURL
+ ifdef $(3)_PURL
+  $(2)_PURL = $$($(3)_PURL)
+ endif
+ ifdef $(2)_SOURCE
+   $(2)_PURL = pkg:generic/$$($(2)_RAWNAME)@$$($(2)_VERSION)
+ endif
+endif
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency.
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
