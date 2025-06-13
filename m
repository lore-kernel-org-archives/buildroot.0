Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1848C71135
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95234842E1;
	Fri, 13 Jun 2025 11:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9UAziPn-GDP; Fri, 13 Jun 2025 11:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB58F842D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB58F842D6;
	Fri, 13 Jun 2025 11:06:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8D871BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A983F60A71
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewmPD_a-3Xi2 for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD65160B1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD65160B1C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD65160B1C
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:06 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450cf214200so17112555e9.1
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 04:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749812764; x=1750417564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+l+EwC65HMP30BVfPiXrfMekXzMgtd1HhT85Evosr8=;
 b=S2zdsnNUOYPmEZ1PT7UVGfKT2xvGcVR1fYD0XjfdBUoJLlL9ACNtfjA1G/z9cCxw18
 VGDqeM+DikJzwpr8veKrLXP57FdCvu0mfmBys0R3IsvV2i0L9WmeNAu9WmrH3W6ORUpr
 P6OovWBxD0zATk77edf2XZeSgXqGh+mGH1mcnRh0g1mpOnEwYWRHcqeK7WzanbAWFJOR
 cLmPbMCHZphTGZn6bdIsCQxcJhSWK3HDLUvJM19TT+YFKXsxeWRA+wy7UP/rV5upJYxh
 8yP+e8AdouXMtauyeeIRY60X5hlkJ+Q28mZ3Z6Xu3wE9fjwgkO1ZsC/STgZE5YSRUmwr
 RMlA==
X-Gm-Message-State: AOJu0Yx0zldUJf3m+BV3absDHmRXiQ3X+lhF3iaXztXPF8R2Ut8+8MSS
 5TH2sHL9CFT6AgKdfpJQBsw13ie2fAYHcOFMc57AkHpAeeZXQyExTQ0b4Q92zDlyCZ/9fAe8AhN
 2Be/n
X-Gm-Gg: ASbGnct1iCkG6TmmBYRaqmq7I2hSYdvReyxrYh8dQI7xjGbnchtthX3kIVq6p+es7vU
 JgCq6L8DIJSghP7GmsdmlFdr/EGQA4GCUAbVWq1uTjiwB5hBEArqlJ/wkNC/4QYImWd8oAjRVcI
 POdpoCFQZRavc3Wy+y1anZPTkelyxfDyiDj6Ft9WX4hNTHx7WC4OnTT0xiaIENbSAQYibVKgd60
 +NiJLNs9UdDgDTHfmuTYrEqPTnVhysh7MJbjJCJR6Dm5ulGkoiymuQ/uAkKeMPui1Amkqq0CGNB
 JWD+GKFcf58NGEP8TZP14ocBcEoPAunfPXnrBYl7J9W2EcDggGhQ0T092AGcL+PeTjRBohdY3uU
 =
X-Google-Smtp-Source: AGHT+IFnPeKmWZtAn37jcccIqL7Hr5ML9a1gNDG0FJazlQNcTVdJchAd7MIXuYkUcmgr7UdpIXsqMA==
X-Received: by 2002:a05:600c:3f0e:b0:43c:f87c:24ce with SMTP id
 5b1f17b1804b1-45334b29724mr23272025e9.21.1749812764541; 
 Fri, 13 Jun 2025 04:06:04 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7f8f9sm2060459f8f.42.2025.06.13.04.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:06:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 13:05:57 +0200
Message-ID: <20250613110559.2665663-5-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749812764; x=1750417564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+l+EwC65HMP30BVfPiXrfMekXzMgtd1HhT85Evosr8=;
 b=WlvdJS+a6Kl7/F/9xA6iMq894nT6IMfcQvVNrH62oNC1t9XlKIqXEf8KZqA1CQY3mg
 SDxglNOmlPqOvFvAP9KyS6vdHKPsBrQlKT/F3gswz+hSH3rQvJobOiqiGndUyJNtUG1g
 oGR5101KPtPqLeHJd+d2ztVkRzE7UQApeiLaU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=WlvdJS+a
Subject: [Buildroot] [PATCH 5/7] utils/generate-cyclonedx: add project name
 and version options
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds command-line options to customize the project name and version
in the generated SBOM metadata. This allows users to specify their
own project identifiers rather than using the default Buildroot values.

Also sets Buildroot as a tool in the metadata section to properly
identify the SBOM generation source.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 5a6a191606..1cbeca01ad 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -278,6 +278,12 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
+
+    parser.add_argument("--project-name", type=str, default="buildroot",
+                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
+                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--no-host-packages", default=False, action='store_true',
@@ -305,11 +311,16 @@ def main():
         "metadata": {
             "timestamp": datetime.datetime.now().astimezone().isoformat(),
             "component": {
-                "bom-ref": "buildroot",
-                "name": "buildroot",
-                "type": "firmware",
-                "version": f"{BR2_VERSION_FULL}",
+                "name": args.project_name,
+                "version": args.project_version,
+                "type": "operating-system",
             },
+            "tools": [
+                {
+                    "name": "buildroot",
+                    "version": f"{BR2_VERSION_FULL}",
+                }
+            ]
         },
         "components": [
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
