Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A6C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D8440B90;
	Sat,  5 Sep 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihAcMHG5Fv9o; Sat,  5 Sep 2026 17:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9FEFB40B26
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628038;
	b=QmiH/5U9ULSDGyB8WVbBk9QVLMIM0GBMabQGzzeEfBB0bTt2LyYIBQu7dlNqi/0jjCHc
	 +pzbTzbrNdScGp3UFKzcn5woRqJzsdRoDkASFN6BHIaumfwncA2VN+jWY5HyB7Qn+83/0
	 m5e/8fuW5LmdW4zeJcG0U6d0AXO0PbSE96DtO5wAkLrhQf4XFP6ZHz3hnCDbakxdK3oNk
	 qfRSn4NT2MVDppmZ6UPj6xmat0V3h8UT6pYM34BOHxB86ad94nsg/Eubi8xsK3wGCkxWm
	 DjuomNnmSb7Bs7Tut4v4vuBpZWrbZvMhLUabFKBZ/XBo8YYeS2Rh2KTezInmRXTg+iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vjucOVwWGj+qQVHgItbyJ8L3sU1re+pZlANlXVAU9nI=;
	b=ZuLSNFApfUpWarEZKRg3kguIfyM4xuunxrtJW4EgcEfbfVIDo7P9b5d3wPyBpoAjsxhu
	 aK1x7q8tsTWqGfSRAxKTjrUOypl+TTTn0RxT0cHWXNqmBdDAFYZbfTACi8p1r1SMvZlX5
	 +VANLgq6F7QyVkZA8jIaR3MXlvEA/ucLgUzK2zjrFrL4k+FYnNBahrdX2w9UOPgOUYu08
	 qSdB3dudN9tZEknQiPS97sCgD1ZCc5p9LrjwwmERtxzpQX60hXkJ0TpgUFE8L7jKc/Tc4
	 sidwagcjQavTacgdSjHxmDD+jxbpBbSTBd/F5BFkfCr/F7MtQLGwq8Elmwr9HjHNOWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628038;
	bh=vjucOVwWGj+qQVHgItbyJ8L3sU1re+pZlANlXVAU9nI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R5ZN4+jxgV1I81Ur2E7qqZtIeh4PT3fGjp7jSpuIBcUkUTkzY5kKJWE8LJ7u1xBUh
	 eQSolsPUJrc7r/bEajqZU4HM8EgdXmBC5tnwRoCDihIIulvwCvGgSEbCNpJmH6/qFM
	 4g9lx254L+/0BFfVlk1T8yuILMNAe/1bLh6M0XUSqEtGb4pro39JiRN0j+q9dgejnY
	 5NEvcsayZSPnQjwjlA7K57pRg2I7Y13MSHf/90lr0qJwWLlgDVYbiQ1BYzJvlx7S5f
	 +Srq+cJXtnrBEwAPWFve/Zmy/dt2wTKvWNN6BD+n+rfKYmsQI9RAOs6PknPb9bU5gX
	 8iqOtd3Hv+7fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FEFB40B26;
	Sat,  5 Sep 2026 17:07:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 398781F2F
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19BBA60604
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ut6eghzdwON6 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 263766060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=KRd4Ck3lWMdOuJvL6TJUA+s3mGIEBMZf5e0+cl+ouI2hVuPQ+1HzPyBP+oK7/gMZitGG
 SL7Fv0hTNioYx2N1dG6j6VQP4RXw7FyKSua49RzTcbqoym4T2aDaYUqekVLiuvO4f+5Lw
 2pyGEeGGni4Zo30zazC4fgX49jLFXjFgI16jByUNt7h9NSNmZWKvKgqfVDxsk2g/f1fqn
 fJEKVqcmMRFkZNpA85l2ZEK4p7rgiJJC48uHKoQPRjBbEtL/H0F/30yfsM1ykOELnMLyA
 UbYyE1ZMbmme4/g5b9tmdOXt9OL5Zf+lKrmaTJWHDO0/4hdqRtuu3pUKS3V2xS/181Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eO/wUgg1wlNqNb7A924CsJgNK7Y9aPFabGRLpvf7Izc=;
 b=PnWdGU0Oq77PfldxrMyx7c6cToTx58NbZNmD4C5twXR4OoJXXOkTS7QEASdSW+CxadNg
 44ea/DZPVqKyWZCCpCJi3Qm3OKsG8VidnLNc33TeuvndhYN7myV6bF9vecTTaGjNu160g
 5yFrHgh98FiTywh+ZI8eMVRTHn9M3eKLfIc5iBGl+lT6s99Vm4fwfmigQ0MJzVGT9CXXU
 5Igp3gpnQysRF5NYGkfrKyN0SjaXY9GSaEYxN2rGaFQSVUbFMnfpZoTpmXPuFHVxLcXgh
 KG53pinX2xdY1FwDwjh7mlGdvmvC70r7yoj0PCXYF6blPxJDpw//+NW03GDebm5TSRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 263766060C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F26295262; Sat,  5 Sep 2026 17:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 196f186837ba5a2a0ac622b1b10875ded18230c7
X-Git-Newrev: b0a256dfc59990bec252530d081c11d82879fd9f
X-Patchwork-Hint: ignore
Message-Id: <20260905170604.0F26295262@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luadbi: bump to version 0.7.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0a256dfc59990bec252530d081c11d82879fd9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luadbi/luadbi.hash | 2 +-
 package/luadbi/luadbi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index 992de9571f..3d1051cc10 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  b1b6abd58a7b9cb51ccf67be903d5cbace9721c35dbf799379ffd57f45b40f12  luadbi-0.7.3-1.src.rock
+sha256  521834be356e747b31e42f6be5f5ebcd1232e4bcd36e948fd9e003e6e135de7b  luadbi-0.7.5-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
index 6f617fdc2b..4507d4fe87 100644
--- a/package/luadbi/luadbi.mk
+++ b/package/luadbi/luadbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_VERSION = 0.7.3-1
+LUADBI_VERSION = 0.7.5-1
 LUADBI_SUBDIR = luadbi
 LUADBI_LICENSE = MIT
 LUADBI_LICENSE_FILES = $(LUADBI_SUBDIR)/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
