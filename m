Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710C4C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C09E60BD3;
	Sun, 20 Sep 2026 14:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWkfGGzOw-Qt; Sun, 20 Sep 2026 14:55:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 599AA60767
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916156;
	b=rSMGzOm+7zKmGsbYgQzpdiQYO6rQRkLW2HBcK9c7WF0wU8qSczE/TDABJO//zzBCWovv
	 oU+2cY8yAvk6zaCdyYSglwSnzNqbJUlvbrnqgcmrqNtHosJ0484/NG2OWHcXwjbntFNh3
	 xErbkE/73tkwZDez99xnRtPYl65qU/6x2OknFJAxkbiuMKvgg7DX62GSrOATwwVK5ePw6
	 NfjqWu5Jm+Ev+RUAKuRjBzy1iHm0PJcbQJdm3QJl1PK3Xwt67o5xqn3zjfE1SB8f8eMY4
	 C4wbHO1ncU6CzO/Z7vVTybVWs5l8r/PJ+vJT9gK0IvakrrUNdGXQiW8vnXmpK2i5wQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	b=Ypfo6pL5dOiNUOXXc1XlmwbWC6pRLG2o0g4ktVFJCVlKI7xTUSZW6XXKmAShSy5YcX3A
	 rciR1tlEulYkv0SgFoYK3T9pGU//pZL4EQPuV1YEywJ1qD3QZknVD+ONgvie7GgGEdWbn
	 sIxO6/W0WNcmsoaR41860gixRfuDH20CiTPsy1A3VL0qNCN4xSUufmiPyWopccRVJ+E9p
	 nk7UecN1SjUVm2m/Koe8N8lMTFK0DZ6qc05GlisnGeOGBXHOeGwyOmyIIYs/FTGI7LruG
	 N4MA5nsQ3wl8clFXOHynWnfXD1017dfgN36ihXIU4TzZN86HzM/ftza0iPd1HqHg+WQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916156;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/AxqT7jJXnywHM9ZUv7YZ/LR9u2KJ17ktYqw+Fh1eeKJObm+2q1k1B8h5jUtTBpL
	 1GxBh7uoDl+5f1OHuEb/hzELjy8T7IWsZOu58AO3Q1hQzDRtXJsxNb8FskpEajph48
	 Q8UG0QvcDfyFA3JpDm8h/QFhlt1kfSeU4ectEorT2Da2SWdoCIfxmOaCHdhTWQ4Oq3
	 YDEdudHwcZw/2E7v1P+ZuAsp9Npbu6KcauTpJDMFCBenKkEngj0Xzb/ak4FOTEulnO
	 RsRiPU+yjqAFcWzKDbOHfuwxS68Fz4RP6KpeJYseTClae2hLzsM1EftWoVk0N9plgt
	 yz9I03R5tYMeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599AA60767;
	Sun, 20 Sep 2026 14:55:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAA1624D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC56E40E6D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8HhJASYItFL for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:55:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E3A0140E60
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916154;
 b=K88jApzISv+mwY1mJZNjviLSjE0QTFsILf2IZGPLyxn918KXGFZTKfsC0cUrNqsJ5wpn
 urYLFCqcUESNm9ZrZ3qoCS2GDqR3p8QLCXXisebrPDzw1SBm/OJPty/3M7/l9DzjtNNQG
 0Z70T27VUSXJRtSccP/fEBMUEDgxo1QGWdyQolvGG+y1GnKf9R40Wq1HjCnJvAoPgP+h/
 LN1fyedVjr5n34oNs5FRVO32OJlFtb4EwQIoW8dldvu5m7U9K/0652R+zLQFwnaAx8eiJ
 VMEorxtwpRosTWLELWZGpSe7/vSuDRei9P70iLOXqq8nwYBM58ktE/tTpfJYf/WG37A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916154;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 b=K6ewA5W7mUpOVqu/oF3enmMrqL2XMFOKYW0AdD8QLt64zhQjig2v932Gbt6LQy0kYIPx
 0IfLjZ0mRTn3rmFPXJH5+4waSba6szM8In0qt5FmQqsDLW993bLh8baZBBm5PpQ5liyJY
 rHWNal+Qo+lFcdbD42JagDxkcoebAcM77XB/8FCzwbmXzbPyAoEkfWhrQDFPWp3budEu/
 L70iL5Brz7Xq0K1J9se+owPOjsPRNqy/1+uLeNhbefTEBPAF9LZUOmqCCZvDM7ZDp1niO
 Sb6AiDKNGXKCpT5vFs0p0uzswwxsD/rRmXW5zrKVOxuuIIJB5NJQu+Bp8SgnyxyOUWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UaQZd3kI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=UaQZd3kI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3A0140E60
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=UaQZd3kITL7UP/qhQzVMsrWYgbIs0CBLRX2Fjz4pTXx63kzuuIP12y5mM5HfeScW0
 ZgjyX+5IBH2LakvjRwW6i7U9RN2Zm7+DF0Uzm3UhzcW0u1ic7ewxFSUNVF6asOka6M
 1e3Qy43DldMnnxT5n1YW9hycCSqIAR6qlK2F2DXnrkaSyC+r0rnXNATnCMvV0UMPzf
 3WhPbn4J9jOsX+U3PUv5unvQI4CjbLH+QBhxnrvSKGsORhw8e7tp5b/SlWQ6y7+cRA
 Clpa+fAq8RtJjbui1es3bRAboStkuLc0yAztJYiNPDAWETCMR6KHVr6rNfKETKsaeb
 hsmyL0PHnMFTg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:nKW2uqT5F2TQ3hRnobrCTBA+5CeNxTumak10ASgXCNbC1Sf8T8VKlCydpR26GEK76K4nfBWHlKFberpnn3pg4+gia/awPVyQPSvOuuvowbK9Ta57eQxnOYU61aV6enubTAMNKtdaUCTcTRri9ow2egRgaO7+bhxI0lM0sWSxT3m1XApB0WAKaj7sCJljsHE02EiJq3SB8FWFX3FiQ3utpDre17VIcXz1XFaLDYqzHWbkB6HsLCAMX+b41UtFjBCKBbeQpIPjWH0H8Y7v7s+Peen2UKN09dp31lPgsygKK6Keo05rAsTMlcEY8SJgtClNu1kZ2hZpdCbBJ9f3GQudHDnilw3rWV60dkFxe/85VHGdwHSQuOWB++jGJfQWDPd4UEYwKgUSQ+EXEJLXosTlaTVB2zU2JQUpkVzOQv/2X+cj5KIGdiKlhW5C2Utc+e4bz15FlUzdwMypVZXMpumwaEI3R5l29ELfkej558uj4CHWAA+Vt86k3nxwbekUPAPYWTlX3vvD/ZDA6ef7BNKZrRJ1Uc/CyGOn8wwsQbD/chosaYSisZnuZKVv+JW2pJEuu3+J6q5KbjlVKF+ECqSv+etPM4TWx+Q=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97C8AA4C48AC
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imn-000000000hB-0vTR
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:18 +0200
Message-ID: <20260920144428.3009612-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 57/66] package/sudo: Add support for OpenSSL
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
