Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0884C982FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 06:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826FC60677;
	Tue, 22 Sep 2026 06:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kb3wdomM-Bk5; Tue, 22 Sep 2026 06:31:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8C0256066E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790058671;
	b=ej1GgseFiCmfTJwdQvPeJrbCq/dpdGq95f52FFq8BFrqibhbzl2UW4naZXzborgiQegO
	 Kri/S41lskkGWZsQXCD1D8fyEDF52j3oDZ7lkZ8Qy7e1bvbXUPlOKp08TmtYRoN7sGdyI
	 E3tmaGRMAquX6DTaAhGqkmjLOGsazWDpAYIvzUyoo2gIcFeg+oPD80Bpj6ILyd5jHKZ7o
	 L11Bf/gRgJgHpOBq1nVbcpYI/kJypFshtH1jRQp1SwIyGtxGBXFOMJzC5XwxnlAbwwcwc
	 bQBo2/PzaBow9oIZlbD4aLWB6eXwp40CvBShpjxM0blSC/MJ9TMHYZjl8UamBPddwuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790058671;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FOnFYZkQaxcIcqJ2kH4vriyBFOYUm6PGcl+Jcs7mcgI=;
	b=XJnvfnt1bMQ8S5V9zBTkuQtjvKkFA9lDHC1RjwAmQV91FdF3r4kEP+0NTG3DYtV9hpYf
	 QgliqmGRYpHo+hwaFkso/Q/oagS+4zDAVTdzHCndm/caK56OtQIJWsfqVjNI+J/ECpkmo
	 LBEIHle79DcZ3vMB7iHTNQwaufREfmqtO/29GYsjhd+sivhN71STCCdAmlJCWggGpY0fU
	 xXkOFRrwouUvgqg6AuZOOxu72pIF/aJrairPxMvL8iyLObVIClkDSyINs2/A0DYebtwmJ
	 2zsTHvYAa2yzVdrN4vQt4G9BT/VwR5t+2XRkbkLbQkK5QVQ7vZWEAF4HJquPnGs2dQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Ncwn4M9o;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790058671;
	bh=FOnFYZkQaxcIcqJ2kH4vriyBFOYUm6PGcl+Jcs7mcgI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PO1yoAanU3ubtOWTxXikvHDeZTWdwNNBHibxmt9ODRzHXoJWRGMaxXN0xyDoD1mhv
	 oz8NuIuRHupc8SKxnozRQRiGfTh0AiK8f6p4dlgpxmSe8UIOOseQv5L9qJq35LIwN0
	 TJJuWdYKNbwTy1FakEmQrFwtZao8byUhHu1Sk49WiJqiZq2ST2B4RlD4YpTXRd2rB+
	 yguJRW7YWiLvFneEOylaUFcaYj1j2NReK++9Pj2O82yTpFgOFD+1jpxsgfbkHAlFLn
	 buJmoso8unjc4xOA1MLHNxv94BzTBd0XHYlGTSfJSW6epwBVo5HlTz7vAa6ciL2jel
	 uQFhjRUwHyPPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C0256066E;
	Tue, 22 Sep 2026 06:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 055C434E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB22C6066E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVoYJ2oyw6Md for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 06:31:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E2AD86065E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790058669;
 b=qpf0gpHwy0N4jaHU7NvpC9qTAH2o17JP7/0UaV9hocsHYKo42erg/crnbEtdi0g60pyq
 UiRd39bXHe9kBHTLT4s1LKI+cDOd71D2rcOfzwpJ3jQE40RZ2ektVcUqd+yO82z+8c24V
 tnX2Z3DSw/7PSBmM1LAjRscBiY0Sbw/t0+FB2ALnHKaLsL/FRmfRRiCt7bg3HYTnqr1KB
 rZTSbiKte/7QfxDtVYTd3bajl8ReWmlU79ZUhENUj5W7QMLTNIo6pSxWhpsLWIxjGh1we
 hnLGMl0xD9qSkLOiLc3wHYd04gZtZBKPsquMHdNk/+lqAQ2LUrttdhhia13Mqc8zXVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790058669;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mpeubLbvqIhGXXU4fIlZ2ZSslmoBwYzOeidedR65Gmo=;
 b=j5pGMOK/w6pylpc5Qa0B6EPqd7ITHetQUCHSKmvwBFU0DuWNJBwK/fe/B51CTNIp7CxS
 AGygfYLWbgxBMu2kUs5RieTJJWSO+gtUIVhxa1aQT7uehpahuF6otpsx2BmS9IYT7nyKt
 4V5KdAbk38xZjh0vG8wvJmJ52ZuvmVG7/DUnzJqEUhm/v2I+uL/7YOky4WMIqfFmdaOV8
 x0t5WlxxnggQRY2CtqrQpk3v8y0SU8v3fTerT+s/NtNVocz1VCrRlJ693VFoXArkbWQ1T
 2BhQ4iq0Byxh2Ozf1LKbRtMjKz7WnKqUtNDCIWi4/Mx7/NUBPxj7OxPLXoXUy4s22yQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ncwn4M9o; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ncwn4M9o
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2AD86065E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790058666;
 bh=mpeubLbvqIhGXXU4fIlZ2ZSslmoBwYzOeidedR65Gmo=;
 h=From:To:Cc:Subject:Date:From;
 b=Ncwn4M9od19ztizJkf3ZFSUwpO0DbgsHpz8v6kTcJIV5UFb0ulfgh/G5FHxXmG3M0
 Mga55nX4LpbKydaMGLOJAtu5pQ4txFzJ1RAGmIFH5vupqFk2Xaa6OPjrGkcd6RHQZJ
 5sZtrVQ//e/Jcvt6q9IIPUqzA7mQMerT0jTRVoTACOLQD+AMrv/rT+0/7wSj7mPT4q
 8tvhh6DQO90NHLlnvMW/f5+7XUdTdSnxrkKcwG8i3qcjU0Sg+Mu8lhnhxp7SF/qLNE
 mHtFtOxjTDJfo9u3uWFXm250bH3HyEza9kFMfWzcR0NaG95AuuNSmt/z73dx0bDc9X
 bRk+6kIkI3b/Q==
