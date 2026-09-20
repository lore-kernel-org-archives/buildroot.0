Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF346C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 886A040B54;
	Sun, 20 Sep 2026 17:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeyoRP1wIrPv; Sun, 20 Sep 2026 17:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A0DCF40A6D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789926167;
	b=FQRpbqP0K2blYUX6/4not7fszs4DSuwErsmGf/wW6NGBEK4j8rzh//F2KQAaIjT21oVI
	 6L9wYo9dpiiRtBBfSyq/RPW2VvGiW8eENEdbb1EM1UEprfR1SM8AI4NcBpf3j5xX+2qfH
	 AUchnvEHkv8EWNw0U0FENQ/LFiePORbYNxYPDn8XkJhkHj4UDLErCiyMIF1+o+1Aj3yn/
	 q2PkXO61jlwUmGF3lZvpK3wMD1RsEb8I8Lot8vf8KesJkLKOaV/am2dHyof3kDUPHsPse
	 lkgtaggZb339mDYdzQB1hnibj1R0SYRMqPw7LG5/UVGU31jyxj8lhJje0FffJKFmZZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789926167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6YSEfJbGQmwSzHXdV345KpeK7lkUr260Wwp9XmCrk04=;
	b=YoxjqKS+JcuEvSCrh/WxplSpDUOKXz+RygSUdWuVbbH0x11ra2KfxMDFbubJXbQIhgew
	 GGaIk2cFbpxLckR2HaTFFXaZk4YNUt/cAQiMagzMY8ppsBFtd9M3z2Wm39uIn5C93gSWW
	 jFjyVNPgIsp7rtKMaKMgT3U/y3WX08eP97zG1wQ7rKGaSSvlnMcLBiDglMur4vsgjfEMj
	 iAtLwgL/S5ziynFPFwY6QXPfqhXrSTYoBR0+bo5NcnNhGyf3DsiEHPTHkhHLEWb6Hq7TA
	 Hn9G+bCyVHzIFvXfjqcVgOcpA/Z08nUNALJxh3G/hMl+nb3+otHr90YKcZznojdUFTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789926167;
	bh=6YSEfJbGQmwSzHXdV345KpeK7lkUr260Wwp9XmCrk04=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k0WfQCjlUVEv6ZiMOdUGhZdN+W11/gnSafh2Azf+NAdW8eY4Ij5kIxbG7dLm/bByq
	 DOM84tE/Bukwxnpni3e0HLPgMIjBbtW19jofWyPeVu60b5ArAYLXdkypxVx26Xj6AN
	 0YNjvBHnEm6SVjq+FXTWweUx81hBmnh34N2fbNQH9U4FNElxyKbQPHasWjilLhuyms
	 W3M/2yctnbAh8SiF+8zptU8wwCfMJQLwNmtEImEHfDcilb2tyi4U989A/a/rkA+N+M
	 d3DOt9ZOwuwH88+lsPudt6oAjpdmTVI+lz4iqvHJEaL9cm7FeLTT/F4lMpV1T6MHbV
	 2EtbGXmYrp5wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0DCF40A6D;
	Sun, 20 Sep 2026 17:42:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 936EF3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75F4A6068F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POE5R3h6X3iL for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:42:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7824B6061E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789926165;
 b=byvZ3/j02J14dv6pNnqOtLR5anKSuJbDjKCfZjktEz1cu4+yT2oAojWBdDmbslM3oWn8
 RK5DqgQd3WkICaEPMfni6PtfSJ47L/BVI0yL+2cdVtoC0HIWvJVEMb0YMH/zstkzYJO1X
 RGzeq41HS1z+45V3DEvgEaO0OAAY4anexCwS2RSbUBnaANmqBsW9FXksO0b5w5wliAvjG
 AEW2MqN5kj7pCHrGdEBQqrlcCbmif3hBWpBGjB89QsPSAgKxO694TUfUBq5NJJFCcE2hr
 JJsfQJWrCMcOKLKyGF5Ei3GS5kII+29F15tOq2kIcEcM9iPG4JpSkrHsa2NmuuthXAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789926165;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8N9bWrBzpEQZATXhoUtDnKOWycuGuK7rhclOPrErzHg=;
 b=DfpqhYUfVssC6q8TPNft6lkAota/uyKAkrOf5QBtJ359M57DCUMPsuyzB+744NBImoEo
 GuBld95f0d4H06Y6qkqQ7qUvv3XrAro12aNz9fT4MYLDRXufoPgCbexHZfqq4ibkKjX3J
 T3A/3hUMsGw/FvwzkbJ9evEgcOdETDSuqyg3eOBSbY66zW58wJGF0wNW8QhB1xUgxu1DH
 549FreMihJxUdSofiLV1m9DOAvi+AVJBKT5K8bx0dCYhHT70CGag4sYNquXg+rRtN55Fz
 KMlf4LYrzMPQzwoBHqNKSpzZjL9RD+lduUnXThfGhz5Z5GktsI93MKZ7iXMs9QgbUwg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eVIbcpCo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eVIbcpCo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7824B6061E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789926163;
 bh=8N9bWrBzpEQZATXhoUtDnKOWycuGuK7rhclOPrErzHg=;
 h=From:To:Cc:Subject:Date:From;
 b=eVIbcpCoPUqVK2mSNzR48FF4NHVRZN0trc4tGqfCcVDK4X2dDEaWc8A4pEfX19DkB
 DYBsM2KKoqekmHJjoLbMr5Qq7pQtg1fdgVIpaJV7tc6YzIfW+7d/jqK15hvElVf+7s
 AYFMBFSL95pII3SSJBe3idcKgxzi+2VZUTnNg4AbFgS5/99xmBS/DQnxc6409STRvR
 6dYuYXmVhlUrqkCmTSCplfPpXUCuc2obPl9sUeq1vJnpjxVrWHCeAExiTMZr7iatHQ
 ZLGxQsuXJ5wsz0PgrjBOZ+NnMOQDuoU4n5n3HAzt4jpCNjyniIf10OrCnComt42odU
 10erzlhtsMYsQ==
