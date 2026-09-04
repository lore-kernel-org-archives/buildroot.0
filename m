Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C5DC79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D017810E9;
	Fri,  4 Sep 2026 16:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkZ3mX6_6f6z; Fri,  4 Sep 2026 16:49:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 95FD180F5D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788540571;
	b=oNWzdAbyPZv5BDnUOmnfC1b2B9PoqVCe+e26RsjcbCDNWQHSeC3hFd0ar+3ndJQywxJb
	 Qp+qp7jLcwfRFkthwx17z96N8zWegNFJrIp1VDP5iCr8owEouzIq8D1bBvOhwA0rtGYh8
	 Ottmn6JZs77gnv2AMpjZoxX2Ew2LHCbCLB8YyCAdbPJGzjvN4St8eC1++PORgafBoTZuj
	 3nv1HZdKwoW1I96MO4IQ4y61NUJNa2yBcJsot76TlviAQomf22ziDSF2wI4bqfISxoUb0
	 M/gUigMjALUN3nkEcJkZNTksnp+f4RUIlZBJjn8Cvbb4iG+uvW6xyOKARfav4o0SPyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788540571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=hRbEGrapw1vVuMqOphF73pziKiEDDH21Rm6oxyH+Fds=;
	b=W9ui7TCDobqyY2P0SA87ibPcgVyeKJB2n9nh1SHBA/OW8TuS2wVJpll40BjCAUv1gCuq
	 Z1LKpj2rb9+bdVzg/9DITfUqz/wA+zpcXLCI/BeEfnOb6AyfLCeMcCcqD6uk2UJkdwG1n
	 A9y1SXX05ogwWQcGjEqy+I3IYbPsA7aFobWjYygk/x3juJcuNr8SgpMjZQ/XpizrcyRer
	 dzAeRJFT/zA1YuJmp6KLSb/24HTjfRB81C5D2bog3QTIfi3+DalsKRxPIaYww5Vlacowg
	 9ucYTg4P/5/X5bMODogW9jiI7FM02ZpXp7s/CrTHrrm8gTlOv/NfNNqv/kG/yS+SNjQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=M1UT06da;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788540571;
	bh=hRbEGrapw1vVuMqOphF73pziKiEDDH21Rm6oxyH+Fds=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n1i4m8Jk0IP50rMKWU7yzkrN9Hql5xR5tC5VwUec2Z46tmS4Ir3HdkeGe8+lrD6EU
	 E5HICTP3o2K7QwT+1o+6hVYgqOJcM3aW2CboJldbsZdavORuob4fGcjBO0DJ9ctOw5
	 6SlPLhQR1KMKFUQt7WaBITTtfOLDVnDv1n6vdC9QDID1iYKy8+BEtas9pOBx3O1nTM
	 itkaTQYWakk8Bm8Zz40XsJVGTDnBrroWiDGivtsptK3066/fgM4pK8FgtGZtCQSVsj
	 VukLV8bEh1noIxN9Ymrckbsvw3mxi/RLk4yFLnp2aXYqFtk2yJ70IR4/cj1ZTngr2f
	 4ofycmGglqdZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95FD180F5D;
	Fri,  4 Sep 2026 16:49:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E928C10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B62C880F5D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP1cuCy2im1F for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:49:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AF31880DDF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788540569;
 b=LoJQXcNke825EJIec84y+X7t7LzGJrL+q+571MYm6AbFC8Ia5joX/oy35qmxWJClB+Wo
 krJ8CuTfFrDKqJZ62yZWM8djdTlZF8nzJFRFPsPyo5FPTxjlzR3+p5mldWO0RH23Cy8kD
 0lEP9lrtoT74s16OU2iBbLskKZYfTQR/7BxJI/BYaRWQbqLcFkswDG4NabwHqsNQHhMFh
 syJIsmzx06k9NoT+Cf761XsDkmZaHFcqS10ZZZBYbQCeSa5BMjq4Lyczc7EByvtf3CIcj
 cjxoc/mGrWLX+MI1vyJ8qukpfbBEe1UTtJVQ05l+fM9DqxaC8QNYt/imFoGRFIhU/tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788540569;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=WyYOgTqwY+GW8chscyMjM85AsNeWYPb3sR3RzPwLbUk=;
 b=jePyFnuD8lQJz0XAYfVM98t06c1rOd/Xn73hUX9vbNQaHpt2vMazORBe/ByEmnMh3bko
 JJfhOVz4eUXgsQDgpCAoWwtkoXK+LE/P13TepldUf+dg2kbzAW38rZ6u34U8HrSWBh+8X
 w2erKky2hpdCSl7dMDfhrkDdS8tHs+LdpXgOiJmu/fQQ/WP4uAtIB5w98ERveBAHxnKW+
 GLL0va/lklJ8JJyJnPubrBCr3CDUf/WtaFB/y1Sn8soyr8pN+4l95zqjk271M+lf1LiQZ
 04HOp8dqNKekVMXak2A+6f7R/9bQaIrcbaxdU4DznONDXktORmVSolHHtjbglVTU+HQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=M1UT06da; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=M1UT06da
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF31880DDF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788540567;
 bh=WyYOgTqwY+GW8chscyMjM85AsNeWYPb3sR3RzPwLbUk=;
 h=From:To:Subject:Date:From;
 b=M1UT06daoCYNFkmX12YujHUEwVJw/YoBeAeFIJxRAZndZTgIiur45G9BQqDi3+pep
 emos4v/RdjW3MwuwzprdWiuph2WkJL+jGG5q2zAQ+3BCFe9Zi6mPe7zeg9RoDLLNTM
 WiY3U5Uil8Po9wi4JY0n5UZ75DS0sMNH6TpUhmMt7Ilj2Grj+QeiNwGkWxnTPXCXzX
 3MJLh7/eRk3lpPg+nCTgk26JBOB6kU/AwtJD4ReoVvgLuO3ouwJ8szmtcOJruK0jNt
 xPrax/pbPHw/l3oPWjfXSXa2FY2IdzHoK+tPpTeEKPuRFjO+LLhEvheOzOaSXAxzI8
 5fKoSYUn61wNw==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7FD36A4C0370
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:49:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57182)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2X6V-000000000xy-11qo
 for buildroot@buildroot.org; Fri, 04 Sep 2026 16:49:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 18:49:27 +0200
Message-ID: <20260904164927.188013-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libcdio: bump version to 2.4.0
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

https://github.com/libcdio/libcdio/releases/tag/2.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9a89d8eb86f6e88d00e5d6bb22773090ae6eff04

 package/libcdio/libcdio.hash | 4 ++--
 package/libcdio/libcdio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 4c15b53e38..821f949b98 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libcdio/libcdio/releases/tag/2.3.0
-sha256  53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed  libcdio-2.3.0.tar.bz2
+# From https://github.com/libcdio/libcdio/releases/tag/2.4.0
+sha256  8e6a305f81e45a78b41ce696d34497cc208d97075469d7304c11a6d44bf006ac  libcdio-2.4.0.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index d5238e3aca..213d5cfa32 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.3.0
+LIBCDIO_VERSION = 2.4.0
 LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
 LIBCDIO_SITE = https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
 LIBCDIO_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
