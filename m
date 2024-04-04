Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C541CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 12:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E8441A42;
	Thu,  4 Apr 2024 12:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blUGpcRIECHe; Thu,  4 Apr 2024 12:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5015C41AFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5015C41AFC;
	Thu,  4 Apr 2024 12:45:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0A0C1BF3D8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE8D24039D
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdS9gSfo8s-u for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 12:44:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C14D4040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C14D4040A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C14D4040A
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 12:44:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3438d7a05aaso557268f8f.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 05:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712234693; x=1712839493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A181ER9TRYyfmZ3iXkznrbPDVh6m/n/NeVSSiu499ck=;
 b=dvFMMYQ49KG3A+GduKkKrGQrgofqdSf0I0eNN5rJ/XyvqK29W65AecbqpNrqwzmGb1
 +gg/BGkFzDtJdk+QEMKJZ1BZUmdYiCPIm8Yhz+LLB/Q0rP8uVOx8zW0I6L4uMKhylZo0
 CBhUqmz3M6HS/R7gE4lhkjKFH2XCdOF4Ggy3FIIFfDxDOCuFd7tBxTh9ECLzxnRky/xf
 cD9ZzNYRjJzt275O2TUA5Y6sgZSuW8XoOs9oU25HvCYQWmv8DpcOu0HRB7CfciDeduNT
 OD6ub+VUMzRHRuTAIx26S784hbpAwX8u4a1AjIREsC1FaVOd85gy5AWe6UdbQZDipKTY
 7YZg==
X-Gm-Message-State: AOJu0Yy7GxFePU8gXcZrjL7ZGYbi4JpvfvojS4J8I42F1lcHYRJtzsmE
 +K0VMIK/mQG0MVRW6EOpMMFPurn4iM9VikUWn0AweknG8Bt19MqSF1YimFOrM9dcAqDm5UgaIri
 r
X-Google-Smtp-Source: AGHT+IHOl51yfEJIBU+L+0qpKVhzeqD8IQUJlIzfU96JQ/59Rdv29nJJIgnT7iiNd8IByJFaoJRcYw==
X-Received: by 2002:a5d:6845:0:b0:341:c9bc:6340 with SMTP id
 o5-20020a5d6845000000b00341c9bc6340mr2584767wrw.12.1712234693028; 
 Thu, 04 Apr 2024 05:44:53 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b00341dc343e21sm19913663wrx.65.2024.04.04.05.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:44:52 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 14:43:27 +0200
Message-ID: <20240404124329.768546-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404124329.768546-1-thomas.perale@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712234693; x=1712839493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A181ER9TRYyfmZ3iXkznrbPDVh6m/n/NeVSSiu499ck=;
 b=Y1Eml+Lt4Csa4t08FkIs86xzyV+KxjoSF59P4wngc+TiYeWlnlkp0phowtNA0faNCe
 Ba+njp+nqLi2UyyFRHI7yXJg4uTtYcWFRuTVoUCzq9ZI52JBc8C8V9v4Y6JTTEpLfsIG
 5IK4TMUaBQba0cjyWRAfu7yttiy6qzpNrEN05jutP6kRgGkZv+Uy3WrIdk6VxGPt54kf
 PMKHXu9JKSPTZ8tc5SinXVxyMC0WavG2mJxDEauepyBOmNhC0unyxu3fVlbq3L1VjFO6
 y50AL29ezUNTUvtX6qnsp+F3nnweB+/vBK1ODNz/c6+Tu+oHgOKVL5sSkLA3fS8cuHLo
 gm4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Y1Eml+Lt
Subject: [Buildroot] [RFC PATCH 3/5] support/misc/cyclonedx.mk: support
 CycloneDX format
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

CycloneDX is a software bill of materials (SBOM) specification.

There is a growing need to generate SBOM from buildroot
configurations. Right now there are different solutions available
for buildroot users `show-info`, `legal-info` and `pkg-stats`.
They all generate similar information (`show-info` showing more) but in
a format that is specific to buildroot.

This is the reason this patch introduces a new SBOM output type for
buildroot: CycloneDX. CycloneDX is a format already supported by tools
such as https://dependencytrack.org/ that helps track softwares,
vulnerabilities, etc ...

