Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FCFC88E73
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 529FC403C4;
	Mon, 14 Sep 2026 19:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu57pbrfipjm; Mon, 14 Sep 2026 19:47:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 76EF8403EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789415265;
	b=SMKEcj87RcNNi94Atzn8MsUJlXRQrzFokvTK/hjKRsnw+NmI7dQZwZy6+OQCJFeAFyeR
	 FrUbu3FCbS8KWKtQLFq+F5sqCDSjx/+00KYEJ0ATHGcFuUFtyUAnQE8JFPd390KTjTKf1
	 l74hzvrXdJcakvFBIGnNL1xfs4iXB7RaVoa+JY81F84X0uHug8VRwyxQEGSStxmcl59Hf
	 Vw2ZJ2hxIKhwQdPVq86es7grAGA5hq9PW1HwkFxH2b3k9+himlBEFKenqkhSi+CnnIwPD
	 /wHauCK7IZIOP169m5uLJwsowDrVWFYfGOIrBfr/VRD/R7EsW8gxTIt6xwnTdlGjkeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789415265;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tIn/1Wg6EUBxMX62Y9CcDb514oFKEiJvmeeQBlM4fKA=;
	b=LxArUjOMJdu5y85GhOCxOnPxs95Dr0sewcHCT4WjHMe/GZk2JwUgUK+cFbxK2QBdY2Li
	 v/ZNzvNGZfUkYUeDffIZtbVDHAXBk3JtJaJI8s8jHRHafh7cnHbdsHp77OyYgZInQmVqH
	 L28/gS6kS8VrBdRIZFppNfCs9dds6OsP5t/vwt97bvIM7uKIxXimJfpiz8z9rk+1FoCey
	 iNctcbZu7SoSN/CfcgcsuYGI/dbZ/JlNR9uug7uh31u1UmP2W6GiB5214yntfEJjN8d1S
	 XGd4T9zUaG3IqFLLBE0MdnwHEg452c/W1OKM+zBTLn0AWf/kkaT0gPqiO93WXjrHxKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789415265;
	bh=tIn/1Wg6EUBxMX62Y9CcDb514oFKEiJvmeeQBlM4fKA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NnDpcDKKCcBB8NiDeBl6o/crUrFZq9/qgKwc9Hw2JD2QJyDvD9ra27faDgosQPviS
	 HnyXsdH77L/BYbH95PPDTIFrR3QdY9ZuuUyJL9F7kdQXiAhJqX1QuRjapjPlh7quqV
	 Z8qjHoZgf1RGFMyKLPxXlvPdnhI2RiMQI6ecFV+rP4G6RXMEHSSgazxYAsp4108tat
	 yd1L8y5niIntLThgFFZry7Q0OXVgAerbu+4MkRacVhmFFXwHyko7wuCGAdPfvgfS+0
	 wDfl+qzCUQT08lyGzphRmnJSPfvzF56ljmLOET05Ury+8R9W1s8cOiJNZyPvhHLZ+d
	 2pd8BKFca1KDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76EF8403EE;
	Mon, 14 Sep 2026 19:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08348465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E255140509
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0r9dUwFVyfsc for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:47:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3EF5A403C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789415263;
 b=oxKvQKExAsgqAFcpVodaH/Gho7OC5P/MiTFPXFuYL0R55LpfXO3lsvzMGy5QNqiOgsGb
 +fssnyiado36VaBTcFAAdQBmflqIhJzdvfSOFgj/kx5sUKEH6GanUVJ7e/es8QGCP1eSV
 nIXK+fk/ao1jZK4SmB185HnlaVCOFBb8BlgcOhfikgsjWIjwNiwIAmY202e3bZYNP+XVg
 MseZhGfFBIoKYxaUwUbz9FL5/0QoD1TC2sDLsHA8ZgtbIZBajchJ7cMlPPvgIgTuo7DVp
 zd61xNdGYz/hf46fh5AkjMrNbrmxA05deMm/gkj2BpzjRTZlHBoqv7NT9vsh5SxQTEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789415263;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kmjMDwl0lP/kh0+qoKB2L/LHc3l2y0XZ6Fod8gkC0F8=;
 b=jpZl94reWMnUyYfFxHiH6C+88dp8e6sSoePuJlKk8luxJz/MzncpOGt0TvNaDKz7fSpn
 j/iIcHHxE0MwfKeadPoQ+RmO4costZlPaMK82lM529TPlukqGka524JB7yegTjQ8Tl9KB
 0nnhoDFGuBRKhibFk5RCfkjcEUxQ8k9lsuKvgR2FzE63tkZvk3E/FF/6hO0Xl0UUaI9Fm
 Nb4SM6Ss5SOvdF/ZVz/i10asx9OSJmeTgfELis8GExYKPE7OMNdyVm62HDGe4rTamb3Yq
 3MbCIQiVrYl+hJ6tVUnqAd3JN8OiC2dVUwmhAL1LjywxdBqOvUZhkZFWJW8i8bhRHzQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EF5A403C4
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9B7795CB3; Mon, 14 Sep 2026 19:46:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:33:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21f18cd0124f994c736c034d79218a2c77735b31
X-Git-Newrev: 03e4bebcd21a8d25c68f1b225498de5db10d8edc
X-Patchwork-Hint: ignore
Message-Id: <20260914194637.B9B7795CB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lldpd: security bump to version
 1.0.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03e4bebcd21a8d25c68f1b225498de5db10d8edc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/lldpd/lldpd/releases/tag/1.0.22
https://github.com/lldpd/lldpd/releases/tag/1.0.21

Fixes CVE-2026-46433, an out-of-bound read access when removing the
VLAN tag.  1.0.21 fixes path traversal vulnerabilities and arbitrary
file deletion in the privileged process.

GPG signature verified with key AEF2348766F371C689A7360095A42FE8353525F9,
LICENSE hash unchanged.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lldpd/lldpd.hash | 6 +++---
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index f3cefe7b73..46f2b9b476 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.22.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
-sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
+# gpg --verify lldpd-1.0.22.tar.gz.gpg lldpd-1.0.22.tar.gz
+sha256  9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03  lldpd-1.0.22.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index a3015e9e7d..f0cbc7e436 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.20
+LLDPD_VERSION = 1.0.22
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
