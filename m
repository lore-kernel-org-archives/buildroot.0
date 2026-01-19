Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920DFD29C33
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BC78611F4;
	Mon, 19 Jan 2026 15:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXzqjIZ868W4; Mon, 19 Jan 2026 15:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D85D611F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768835812;
	bh=bICW7cMfMBEj7L9cffVJfdxHX6VDpFKnEaG5WF4juqU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AnsHIXqCZuTSYjc2GkrqhgK9cUk6CWyZOXnlikKS2HRkshSAb/qJDIXYkRSkf2LPJ
	 hf81aENWMtVZ+mPlvSBfm12rvVfNMuFHxNq4FQlZQb7YS4YP+0aYaUY2tZg8n+Mpdh
	 KOpW97ox/J8aRZB8bU27xoNuj9O7F06tmwiL31qr9LK4cIEpNOHyZkaWrkhVopg+Yz
	 XYYsmos/lyBeEXZr0Zkv3nHFKGGBwXU6Np0+lj0KGE+v11CGeSEwxuHgS7WoH4jb/L
	 62lQ8S6yqaE95B8FClS7XCjWiuJZG5q1Iojv0evaf/vqCh1hBZ+rGD+10yeM7O2joA
	 He03/A+IpCnRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D85D611F6;
	Mon, 19 Jan 2026 15:16:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03838160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD805611F6
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LunQhOoPlsI2 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEF4E611F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF4E611F5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEF4E611F5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee4539adfso36721515e9.3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 07:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768835806; x=1769440606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vo4RfQuFGANu2D4Es0JUczr/QPpNAA+3+YfPt9J8vI4=;
 b=p/eHqgZDTC1H6mkfmDCDHfHxH6fQ2Rs0PlSphiAl7f13qj7ACF2y0PMa6dabOaafBS
 BVQeqX5ZpbIFq0iTcLECLx+4gUJ4iDPInllshjht0FR+wlOCt/FuPVM1XGv0/12uX1ei
 ZgjmLuOJYxsm6dCUYoSku2b9H6pASg6lrmIBR8drlK2uncBSAg4DRXW93VXsaq0BYdXh
 Zf/c5I2xCPiwHDMjBRXfgTTZaTabHBx4WlW/SekUQyH+owAS0I6NdVRD9jk4Ofz20CDr
 fu5c/9BpXuHowy9Fk2mFG+DGLukb0uKV88OGZWJhNiBlXRixdMDXq4iMEvfGgOpVIO5w
 kzEw==
X-Gm-Message-State: AOJu0YxMhJad5lGQkAn04vPj2Wa4/Q2hzz5k/c6El18Vc4s/YDbshNfF
 EF7W25GaSYnkdPvbBtOryIZxyXmdvk6JVqdQqK1Tip3bDrm1pBXis69OWs99eWxgXwUh4aZeKWb
 nrJB+
X-Gm-Gg: AY/fxX5pN/PHZEAiYUxkftVfUukQn90jmvVma64XMCgWSgKjDVBwlJOneALgDKA6kH+
 QceRlqR9cMjKvP+Kxy8m8nFZ7ajSpMyie8oCLdNz73XKzqJRRjJ1q68bftcNtmqJGJbzKHH9scX
 FtCwT2gyvF/vfS49pwktg/qjJqW4wVANE/Xz1IEfioxkl5X1gxPcr+pvbd50mfOsxDFIRM3rYOS
 xW5DukgEyjkzvy/iDepFAYaODY0A/cwtKPp2G+qhHmjHTz9Jv81NOcjtqwNAM6HThEnAhrDRqcs
 0Scq065NXYk4B0R0lVLxoPgx3FRCTJjLV+gSpkWWmszwV+fSSSnhyQsRy9nFxgwEyR8pJ9kKuAJ
 DpW/Iu2CR77812NMFu6mhX/HlTbZxJD7RJ1luf0i34TVHc/VfDougEAe1gz4T1Zk9uul41xmpGK
 2AHv9W7qPDZlXa4QGj9uJQGG1VCmf1MuiICYgUI85ItqHhRWrI
X-Received: by 2002:a05:600c:6612:b0:47e:dddc:3369 with SMTP id
 5b1f17b1804b1-4801e3530b7mr156275255e9.35.1768835806300; 
 Mon, 19 Jan 2026 07:16:46 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm253324295e9.6.2026.01.19.07.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 07:16:45 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 19 Jan 2026 16:16:39 +0100
Message-ID: <20260119151644.100529-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768835806; x=1769440606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vo4RfQuFGANu2D4Es0JUczr/QPpNAA+3+YfPt9J8vI4=;
 b=BHDkpTedaZWmTducN/cCiGxXxb1EqEeGwv9ltqIx/sDbx+KXLtAlIo0VikDsd2zRV3
 dKso9o8EUQzJcXXf8anM5W8zcvLBd/BDZZu+UjXCnkgxDfaRx+588h9tuXbwB4fohLjs
 vfqc/PTChwpYhob09QUT2WKgTtTemTQAzV5K9XxWJga4+Y/pLiPPowmZwj1ZgiftmAuH
 iGb8qwPrhpjG5d2W7hOE9VV0ecuGMrPLJx2rNJRPoIDcg+XG+/x8gUDQs7QAH+7tToGl
 qKdr6z9p4ib/jlBt6WT10E9t1F1cnet2lSSNsE0rNix6gFjFcodfXZ+hWlK7i5nnG46Y
 Jh/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BHDkpTed
Subject: [Buildroot] [PATCH 1/6] utils/generate-cyclonedx: fix 'project'
 dependency
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

The definition of the project name & version is stored under the
`metadata:component` CycloneDX property.

Since the introduction of the `generate-cyclonedx` script [1] a
'buildroot' dependency entry that depends on every components has been
part of the generated SBOM.
Tools such as 'DependencyTrack' relies on such entry to create graph of
the entire project.

With the commit [2] that introduced the option to pass a custom project
name and version, this dependency reference was not updated to match the
custom 'bom-ref'.

This patch fixes the reference to match the custom project name.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
[2] 9cbbc47762 utils/generate-cyclonedx: add project name and version options

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index a103b7b707..e864edf181 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -428,7 +428,7 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
+            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
             *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
