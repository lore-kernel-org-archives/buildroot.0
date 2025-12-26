Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEE9E8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 15:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A4840695;
	Fri, 26 Dec 2025 15:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weno-P9lo-OZ; Fri, 26 Dec 2025 15:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B385C40696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766764033;
	bh=+W9g05eOIPUqggSbP7qYlKb4lKYj4MrnTs9U8AFJZk0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EYMr1u9XjYPdSEdFMmUV4fJ2CrPJzqEhpcpl8IOqkVu/6KXDxWgzTuMS8bc82PL1l
	 sriDpHmVDeOMmlUV/qVTnwOlz00bYdIHH7a6I4RiGoQLXRcOn0Pf4bVE3i01iLc8M/
	 kFJh0cDGNqNI1iO2m+i719aTRuzJsiRf4kiu63sLlTvpD617yWeA2pc7AiGIfG4WOe
	 P5pWv43v+H+oGBw8f3s6xsF//AqU3K4ofiR2iYynH9ABlpNWER8o/jaYBPtYXSUvbq
	 JxLr5PHhrbIt3bQieqpTB7OepK4wYSvMgDjW/FNdNfFrJHWJsxZprSmsGKkwERRQze
	 1P90OxRNHgWvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B385C40696;
	Fri, 26 Dec 2025 15:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49E16B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 362FC401DA
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3Gbths4SLiR for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 15:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 431CF4009A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 431CF4009A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 431CF4009A
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:47:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4F9914E41DD3
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:47:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1E420606E4;
 Fri, 26 Dec 2025 15:47:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C69C103C8C77; Fri, 26 Dec 2025 16:47:08 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 26 Dec 2025 16:46:51 +0100
Message-ID: <20251226154652.948817-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766764028; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=HSsbl0L6iaFLLWZdMHmL3HqXIMLzuHi1MAiaWxvV6ZA=;
 b=k8TN9OT09gI11NgxRmiYHAQVYmYIKH+PUSzY78dLLnUkzcAdbohBRwxkVUvRBQkBp1pzSO
 O3gjNjD1WpkxAR5HV5wOUrm4ID5HOiTlNi5PfuyQJmTNPt1hsriMsKRD13sw8izCfNha9x
 HkE73s0SrNsY45N7lqwfMsaCOjKyCPUt3GERyW682lwIqyEoTvL/vA5aK93tSYHlk5DZNU
 VLIlwxFELFGAtvAHCqEYoqB+jFxh2UWE9ZiR96TWd1tKxrD7mWX1zeNtiE4u2qwQq1E8bx
 geg8JZTs6OZB/C51ZnFrtWxjNPFg+SJqSgXaj3m71xosccnMb3OTKS5guuGAWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=k8TN9OT0
Subject: [Buildroot] [PATCH] package/flutter-engine: don't write into $HOME
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gclient.py tries to not only read from $HOME/.config, but actually
create some directories/files in there. As $HOME can be inaccessible,
let's override XDG_CONFIG_HOME to tell the depot-tools code to write
its stuff into $(@D)/dl-tmp instead (which we already use as a scratch
directory in this package).

Fixes:

>>> flutter-engine 3.29.2 Downloading
/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py:3367: SyntaxWarning: invalid escape sequence '\s'
  dot_git_pattern = re.compile('^(\s*)url(\s*)=.*\.git$')
/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py:436: SyntaxWarning: invalid escape sequence '\.'
  tokens = re.search('//(.+).googlesource.com/(.+?)(?:\.git)?$',
Traceback (most recent call last):
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
    os.mkdir(self, mode)
    ~~~~~~~~^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/br-user/.config/depot_tools'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py", line 108, in <module>
    import gclient_scm
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py", line 23, in <module>
    import gerrit_util
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gerrit_util.py", line 42, in <module>
    import metrics
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/metrics.py", line 23, in <module>
    CONFIG_FILE = utils.depot_tools_config_path('metrics.cfg')
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/utils.py", line 48, in depot_tools_config_path
    pathlib.Path(config_dir).mkdir(parents=True, exist_ok=True)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 726, in mkdir
    self.parent.mkdir(parents=True, exist_ok=True)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
    os.mkdir(self, mode)
    ~~~~~~~~^^^^^^^^^^^^
PermissionError: [Errno 13] Permission denied: '/home/br-user/.config'
make[1]: *** [package/pkg-generic.mk:181: /home/thomas/buildroot/br/output-all/build/flutter-engine-3.29.2/.stamp_downloaded] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-engine/flutter-engine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 1fa59a3863..e1c56ee62b 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -181,6 +181,7 @@ define FLUTTER_ENGINE_GENERATE_TARBALL
 	PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
 	PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
+	XDG_CONFIG_HOME=$(@D)/dl-tmp \
 	$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
 		--dot-gclient $(TOPDIR)/$(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
 		--jobs $(PARALLEL_JOBS) \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