X-KAS-Sym: v3:f51bdf72230551df:CJNYxrQ7z8J6JDQS0tHZ/5e1e3zAL5pSJhpRea+4USbkuh2fhSHfjylIfjZnJp3IAZQzwkx70M3G5AHirQwY/F9oQsWC2sgtyO7NsDV7fxZNX+vADISx7biAVNNFpJ7TLSq8G/ezTcK5yM/urmSIkja2y4jVpy/8JmCaIonzWH9PeISRc6o9zeM47Om3NrcaSTKpQoaetIvWysDzvM9CTu9Q8fbFisLcNDMW1Wn3xvGU6XIbSlROvSEsmJRX9jpLC2Wp356gBBVh8FDTtfl3F/Wkbnnmra+VWyLkN973s4VUB/8rfJDVJ8/qB8/8Ul+hNyhIwKO9/3kxwtP4D9Lq1A==:27vQBG4R7JRuZT16nw2QHKJLwqRwJOhUSb0qggH8/3AYpRCSuqRvi+FspQPYxh0iEBFKM+CM3CMRUy3nEMMrvBruUbiUS+Gbg7AWBo4I34HjFza9JZ8lhNrzS3BfXxmC6pjvszAkhd8j+i5Tvv3TN5wKLzrp6U6BY3z3L/dlHZVbFoh1NkmRZ0zOgz4lVNRhKQeMo5vk54CmJJxpPYK8b/JmuqbxmvctfpwDzJYGY1KEgk267FoYnASkzHXKcZKCHM6qoExQBuREzvbr36OKtjhfllK29Ixy5BodSCcV5oUnRfUxU7DCjSNJjSv+sqBI7PPsPWiGntkDbYss17sM7KwQglASz+sOSsVMeiV7wumKU/KeOmtt3PWYLzmakQIY9xcJpEineqfGPA1FNfn/SKBnJzly46jdU5EjuXCHyp8ETF91iqfddGCg+TV651Ptzr04GwFdsGZ5SODcz8yeTFurQhez68cnA895T8nAnqi982K9PcvS1So3yLHJKre7uOsSP9Sa57o6FrqW/yJoShW1DnfQuil1doJjqiyYTjZ0TWqgGLxVJLcl6OHrKKLgTRJpCdhUa3LI2y75nQ0etCgFKBJTQ4DWTbPbn7USNQIjdD
 Ffo0Z8skef30mvwrTTON5FXWkJsRauOjyxhM8=
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BAC89A4C4718;
 Tue, 22 Sep 2026 08:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56442)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8u1y-000000007Ke-1us1;
 Tue, 22 Sep 2026 06:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Tue, 22 Sep 2026 08:31:06 +0200
Message-ID: <20260922063106.84043-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/bpftrace: bump version to 0.27.0
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

https://github.com/bpftrace/bpftrace/blob/v0.27.0/CHANGELOG.md

This release includes
https://github.com/bpftrace/bpftrace/commit/d7a3bb54a3d5b5682cce92fb326aa01be2092d47
which adds support for LLVM 23.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines failed after 3h timeout:
https://gitlab.com/bkuhls/buildroot/-/commits/6998f512dc3f25010906ffbc8c014d01e0d17ec5

 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index 48572d1c58..b5f793320b 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  555368f32f94bfcb74b119a3d9c67b68200be6375b8f452f794a2d3f6ebbcd16  bpftrace-0.26.1.tar.gz
+sha256  87bf01fc3269ada7109531b0d964ceb5527d1ef7b9c9a4269b3aabdf872f0e26  bpftrace-0.27.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7c9bc6b7a4..929bc0fdc5 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.26.1
+BPFTRACE_VERSION = 0.27.0
 BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
