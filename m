Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D99CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 12:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BEE860644;
	Mon, 19 Oct 2026 12:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUJvQi3Eemox; Mon, 19 Oct 2026 12:18:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0EC2E60623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792412298;
	b=LFxjPW2evAPDYz8SwNFs6DzklapkWi8bD2Q4ZmGdYNJSZiYS92b/Tq09H9JYkk6RsVsq
	 jP+Z9CylQlfEaJzS8M/vZRiIU9CJjRO3sVRafaAis7/SabKpKl75E7i+AOuIgJpThTrE3
	 3RzarwxQMvcuqtBFhrsGW7chZSi7860DX0Gyoj13e2B9886rKKS5f352domD3XZra6qFc
	 20t5VaezB3kLqKc7y4xOxueJEgCe85HAgglIgb0k+2kNyj0tecnRw3al2iY/rWKl77Kfv
	 tzS/wd9dqAN78Ht7WDVfA50QwscFgcuRAfZmZC4a3ftIdbPMY1ZsBigsvGvMAfj0MIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792412298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FFSZzD16WILdToNQGBnQu+XsrNmnqfsXM7yu8UIQwnc=;
	b=te/8YHQ3T91imPy0Zkn+B4sGZjN1HsaGfFSD0lhqdU2PfGMKzBCQwO9DqDlUKpbXdRSr
	 0uWjGFLX2dgRIdcfV3qZovLCrMqHmKuGGVd02EqvuvReU3pkXMVWhcIPPFJqEkHsQgzQx
	 NBgH8Gg/O95prQb7G2qufOX7/uOgNDtefOESEyRUn/nish7ucPH0IuYJp6IOEkwaYArkX
	 h4gvBzqCXfMFKkdIayUQpackmmoJOPwl/voeluc+2LXwf3NRl4OeRvbWNZZVzjvmjUYIX
	 Zx2znDjCFmqioxZbcLOk8A1szPgo1sVO9Q4UO+mR4tXl6rpc3u1aLjVDqqH+sbOdPEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792412298;
	bh=FFSZzD16WILdToNQGBnQu+XsrNmnqfsXM7yu8UIQwnc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ea85c2NJkUkUEIXEGBLsfNhkGFWwsBzqJMfUiY6lFJTmi5peKfEUM8k38HvVVkrDE
	 C4frazouTcLKYR1EvgTmACdtuJnia4A/lhtYhlTAz4S44FjlFXlGnsZMqqN1PQcaUX
	 SSle9m/agKKhykQU1OSKy4KKSEJijCESaLMLhm8fsawwS9sm6VgnSr6tOCMv0HHgCi
	 F0wSbbM079nMlm//Yv6fnVnp7RrOFi1i/4bvPSo0HaGvGVN78+v3i/Zt9DW8vGT79S
	 2y8enF+QSFSYvNRwpvspXzXXQZKv+EW3y85OSUL9rmmguqhTeD9N5m9U/6Id6UPUqU
	 zOU2cq0zhK00A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC2E60623;
	Mon, 19 Oct 2026 12:18:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EED5279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44E4380DB1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3wu5RT9eIDo for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 12:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3CA1180DAB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=62.146.106.75
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792412294;
 b=hQ03w1YxsjWrjpnT9PKb1ZpKXKaQqWdunBZZxKjKcP6A+8vf2Oagm3WfcNqUdeqaHWzk
 oxItJ/E1LxaDMYJS2EFkm/OeoiPSSPdoxASuqhDIZPjU5NijzY9HloItbAn4iweBTz2Wu
 iGoPBS589+uz66c1dZU68x7+GaekDzBRmVzcG+93nbWXXokYlyVF1GNcLRg9aMtZ7pq4K
 UglqGac2U5rAndp58Gi2f3puuCP7VSSOkRZojbqLnmS9iawy2Q2mCHgQmXy7faiNGBTyJ
 TQt1Q3WZ0ElJ2KSGxqhUKAnUmkqTw0mBrtbGIYxw6wJMyR192jK0N4hf3Ebh18G3l6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792412294;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=cOR8iNQLtSOPAjHh8PzOdGn5WiaV+eSmPFDMWJCTiLI=;
 b=YBsNKZ5/RJ1HTLt6ZIoNEk4meVGdzKuAkt43unP4GqNy2mAaFlUDQNDjdCYh12xK6xcA
 sPTWyKXVflBMW/xobLDOyHwAzYRTfQJl2sYbve+CUyVFiZVQeEu5jPzKK6bSIXGeLFSQa
 wkoK5gyeavjrdsKwu5IXLAsDlpvYy+n8TH2GxxAvcDF4gwu6p1Cvy4Bsq0feS1/BytVSG
 0p9fhM6EqNbLJ/c1+pT6PKauTnzaob/CqJWbchKYhgYbUN4+u9mNz6++6+2i9BdSKJFDG
 gfO4dKtZqle+U2vxPs4O3IdaZ4i7U149hLyGGTofcs1CWMu/ltDejRGzX/sF5S7lPnA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=relinux.de;
 dkim=pass header.d=relinux.de header.i=@relinux.de header.a=rsa-sha256
 header.s=uddkim-202310 header.b=jUHkpqWw; 
 arc=none smtp.remote-ip=62.146.106.75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.146.106.75;
 helo=smtp05-ext.udag.de; envelope-from=kirk@relinux.de; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=relinux.de
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=relinux.de header.i=@relinux.de header.a=rsa-sha256
 header.s=uddkim-202310 header.b=jUHkpqWw
