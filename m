Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE73CD98DA
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 01:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DAE184A40;
	Tue, 16 Jun 2026 01:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yzje2FMZAz1d; Tue, 16 Jun 2026 01:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC7FF84A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781573485;
	bh=oVul1aiQTlysUPUGKa/lQmcl5B98RLtGseJvfGwdTBU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=le68LG4pcw/PZtqxLl4KX+tl42HwLckWP6Qda3whP856NR55WNoI57rjzkRJg8yg/
	 chO9CZoVCY4iEIu9fx+elVj5PopDx1piblI0xX1HqamsmgOrkOKxucKiYpb9nVuLMm
	 hbmtGyHjC155RJCKygLClD9WSTO6j1IvDTp5vvKNhCgj9SkAyl6bRyQcVYO5+wS+jr
	 MujXOpIFBDs83WnSCkj/jTnE5ME0FHLy+vjzg58nUBiK/E44/yscjcNrMCbzJpqv/h
	 8BQLpR+ZaEIyudCaHfpKKTDHjF8q5FXYH/HjJ0ItaLvLyEQm8/rwq4Epyg8Ctqn8Va
	 X7jj2kQrD/tGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7FF84A42;
	Tue, 16 Jun 2026 01:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97AB92F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 897544007F
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIGCmAPd_IqB for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 01:31:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BE4D4006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE4D4006F
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BE4D4006F
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:22 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-69e49452f35so976295eaf.1
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781573481; x=1782178281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ApVMYA3EeDrzsK5NG+bJOn8EtAo/sEVvcOMSQLTiHtQ=;
 b=JXTFSEObd76lQKlV4/CArRv7JGIrNEASSf0fBLRWzX7lv0TlDX3PtYURMIQ136Z3pM
 74S1pgOTFac3Ea4qGRNoqSGm+ldE6ZMAAWeupX+0pDsuwIt4u2/bKxXvo0k69b086Mpe
 YV6AN/2xBDu3jLvXMPim1Qsb1guyBaEnKvvDwtorYJc9igKoCUgV1QhsOl4tAfcn7B3t
 Z4v7J5ugrw7AKf34dxXpYIjHqCNW2MTWm4G1rrNvjKUdAgfvE2bPUHws0Cz+5u6oJcfV
 w5hJylgxYmycPUunsavBm+BNwSijyK5ktDFgfDXHY9BNIQTiDanU5jlAP83VAXjVw1i9
 kU0w==
X-Gm-Message-State: AOJu0YxiyyELY64kCRXx+GkUJKPH/T7N7tUYhlI28YxGTEOzzYubLi93
 k8fVP4w82xCWe7ihRrE2pVwPZSfVWYc8j8sPkMccuWi5pHn9zXAEsUt/2Xu6O3Nn
X-Gm-Gg: Acq92OErUgoUp4pT2FGqJ9n6xIs2szqHr+HgB//2bDnzd1j1JH0lwxq8XAeaHlhXL8e
 +DR3paVwr8q5JBxa+0p12Isgb62Tno0r9+1Cj1L3NvFAgWk9HtWMizbYGbikDCqa1tOqBOnwma1
 xuouZmF2nD4Gh0hYjrk1MPHnsVaTRB953Ah+y4paNTEeoA1GEa5QQ6WlqrBJgIINT7HqY46asxT
 r2eYHmXE/k54iUBvvBE+u0Qok5kF89AsHrMoSl+qQrxEsMgPQJqUqdhIIyaEVVfsxO6JRnqATlU
 PypoONJpRZcsRFR4GDWI58MoKhnBGlRvM12LG+Hm8PiVk6oVAHWvtGjwEEjNDttZA/YBGunYQ+v
 iT5Wfowxr75w131wW9ys+kfb4/Szl514sC46GPUPtWplKVOr6tWct40R65pHXECh8Xpp6kloKkr
 tMlKpRBUUQ+amujM2CwKCmUnFiKPT3Ss24tCEuAzPpSa3oLVy4qkbGiXuIpdgfJVxbu7+4uaa0K
 AEg5Sfnma8ycZGrHheVKmZs70+xJOUpIZNZDqGu5orxnIUl22cqeT4f1saLEju6SGRRWN1enhDM
 uaMknZ7EOu/DLBrt6Iy+nv0Cgg==
