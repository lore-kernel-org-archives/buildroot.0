Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595B0C624D9
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 10:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2506E40B62;
	Sun, 22 Feb 2026 10:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQYLIsSvaFEj; Sun, 22 Feb 2026 10:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B0F440B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771757811;
	bh=BjjGVq9+rBo8eYoM8CTGkJwtMpPOpoj2h5NPYItr9vc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjUlcdFSEACgl8lU8ZVOreR7gqE2tPUqPJJ75P9wi1eMbIy1rlBGlhXDLUh4CXHPL
	 390Ut/Vp4zksO11ErCRxk6XhJbUbQZiFDQM75o/oCJ/mgZf5puf0w3zySb9EtQIZ1n
	 4sxCqVSznb+WQrw3jcaoqgGrlxpYA8IkIx3CuWS7cNsCrIpuk/iw3OVKouRyf73et8
	 u35x8sqvMHmp1Yxk3FuEChgum+myK4fh0Jj01OK5UIIlmepuQDlcflL5oBJxiJEf53
	 r+eeLIMYbHZxkP7qAjnUjKNUU0En36DQLVWKyj5qtxL/HhhaOlG0SmjizN42jj22ee
	 77w0umeaq8UnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B0F440B86;
	Sun, 22 Feb 2026 10:56:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE7142DF
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBFDF400CD
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7BGOnJZYIO1 for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 10:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA8504009E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA8504009E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA8504009E
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:56:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60340A4C02C4;
 Sun, 22 Feb 2026 11:56:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49720)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vu78Z-000000007Gs-0kTv;
 Sun, 22 Feb 2026 10:56:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Date: Sun, 22 Feb 2026 11:56:30 +0100
Message-ID: <20260222105630.549807-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260222105630.549807-1-bernd@kuhls.net>
References: <20260222105630.549807-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771757791;
 bh=14JUAzSr7IhVPAcnYw9LSY0gT+4rxVGvTG6DcDkgV1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=udgbCfE6b7YCFjNGke103ecfZAwEUgC/XfArk71uK/LzHX/bINTPRnCWtAljK5kPV
 S6578LYXCVWz+qM0JiXa+KHaRK7p26EjThDnxQ2HEblGq93pb9sXlILTspiF379w8M
 5k/rLGmwUcB7CfHg0DVhKnl6yeW1nD5RiIGE6LPL/TitooKPiUvntljdxq8Fd0MWZr
 gRxEVku7fkIWOBfjL5FdKQRoFIQMnOF0Xf4B9BDZNVQ2A2MWD/0escUJv234h1Chzw
 q6vMRyTaXx7a1zSGYjRQsSW03e08FOqIFSGclkZ07QcEqP6YXttDCR56gNz075tQ8/
 2C1tRs6IoewKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=udgbCfE6
Subject: [Buildroot] [PATCH 3/3] package/tcf-agent: update tarball URL
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

http://git.eclipse.org responds with
"The Eclipse Foundation's Git repositories have moved to Eclipse GitLab
 or GitHub."

Update _SITE to https://gitlab.eclipse.org and switch to bz2 tarball.

Fixes:
https://autobuild.buildroot.net/results/549/549c8d2213d3df78b8103f1f460739e7fa74fb1b/
(Download switched to sources.buildroot.net after hash mismatch)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tcf-agent/tcf-agent.hash | 2 +-
 package/tcf-agent/tcf-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcf-agent/tcf-agent.hash b/package/tcf-agent/tcf-agent.hash
index 34893d280b..910969dd27 100644
--- a/package/tcf-agent/tcf-agent.hash
+++ b/package/tcf-agent/tcf-agent.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  64131790c7d4636d4abff8516d5b4b6329e4d3e691f44dc604e2c30f55edb0dd  org.eclipse.tcf.agent-1.8.0.tar.xz
+sha256  8993a467b80f407d3fdfcacd6ed6dca55e4ba075c986b60874c1a2cba373545a  tcf.agent-1.8.0.tar.bz2
 
 # Hash for license files:
 sha256  f82d01b74a513bd3504d08136026a5ac2a7e6ff62ebcde391fa74aa222d11ce0  agent/edl-v10.html
diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
index e90334c783..96545004f0 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 TCF_AGENT_VERSION = 1.8.0
-TCF_AGENT_SOURCE = org.eclipse.tcf.agent-$(TCF_AGENT_VERSION).tar.xz
-TCF_AGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
+TCF_AGENT_SOURCE = tcf.agent-$(TCF_AGENT_VERSION).tar.bz2
+TCF_AGENT_SITE = https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/archive/$(TCF_AGENT_VERSION)
 # see https://wiki.spdx.org/view/Legal_Team/License_List/Licenses_Under_Consideration
 TCF_AGENT_LICENSE = BSD-3-Clause
 TCF_AGENT_LICENSE_FILES = agent/edl-v10.html
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
