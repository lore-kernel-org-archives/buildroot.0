Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D8DC61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6445403E1;
	Wed, 26 Aug 2026 15:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmHW2l5z_SMz; Wed, 26 Aug 2026 15:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787758065;
	bh=NuD5K2St7BV6FDhfQLG5Hf0J37qOjNVFPBbU8ptEcVg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MyuMXFyTRG8pzDLcefrO2RUrW9/DpLy/Gsl5Bwb9n+8t61+68W0QdfwlwYAqreGp4
	 xulYrMeANDsrEvr0O4s4JcLxtAqq1h5jJjpyiXsf0ez+L6dvEUVrYEigu0QgoTF3NS
	 S4fm44BdDYiN8CVOkxu8G1PPIBm749BhdkzmYBqEpr7ZlF+SyKlHwiHlA1bIHZ7oG/
	 1Tcaq5TRSOiw/3mu9GdfiMbmlsl9kWMioxVCXE6xbEcBbCQnkvgjLMVohWJAkwt9dt
	 f1kLmH4pPSHfTIUHBvougMPy2eYQHiPtJrjpCSutWlrkbS4Itqu0xJZ63c9By18pW7
	 wMT4yund/ITjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCA7403FF;
	Wed, 26 Aug 2026 15:27:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7C1B334
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D97C580ADA
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzGuzcU98s1x for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 15:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B92EA80AC5
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:42 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c207cb16cf5so165070866b.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 08:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787758060; x=1788362860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OFKA+VNc0WpPsBFM0A/pewfwCaU5Sge+mCFe730Fclk=;
 b=WQPvUHqpTUJ0IANCo6pO86fyw+PHxxS5uqb1br+KuPO+jjpru/ctT4gUz70x67aPkZ
 AdipkxBhRghy8iVb8kQ68tIwlLhWhIEPiZHkBjMzItyRaYYu0C8ge6U9zdoFyx5gp5uW
 ALzfQTb7f25qMAhXyy9Aif9PhGcpO2HlKManzkSN/fh9x5X/TubfJ4Pj+1PN9ccFYeFT
 RKhw98l73Gzxa9plmByMJLcnVslGh4NmyzE8N0lsvt535T7fSGsqxNMyl1RiHwXotXDC
 4Plxo2pXHkwvbaBbiIoFNcgiFJPs+jA7ojEpz5nIdXD1zS7a7PUBIIJigsNiniuZFSMZ
 8J7A==
X-Gm-Message-State: AFuF++kgc0e4rRwNnrUFhoIoPxFigLDLNgjsqHlk0ULiA+7XTcd656VS
 ePX/koJrhgdeHMSqRq0eh/DOoun5cAc3Ggwpb+8SIT4lsSSgbosSObQdxjPW+y14BFishbh17ww
 8mazFeMQ=
X-Gm-Gg: AR+sD10vLG8jw+zYEU1QjJIiS3K5PjEwULCjOQu51CT4ke3i4niBikavJkVlHJtpcXi
 aCyloPJL07vErRoFs1lfknk+ZvBa1D9xLOP82AaKmFTJTTu8dtRMwgzRkKfe26OdteWE97cXu+N
 BErpG8n6gUQoYL5lUdnfRDMXXCV74637UoAeWVlo0d6UoDsRduM1BN6h5I7iDM9i0/2Iejc1P6g
 JKsL2xohBWMEyZhPTAm0+bU9yYR0G8Xo3eAZr/P0abdbFxdmfj6MprnieAvpnzu8S5Fx8YdCFi4
 q1015IK87EAFl930zCO4DiUSja2M/pEaUphVe/pZY15zqbY4QU+1wTIOCN8kOSQuHrb0tC1mzLb
 j67GlJPHfA67E6IqmpuIqrn3M4XE8VWD9jTS6nDzRFO4JsxioW79zG1wQbvS8xgpuY4SOHmwPln
 B8xj5yQ/epPs+aYxG6hlUP2e35FB6TLOPbhrTh3wpOinpJhpQ3eqAtiYqan8aYqIap1yisTZYXp
 TTfGzSmBwLU9u5ZE+slut40SKWUtW6SdXxyiJA2PqT86+PIFVw=
X-Received: by 2002:a17:907:97c4:b0:c1c:3b06:ed1b with SMTP id
 a640c23a62f3a-c250c36bc3cmr1050571566b.22.1787758060064; 
 Wed, 26 Aug 2026 08:27:40 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9ec343sm403804666b.57.2026.08.26.08.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 08:27:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 26 Aug 2026 17:27:30 +0200
Message-ID: <20260826152732.3556127-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] support/testing: TestPythonPy3Gobject: test
 glib 2.88 regression
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In Glib >= 2.88, GLib.unix_signal_add has been moved to a separate
platform-specific library. This break backward compatibility from
GLib-2.0. A workaround has been applied to pygobject >= 3.55.3
https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310

This issue currently break TestFirewalldSysVInit and
TestFirewalldSystemd runtime tests since the bump to glib 2.88.3 [1]:

https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)

Break the test TestPythonPy3Gobject now in order to reproduce the same
issue than for Firewalld test.

[1] e313a2d2590af689eb1f79e55b5a488154400da1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/sample_python_gobject.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
index 4490a73613..1c2b327206 100644
--- a/support/testing/tests/package/sample_python_gobject.py
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -4,6 +4,12 @@ from gi.repository import GLib
 
 
 def main():
+    # In Glib >= 2.88, GLib.unix_signal_add has been moved to a
+    # separate platform-specific library. This break backward
+    # compatibility from GLib-2.0.
+    # A workaround has been applied to pygobject >= 3.55.3
+    # https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310
+    unix_signal_add = GLib.unix_signal_add_full  # noqa
     sh_path = GLib.find_program_in_path('sh')
     if sh_path == "/bin/sh":
         return True
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