X-KAS-Sym: v3:f51bdf72230551df:Cj19210mj5koN+X5+w4jJQx0wZS0f6/OSa2AnH5kPDtsUpmb8c7zPJ3iwUF9lmp/Cmx6TgI/SLm0Rjebo2XClQhcoJv0y5D0K6w7j8NuvAnTEvOJ2pIO3us2AENdoQUcjl6+megbLzBF7q5KntPAa0VRV6O6dFjmzaRcG8ZyQrMJhsjddH2gg84huXVce4fMw3XTjnDvUgjVvqzcW4UTpeSVaNCWk6elTKHtSAmLNrGBgygpf86DnVkv5fndOCalrLfUERR4uNBKO5d9p9/EmidmMtyKnlKrlPgHGZUXHJ+vbOZb/k/EzbRcpAEvqIQAM198WddBmhpZH8fYmDObrQ==:gSmSJrb2Xvw/a+FH4lMa0OPnTZ9QD3zQ0KueuJyfqddJ7Ofav3FtuNV0AjmmzRoZJM05Jy3ywId92tX66EkGSPrAOoxpa4INvjgN7M3Iwto4//DaKGFsTJ4yvZ9VhtMVMbdbEVVBCN2SUlY90QY3obJO6bHNx+vWNEuPjKvhpEOBKlSbzlws1ohg+E0TbPKY/1w5qK3Ej2Xf4/iNwGctH+k/Jn3/8rLl3ekTb8LK593my/4DQE8fuL71BW7qJC+rddeKo9VlP3v5x7B0x7mpEuPz5fOx94IwZeWDhuCBIUHOrCXn7KdlQmy76Kz5gAWi+BhvtBLjJL7XFVvW5gWCRLw3vOxJdsYjpV0amGKPDXhtaV9/PkdFGdQ8Js3KRxKv5xBaN4WmwQdEpXBwOKjJl/NZsDB4+mKb6bjLtNoRAlQaWAlMNsOOSUZUre7oigxqOuVu7KGQIlbwhAzoKBKtD4bKXywiwM406otNp6iwmYqos3PP98kHVhGtbHvdIdtlionaLjcsM1mPcmoyrK9t+FQ+5pZs9xD/80yFb0yQBcm0/xk7VWx73GPWYtcvhIrUJUPaGHBZ5hwgDSIGh742uhw78pOqW6Gws+Z/HyBvUVPjw0
 G1l+FOM8Et0BhrU9KMHpDGkVu7LJM/4zhuTpmLdfcNkLqzioiwc8gXEnnwXf4OQbCnbD5o2aQRqUC+
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 242BEA4C211A;
 Sun, 20 Sep 2026 19:42:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8LYo-000000006xH-3Rhg;
 Sun, 20 Sep 2026 17:42:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Sep 2026 19:42:42 +0200
Message-ID: <20260920174242.368233-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/suricata: security bump version to
 8.0.7
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

https://forum.suricata.io/t/suricata-8-0-5-and-7-0-16-released/6315

Fixes CVE-2026-45764, CVE-2026-45766, CVE-2026-45769, CVE-2026-45768,
CVE-2026-46387, CVE-2026-45759, CVE-2026-45762, CVE-2026-45765,
CVE-2026-45747, CVE-2026-45770, CVE-2026-46352, CVE-2026-45767,
CVE-2026-45763, CVE-2026-45751, CVE-2026-45752 & CVE-2026-45761

https://forum.suricata.io/t/suricata-8-0-6-and-7-0-17-released/6391

Fixes CVE-2026-63452, CVE-2026-63450, CVE-2026-63449, CVE-2026-57227,
CVE-2026-57229, CVE-2026-63446, CVE-2026-63448, CVE-2026-57224,
CVE-2026-63447, CVE-2026-63451, CVE-2026-57222 & CVE-2026-57228

https://forum.suricata.io/t/suricata-8-0-7-released/6467

Fixes 67 security bugs, all CVEs are pending.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a3eb57e57db4d4a389de2728ee7f17174ee51772

with the exception of
bootlin-x86-64-glibc/build/suricata-8.0.7/.stamp_built:

error: failed to run custom build command for `proc-macro2 v1.0.95`
Caused by:
  process didn't exit successfully:
 `/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-glibc/build/suricata-8.0.7/rust/target/release/build/proc-macro2-77efca2882855234/build-script-build`
 (exit status: 1)
  --- stderr
  /builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-glibc/build/suricata-8.0.7/rust/target/release/build/proc-macro2-77efca2882855234/build-script-build:
 /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.39' not found
 (required by
 /builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-glibc/build/suricata-8.0.7/rust/target/release/build/proc-macro2-77efca2882855234/build-script-build)

On my Debian host I can not reproduce the problem:

$ /usr/lib/x86_64-linux-gnu/libc.so.6
GNU C Library (Debian GLIBC 2.41-12+deb13u4) stable release version 2.41.

 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 15f7e666b3..a5b7807d60 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  81cee7bae69848a9751b2ce0867620eefa52b192e79c20b5eac897600b28b191  suricata-8.0.4.tar.gz
+sha256  a9d46a9c8f40e81f8a6df3ecc2c5a9a8e8da985876299108d92da547c013ba8c  suricata-8.0.7.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 56bbc0c89b..d77652162c 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 8.0.4
+SURICATA_VERSION = 8.0.7
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
