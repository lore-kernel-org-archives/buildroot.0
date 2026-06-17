Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0F6CD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 17:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF02440966;
	Wed, 17 Jun 2026 17:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOYPQJq0mkYK; Wed, 17 Jun 2026 17:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D2E40967
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781718144;
	bh=/NOUCQvjkbRquKwCsf3YVoOjUi+C9EX+fxfpElbo+UU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kje0cQmeJhGgkJyYbsJ0nnYnTGx1Q4kZpds3r1iYoroVJXWhkvy7Sr/LbOsrogokC
	 gCj4TUuVEh+Q8GUyafOJOqELSQ+9Vu2Kpzl4be/lsAOidwWe/CiR9hUIyiZuE8rIIA
	 G9uOk+b0esIuqrTGvhAMMcEsSf98ZX1qWZa3eHXQgb8PwVPj8r/Ap++iOL+FKLvvER
	 YbordJ7rNySY8w9rt7psw/asxGXbDZIsWmOR+qMWfpgoGZfMR5iIGFc5dIzvTEY8Ce
	 zsQuQDCUjU8/cK5hHkzlC8N8eigsiRVXIvjEzB3enHSkKeLBwj9sFHy1xb6iKjTXQQ
	 tnMSdHb4z2Vqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D2E40967;
	Wed, 17 Jun 2026 17:42:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3958E3A9
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EF6F81264
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juT8HQySLrCT for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:42:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4537181263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4537181263
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4537181263
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:20 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7e6e41cf7aeso20345a34.0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 10:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781718139; x=1782322939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iS7SNuTHLRkmAG+dyPmweOYgWmKSvbXDXadzj46SIAQ=;
 b=U85Ynxi+j9Y/lMr+0NFLDltOYrvoJIDTZFdy99g29wiQdVQ2bxGWeTNoRCUiC6Vu2i
 VBfd+xHfy+BBVCwVTqPs9gqIBwW5yu2VijX877JhoOkPDsLQXYVFoP+3ohobTKvnAKa4
 HXOomRlUuRRDtfm83yn8woAuhIUOox56xqJBPs4/uY8YX0fZVVL8hkp6M5tu48uq0U2o
 mkZ2wRLkJdZZzsj90r+YJhZiQ3Nqh1Hd+Ok8fet0ngfgV63UhUmJT84icVsKyXXD01HY
 nVSWVbMmDFC6llnqR4iQloTXvHmX1Ur/QpKmW1jAkcfbylLUwo4vulWR6ZhqsWc9esrd
 pG0g==
X-Gm-Message-State: AOJu0Yw5Zq4Q6WwntKxTy756ae7BM0CCWHWjuxRWMi+ZHWx+PfnuKnBN
 LVg3sETnAxeJjR4iVHX6K9VzyX32NFyXwKwYRBN+ScUpRM2uVNJTkKxcYem24tHO
X-Gm-Gg: Acq92OFFjoTETIYZh5ePpCYQTGiFryYJyc+nM0kD3l29IMIE5VFP3tG32WdGG2PFBIC
 YM/y5n085rQaIWQ5qLjmPlVLhXl7enXhUj1FtdmPK9CMDy7Fqwjto9kNeLsz+lY/vYRFpzdM3LH
 RZKuRqMLHSA8ouE7D1zSz2qtTzavEijYpiCK1/8+0AZkO7alWdhYerZxM0wyWEeUEiiHKTz23YT
 t9K2l1MCHpdwL8l3noytfqNIP1s8oJY11RgIVgXK2SNLT1uqNnyB2oMejUmRrkcagjRQZMCf40E
 yaOm+uzyZuzCBN6tHMvZUdrwI9x8lnGC5kSA+1VFZ9BSwHkkKBEtfIgtdR+076uf6jBljhcuoO3
 961TDLeFudokCO6himjXp2E/jnEdf6gtNrTPLuG0zzh0P/Wle7VdsFE32Pc67cptvFMueMbEIjt
 7OPu4arpmukIu3oqzW786stCznfQ2XEFzSpZ0U3vktn6JAWPm5YYm/+hfLSLlPPP8c+NO5R4gXB
 LP01mkfxFQ9LJtrG8Nexu9FJTFSVHWOD5SiAVMvP3CZhMxHaQtsMzFfTHH4iqDWlo67AsBeEUm3
 nsZy6Lg3bRsLV1Y=
