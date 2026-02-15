Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D70E63F19
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 21:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA6C409C5;
	Sun, 15 Feb 2026 21:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThnclFmPeIAJ; Sun, 15 Feb 2026 21:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C0B94095A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771191580;
	bh=KkwWgfgx+oOkL/GARsToCP2o2IMaIgoh40JahZH7GVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=f7isaXmDwxx3N7vbMwzo2PaEm3F0pyLTuoOFIjP7vEzSateCRVjepcX96T2tIx81g
	 WQMGdvtgid/fSmrM/Irk5KQ8o9NV9XPM4ZjifsGeAR+BPG92f2UuuSjraC0HMKUYNv
	 LL3BmOa6WLo08wcW66JXbkI67YkDk0tmrBmHvOW7fRmeAHtMWqvVeNAV39iokesrUh
	 7M+iGWvbbMoB7FFBgOLlzC/iSZJSKh0Tvdejr88bnkXfwUIln3nmMsbyDlt+A76sGw
	 VFhEN3cX/ajew670ojVJFEYl25ygB8SqidEgzU3iD+40CiGW1V9/aE+4Ci6lqV4jJk
	 Y5U37fNJe+shw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0B94095A;
	Sun, 15 Feb 2026 21:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 327221EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1439880EA7
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrJfTnI-Navh for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 21:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B71F780E9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71F780E9B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B71F780E9B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.18.229]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRMs-1wLSTi0nNM-00X0DE; Sun, 15
 Feb 2026 22:39:34 +0100
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 22:39:10 +0100
Message-ID: <20260215213913.713705-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AC9OXZ9QbFDEOnlvzT4D03/6lz3ZQXo4rLX9FDnMTNYTdBWwkqX
 tnRnwQGg17j2okYtBMIbTWB1wKWGPZpiUNgCji7yAdaRA9WuucDMq+iy25EXLLrW2NaLFDZ
 GUJGjqrNVk7yXSY0fX00FabFemH+tJlMX9KcHXTw8AcK58jPDRBt9tDuWwJO2zfUhHsCGIa
 Udqt7INxu93mGJKV6swfw==
UI-OutboundReport: notjunk:1;M01:P0:Uq+AwRKvMpc=;GBiXZe2Z2NIfaqev6h6g2VVAtWd
 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
 Df+qIwiQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771191574; x=1771796374; i=fiona.klute@gmx.de;
 bh=88sMKRG+0/cIHB8A3d5WE/aU9oH+32jyWdJrm39BzQg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rEDLfad6z4LT6+AuF8s/4qYJQLQHnKCnfyBfICmS+bAzuyNrChxXTbjdk/EsaBIC
 SouE1sHawvaqM5yzlVjx6h51uRbp8scZKryrat+MRdNYP905hPr/Iy0It8Hczfmq3
 ew0AKUhMQWMsSSDXIy/ZVFPUM4jTaI1D5UR0ClAxL/7eBRzRNU6+kP6EF9jiT6z8A
 WTFf5ZdEphk+vSpRgl9cjSTOEAMUVr+oPS2uAyLGSKEtiRVqEeleDZYkaZKs9WlJp
 ovE46FYyO0/9W23+sir+K8euaACDyWkkv1QBi+3Ud0KEEO2KdmGeDPJGZ02745UHs
 wEK1mRDpGI2RHJD0jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rEDLfad6
Subject: [Buildroot] [PATCH 1/4] package/python-rich: bump to version 14.3.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-rich/python-rich.hash | 4 ++--
 package/python-rich/python-rich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
index 87c58f42e3..a4939b3c10 100644
--- a/package/python-rich/python-rich.hash
+++ b/package/python-rich/python-rich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rich/json
-md5  38baf395e7860be314c6c29fcac8637d  rich-14.1.0.tar.gz
-sha256  e497a48b844b0320d45007cdebfeaeed8db2a4f4bcf49f15e455cfc4af11eaa8  rich-14.1.0.tar.gz
+md5  4eb0893c8103200d58ad1980de396d57  rich-14.3.2.tar.gz
+sha256  e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8  rich-14.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index e6564347a5..2dab5e574b 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RICH_VERSION = 14.1.0
+PYTHON_RICH_VERSION = 14.3.2
 PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
-PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/fe/75/af448d8e52bf1d8fa6a9d089ca6c07ff4453d86c65c145d0a300bb073b9b
+PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/74/99/a4cab2acbb884f80e558b0771e97e21e939c5dfb460f488d19df485e8298
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
