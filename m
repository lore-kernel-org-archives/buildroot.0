Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D79ECA601F
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3F2B608BD;
	Fri,  9 Oct 2026 19:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71OFbALdO_Cw; Fri,  9 Oct 2026 19:31:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 16410607B2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791574279;
	b=JDmWpHU6kRDuh1wqg3yOdLM5dAQlVGLucP/4y0Wf3VxwcttNIpfBj6L9g5mMcJPz3U/W
	 FcleIGL9tjVcFCT65PFiwzzirPuy/Y4k2nVfwovsANqrsmfwc6bc98d0q0Pdp6Hy8CfnJ
	 rrGQgZDFMv5kRVaMBXwCyd038B0UfLfQcFM+Zn45OYj+Ymdbf65WLvy2pJ39e8RGWlXSo
	 BVJU+xzPDsgvcORJSegAGef7BJEFjiL+ariMvy/4tUV6QWDup4COwNFD5Ip6Tj8k7jp/r
	 kV8g93o2X+IEALo8BciwZmEGS3oNukyb5M5ZIhnCQkfMTD67CWYcUaSHZumvTiDNWAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791574279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wtD+KHFlONgqJmrLOMeTwmvtK1ORLxYN8qPLILLsSbQ=;
	b=TO5WmetEmdSybCWs4Fdb+sIDnBIgzL2NywMAkBvUaHg3BsVZPiDoXqpljn73MtRxRCka
	 Zy8k7QhXBUe+S+oHeTeKokriGUKSKwz26Fto8/ZSfz+UV0BSEC7VzZi3gXZwAkJ6w7Fi+
	 5hfdt53ju7vMUSCJSmZB5tAYZCSb79pF/sLPhJ6Wvdsihi9m5JfeDcznyu/F4FgUTpSaf
	 WlWzVr/n5Z5KR96FEJT51mY1kaaWqOSD6hNwLqj38BmBGpCQIVbIt2WXy43HltRFKJcAm
	 1pjuXol4YuNAEIA2Zv4sG7TzSKMnC/YzKnZK/TlIJ1UJJa7l1+JaLbfkt77I7+YLrHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791574279;
	bh=wtD+KHFlONgqJmrLOMeTwmvtK1ORLxYN8qPLILLsSbQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GGX0FxkLPKTcobcJvAdqEkhs9na2H508wAEOy8q4F9HRB7aRmBmyI4MPGKPmLMs1Y
	 tcUEmSLzWF+ixLRUaZIKqL1POL5z4pIbg1rYQpicAEN11QSfGoq3qNgdDZ0PiIGki4
	 tQJDmQmc35vVmoDhiHSDLLgDBnXtPRdC8I8FQAbqmLEmJ6XtaNcx/6KAH2hIwqd0MU
	 xkxAWrZZKKp6bA0O5l4ox0vb8k39zZSHe9GkUWy6gfvc0AFid+Rkx8V8DwauVM6vt6
	 AG6OijiF3PFREoi90ZijWPTsuNoF2OETjMu+qxdWTsZG1gfnpBbVwGrA6zlqimCXxQ
	 OFOuo0xiVloXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16410607B2;
	Fri,  9 Oct 2026 19:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58E5513B
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D56B81496
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDFX-IWgH_JK for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:31:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3B58A81490
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791574276;
 b=j1k17Hud6eHnQ7dPMxEpT1PaH62n0hG5DU+tumAp6GOIhg0oKnaVbEX0Nh3EBjya8ufS
 p0/w2SLFPEFgxABInHR4Zdc3NAmf2XpPPbLqEOhH/AF0ALNdMGKgKbpfqnu0yv8I1av5u
 dwq0pngOOoonpsIQXCreccs8/mpalqwBmfo3kjs0VO+RLek17+yA9Idd45pjN8VfQFI37
 bBeb+UfsH+9TpcbHcUUrEqPtRzBdWUwZq3HSQLPkXreS6PYwUruOOFa56gw+/PqypvIm+
 4ajaaQJVxOAemV7FLfZASWE/gA1tvxyT2ur8vGoEu2TOeDlu5o2dJAzoLQHAkZgSJvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791574276;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v0YgaLrGzZpNAWQrNuqULg8eSeqd3l4u7njliJpXpTw=;
 b=DM/B3l9AoyL8XNesACEgputfxHS1OF3WwCgOFiXVxzRFQzi6PY/EFRf1QHN4KJZO3/dz
 h1ZMLRA4RnezC2UpGGAH5Es952+9dk1sDjc5DHvmgLEVWbUYuwvW5ksDhbK24XruWvaHD
 IpE9Og7j8ogHtfdZCQqz4Se/wa0sS6x6fIB133E4hdCROKTgD8vcRZ9Nf73oiZRBiAXNV
 QXkBJgb6yAIfBuMLNbNAmEWjgCkNJ04bvVCBvOUmI5G5S2Y1cgbr49B+swUonGGUpjAr0
 dNzEZLQMtT6kDZDXJvoWwGW9yMNwN1TGtZImAXSBnOVYXLPqH1xola250ywBT0JeLZw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B58A81490
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:31:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C5C08E03F; Fri,  9 Oct 2026 19:29:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 21:29:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1869ded4bbf1cb9cfd9b26e6717978cda7d4f977
X-Git-Newrev: 0522d9af895473a34c0a467e72e70d6d6e2a853e
X-Patchwork-Hint: ignore
Message-Id: <20261009192958.5C5C08E03F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadowsocks-libev: update the site
 URL to shadowsocks-c
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0522d9af895473a34c0a467e72e70d6d6e2a853e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upstream repository was renamed from shadowsocks-libev to
shadowsocks-c. GitHub still redirects the old URL, but the README names
shadowsocks/shadowsocks-c as the canonical repository.

The v3.3.6 tag points to the same commit in the renamed repository, so
the tarball and its hash are unchanged.

See upstream commits:
https://github.com/shadowsocks/shadowsocks-c/commit/bdc77408cbe86ea90a6415222878ec1cfb2bb0c5
https://github.com/shadowsocks/shadowsocks-c/commit/bff687bd3479aa3b630bba13847f44ef480c9da1

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
[Julien: add references to upstream commits renaming the project]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/shadowsocks-libev/Config.in            | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index b5be19f939..939bf5d2bc 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
 	  embedded devices and low-end boxes.
 
-	  https://github.com/shadowsocks/shadowsocks-libev
+	  https://github.com/shadowsocks/shadowsocks-c
 
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
 	bool "connmarktos support in ss-server"
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 778daf37b9..75c0d58be1 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SHADOWSOCKS_LIBEV_VERSION = v3.3.6
-SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev.git
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-c.git
 SHADOWSOCKS_LIBEV_SITE_METHOD = git
 SHADOWSOCKS_LIBEV_GIT_SUBMODULES = YES
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
