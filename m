Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF00C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC14160E1B;
	Fri, 18 Sep 2026 18:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hy7EeuDIrY-v; Fri, 18 Sep 2026 18:48:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D5F6260DA9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757282;
	b=iunI0wRg0Nt0nmyLtNS1M0b76m8PB4mEIO1dhkU/dOhwF37/IyfCw5ME8dEGODFZhTyZ
	 z/d/BAPf0vhhKU9fRXpNjAF3SatS2yuwf6bMTCn8gWrIqO6uTRsGyMWRtcDzFhGHUDF31
	 UEWfc+/ZrTDlsuLyzLrxR3U0cTdNM7P1uQMQuyk2ap/PK61FRtuVP3McjblHaAt3Y2rdx
	 BW0HqCwFxwLsXXbdxZN4Bo9bh1Ewacm68ZIPM8CB+LPjTD8nOP7lhLlwmxuUxbkVCShnq
	 Xs/V8+uipWujXXlo+P7B5Hq6FrxV+NbuxFSndU1x4qJWE3AB8KQ6Nua2Kcaf3qATpSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	b=slGXuK8++iLoiPQfRIoQJSagQ6h2Iu9A6dRb8dfZRGGk+trETBFiDvmXxxyVmcLg+iKr
	 7ylHdl+aSAOahG6RiPou+bOjK9cHP4I+dStT0J1IHQI6JwNy2zvXsdhhTnAEI21vCIEKy
	 lOClC3Eymkvn4tuZRNyvai9VW6FNrCGZirfSiU/fFdz8wjNo88npnqrxmr1sOxJHCg7fy
	 a41BfGNC+Oi1Jy4hJgS5EtStRJgDVRsVLzrXhy/g7aXNutLxbki8gy4cEj8Gk3Z8i75yI
	 Ek8ItogSM6LGgfIM94J+Yslky9wiEFjoVmhb5Uve/advJ7h/1jfF2MdmaabQzBpA73g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=X63Ljz5G;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757281;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bORWpprh9u99OMgG46YH3O8sk8g98wWi5t29A2kFsl4hb+iLsYwtjGn7GAzuYa7ep
	 iVHJDsAqfAp7pdceJx/uhHBb3bABRE/EBockDKEc4vpnbCYo5MJEDBAsfiUTvzxwg5
	 HIxhnJ/Z2wB9ja5kcn3QlmnDjQZN4dJm1ZV/5ivTRju6hVg+Ri9gdaIeHza56xwZx9
	 hDZBPQFh+nZCm2n7imzISJoGuNlm25x06AJ+3shWWFe4xMa1sAZjqPThDkD44BxCls
	 3FE1qepoq4dGSXB6tXFImC4A86WaW/uQeT2g/lZJiJrc/khq4mfYXr9yJK71rH4jze
	 ATFi2Wd8hRAow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F6260DA9;
	Fri, 18 Sep 2026 18:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36AB4237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B511360DA9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KSgv0CS4d9C for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:47:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C25DE60860
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757279;
 b=Penw6MwavLnDoIo0pjZtWKEdCGl3ZKPpKh+evK+MIQYWgqPiHhJT3wmF0Yhc++WKuQgO
 CS6CHwELOIO0K/WwtSjUFRaizNVUKTStja3A0bJY6/Srk9V13Iwm27BPWAA1/cTp8YrEA
 E+s2KiU53ti1/3bSjlbuhEzINtjnI0+05nWSxEBeNoTXP9cyC/SehsS2t/hdO/MEiTM5p
 6dcr8SEmMNHr6zQUzQi1dl7FNs+ONgCP8wWY1nww0lPX+tlfOyuUg7y/BrMV+ayg5UiLi
 Mc4Nj1FYp2pGeWjlEBrX7/CgBVKVr3M5aQLgHfbFMMTHWx0RglLybkpOzDl/hUKUasA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757279;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 b=SNmtx2HEUupt5G7xknIpGiO+apeRP0nT/Wzf4Ba34OcNWqCVcZn8sFwSbto3ruIOfG+T
 tReYpjerME869cpWC7w23zK0QaUBR1xtA83G/QkOcuxbzfB5vRaUXuSJr6cDj5kkPIPkq
 RU7UorRryov38Naubd+Ojm/p9oPGk4BvWRIkrcLSOViOQPBoELsYUkIdH/mVIsOiDcQX8
 FbWgu5r3YgnZVxsWhkqdZ+FFoMXgTLWDYLH7yw0QVsf9UZSEaLqpMc7sbLYw9VP3eGmZn
 FuiexxSKtY0nGQJeKKySVy5u9ks1Hbz/T3SCoXVjhllYbemrH/jdqLxAzfAQkA+tMdQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=X63Ljz5G; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=X63Ljz5G
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C25DE60860
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756925;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=X63Ljz5GcI1ITICVJmfzUXMgFelRPTnNAAGOiBA/xaZcgS1z9xRUMMyjPgIB01bpa
 cVdcgg57GLF9OhPdCWoQHijaj97GD+3aqxIjWonKMtCz767vdkSaP4TwPfEqD1N+W7
 oaYZblgQgp8W0Ngm0cWXwL4xRKBb5/uLMRATCuWTh/m2Q4VwxFyO7kRgzhrBsXJmkr
 Gr7+T7HI8MDYT10kivKgUZ2AGE68e9DhltDX1yvlG734A/csQtgb5UOdzpaHm6M2Ek
 teuhgi/LBdhYolw7oWlZuJorGw31U5+uLSDp9XdctnQEper3hCWkmYGZT3yzZA5wuy
 WozYwedrASQwA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:jowjewz7IagcjR5Qcioht5TnBGDheywiaEtEIBkFVc3xYXttyzIdmNragAE53ZtVx4kdZ9sodDhdOQI73Lnh+4IswoGuSjZDTjAIg7KgUSnPUemxE1q+d6xBkjdPM3+63UCJPgXiaZoAYaqcgvATLGYC5BVTzmjMeEgWZkBaZsOQCEtJmMcfbDMZGqEoHGE6J2SdbIKA3x2730j3yxwO6ARw6S17QhjMBUUr1o39KpjT2PgncIjhDEmtP0+Tr18DYA9pU+f8auh8dHxM1F/es3jB+mSEcPJ+0TPjGW3VWTW1vSxAZNd6mtQMrHLtNVELBh+k6XEKaRDyiF7wFZKzHMQFPzjmUIW+96OAc7bZ7Sd4hcgVNXVVXOjCUT0NeEKsjlTSbzmIlsuyPN2sdYt/4xRPucqVWr9woZNwPGOky/3ybk7ChueYD/KuDS+YqKso/Rf1dtHnYQZiSCFKgNBLLxMbF1FV8XihsoxCd6HBVe3oU/sm0YnqyHwz+r1SFvSREoSJ7Y8Vy3uuKFdmTU64pb+fgr3S52AhgIu5JR64pXKX/NZDUf7ebiXgNtVW4NJXnMraJXZbDlVCeEKrMP3Te8iWbcbNIZ2TnWAOiLhbxtCJT1
 JD8s0aMs+XPvA9hTrIpot++ytOEpYlf+AwKyF6AkSpw5Y61YdkJfXLgYK0OaFE7JsAu2lAElBwCsr1eK23CRy9trR6O6CUPufogdxRtfJi+PbHVzMI
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E5C3A4C4715;
 Fri, 18 Sep 2026 20:42:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX2-000000007cB-1a73;
 Fri, 18 Sep 2026 18:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:34 +0200
