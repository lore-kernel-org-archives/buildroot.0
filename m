Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE447CDE006
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB06340C5D;
	Wed, 24 Jun 2026 10:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr4fPoAzNYMU; Wed, 24 Jun 2026 10:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F2E40C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296034;
	bh=ffxyOzHaU5aLxLLzUhWbnQoxbeWncXRc2OvCBGV4vDE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rf29lNzOgif09vbWbMnIVVfvkKYEMKNz3jyOkVYExmyLtUZ7mFO8HuZVH9/UvUDQu
	 or1PZotDXTK33Iztsu+b60VaPvd+9jeiPFBdtMLeZXwNLtQVA4It2ilAOm0eWCU5zy
	 oZbEnTc08m8+cKEMqp/bbXJuOxOEqHl1bFFwbJgYoFbMB1svMXoUlXPOB/FnZV1fUz
	 g9soZWgErlIpB1nCQB0HK+9ERkHzPlQ8SzLaein285Znnytyfy4dJ2gVDGmJBp7ySX
	 lgoxDVj98V6CIWCLrM1jzurW9i9jOXyeCGiHPwnsAMiAYKLMdODN4jw/dFsPsGcrj+
	 AKsBD/lcJRykQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F2E40C58;
	Wed, 24 Jun 2026 10:13:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8AB0256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7D0040331
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qw0Rnj7i7JIn for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA329404BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA329404BC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA329404BC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so8604785e9.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296024; x=1782900824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6BktrFxgLqKAZE5uqPm2Lsa8489h81pwu2e5MYO+BOo=;
 b=ICyXPDx5TKgeDGwMQmomCOQXKKslUuLhl4Ec1HpGrOGm2FhAFwl0kVm2w86w8LcNWc
 /OmdW7ogFs3Gh/rIX1JyFyGNeOF5p1c4znyfSGi/CWqjYKrJwwyJG+Tyr541gtNFtC0n
 ZaY/Bhw+zV4aaJ20w0QsJ/OnEv63V+KHaSwHjFiLnqBl9XFOVkU2vNtoKxFsthvXT/P7
 oNaCzkRbJocUBE/yF4tDn3ke7gteCbMf7b6nVWAhhQEGQQaJbP9cM/XDw+5yGPeI6T/u
 cRSGNgRr3eJAlMjYa9EiXrz5uugWjsQAVovI/fjki0AhxrxIyAbIvGLRYyKrACY4tBj4
 HDfQ==
X-Gm-Message-State: AOJu0Yz+7JL5C7LOzGsujSfap5XKlse7fP3vql0MJfkj/HY/AhHqGyAK
 kJjMgyH5Zobt0YNyUgq8OTa4ZAuhwbjvBxo+/uC2ZsPeCyJmqEI6wlPWAdgmqhp/8LBu6+iKWOB
 QG3kw
X-Gm-Gg: AfdE7cl3bccea9aH/9HPOQfijl0lThVXk1zjdWpC7JkwmkTo6x9D1sBcVBClnQUJFig
 lYHdSxkDsWonJrbN1Jz27E2eQeSC2TbrHvbeoyWcBxU2FefdpfN/UcUFA1y+27Hes8J6HOsHmWR
 apDl43u6EaMe8kE8xyih1DMh2+QMQampH0bGrUKVCatCpFOF+cLxxu9tATStZ9XFLX0N0yW1inI
 K0WsEGnyTDWXEC6cIHpMh8SYgqLsTKkhiNwBFj+Bf1w5UbWkUVOwL8ZuE6z8i+s3ObF5JF19zFT
 YsQfmVLsQIGsZI5G1mYjI9S4OrROW3af6oolqS+TUYoej4nETCSDaLK+GEF2idZXjqYd2OFQjyd
 ItO+4mOrrzm/fz5gDJREIW96UY/DnwI/1MLWE3grCIxJrg0shyP6jLgKXJTfxj+870D9kWhN6IW
 KyiQpp
X-Received: by 2002:a05:600c:8b65:b0:492:40a1:1e16 with SMTP id
 5b1f17b1804b1-49260849696mr36441165e9.8.1782296024408; 
 Wed, 24 Jun 2026 03:13:44 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:37 +0200
Message-ID: <20260624101340.80670-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296024; x=1782900824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6BktrFxgLqKAZE5uqPm2Lsa8489h81pwu2e5MYO+BOo=;
 b=iUNlJz8294+BY38ye6OxpfQ6BNDpR0ac8cXfp+860+jGm3PKv8uZLlluoTG3WPK8s0
 SK19MIhjqwV57TvExq/cgy92qdHS7IDkD9ekMSOgpK6TVEDCY5xoOpA8JjUDt2WNT8Ml
 HCmmjHSyrui8nV+7lDAno7+p4JMBRvVxefJnwLGClTZPEKhAloqSJp2SdZ4JbOD/MD/x
 ++8qkwYuPLmr4PNh8gfHIDkVOek97S+VpBj0lQOwox6BTmVw79Bj1SIruVThBLmxA3im
 XRGINiAW5KCrKMXqGBRjv6924b7wsKfCddVCZqvZ8j7RtSxzAdyiT1buC8N5cqfsnnFa
 QNTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iUNlJz82
Subject: [Buildroot] [PATCH 6/9] utils/generate-cyclonedx: support custom
 version
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
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support using minor revision for CycloneDX 1.6 by passing the version
from the command line. Currently supported:

- 1.6
- 1.6.1 [1]
- 1.6.2 (default) [2]

This is used to fetch the latest SPDX license list available upstream.

[1] https://github.com/CycloneDX/specification/releases/tag/1.6.1
[2] https://github.com/CycloneDX/specification/releases/tag/1.6.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9738db71d6..8d055c3bbd 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -22,7 +22,7 @@ import sys
 import re
 
 
-CYCLONEDX_VERSION = "1.6"
+DEFAULT_CYCLONEDX_VERSION = "1.6.2"
 
 brpath = Path(__file__).parent.parent
 
@@ -538,6 +538,9 @@ def main():
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+    parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
+                        choices=["1.6", "1.6.1", "1.6.2"],
+                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
 
     args = parser.parse_args()
 
@@ -545,7 +548,7 @@ def main():
         parser.print_help()
         sys.exit(1)
 
-    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(args.cdx_version))
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
@@ -553,10 +556,11 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-        "specVersion": f"{CYCLONEDX_VERSION}",
+        "$schema": f"http://cyclonedx.org/schema/bom-{cdx_spec_version}.schema.json",
+        "specVersion": cdx_spec_version,
         "metadata": {
             "component": {
                 "bom-ref": args.project_name,
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