X-Received: by 2002:a05:6830:3817:b0:7e7:990a:62a1 with SMTP id
 46e09a7af769-7e90c9504b5mr3959883a34.19.1781718138886; 
 Wed, 17 Jun 2026 10:42:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e79f5bb5fcsm10323561a34.9.2026.06.17.10.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 10:42:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 11:42:07 -0600
Message-ID: <20260617174208.3968183-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617174208.3968183-1-james.hilliard1@gmail.com>
References: <20260617174208.3968183-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781718139; x=1782322939; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iS7SNuTHLRkmAG+dyPmweOYgWmKSvbXDXadzj46SIAQ=;
 b=XxsCe/b1MUV7ThXTc+uaz7hHsIHC9VWZd54kJpl46wU97xzvHqm/piESAKw35kAtPQ
 NtwHA4j3t6eQoJy1nEGcVa1DU/nC2CsFOByd3y534nxTs6iHTxYgMdPPOwKgxEm7Sikl
 4zFp6Ivvq7zzWk7PjcvwVM6kYoEkSNgcCFWp7xh9Z2dc/wulUVt6XdnscF6aeiZM0P5I
 YnQn8bM7iPbZt3rN/6DWoKdc79HxKgephjrdai+jzq1o1QztiAjWl5YYPgM6hjbFKYL2
 b5gCyuq4dZT/3w15rPiDqs+O/nfK9HAItb6B0JN1NU+Dzmt0e2ddV3qQnhl63DU3MPhB
 Nd0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XxsCe/b1
Subject: [Buildroot] [PATCH v2 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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

When a Python package does not define _SITE, derive the hash-based
files.pythonhosted.org site from the blake2b-256 entry matching the
package source archive in the package .hash file before the generic
package infrastructure validates _SITE.

Follow the usual target/host fallback pattern for _SITE, and raise an
explicit error if no hash file is available or if the hash file does not
contain a matching blake2b-256 entry.

Update scanpypi to omit generated _SITE assignments so newly generated
PyPI packages can use the resolver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Follow the usual target/host _SITE fallback pattern.
  - Drop the /dev/null awk input and guard missing hash files explicitly.
  - Error out when no matching blake2b-256 entry is found.
---
 docs/manual/adding-packages-python.adoc |  5 +++++
 package/pkg-python.mk                   | 14 ++++++++++++++
 utils/scanpypi                          |  9 ---------
 3 files changed, 19 insertions(+), 9 deletions(-)

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
index 32ace4aac1..a301b0501c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -454,6 +454,20 @@ endif
 
 endif # host / target
 
+ifndef $(2)_SITE
+ ifdef $(3)_SITE
+  $(2)_SITE = $$($(3)_SITE)
+ else
+  $(2)_SITE = $$(strip $$(if $$(strip $$($(2)_HASH_FILES)),\
+	$$(or $$(shell \
+		awk -v filename="$$(notdir $$($(2)_SOURCE))" \
+			'$$$$1 == "blake2b-256" && $$$$3 == filename { h = $$$$2; printf "https://files.pythonhosted.org/packages/%s/%s/%s", substr(h, 1, 2), substr(h, 3, 2), substr(h, 5); exit }' \
+			$$($(2)_HASH_FILES)),\
+		$$(error $(2)_SITE must be set or $$($(2)_HASH_FILES) must contain a blake2b-256 hash for $$($(2)_SOURCE))),\
+	$$(error $(2)_SITE must be set or a hash file must exist to derive the PyPI site)))
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