To match the functionality of `show-info`, buildroot internal packages
will also be present in the SBOM with a reduced set of property.
Internal packages are defined as packages without `<pkg>_SOURCE`
defined.
In a future patch more properties can be added to cover the
functionality of `show-info`, `legal-info` and `pkg-stats`.

The CycloneDX SBOM output as a stripped JSON formatted line as there are
already macros available to work with JSON in buildroot.

For more information, see https://cyclonedx.org/
and https://cyclonedx.org/docs/1.5/json/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/misc/cyclonedx.mk | 197 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 support/misc/cyclonedx.mk

diff --git a/support/misc/cyclonedx.mk b/support/misc/cyclonedx.mk
new file mode 100644
index 0000000000..3906a3b60a
--- /dev/null
+++ b/support/misc/cyclonedx.mk
@@ -0,0 +1,197 @@
+################################################################################
+#
+# This file contains various utility functions used to create a SBOM
+# in the JSON CycloneDX format.
+#
+# https://cyclonedx.org/docs/1.5/json/
+#
+################################################################################
+
+# Note: to avoid conflict with <pkg>_VERSION `_SPEC` is added
+CYCLONEDX_VERSION_SPEC = 1.5
+
+#
+# Licenses list helper functions
+# Since licenses in buildroot are comma separated list and the 'make' language
+# uses spaces to create list we need to replace the spaces of licenses name
+# by a character not used in any licenses name.
+#
+# _cyclonedx-licenses-as-list: create a list from the url-encoded comma
+#                              separeted license list.
+#
+# $(1): an url-encoded comma separeted list
+#
+# Turns "Public%20Domain,%20GPL-2.0" into "Public%20Domain GPL-2.0"
+_cyclonedx-licenses-as-list = $(subst $(comma)%20,$(space),$(1))
+
+# _cyclonedx-license -- create an entry of a cyclonedx component license list
+#
+# For more information on license object see
+# https://cyclonedx.org/docs/1.5/json/#components_items_licenses_oneOf_i0_items_license
+#
+# $(1): a single url-encoded license name
+define _cyclonedx-license
+	{
+		"license": {
+			"name": $(call mk-json-str,$(1))
+		}
+	},
+endef
+
+# _cyclonedx-licenses -- create a licenses list formatted for a CycloneDX
+#                        component
+#
+# $(1): a comma separated license list
+#
+# KNOWN ISSUE: Licenses name that include a parenthesis with comma inside,
+#   will result be misinterpreted as multiple licenses name:
+#   - host-util-linux: LGPL-2.1+ (libblkid, libfdisk, libmount)
+define _cyclonedx-licenses
+	$(foreach license,$(call _cyclonedx-licenses-as-list,$(call urlencode,$(1))),
+		$(call urldecode,$(call _cyclonedx-license,$(license)))
+	)
+endef
+
+# Note about patch list: this patch list might not be complete.
+# There is no variable yet that stores the patch list without applying them.
+_cyclonedx-patches-list = $(foreach patchdir,\
+	$(addsuffix /$($(1)_PKGDIR),$(CURDIR)) $(addsuffix /$($(1)_RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))),\
+	$(wildcard $(addsuffix /*.patch,$(patchdir)))\
+)
+
+# _cyclonedx-patch -- single entry of a patch list.
+#                     It's required to pass the type of the patch it can be
+#                     either: unofficial, monkey, backport or cherry-pick.
+#                     Since there is no information available about each
+#                     patches, we mark them as "unofficial".
+#
+# $(1): single patch path
+define _cyclonedx-patch
+	{
+		"type": "unofficial",
+		"diff": {
+			"text": {
+				"content": $(call mk-json-str,$(file < $(1)))
+			}
+		}
+	},
+endef
+
+# _cyclonedx-patches -- patch list are stored under the pedigree entry used to
+#                       document how a component is modified.
+#
+# $(1): patch path list
+define _cyclonedx-patches
+	$(intcmp $(words $(1)),0,,,
+		"pedigree": {\
+			"patches": [\
+				$(foreach patch,$(1),\
+					$(call _cyclonedx-patch,$(patch))\
+				)\
+			]\
+		}$(comma)\
+	)
+endef
+
+# _cyclonedx-component -- representation of a package for the CycloneDX format
+#  - bom-ref: is a unique identifier used to refer to this component in the
+#      'dependencies' section.
+#  - type: is a required property since we don't have enough information about
+#      the package from its definition CycloneDX spec recommend setting it
+#      to 'library'.
+#  - properties: is used to add additional information that doesn't fit the
+#      current CycloneDX specification.
+#    - BR_TYPE: {host|target}
+#
+# $(1): upper-case package name
+#
+# KNWON ISSUE: packages with a custom tarball (linux,uboot,...) will have the
+#   'version' property set to 'custom'.
+define _cyclonedx-component
+	{
+		"bom-ref": $(call mk-json-str,$($(1)_NAME)),
+		"name": $(call mk-json-str,$(if $($(1)_RAWNAME),$($(1)_RAWNAME),$($(1)_NAME))),
+		"type": "library",
+		$(if $($(1)_SOURCE),
+			"version": $(call mk-json-str,$($(1)_DL_VERSION))$(comma)
+			"licenses": [
+				$(call _cyclonedx-licenses,$($(1)_LICENSE)) \
+			]$(comma)
+		)
+		$(if $($(1)_PURL), \
+			"purl": $(call mk-json-str,$($(1)_PURL))$(comma) \
+		)
+		$(if $($(1)_CPE_ID_VALID), \
+			"cpe": $(call mk-json-str,$($(1)_CPE_ID))$(comma) \
+		)
+		$(call _cyclonedx-patches,$(call _cyclonedx-patches-list,$(1)))
+		"properties": [{
+			"name": "BR_TYPE",
+			"value": $(call mk-json-str,$($(1)_TYPE))
+		}],
+	},
+endef
+
+# _cyclonedx-dependency -- create dependency relationships between components.
+#  - ref: reference to a component bom-ref.
+#  - dependsOn: array of component bom-ref identifier to create the dependencies.
+#
+# $(1): upper-case package name
+define _cyclonedx-dependency
+	$(if $($(1)_FINAL_RECURSIVE_DEPENDENCIES),
+		{
+			"ref": $(call mk-json-str,$($(1)_NAME))$(comma)
+			"dependsOn": [
+				$(call make-comma-list,$(foreach p,\
+					$($(1)_FINAL_RECURSIVE_DEPENDENCIES), \
+					$(call mk-json-str,$(p))\
+				))
+			]
+		}$(comma)
+	)
+endef
+
+# cyclonedx-json -- return a CycloneDX SBOM formatted as a JSON dictionnary.
+#  - bomFormat: required field is always "CycloneDX"
+#  - specVersion: required field with CycloneDX spec version
+#  - version: is used by software that accept CycloneDX SBOM to differentiate
+#    the different SBOM. The bigger the number the newer the SBOM is.
+#    Here it's set to '1' and it should be incremented when the resulting
+#    SBOM is edited later.
+#    The CycloneDX spec mentions that an 'uuid' property can also be used to
+#    differentiate SBOM but is not included because there is no native command
+#    to generate an uuid in buildroot.
+#
+# $(1): packages list
+define cyclonedx-json
+	$(call clean-json,{
+		"bomFormat": "CycloneDX"$(comma)
+		"$$schema": "http://cyclonedx.org/schema/bom-$(CYCLONEDX_VERSION_SPEC).schema.json"$(comma)
+		"specVersion": $(call mk-json-str,$(CYCLONEDX_VERSION_SPEC))$(comma)
+		"version": 1$(comma)
+		"components": [ \
+			$(foreach p,$(1), \
+				$(call _cyclonedx-component,$(call UPPERCASE,$(p))) \
+			) \
+		]$(comma)
+		"dependencies": [
+			{
+				"ref": "buildroot"$(comma)\
+				"dependsOn": [$(call make-comma-list,\
+					$(foreach p,$(1),$(call mk-json-str,$(p)))\
+				)]\
+			}$(comma)
+			$(foreach p,$(1),\
+				$(call _cyclonedx-dependency,$(call UPPERCASE,$(p)),$(2)) \
+			) \
+		]$(comma)
+		"metadata": {
+			"component": {
+				"bom-ref": "buildroot"$(comma)
+				"name": "buildroot"$(comma)
+				"type": "firmware"$(comma)
+				"version": $(call mk-json-str,$(BR2_VERSION_FULL))
+			}
+		}
+	})
+endef
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
