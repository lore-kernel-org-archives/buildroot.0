Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CBBCD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 06:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF02583D3A;
	Thu, 18 Jun 2026 06:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TW1-0GDiV-sr; Thu, 18 Jun 2026 06:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17FF983DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781765507;
	bh=/6vehve9nnPdyj4WYBtGxw+CMq2O/pL5fFyUjwcFylo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iFzsG4WAixS+StNqmlutPq/IcLLNZF/Bja6ITOdRh5hc+VseZjiGdPEX2ZwLd2pk0
	 pI6zu1djZ6XPbLln5i9cdhAFzDvVdH3lCl6fhClJ/xmqT22DAGOW2IQa2eXB2j6tFy
	 xudbEyUxifuIUD9jUID97XDyGHhBraV0X2Kx0rJfr8DOiDGJv8MUvKY/qShytYqoEt
	 4DQOcl0r005i/8IjwVrOR8CxtHM0ZQZnMY9BLGFhofMFDfEic6HFKVvYpMhXRcVSme
	 4bS1RhUkoe01j8YtWSyW4WfZeZJtsDoBRFPyLXQL9R6w0jnP/h7yGr8sQSNaIfoiBT
	 9a2lJb7o0+gRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17FF983DC6;
	Thu, 18 Jun 2026 06:51:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDFCD1F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA8B41325
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7uCJAr5gIJ6 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 06:51:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2B5841322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B5841322
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2B5841322
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:42 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-48662d16d08so205241b6e.2
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 23:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781765501; x=1782370301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3CvGUoXsVG70GUPtN5xXeqUaJHaUTZcTw+u0/7t7caQ=;
 b=dMKcoxip5Iu8Ym1ejcWMnLdMvkXlrIbzA4/qrJf5TBLJ1PGBVA+SLZRy1B7ZimyX57
 hppp+jVuuyrD19YHr9arYzbyQzJaeUTh1m4ri3P7uAsgTO9W6xGuE6lQ9m6pQkzitdof
 ARceA9TXW8Vp6MXOsQM2N/z1rQqKLgMwA/Smr1aSZGA8LOERIFMHYX8jBJstxFA7LPXO
 vK6SLqU1cWxHZjLfIJLSp/exfXbjH+V/FaAKl8oKX9QQPght4fAD2WPPYin5lUbiXKrZ
 A8wKEttka8D3A8iTrFAPtT2yts7R1V7pnl+PaQDwXRFAHSw/OcFqK7ks1KFlXWCe+4KJ
 YWmQ==
X-Gm-Message-State: AOJu0Yx6xFLcATsaSSGlaTHaUONUX3t7vMIoBuzzrBq03bS0NE2Wh5Rf
 wBw1c3kJPx7CY04VDxcRi5JtmjcalM5TMta8hgBgSSv6WkzjOzYBZgM/Xy+mAaqy
X-Gm-Gg: Acq92OHRySr1rIyN6LBhJBjoZUb+Gp1KJON1ykKReZzv7KFP6ydQT5GkYOjLkPX36mZ
 ItXgy8e2YhkbZcmDRCmeSGt9n1Gs3PVi72+3HKP0XIs42gO97AvGFYWIjlBXdfsjUrlzVpI5t4Y
 HZAbkAr03Fz0e58gpghmY7m49pTAmQMf1Y9dSCUOWzb0UjLUyD5PSJApuzDct/6F6gAHp8zmU7z
 p13AI3/jrOsZLUgZoQVzWgynCnRYBOPODl+Hsa1qUbAGrU82BmhYKIfyxIcsYOqbeFHa9WA1rLk
 Sr2gBCPQuHnVVGLqRSkwWnMJHG7ySIUKtn4TIZRMFWWCQcNY/rYUBqZ3KHpsDHF+vKBtSCjk1UO
 W6nuNm1b6T0WDA+oYb0+XPMrQEj3WBl4G5LCqykbl+iy8jc3BVJFAoq/LGDs+cMVusZjiboHZsU
 E10SY7CE4FbrYwUEDS+3/u8rcbFOWqAXXJTH/tQZ5ykDdGH5z2l2sRScLCsphynBbElYbiFhLoD
 Obqyj58wulGax4XwSCPg+9jTU1Y10MMh43+jnaU/YLLksbMLXuxorcWnSTECDfBIjWYKb17j+R8
 zxdc1CyQ6BYnusw8tQYSOQlzPQ==
X-Received: by 2002:a05:6808:1781:b0:482:c2f2:7bde with SMTP id
 5614622812f47-489570106c7mr2102823b6e.4.1781765501495; 
 Wed, 17 Jun 2026 23:51:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e79f5bb9c3sm11717542a34.10.2026.06.17.23.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 23:51:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 00:51:36 -0600
Message-ID: <20260618065137.3987932-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618065137.3987932-1-james.hilliard1@gmail.com>
References: <20260618065137.3987932-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781765501; x=1782370301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CvGUoXsVG70GUPtN5xXeqUaJHaUTZcTw+u0/7t7caQ=;
 b=qlF0CFxR9t4K25zFVWlNkMBSlUZJZxL1vANfz68bnldUzD5VU6X2d4uM0vJiyNfvlo
 XKA6I/YNmrhHxPilSzCV4CxTTBXqTRULf07eC3xd8Fgxsfx+37APATDBFe/JYNEDHmEw
 oZQs6u3HE5eMOg6SA1HKVPgGnsFVVH3eF6sRBkxAyGNkOG/8YESVNEbIEd/Ff9e21Y5S
 UkgkmQa6hqXlJaWWeN/5HWcNO8xfWyPe6tvIgvUP3ZUg717hDFVp8HNmWQosPAOINvrL
 A/CbE4LPbBnh/3iEpguoLFgXwl88wZwtFnkMacwF88OzUzPrTUAne/QOGTe1DLSsKf1/
 Eszw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qlF0CFxR
Subject: [Buildroot] [PATCH v3 2/3] package/pkg-python: derive PyPI site
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
contain a matching blake2b-256 entry. Add the host coreutils dependency
for packages using this resolver so b2sum is available when needed for
hash verification.

Update scanpypi to omit generated _SITE assignments so newly generated
PyPI packages can use the resolver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - Add the host coreutils dependency for packages using the hash-derived
    PyPI site.

Changes v1 -> v2:
  - Follow the usual target/host _SITE fallback pattern.
  - Drop the /dev/null awk input and guard missing hash files explicitly.
  - Error out when no matching blake2b-256 entry is found.
---
 docs/manual/adding-packages-python.adoc |  5 +++++
 package/pkg-python.mk                   | 15 +++++++++++++++
 utils/scanpypi                          |  9 ---------
 3 files changed, 20 insertions(+), 9 deletions(-)

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
index 32ace4aac1..9ffb26b430 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -454,6 +454,21 @@ endif
 
 endif # host / target
 
+ifndef $(2)_SITE
+ ifdef $(3)_SITE
+  $(2)_SITE = $$($(3)_SITE)
+ else
+  $(2)_DOWNLOAD_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)
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
