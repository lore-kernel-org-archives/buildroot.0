Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DD2CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ECBE40779;
	Tue,  6 Oct 2026 16:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOGgt8HF_1He; Tue,  6 Oct 2026 16:34:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B1EBC4077B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304453;
	b=r8+W2fBbNj0ZoB7HJeIpHzj8EOIksHbsyIcz8aiRUmKHqOdWBJY/cVcNEGDV8gQwjeg4
	 w4PPG6yUlW5gtcxvfJxiXBDr57KIEHrUGPinz3EB9iNDlhCaOOIhoMLNQ6mnSYNnR4L73
	 74p6a9iUHE3gR/JplZ5B96zQoktOVd41dl0CHukUMhCI1UEbpPL+F6YbuC4FG6KCopiPh
	 MsERIiCCOa+QNyugxdhblwWX/3RnK1NAUixlqk0ONmaGSL5Avw+plJQIeTigrJAQ/6Jes
	 M4lJqvp2iW1DLscSheTPz9yvSAfIW605GpEVJ8ZYd/foSO9HagZLUxtiGAfPk+iUWtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304453;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NG/B0AJR9B70duiQkEa3didcdQSnKipLRHeiNKQfRLw=;
	b=A1+39kcxPlcpc9681tPnoWLxWYUMShd3WzKcaE+jv624nu+zP4IYwXIX8QJWzUI22n64
	 mDjW8PB9kvr72gBJbso+JrRBjelFZympfk5FGwOT06EoDgQ4zMPjvrVPrq6XMij2xx4YM
	 cuuFWole+Ea+tM0cfjgOGhimrwANQ/ImLI/ggVN/yD2OaR5pvVnSZ88+uuHUlkGc4Og9Y
	 9r7/wygtnivPTLWS8lF61EREhSRGga1Eh0sIvw0gNvjgQub8/OUy9HqaBYw6uWp7R8UTF
	 hj3Xa83drG+cZ0fPsF6i8nMoUxGgzrWn2UWjj+/jfr73TaTRK7H96TR5eLzT37R5geA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304453;
	bh=NG/B0AJR9B70duiQkEa3didcdQSnKipLRHeiNKQfRLw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D29v7cNuw4pifVN5H25V3t/Nrc59lgEG9Ja37eQ9zk/MwgCAcfnt/3p6qKZbyhuau
	 kYv4vafNI8zftMIw5VlPCr5tjo0iL6ZK2T+WDACN4sa7S0L8PANz4Zlu8CLNbO/eZq
	 wuZAP5F7Mnqo9S05HtRUZpnHzt9hBnzo/GduNu4sMFrK/dYmYXhtJUZCmH9SPnBfdf
	 iqVUIL+3Kpg7IVGaHAMjlCqNfH0lMEEnUSIUVYOkNYzZk76c+uHTbcc6BCLDoo8EV3
	 6vksS1Br+l6pwvGhiXfQmGxOLQYWq5fkzHLA1pTCOJYjTnDHkmLC7ycBxtth/jHvxK
	 4QTq58x6d5LNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1EBC4077B;
	Tue,  6 Oct 2026 16:34:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8406834E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 764A080E37
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEtpCVoyWbpu for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:31:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7FAC280E09
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304317;
 b=sq5fQJBod1NBM7pauaP/2JOqF3ouXIPrUi+ESLzDDUEsDzqNgWyT+n6vv7dK5/RkqbVC
 g1nh77DnbJq7MoMg1LkuoqIPpF25oVR0lnobD5eSYk7/++FF/NqQZjXQX5nORlvYyLi+x
 PF+pYLwo2W5Dr6lXgs+0QBQTO1OnS7lHwYNWSegH8qBaWgbk8Xp3gmLSm2dvSKry/QlQ8
 Bs/Xswm17z5EaX3WIiGlF13LKZVgEIY6eD/k96AEwfCm4RUaMFKgWitchQx8BGRFJ07UF
 vO8TP6TWlGAOn8xT1VKYiCQdCTYa0NKhFTVEDFiTiNaQbENwV0u+1wM2MFk5MzXUB9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304317;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=sDEcBuDGDWRJYKVA0uP78tt1MUzoXPok2DgJ/vVS7ZQ=;
 b=Nn2lY2LUvZTvl3yZtqCBwAA0V+KfIRY9rmyJcrCJOy6j5gPWWkmJx5NpQ/1wt9JKbevY
 x8X1fOi0Tmmmb6oa7ABbMSV0JyDHerZTGCVqZ136GoJ595QB2C7CMiVg1Ub7rS92PCCim
 uCMT5ZrCocLja8qbEVDGB4f4bPjr75MPjle8e3+ppDfc1N605x/t+oC7nWIQk5iY5V0mD
 tRecH3gHR9HBm+tyowsfTP4CSWmxLf7q1NfH8pvV/fMPsTJSGcf6WUwn14V0Y6pqJwyMp
 /S+NwqmjBLxVZIP7ZSbxmqiCKgvhjQvIc/OEFyQlZNHdQdRs1Zhs/5QIvGsy2t5u65Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="N/4oam61"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N/4oam61
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FAC280E09
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303709;
 bh=sDEcBuDGDWRJYKVA0uP78tt1MUzoXPok2DgJ/vVS7ZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N/4oam61eBXFjR01DCJyFgfd7OcZoPguFWTVn1B1AVoGTLyAqfjb9cRu14tLZS2Cp
 OnDS0tlijEEJRi4EH0cei7mDGIKmXS/26JsKCeaDIfKg6iK33ZTl09dap6SVALfhAy
 qV1kKmPOlcNuuXlKZSnNAjn35Ydmo61d4mpF6jzIPM0sAJh4mL+2vox3Db6TkTvLuJ
 7LCTV0EN0QW2JRlb5ceyc54il99MIqutiUPg6FjRzO9HfM+eZrkiH0o6BkJvbdkvPF
 54/4Bxsu5ueCJUA3K9P9gDhk6Rgd6cHdW4u1cFLO2BCeh8CGbkP36aDeWiUL80CP1Z
 JJNJPLCMR7fag==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 uWqEHmyD/rXHDUA0ynpFQ2QWcXr6rjMK4hSlaP4Uhveag5hFvbaiOCzKuQd3IGKbJcq/5LwNtxG
 +axKF941pfWx0H5rDRMR95Nr5+Z1ywFOgYhZ5pQFxd9PzPqbJyqTSEeSALSXds6wyCWFDZCxAev
 2lptB1Nyo9ADxaQH6goWi3pWgT4DlLJBwjs+qPZIqp0B9P6skY1kad9NNsXnwozHItS72efBeHy
 SVP1YU/7CG2G+a/HcA/etgM29IqEzXdVIf/W24VB+JoGSJFKj38U0kwVqAs1/C59D9/hrs6QQnb
 iAgxV2LFgXE6yNr1S69afcAFriX1sh48LHUDqFCCk8gTTNDdO/TLeP2B+lBic33U2JpsSPoKbpU
 EonewnRhoUK2Nx1lmLI+WocCVSUf6Os4S/HztiNCO3KdK2qJo2UUNk3TVb0bvc76QbIwPz8UNDi
 EvufxfOtZEguRQ7Z805UQKercrcxxgry+g8KBNglQ/xiX2HkljFvOvup5wX+EQmGMmJmsABQqLj
 WpZ11hALhRtuaZsfGib8XjPajN3YKa/1cCPXSvAWGZXYvAC8OV0lAxbenZ8VpVk0f5/O5ux2030
 rUkiGoUFjXNEck4b2pe8McUvjwmJ5augLACmiceppwLg2sY7lJ66CaujVSfWDg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21892A4C54EA;
 Tue,  6 Oct 2026 18:21:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-2aYi;
 Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Oct 2026 18:20:09 +0200
Message-ID: <20261006162106.3439373-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 28/84] package/boinc: Fix build with OpenSSL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
