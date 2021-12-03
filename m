Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCC4C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 20:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F03D68104D;
	Fri,  3 Dec 2021 20:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtumycI5P3Yh; Fri,  3 Dec 2021 20:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5630080F37;
	Fri,  3 Dec 2021 20:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2631BF378
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 20:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17FD04059D
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 20:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGY9avxDjcwf for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 20:44:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9B6E40204
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 20:44:20 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u17so871660wrt.3
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 12:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NprLtZVWlW130CJl3rK3kHEkTNeRKnITyltbo+6oZxg=;
 b=A0KzrdtQNz8Yjt9v6MEhgbqjFVD6y0dA8MoLLyjx3T6g/yd7eZqzLxV0wAAeglhHVZ
 xw2Bw9KpOdXve9NI/u5SM/rU97/8E5pKM/fFaBYb2o6vJVyplS2aWULciYVA8js4N9am
 5YQ/j2+i1pB1kA7aNTEc/75brDaQnQpoVYUNNJEoUlisNCV9KEU9kJRBocgWFuhdgKpx
 i/jUyup1jKl8OoN9HAXQYVkE1Hb4HGBHa2yNU3gtHdg6q5zqtDUog6XhSTswF0pVfmVa
 mjGhefVxMVXbJouYCwYpHIAephgYdETiAQ3WBb0jGZ9mk2vSPEqSuJ4iSMyCM1gztuCX
 2Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NprLtZVWlW130CJl3rK3kHEkTNeRKnITyltbo+6oZxg=;
 b=HO1eKKojNU//DKxbTK7keEwOjf7DQ0+XZkOD4dgM4x+PhgRQeGSyxBZMF03+eWTPbP
 yX8pIF/QIlO7QyFQzf0dXW78uACcowgQVmtpfcAoDiUSbwryP61AsGDy7lcIvODzGnnD
 mbGSedtktg+NPOynB9MEdbo5zRXkc/oCuKXwvt85zfWoW+rBxr4bBPuXAOof9M9EXFkH
 e0xBThMxdwQVrjQL8vZoItyNACy4DN2JCkVXjQl68evn6LPl3Rj7jSS0NVmZNMQFZ7QH
 nIZ6oPTFqQiEkquuG+oy5fWA/O1mY4lQK2rL1geOuH2sctCQUmP0t0yUmc0cAmwiUTfz
 wZzQ==
X-Gm-Message-State: AOAM531fOoQ42JHjZaCKKZjmDjoMGMsJSrOqY0KrN+sTRm81KSIlWA4N
 kt0ISFC5OA6+gMDSn2gGwazKPiWDg4RPdA==
X-Google-Smtp-Source: ABdhPJzSa2os60u9mNt0MfUP7o6pKx3yxkzdJUWRxJhz+hTgEQLjCxiCX4rYjn5nk19iX6mQwk0TVQ==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr24967245wrs.126.1638564258514; 
 Fri, 03 Dec 2021 12:44:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id r17sm4087522wmq.11.2021.12.03.12.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 12:44:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 21:44:17 +0100
Message-Id: <20211203204417.1922170-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnss: add CPE variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:mozilla:nss is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amozilla%3Anss

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnss/libnss.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2d880d2336..88e7cfb183 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -12,6 +12,8 @@ LIBNSS_INSTALL_STAGING = YES
 LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
+LIBNSS_CPE_ID_VENDOR = mozilla
+LIBNSS_CPE_ID_PRODUCT = nss
 
 LIBNSS_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
