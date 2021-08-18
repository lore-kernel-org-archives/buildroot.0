Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509C4C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 16:56:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D6B606A5
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 16:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8D6B606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 664E140276;
	Wed, 18 Aug 2021 16:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xbw0c6TOkDhZ; Wed, 18 Aug 2021 16:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F6740285;
	Wed, 18 Aug 2021 16:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC371BF836
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 16:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C62D40284
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 16:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiU8HkkzdYsX for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 16:55:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E19440252
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 16:55:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id x11so6523992ejv.0
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 09:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W4X6fU24iSbZ4BKTHTiyQR+z18cmZX7gZG8JKY4rEys=;
 b=tKKMReRqk/vH/xHxkPtAC7nRPoyU96p2qc5x8dI+i1fyTa3x9Ru0ydAUJnNynHGBvj
 PMxlYEhBFHHIKUDmEtBWZW9c+DJR27m0iBujBR38fS1QQcNwTXi7Rp1yLdHvBBABd/7O
 akkWR0OV1poxabNU2VuWuZDCq1RdFLOtIMQm1boqOzlO32ygEUE9yvJKBjGVr1hj5pQl
 F9ULJAHvzblZEPHp4aIgh1oCjf8VOCn/sn7j2s8aSN+T25dPWQm8WTS9IUVnQrls2sTC
 TzcIQKa1mVI98nZLF6qu+chSvGpxFni7Mga4NjB5DwI7RNa+xYV3l+5KV26UzJG9ubCz
 ea2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=W4X6fU24iSbZ4BKTHTiyQR+z18cmZX7gZG8JKY4rEys=;
 b=iCsvJU8B9pi/DEL4vGA/WJv9u7ZdyTlxcXgJwfSoEwoLLRB/iIkNWuhnMmbS3kgF47
 QZW1EmdLO8EsCsBZs3n1fJgCt9aeZjCPDAiqPxxcA+3j3bNh1q4nqzLprnrhSHaEDoLd
 Cs118KeWM5VA+WLUN1zdXrVb9PvDQbGCITGeHi195xi+TJ1zS1dO3kQttp+iCIETs2S5
 +1mUZ7SoLydorZRu+Vbu+fpOqA/XyGvunGJYdsRXUcnq8j1SbRkmNeoG7OJ4GYJ/nYP+
 WuyFijGPSjhAKDgdJlQfcdVY+WVpOANVSgxLu1HLEHXybBxsndl0enYIApK7rrfBpLio
 KrWQ==
X-Gm-Message-State: AOAM532V61hPkOj9saGlt3tnOjWibR4Bbrnrf6LzVqTj6vIUNqi4Ji7N
 GdfpP6ljMK5uOxixlVdo0ZVw59bCsqo=
X-Google-Smtp-Source: ABdhPJwJreXgJdvW7CzP5ZCKTsXJaY9D1pg8oOW8v5k03zwXvaLAnRoUOyXYhWikVOaHMXDQbklguQ==
X-Received: by 2002:a17:906:2305:: with SMTP id
 l5mr10915163eja.72.1629305757512; 
 Wed, 18 Aug 2021 09:55:57 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 g23sm139207ejm.26.2021.08.18.09.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:55:56 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mGOr5-0001s6-TY; Wed, 18 Aug 2021 18:55:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Aug 2021 18:55:54 +0200
Message-Id: <20210818165555.7148-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/haproxy: security bump to version 2.4.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes the following security issues:

- CVE-2021-39240: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
  before 2.3.13, and 2.4 before 2.4.3.  It does not ensure that the scheme
  and path portions of a URI have the expected characters.  For example, the
  authority field (as observed on a target HTTP/2 server) might differ from
  what the routing rules were intended to achieve.

- CVE-2021-39241: An issue was discovered in HAProxy 2.0 before 2.0.24, 2.2
  before 2.2.16, 2.3 before 2.3.13, and 2.4 before 2.4.3.  An HTTP method
  name may contain a space followed by the name of a protected resource.  It
  is possible that a server would interpret this as a request for that
  protected resource, such as in the "GET /admin?  HTTP/1.1 /static/images
  HTTP/1.1" example.

- CVE-2021-39242: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
  before 2.3.13, and 2.4 before 2.4.3.  It can lead to a situation with an
  attacker-controlled HTTP Host header, because a mismatch between Host and
  authority is mishandled.

For more details, see the advisory:
https://www.mail-archive.com/haproxy@formilux.org/msg41041.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 849d362dc0..9edf5def08 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.2.tar.gz.sha256
-sha256  edf9788f7f3411498e3d7b21777036b4dc14183e95c8e2ce7577baa0ea4ea2aa  haproxy-2.4.2.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.3.tar.gz.sha256
+sha256  ce479380be5464faa881dcd829618931b60130ffeb01c88bc2bf95e230046405  haproxy-2.4.3.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 4c02b6d334..85d4fa7e8d 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).3
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
