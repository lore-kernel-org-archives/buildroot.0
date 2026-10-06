Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC5ECA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374F160784;
	Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtnU2gfVbbhg; Tue,  6 Oct 2026 16:30:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 63B43607F6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304255;
	b=fruoG/VOtGWbLmjL15SsOf+25bvPCqU1VHfuuST4S7Y5slitl1WVXTmNKQc6WZb4Aa7k
	 h6o4/AWVHX4viWiZTnqAErZitGcCa7W2SGLrmkSaIVLJKLF7hQlTN5a1dN2zUVcP6FqFL
	 eeF43t2Tw4RKhb6NDORwJd++ZanYlTo8V9YZLc5+khL7jMGObRjZ9hkuQ163m0iwH7O4v
	 tyq0oP78j6zyxkhKkTl71Ua6Y7TlPAB6dXcwN20sQrk2Ubcg8nMd4dTEbSzoCoq0wWrhQ
	 pYJq/HA4AKFWFwy9iZuXx+eKCiv6VWN8d0elJke4o3QwUIfmVdqwaraPhztNirAoMjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4VQQUlmxvOMRUFnm8JskRAA0Kk9B0mJ1A/c2gLrXQn0=;
	b=LzCQdgIGyFwJq0jyFhkhgeU/79KPfRSaEraSUy4ypjdFI3V7cgJPnVvHxmCZDKpwzCdB
	 QAtOPicO5ILu3KzmspgY6mtevJCOLBBqD2lvX7MUtl7BbtdHUjwOWwG85nIgoOjEWPcRW
	 YYDjhAxtlSLRdzlyZyyaIJuXk6iRyKo3x7Ek/j01Mpf1u1M237Eqeb7gf1PBa9IY7KjR/
	 WbmpqZglZkQB8rfBjXg4WDiWWiKqkcVEi84watDblPEJern2M/RTrSDOLnNhmZkX5sM1x
	 83IQsKMoWiJUY1DdBTEoFARbdvMHqSKq0syBJ6piHO4c+wlDXyz859ZYelnQ7pFLk4Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304255;
	bh=4VQQUlmxvOMRUFnm8JskRAA0Kk9B0mJ1A/c2gLrXQn0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SO7re9EW4hk2z9UMp/mcMiEI0DA3xmyhjHUeP+P2YKxyCwiD4MPn+6pOjNuYF2x9q
	 ZQcVZQ8hS40LS3TFLgDq2cdF5nwX/8BQ6Mce9q32ZNkJq36+zsP+holGOSJgunodWC
	 rz/T8ScFFAqkGLl2zu2104IhTV3ns+rCNNL8EyVBTSNkv6uVHik8khY6G3N65l+0pO
	 n/YdNgVVzySOzKVbMQPnSLZl+Csybx10Tdn4LwsgEqtuB2rTvDEsItUElx/MnmO/m6
	 tyYJHZoNzY5AED7sLVH2X1q+dY2vVvm5lN/Xz7+mnSgDPWwvbTdZc2SAFdi1vIS2Ro
	 RXB1vzxX2rmTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B43607F6;
	Tue,  6 Oct 2026 16:30:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA645A12
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F92840437
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvIpHoUdT4hR for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9761D4041A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=RniF8u18qxaTqzvh9+HiUWubbO8YWx9bPFE+z9vks4DaRQoC/WH65EJHicBbyhHPJSJj
 +Oa2CY1u+IWtU4AzP+FCCC+Ga5qwSKvL5ViA+nlI3xYcV0elJsN7tSORsV6dz/QCHKCJc
 sdcFkMFSPvciuvcS2ofbXE4quFX4luyTjodKucwX5Dxq8ZWgXhoS7zQUKcyovbidDrPzO
 VPXRmRoPVnNy07vCMfUFaLmGD9jqOMnwme8bSMiy/16pZB9Kc7v2gHHAd5YAf34oIMFZj
 10m5ZU8QY1nzZiRg+W2HDcOepQiQa5iRN0cUs2hGljWw5114e61YVlRc0u9YJU+r7Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=P5J5sXtD3FAbwouJ7gFti2jp5IU4/XTUVba6pMc1tD8=;
 b=AHhYTyhETn+B3SJIsiroZVPi8ilK5gfrZKV04TCNkRSLhKZeYo6PFDiIr0sD7afn+WTP
 Uvk1PBonqSaiXr966HlUWw0FLYAnfl4irBVjOJT16M4Hs5hAvcvLJIVh1Oj+FgH832j8u
 YwwSGgHG2YLX49AYh1rTK4toSGtlxE0tfoHjD1ndiDDswbUDdjm00WGg/PKQ4C74RhQb+
 fGgLTiIH229WdDMOnh0RRCZ/V57BZcu0U4rb4GOC4rMVfjgPpsShn8cDO2Ap9lFB94Ie3
 Burb7q0owbHekJJZ7AplIifTBLjaPJae9ZgRazl9bmUKMGFlTlKrxRQv+T4p7zA860Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9761D4041A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FB5A8DA0C; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:54:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd8d89880b61d27bee2a428414346db086ebb99e
X-Git-Newrev: 960eeaf8e7560adc2e4b1d5cc5f09968db10240d
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.4FB5A8DA0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-maturin: bump to version
 1.15.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/960eeaf8e7560adc2e4b1d5cc5f09968db10240d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 117a2b9463..45e8492bf0 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  703e4542966258bc728916f99fc78e38b670a538339cbf7f0e1b3bc9f9ab166f  python-maturin-1.11.2-cargo6.tar.gz
+sha256  df0b5d46b6a70ec13b5610de795e055c34b8cc898640c918b14e22fdbc92c9d0  python-maturin-1.15.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index dba5e8bbce..5cab6697bf 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.11.2
+PYTHON_MATURIN_VERSION = 1.15.0
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/2f/1c/00b48c6b93a5b3795ec96165a60dbafd3c5094aae281ba56812a8cad4fc7
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/b9/c8/22e5e21b2679c9bce6415ca578034ca2cc9316be0642ae21e051a2d5198c
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
