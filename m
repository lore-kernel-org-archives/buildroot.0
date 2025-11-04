Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4E8CCFA04
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 11:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1457B60F84;
	Tue,  4 Nov 2025 11:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeXHwOwZhDsy; Tue,  4 Nov 2025 11:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2F060F58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2F060F58;
	Tue,  4 Nov 2025 11:30:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F702278
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B5D140A24
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmFtjuUxkNEF for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 11:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 839FD40A1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 839FD40A1E
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 839FD40A1E
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:30:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-640ed7f26b0so88661a12.0
 for <buildroot@buildroot.org>; Tue, 04 Nov 2025 03:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762255836; x=1762860636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xK/8P6hT2Vh+26usVptv6rTdGWghR6PJVIqvOg/z9IY=;
 b=MGvdjmw3DXwXHdhpB5fVpjNlwGFRf4bxYsR61oT7iMnyYpImNYVbVN/jucwrJjIUP5
 yiLJwkr/htzEpqqwZUD60SjwzlEbW99NoFWOBbAHkdR77z9RcJWzn5e2QXjvLpItd+ag
 oXNnC6NCZeaYgpuWXwNVv/kIia91guLQsWvP0B6VhzsO8EHazdwAbqDTQL92B3qtmQrl
 TPd6Bca3YFTRuZNlvdrCLUokYAgOmYfVc6q2DkbXkmA5c2+1QEy3u5Py5nafNquS+mYG
 743+sSVi6Or7nCgHUuCqxF64H4ZtQwIPIry499gW1fY9zEqF9QGXJ+K4DqkvuGP+UOpv
 nUtw==
X-Gm-Message-State: AOJu0YwPvpEMlWBFJRsT4jus9t9bNzIAs2ZcC8oobwSns3JFkiZzZ09g
 bVsNVzKB7D4szh9+PeiBtlHe9JY5ny6pABGhaUnOW8DIWbeBrToYjqBdqgAM3vF5CRsvFbiYuBx
 Ufk7n
X-Gm-Gg: ASbGncs0lwUAglqbX7QOUmQC9PArH2Z6HTR9qR58pNa6340HDauFpnocsOywqPMM+4W
 j95Z4F2XbHw+TYLVlcGV9/+jaq3uRalmHB0e+F9edUOE699Fng+5oRXensYl2UU2ZsIQCKRmoc+
 B/wAAAgJolYmMwouPn1bqoaOm4Fgmy4kw7qfCs4jYs8U52svDmGIeNCcLOZ6fv6nTJR+x9lbKGW
 KE0EJlYPXjsNAWSEDFdGgQHma6NUovllTq7ChKhdtc/dSkc+YkEO0wQ8BluE3vp9ycEGgWAp9Iy
 HHS2+ItCxH1ytwRexeqHTwWa7JNn9Xs1LNW4Zsi+Gl50J2T9KZnooOv670R6c+YcZFOB19al+bS
 jGWLXgyQxy9oBrMcbz50Rglt/iovpgQWO68njGx/vhfKepD9rQTNawmmo4NbrZO9pLBl/6AjciL
 ywAwHRim66Ud5tPCosHQ9j2Rww7JOGxLIYaegYko5jWSpleab6La6CHEAfNZEkX8ZM56UdcKK+F
 hKw23fhucubPmFoxDKsp487g9JqC5O506s6McZJ3Q==
X-Google-Smtp-Source: AGHT+IHJEtWOTjkv2hGS1mKmy/TN2SnJ+tTdh4+XZ9rdz2hWEVBCeRM2xP5Z+fWzyXsyNkWzK8Ta5g==
X-Received: by 2002:a05:6402:3511:b0:640:f481:96c with SMTP id
 4fb4d7f45d1cf-640f48114b1mr392663a12.8.1762255836143; 
 Tue, 04 Nov 2025 03:30:36 -0800 (PST)
Received: from adam.arnhem.chello.nl
 (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640e680578esm1822655a12.10.2025.11.04.03.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 03:30:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue,  4 Nov 2025 12:30:31 +0100
Message-ID: <20251104113032.674980-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762255836; x=1762860636;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xK/8P6hT2Vh+26usVptv6rTdGWghR6PJVIqvOg/z9IY=;
 b=iZoFn83jqcOaI4B1kwwmtYLnQguwD+UZ+FUt/4zNIx3VIqrzTw0BMdMH7DDSIvzNoA
 Pj/JtYLXS3HIjicKlueu8BJTqYdvsX0BaGhmDwd0I54AgvmoPO5Xx+6lM7/oc54oiAOx
 1Oc786kVmaddWXPxSJIzy1mQF3fFqFF0Cj7SA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iZoFn83j
Subject: [Buildroot] [PATCH v2] package/python-pysocks: add host variant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-depot-tools package now requires a host variant of the
python-pysocks package due to the python-httplib2 update on commit
55a80f89d7321000591de349c7083a94c0349187.

Httplib2 removed the internal socks.py file on commit
1a6ff781792099e9e14d7beb610bd99112b17b07.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-pysocks/python-pysocks.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index ccb70fc5db..1925220d23 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -12,3 +12,4 @@ PYTHON_PYSOCKS_LICENSE_FILES = LICENSE
 PYTHON_PYSOCKS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
