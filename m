Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE84AD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DEC82319;
	Sun,  7 Dec 2025 14:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z54Bbo9TQGeV; Sun,  7 Dec 2025 14:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898A481191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117730;
	bh=y3GTvqJGrm1fxdNubYxZY1VpgrqvPn8ZC1QYPStSSNA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EwVD6gOgg+3huw4sFuzuVSqGYFbeaYsQfSOFvS+LlTR1LiO24JjTVfNAQqtoIvku5
	 2uf+FXgYkF+H1VNE9IU4aXWI0yfPd4dav4F22Oo9CyEO8CvdYyhaIg15julxs9E92B
	 imaUyH00aNqbdWQ3DFQLOH/mzG72ltrreoIyD3ARr9GozrQigabLDPjaewmeAV/kUi
	 hplwO3KIstwYIlceAdqEdWVddX5cf7QKu6tGHjjHmOj1a3Gk3TqPFHVE4qHcJTuDu7
	 QsvaVM4RcPcKyf07ouvv+pveztakOBBML/408mZbDAbnB9gpzRZ+vyTZZ8QarY3wLJ
	 KjlWVO5n1EiUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898A481191;
	Sun,  7 Dec 2025 14:28:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C172CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D61881191
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTeByPquWheH for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50F2F81178
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50F2F81178
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50F2F81178
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67BDAA4C0984;
 Sun,  7 Dec 2025 15:27:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-2vAU;
 Sun, 07 Dec 2025 14:26:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:46 +0100
Message-ID: <20251207142651.3695074-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117620;
 bh=D0Dt/dKlgAVHmCW1TRY8EenSgdO9lx5VFPPe5PT9wZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l0rjCWKwTcN6rnv3YGipPZBcwmDpXwVd9P5ihgtGIfb9MQ2rxg++h9zNV/FILlmQE
 Z6ddGxL5ruq6XndNlfqv4V6oVxQCzQJhEuHeu5WbK0OK+Tn5anhawRJG/ABPuFq10Y
 9U3+K4XEmcb5CdJmb2AAywUblhxqIwHhmZOe+qT1sz+WV4WwzFwjhUl9kaVOlG3n7d
 +5rsHFNlwmOtLio4fJRQwF8fVJnW8Mh6gdq1XgGJQPAMbiHqV0keFeR66XS6eM25ua
 tk8fI8I2V729YqugoqjoJZO7iw+HmkBw3h5hJGsdel2kuzBN52tOZ+gM9WYy8tFpjO
 L38lDoZuzEQyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=l0rjCWKw
Subject: [Buildroot] [PATCH/next 09/14] package/mbpoll: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Set-minimum-required-version-to-3.5.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/mbpoll/0002-cmake-Set-minimum-required-version-to-3.5.patch

diff --git a/package/mbpoll/0002-cmake-Set-minimum-required-version-to-3.5.patch b/package/mbpoll/0002-cmake-Set-minimum-required-version-to-3.5.patch
new file mode 100644
index 0000000000..0df22ddedd
--- /dev/null
+++ b/package/mbpoll/0002-cmake-Set-minimum-required-version-to-3.5.patch
@@ -0,0 +1,41 @@
+From baad0efca89f0d8fe370591283d87a6e8e7dee4c Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 7 Jul 2025 20:05:36 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+
+Upstream: https://github.com/epsilonrt/mbpoll/commit/baad0efca89f0d8fe370591283d87a6e8e7dee4c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11dcd05..d72c5ea 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ # -*- CMakeLists.txt generated by CodeLite IDE. Do not edit by hand -*-
+ 
+-cmake_minimum_required(VERSION 2.9)
++cmake_minimum_required(VERSION 3.5)
+ 
+ # Workspace name
+ project(mbpoll LANGUAGES C)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
