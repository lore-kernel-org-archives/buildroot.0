Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72245CA5FAD
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D978127A;
	Tue, 29 Sep 2026 18:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJWEcuBE1uVD; Tue, 29 Sep 2026 18:49:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4EDB381253
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707777;
	b=sC/BwjPhj5u01luZP2+HOmwcYbMbnNN1HeoHHLfhSxReVguTls9Wzj5/RSiTSHbCjYVu
	 YAF4QOUzJdveL2ciUXh+8e7FMptJI2BNO6Nrht5JFxN5WVYcivBazuk94/OboW30hTeZh
	 9vZtmoaVxhrUU1OIhBLPBd+wYyG8bMLSPN/pvOtSS0wJEpIMWBORjJBNKw2+kbtqXwNNZ
	 i6rckOQo0m3T2+EbXmfEMezrL5B0I+iGSgIwO4nRcfh1k9OddTg9MAkLEHWqWId+aNMcZ
	 6IuMptDpH1AjlGYTk06AM/pKjTjwW1Cic8m7J+jpN45I2ACwEGWnl/bgTbVNDuvtBkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	b=dDNTx1nKHfxIvpIA3fFVTWrP2rc7z2zI1L/htRa1NVR7Mf2w4rsQ26SqVNL3VSbJCqwx
	 GnT7h5CW+7ZMvGVmaylB+L9TpTtoCknJo/VWAO3kH0F6GYLrsbBE2nrzfhnH7E03fxVrh
	 sF9vqda7qzgEjyeCsYdjt8RU1i6R3dxktae1oaWuRa0ak1G+4opLa//Pg0aovYlAZrI6i
	 qshnpX24R+5UkqFtAUaoM+5F86W1wMwYBWg1k6eihR3F/hUBmVKQZbkDMUGvkChT/RcyE
	 ReEnNoqeyVAI/cewKnJyuG7PdelZfunzDC3DM1DTI/3qQqAkOqEJfEig+TNDkWn7fsQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fTZitOnb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707777;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wxl95/ZbWN4bRHu1Dgf+E29rNNxvYTveO+caGNlTi0FWh8fgmRaJbsD0XPjtd10c9
	 g9ikwVoL408bRyleZYG/ZiViCVnoh1pP6a59ph/68CZiV3QZHS8h7DcwGcGcTQEv/k
	 8QIw68s/3a1ZLOXw+IKXDcKFze1nQha05RHCG3hRJ9Fhjos7HheB2upU8MPG0z5J2t
	 z+xknaKYhVJRR9D/NQMsmOIFROVBPLxQSCWFh1HuUNd0vnkIoYfDvDgZMo1KYTv+tF
	 61Q0xCiJINIhU/A8NgTlpYmbVVkna7tC3AuAkhhuz+ljs2Bo5tqtFFQaBn8YlR8Lzt
	 WI4CikaZXj3Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EDB381253;
	Tue, 29 Sep 2026 18:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F20AC14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E36F281253
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJ4AEuWhnG5A for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:49:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 100518123C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707775;
 b=QzF7FAJu+1efeQo7MnIsXH4d9td5MaauNDhrUrNsjibHhGOMkq9e0NumfWqJLSQUkhGg
 aRjGKxEdZ4c2IEcnUoqF/RgVnVt5sdwsTWUHB3m/kGfYx7HAoBXWQxwp6J04o2aMOEzu7
 gFc27Kstxl+49hmWoOJJx+HtHekC9izOecyzy7imldIWortsbfAnE1pdgUegcipZPp0Sv
 nhj7XrDi1f7IGOenF2Y1OFzjsdW2bxqWt8qbijlD1gc4000vWCc6ui6hD1qc91h+OBelz
 65jR81OWJ4W69WBd126qmpQSIhxTx/lYrXdcxh+Ayi2Lu2kKcGuFO6hk1ROVHGaAhjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707775;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 b=k5hOmRd55HMVbsYZvEELuOnSmNZ/qvv8WBYKCMjIZm7L1e30qFXzeYM/2oHX/29Zt84A
 y6ilWlNx995TzZelXMP8b2utfx3dDgfzgoUrj7mWOIx1tCpj2dPuMYFLfBuxRvZRsUkTw
 BpMMhhdcuas/2SPBzmkb912dqAHfnvBQ+FEs6Gp9+XESOco1t5CHDOSBwMzT17BlULAYD
 d3Y00jrVQzO5BW9ZkKwMgM7IkPpNtjyhCUdlOSyE+Lkg71UqF26W3P56791xT5sI4evtz
 GTIQFgkv8OwegymovmdlnSkcS9ClQiyjlpfZwg+8iXUTuB632zSoLr3g1oF87qTmC9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fTZitOnb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fTZitOnb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 100518123C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707033;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=fTZitOnb+M6E+kKW2BaYU54qCuTNKBx7SdZPX9KkAiMl+Pr2v9V3Gvt/D8S6LkT0k
 4kwggCRDxBPg9f8TFxFKii1bNG1StshHMdOAjziLIjewlRMMVp1buAIi4Bg0SIBo7i
 j6dKmvtdpdA/huoQMobLn5H0UgvtD5usbrkkds/PXFhv2LRb3jlJfHypzMFAvI0Uj+
 fJF5VpWIDKw0DMpsL4VckRgvmcIRygiUPMsbsiUcfDxauvJhrg9HOiatG4lJh5eAwO
 a2XJqMJfDuKVyu4Tt1O0TzO0H3ZjFq9lWry0FBKQMxcZuTnMdUiemMmwXt6tssKVax
 LCKLFLzTBYH8w==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 S5vRKV9x5vPjmVr/I8diaoZYKZUtxWU9UdYm6p+ISc/KXQLYgpzJ8fBK6W+QQX8Cbr/hz6vAttf
 ck8Zq9L3/sna/GHHpFSHm1LlJIskd2oUTx9qWI6jR04W60wvI0N7dz0V2x6u0XjD0IkIlDnfV+v
 XxFhp6xTzCFxvJOvfO5dj/PnkSjr+Drleev2r28oLi6GvoyC4uLPRAMQquaugqrvM0JRD9G4haR
 IP6RyhZQAka8Vzlwv+gFx54VmyI9JBdCJMJ5QRbc0ao4yCGBCwmlGWFIavDUDbrFCDedXcR3BKa
 xSIVLXy4dJGozxDPl0GSZfr1v3mObzOVFuiMwb/ghK7/gp0a4pm1Gcm76Rc5T7tiHt6qQ3PvbvT
 91zYq+m5XYjt6CY68LgnV1GrVg92hG1pC+61+9MZePZWm9p+6TOuE+9t0qiXU4IEMlvSx7YhLib
 x3oMoyGgpsg3beS7LQ4kDlDzS9V9kf/NxnYah15FJXOBFGLyS374Lqxgr9sxbIQ28M84x1itKfv
 zCFGg0DOSM6m2t2ZdZGTvYffnbuwJfYWe486qKT9heJdDQC8cfxC37DxXREngNOJj1BB9yx8/nC
 ZUX/2UM=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7728A4C51F8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgm-000000006Jn-2Oq4
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:56 +0200
Message-ID: <20260929183607.1849293-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 57/66] package/sudo: Add support for OpenSSL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-for-getting-an-ASN1_STRING-s-length.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch

diff --git a/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
new file mode 100644
index 0000000000..eec375f70c
--- /dev/null
+++ b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
@@ -0,0 +1,46 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpensSSL 4 has plans to make ASN1_STRING opaque [1]. hostcheck.c's code
+mostly treats it as opaque, but accesses two lengths. This is API added
+in OpenSSL 0.9.0, so I'm not sure we need a configure check.
+
+WolfSSL only recently const corrected ASN1_STRING_length(), so maybe
+there will be a need to cast away const.
+
+[1]: https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e
+
+[Bernd: backported to 1.9.17p2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+index dbb900e71..8383d2c49 100644
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@ matches_subject_alternative_name(const char *hostname,
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if(ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
