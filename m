Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D10AC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 18:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A0740B65;
	Fri,  4 Sep 2026 18:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQ2FLRTk14_z; Fri,  4 Sep 2026 18:42:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4C36140B6E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788547329;
	b=dLNZe04RL5RPhX6tHWaXUqVFgwFy+pStCnirsMmrjmXRzJDja1Aq0ZMt25eUWufIqpHv
	 WektQmsfkwhshJSRSL0tvIZETSmtg1v/88RVV6zZBMeKU0UA2CNEeg0BgLtyXIDvx0ZBt
	 C2El2a5scALECNGHAK53mgOn/MNgVj7Bodv1ZV61H/KL+x7rDDTmCWGs5gnYAAjYldW8M
	 C0vFzz0mg0NhR1cfmSLgOSwzMk/sPNJiQ0rZsOZy5zBhh/dOBNxQda9wCKuvg2dkhCKZs
	 IHXHCtwJQJtUBl60IiJDf+osPg3rCuMSW/TqnFgzQ9NadvdrYc4EjRil1SfuF3PI79g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788547329;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jtTM7kFIidVb/soOe5QTG0CHlvIr9aURoCUlx6N/YqE=;
	b=ehKhZuNdHEKJmpKWIVL5SIDyiWSzJGDU//nF246s4m6NQAvZyIDFllXnc+4kivvDdkWd
	 zkVQ0P4l6kPBm1SIjWqNunII0KLqeBZb+0S23GSv/URjnPR9gQx/un3KRHQsVjn3taiXm
	 whpaGubB4PfowWG2i9DT5W/k7l3d0T1uwjviH03dPohN8myD1oD1sdmFVQZuLjaIGYvZO
	 Cef5BcT3rFFiehTakiEaTAkjUoti7ddJAwc/RNSGYftnbdEr7HCwWONMNpDvUnJG5jUkg
	 P9DvMXYYfIGCXaP4wSlCTmbNGcnmHrgR5iiJoQKx98ycSo6MGvnrjEWaVwoNx1+AJEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788547329;
	bh=jtTM7kFIidVb/soOe5QTG0CHlvIr9aURoCUlx6N/YqE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EacPvtR1hEhxqZb7ATMnzAloLkckdosBEj8a4MEtZyAGBNm+8cWQxWdS3tolcIKBw
	 8Q2lMG0yg6NfxSlHYECWBStRhvHO2xA5Aw2z805J4eLXWbaiQN5TmAteaVCPL9O1UF
	 1brEfv8WPPnKm9JXZ+fne34IDnXBW5wIIYOGftnaIe/3ClHG7sWQ5Tq5kqPiSJiHMp
	 /IR2kT87BHIAMXvSKw/Bx73UM0rsbCVeaN17AUGD4P2SIfJEALToQ6tJs5XLwmV7mZ
	 eHxEt/E0qWvTEeIG66aAi+vfC2JhX4o4tVmKnPH1pgL6ssaovdLCz1Q/DuQ9lWXBYo
	 9j+Rl2cp0urLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C36140B6E;
	Fri,  4 Sep 2026 18:42:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 402C529B
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3236260B89
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IzaCj7f6jEU for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 18:42:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2486F605EC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788547326;
 b=sQZ4kIAsanAm0S2YvwtRw0grEK87pwec76fk/KC+QdaCBXnfaf9Dy5JKeWp2aONuj0hf
 rDl4Nz+V0pzmQ0FNEonzaDft3wC+DIpbPBFau0KUCL6dxjDvWt5B6NTZ54/PpnkgkkL+s
 8fJn9s9vwjZMYv+M+NPhWig4jifOEJ+hrQJF21NlVSq8PEjLXl4SUmTOxB4Ma5UeoiGaV
 7JGtqVZhyiAxBKL2bOpWac4y1+kgrXMT0rnXgArAUERZZQO2nAU2Vk0MKcq2Yhlqi+vcQ
 /ik5p4DhkLXik25+QqKpQRHVOpiacxx9m+HrKl6IcGwb0S+uSYoipGEwy4J9MNOIpFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788547326;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AE1GbNkOTK6zyXa1fJYYE8KH74trQRxt8AmkYEw1sTo=;
 b=LaB5A5sq45O7czjhlkf6wYjDcv8XkmHIAenAbivVYbQ6e1j8f8Wuy3iMGH1CuqFRexUe
 Sy1yzIT9zTGv5ASmgH2gGSv2M0wJ9YfICFPeCddrkuodXx5pyefl1AdgDokAz+lKakUGE
 CkyGmnTOPzIVzNPeF1YIVlXMkE6LtnOyZuqHTrM0hzL0NpG0Ca++cxQOidqDLkteR1+pn
 0dPJV+JUpzLfSIP8mG+Bb2rM9uzrCU01RQeCnsMSpbl8R2+BOW/ikrWS/0G7a6XvvefIY
 n87BBwHGzVXUj7OvVWBPTS76iqh9D2IyaGwV1dxHwWleft39YyFUxaBNlCs1DLsEySw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PxmwgFX9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PxmwgFX9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2486F605EC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788547296;
 bh=AE1GbNkOTK6zyXa1fJYYE8KH74trQRxt8AmkYEw1sTo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PxmwgFX9r3HOSXUxraEvi3xZl55xcOCnid/M4lI13CCzzRG3kf0MRFIvlen5r8EEh
 PYejnabTJdeoKI86K2LbtfnsNnjp8YIxEuNcs5Bi5ErY+LWf+DPVetsNpgzu2pVp9s
 r34BUZLczDQf/dqrxwZK7TiMeWL2T29iu95oc+pBDC/jYsvlKk8nizDCLwlv2uj6dT
 8LtpqqCuBsaYfsTkLtag7rOBfrxFQRQ0sm5A53Kc/7cD/brvIBnQ1MgS2DEeFay/Lf
 4ZCByELwCst31zw/Nb8SOuKfRj0Xyn2B07e5n2GyogT+3W5DQX9CvAQibS9x2pvjHu
 3xUMTZ1DkwRzg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40ACBA4C33A7;
 Fri,  4 Sep 2026 20:41:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51846)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Yr1-000000004rO-45ZL;
 Fri, 04 Sep 2026 18:41:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri,  4 Sep 2026 20:41:35 +0200
Message-ID: <20260904184135.875634-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904184135.875634-1-bernd@kuhls.net>
References: <20260904184135.875634-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 3/3] package/gnupg2: bump version to 2.5.22
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

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000509.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/641bea0dd5838e2ecb955efdb4a17684a35deaef

 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index a53f46c67a..deb7a0da17 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  51fae4f4d902787624eb7047f6d3e7c263ad7690  gnupg-2.5.21.tar.bz2
-sha256  e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352  gnupg-2.5.21.tar.bz2
+sha1  4921a199ae868c8dd0478352d2d93bb470489e23  gnupg-2.5.22.tar.bz2
+sha256  96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e  gnupg-2.5.22.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 05acd4811d..5b8b30e702 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.21
+GNUPG2_VERSION = 2.5.22
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
