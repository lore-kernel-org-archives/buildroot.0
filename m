Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDBDD5B149
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF3D60073;
	Mon, 28 Oct 2024 20:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TD-dtZY2D4Ph; Mon, 28 Oct 2024 20:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A417600C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A417600C9;
	Mon, 28 Oct 2024 20:34:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31132112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC3280BDD
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Z41H3eR5d2k for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:34:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A42380BF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A42380BF1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A42380BF1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:34:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0D06AB0055A;
 Mon, 28 Oct 2024 21:34:50 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Carlo Caione <carlo.caione@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon, 28 Oct 2024 21:34:42 +0100
Message-ID: <20241028203442.750154-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730147692;
 bh=40PEjAa31Cuj48lElA5Pulqsfs3EjNZJtxbprH+Wie4=;
 h=From:To:Cc:Subject:Date:From;
 b=QWtWpQzO7hfzLIYs5ai9EtgUW+Y+RJB1K2SM4hpawmA15rwU00rysKAhE7lJlkICA
 2qSEDamlWPyKqRlvSBfgJaVjgnY1xA1e4K43Mqt0881TmeuZJLttqiw+Dgypcj/CR/
 tB2YNPk+GCNLuUWGpOWvA1DBhNjwJhMrIWgqRtlYwsMDZmFqro72Ek5GVfO6LvhnR9
 omdeylgEMgN3mECfFJRxPPlGTwR0CSFIbWxjAXVTlsXtp8YKiXIxTuIO8hDvXqNS0L
 e7hs82Eh1wUWTPKetBlakhUmHFm87ri2gbpIu4wwLTukm2I6SpqlFNFgiYNaRFcyD7
 PSvZOOGXnj5sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QWtWpQzO
Subject: [Buildroot] [PATCH v2 1/1] package/jailhouse: fix build when python
 helper scripts are enabled
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

When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
build is failing with error:

    Traceback (most recent call last):
      File "/buildroot/output/build/jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560/setup.py", line 18, in <module>
        setup(name="pyjailhouse", version=version,
      File "/buildroot/output/host/lib/python3.12/site-packages/setuptools/__init__.py", line 108, in setup
        return distutils.core.setup(**attrs)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      ...
      File "/buildroot/output/host/lib/python3.12/sysconfig.py", line 549, in _init_posix
        _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ValueError: Empty module name

This is due to a missing dependency on the target python3 package.

Jailhouse Python scripts are using setuptools with host-python3 which
reads its sysconfig data from the target-python3. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L33

If the target python3 is not installed, this get expanded as an empty
string, leading to this "ValueError: Empty module name" error.

Pure Python packages which are using the python-package infrastructure
usually get this dependency automatically from:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L295

Here, the jailhouse package rather uses the generic-package
infrastructure, then installs the Python scripts (if enabled) with
dedicated macros. This is why the target python3 is needed.

This commit fixes the issue by adding this missing dependency.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
From Thomas comment:
- Explain in more details why the target python3 dependency is needed.
---
 package/jailhouse/jailhouse.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 1354acf600..a1c86f0e91 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -21,7 +21,8 @@ JAILHOUSE_MAKE_OPTS = \
 ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
 JAILHOUSE_DEPENDENCIES += \
 	host-python-mako \
-	host-python-setuptools
+	host-python-setuptools \
+	python3
 JAILHOUSE_MAKE_OPTS += \
 	HAS_PYTHON_MAKO="yes" \
 	PYTHON_PIP_USABLE="yes"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