Message-ID: <20260918184140.3631274-73-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 72/77] package/trousers: Fix build with OpenSSL
 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/trousers/0004-openssl4.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/trousers/0004-openssl4.patch

diff --git a/package/trousers/0004-openssl4.patch b/package/trousers/0004-openssl4.patch
new file mode 100644
index 0000000000..5ef6cb19b0
--- /dev/null
+++ b/package/trousers/0004-openssl4.patch
@@ -0,0 +1,26 @@
+Description: Fix for OpenSSL4 compatibility
+ Replace direct access to opaque ASN1_OCTET_STRING->data field with
+ ASN1_STRING_get0_data() accessor. ASN1_STRING is fully opaque in OpenSSL 4.0.
+Author: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/2155003
+Bug-Debian: https://bugs.debian.org/1138451
+Forwarded: no
+
+Patch downloaded from Debian:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138451#12
+
+Upstream: https://sourceforge.net/p/trousers/bugs/240/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/tspi/tspi_asn1.c
++++ b/src/tspi/tspi_asn1.c
+@@ -237,7 +237,7 @@
+ 
+ 	if (*rawBlobSize != 0) {
+ 		if (decBlobSize <= *rawBlobSize) {
+-			memcpy(rawBlob, tssBlob->blob->data, decBlobSize);
++			memcpy(rawBlob, ASN1_STRING_get0_data(tssBlob->blob), decBlobSize);
+ 		}
+ 		else {
+ 			TSS_BLOB_free(tssBlob);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
