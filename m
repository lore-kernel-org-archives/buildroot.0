Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F78C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250C180F9F;
	Fri,  4 Sep 2026 16:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNCoAHYD5aE7; Fri,  4 Sep 2026 16:22:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 532A68119C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538951;
	b=QbSObVb7SbReZND5Jze2PPHK2/Hfd83aX14JGfvXZWYRMKyBccqaAqp6jVWuGetoh/vz
	 cIVutXpe1n4YFI9cW+ivBhyRMGOwjcQQ4FSja+Bk/82NpLq3amm7EcdyZ55gQMc8mmk6h
	 qFPTf8DXnRdOTTm3JQzLiHcTRXCukFxkAuzwdRdbypqEtNmtzXrAi7o/huds1Gmmds4jv
	 stDPX/AY/lXoz6CylEv1wIqAZT6IOE5cZa9L49pNRvwHgoN2o4hAAUXgE3aGew7dA9TOo
	 NGFBeP/kkEZW1witUF6jHLGqObmwYmjmY0+iYkbGBV97x6bdC4s15VrTySoNdPA2b7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wJ14yDhXpYOzu0HjbNLenTEBSbvN8te8PYP60ALau0s=;
	b=MEAZIlV9GoIqT6ulsX74Cxpb1qvOS9NacW48YXpfFq4gRfh68pn7u0cFbxV9nGg4Y9+l
	 BDtywK3qaCgVVRAZwLbhMAKNz4KXSEKVgyf7xoAxp+ytPIPhUbXGpjJYqtp/V0vJugyLs
	 WXhz1dfVgOUsGJRwOwl+8QbXhZjL7Hum7o64q5pzwBX898rszDQWp5ythuJzDUIDK3Vvh
	 cRAT1OYjhOWkdpPLPBi9NiArVHkpw5oUmmupZZzMun9a3EEalkeSn4PHUmHMaK4rK0u64
	 tlFI7qgxdcPUDJY75wFve3r8HYQG6nOn4/R2gGTkKbWDEsiIxu3uAzZHqGZCjmLk74w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538951;
	bh=wJ14yDhXpYOzu0HjbNLenTEBSbvN8te8PYP60ALau0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f42aNr+UlGMh49GbpQoZQiFnDBN+2FdS9mNJndKCs6EbJtnzuqIZrKGA+VWBuseEz
	 QIZCwXib+4VUN3T7aS19oqTVccSQgCRnhB3D8PVCFNFf/w0nWTgy5WQwuRNeX1RUy/
	 u3zTRnFUHO401aRhceP8cuuULkc7xTYrNzCKikIHep8ixTwqPWbTm9MyShEC4dOT9P
	 c5zuE/brJLyFLAXC4jNLc4tFsMFbnWgD7w4UYWhFBlHSWGfC7ATfwTns4WKUTFkEcb
	 YrAFkApeLKH8OWJCvDRBA83rbwx0Pn5KfPfl44Xjd1R8ksHqeAvOlT6NwVjrelf802
	 Gly/JZ4ilc/zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532A68119C;
	Fri,  4 Sep 2026 16:22:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DDD43892
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 740C240A68
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVwV51H9HMw4 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 650E640AAE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=HO9A0uetIHeRaEr5OJKIFFL5GKxVijhY+GXPxoDwTalJm095YkZUSLSQnU1tj3/sLR9s
 zKts6S1nBemR6mpLMqJrUFeC7dAhGEZwMRESiI9qWjUyJLZ21Iq6Cuut0OTHz2OBwpxmY
 lK49GCCfwUM+BnNzOhC0LKfqJA3zAFL3OFuHtDYNimlN09W3IPD3wZ+dl8qHdv1xqOQgU
 xIoLP25SkNDwsALTYNWMFiWmclshMDHPo/UP4X5o4oBCyo+V57PDM5vXvGcFVRkWjmlFR
 b8hQziXuUoK3xb6f6iCIIhALx1J6uoxTQXeye+DcImeakJ1OPAq1ITnCIYLBO6d0XsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=P6BtqjeAhELRh+3sZT8cxfG6N2UPzGzNoPKchZDqpCc=;
 b=gU4o/mLnsrCLrgnpXxRLdZ0RQFECC5W40pLF83zZQ3p+ghJxLLsErEJk21acjqd5qNkj
 Q0ehM73RGbBJmTj3DSFcNlcPvK5VWaBADh0epWURYKj+TC92A/CBfQ6L/lSy/4gQURDE9
 NjYhsf/hNSAv9w4qGXt8GU4HJDwnYf5oLXKs1HgFce2rYn2z3JNCNCZX5f3pN3v5lPFn0
 vlN0Ly87lQqRW+eqh5NzuAC/iceeL90+JLUUKHjxpP5nbHgJ1oeFaj5WZ64pSE8Zeu5QP
 3GzPqd+am0K6jxd2SLOLIPoo8uvbKfefx4NlNFifS1GCMJFVtGoTEwCvzxjyF2n0IFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 650E640AAE
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D793993616; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 14:03:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e6e19e97bda5fd399df9bb6d393a523b32ea2e3
X-Git-Newrev: f48ae8880554fbd433b27dd3c585ad9585eddbfb
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.D793993616@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.59.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f48ae8880554fbd433b27dd3c585ad9585eddbfb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.59.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 176c663d62..a6d767c769 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  cad8fb5e23b422aef80ea14797de7c709c97a5d2bb8019cddaea87811b17a652  broot-1.58.0-cargo6.tar.gz
+sha256  5a0ac9419b66b7a7763c4ec0e53394b38e87b2cc11958aa6d352e6b4c74020a0  broot-1.59.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 91b35abd6b..2f1648fb6f 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.58.0
+BROOT_VERSION = 1.59.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