Received: from smtp05-ext.udag.de (smtp05-ext.udag.de [62.146.106.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CA1180DAB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:18:13 +0000 (UTC)
Received: from localhost (p4fe23947.dip0.t-ipconnect.de [79.226.57.71])
 by smtp05-ext.udag.de (Postfix) with ESMTPA id EEEDDE0218;
 Mon, 19 Oct 2026 14:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=relinux.de;
 s=uddkim-202310; t=1792412290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cOR8iNQLtSOPAjHh8PzOdGn5WiaV+eSmPFDMWJCTiLI=;
 b=jUHkpqWw5Gg64Tr0o0StM0QOURGTqA1gJCTWgZu4piy67+67bjchRIJi92huumXSwmC6XD
 IyVJ9EJfW8vVY62Nf9coTN3ZNdGLO+ZifrbS7UngyisOcEUdCgZfkYwNJggFLaPuLvsah9
 A++Dd17TPynGzLI++ue+jNFisjEdOHQ5vqlazRj+CsS/49Xlft3OmouT46qwyK1AvLuAz5
 1yaM28D2jqUVU4p26dkU+NTxA/FAA8OHA29ah5BlAIHZpuZd36/18nhDw25vlNPTP64P5d
 8BG4+qIFn4yQHEYQDQOD1a89EIRXr1//3+uVpnPaVV4kByfrnROu6W/C/TMFmQ==
Authentication-Results: smtp05-ext.udag.de;
 auth=pass smtp.auth=sho@relinux.de smtp.mailfrom=kirk@relinux.de
From: Stephan Hoffmann <sho@relinux.de>
To: buildroot@buildroot.org
Cc: sho@relinux.de
Date: Mon, 19 Oct 2026 14:17:26 +0200
Message-ID: <20261019121726.184892-1-sho@relinux.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libhttpserver: bump to version 2.0.1
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

Version 2.0.1 fixes an unauthenticated remote denial of service in
version 2.0.0. A single multipart/form-data request containing a file
part without a name attribute can terminate the server process. The
issue is rated high severity with a CVSS 3.1 score of 7.5.

The release also replaces the blocking-start pthread mutex and condition
variable with C++20 atomic wait and notify operations. The existing C++20,
GCC 11 and threads requirements cover this change.

https://github.com/etr/libhttpserver/releases/tag/2.0.1
https://github.com/etr/libhttpserver/security/advisories/GHSA-q8g6-h8wv-pr43

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/libhttpserver/libhttpserver.hash | 2 +-
 package/libhttpserver/libhttpserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index b6b1987464..f4f5263362 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c44d67aba1e4b6767c0fbb895e1acd643601c1e3ee3de7705a59ed09bcd8c92e  libhttpserver-2.0.0.tar.gz
+sha256  cd6a53302415143abff2db2b92e59d3de837652243717c873d4fb41fe22fbb70  libhttpserver-2.0.1.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 7b7aedef0d..535c237f5d 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 2.0.0
+LIBHTTPSERVER_VERSION = 2.0.1
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