X-Received: by 2002:a05:6820:f003:b0:69d:fc7c:ece0 with SMTP id
 006d021491bc7-69eec990ccamr7189929eaf.45.1781573481411; 
 Mon, 15 Jun 2026 18:31:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-44308b0057csm1183962fac.8.2026.06.15.18.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 18:31:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 19:31:12 -0600
Message-ID: <20260616013113.3899641-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616013113.3899641-1-james.hilliard1@gmail.com>
References: <20260616013113.3899641-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781573481; x=1782178281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApVMYA3EeDrzsK5NG+bJOn8EtAo/sEVvcOMSQLTiHtQ=;
 b=An8jrguTdlyXklYdjTHSAFXO17Saq9CfvvC72f/aozOjD7LSj+bA7FBnyGZz/G5eOt
 MTS8f5pnA3o1w1h0z91GWbB1xg6IOVFPtKd0D0Ywr/yC1rB9vwAjileDdhhGf1I3jnmo
 2cflIF8bjE5NBFw/BJSiEtg7geMOVBbV1SANbyMNd6xnotg0tBt6CQvV/vTOHT9oqOIR
 3LJOiTEB2PZzXMtHRzzclq/AckzOMlxz7R+cjWonfnoLZ6hDVtwu7oiwmrg28ui/0lOc
 qCa+M62HPRmpjX44/ijndZij8t23Yb1MJqcfRHlEf61N4WHO2bQZHf//dOgmJUPIH1Ek
 zIIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=An8jrguT
Subject: [Buildroot] [PATCH 2/3] package/pkg-python: derive PyPI site from
 blake2b-256 hash
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python packages downloaded from PyPI currently store the complete
files.pythonhosted.org package path in their .mk file. That path is
hash-based, so it changes for every version bump and adds churn to
updates and backports.

When a Python package does not define _SITE, look for a blake2b-256
entry matching its source archive in the package .hash file and derive
the files.pythonhosted.org directory from that digest before the generic
package infrastructure validates _SITE.

This keeps the per-version digest in the .hash file and avoids carrying
the same hash information as part of the package site URL. Update
scanpypi to omit the generated _SITE assignment so newly generated PyPI
packages can use the resolver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/manual/adding-packages-python.adoc |  5 +++++
 package/pkg-python.mk                   | 10 ++++++++++
 utils/scanpypi                          |  9 ---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index d6bae299a0..a66af1e7e2 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -82,6 +82,11 @@ All the package metadata information variables that exist in the
 xref:generic-package-reference[generic package infrastructure] also
 exist in the Python infrastructure.
 
+For Python packages downloaded from PyPI, the +PYTHON_FOO_SITE+ variable
+can be omitted when the package +.hash+ file contains a +blake2b-256+
+hash for the source archive. Buildroot derives the hash-based
+files.pythonhosted.org URL from that hash.
+
 Note that:
 
  * It is not necessary to add +python+ or +host-python+ in the
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 32ace4aac1..0ba93d8fae 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -454,6 +454,16 @@ endif
 
 endif # host / target
 
+ifndef $(2)_SITE
+ ifndef $(3)_SITE
+  $(2)_SITE = $$(shell \
+	awk -v filename="$$(notdir $$($(2)_SOURCE))" \
+		'$$$$1 == "blake2b-256" && $$$$3 == filename { h = $$$$2; printf "https://files.pythonhosted.org/packages/%s/%s/%s", substr(h, 1, 2), substr(h, 3, 2), substr(h, 5); exit }' \
+		$$(wildcard $$($(2)_HASH_FILES)) \
+		/dev/null)
+ endif
+endif
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
diff --git a/utils/scanpypi b/utils/scanpypi
index de658328fe..63b8f8f4d0 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -495,15 +495,6 @@ class BuildrootPackage():
                 filename=targz)
             lines.append(targz_line)
 
-        if self.filename not in self.url:
-            # Sometimes the filename is in the url, sometimes it's not
-            site_url = self.url
-        else:
-            site_url = self.url[:self.url.find(self.filename)]
-        site_line = '{name}_SITE = {url}'.format(name=self.mk_name,
-                                                 url=site_url)
-        site_line = site_line.rstrip('/') + '\n'
-        lines.append(site_line)
         return lines
 
     def __create_mk_setup(self):
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
