Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611FBD29FB0
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 19:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8338784866;
	Thu,  4 Dec 2025 19:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xaRQxXQlLqx; Thu,  4 Dec 2025 19:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7846384847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764875176;
	bh=m3op9Bu12PvQaoI21C6aeEcGCMJsIe/QvfcuI2ua1Q4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Dk6aosjHAcNq8sgvTjW4ODgfns/JMdUmQuzsSvzmQFvKLT7ULpEjhKDLI5ej9kx9E
	 mVS4YRvqp9GYN0TBV2NRSe9O3avQvobMjESLSO2QyI26eVuiqHEUr+kHEJ4ZWblcCG
	 0It01Ht2j8II74izc9o5tOz5bASFmB8LZf5Kghx8HXYKmi6qNy/IxOSPBmaupVYXju
	 cTwW7NxtTLA9pcRcHQs0TxakIlEr30W1Ue4l41/2x6H7E7LKm5NpR5TOnC4V8R125M
	 Pu5MsqI8mqGCXZAsJw5aQx0+4N3q/s/9+EHMpt8YHxhEKUKfCvLuBWIRyCynFiCm1m
	 rEIGU3QlumfLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7846384847;
	Thu,  4 Dec 2025 19:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D07E7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 19:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4BB461BF4
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 19:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_SRQxIuS8Qy for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 19:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EE9A60DE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE9A60DE2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EE9A60DE2
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 19:06:11 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id ADD9E2C80CE5;
 Thu, 04 Dec 2025 20:06:08 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu,  4 Dec 2025 20:06:09 +0100
Message-ID: <20251204190609.3846747-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764875169; bh=PTDIbOfiulSGIs6Y93oN4E82nmHlzfqqk9FTo4tNte0=;
 h=From:To:Cc:Subject:Date;
 b=a3yxogGmI0bW7Lf7a/fpMM1fmBMve2NLIVCqQd90XJNseyaDF2i65vmWLHWdHf1Ik
 lp9LWTpYfNIRK2Fd4nGQ/7F7bgGc4/eUoz0Di0yzTn337192uHL9Wy/MGrWtkKodBr
 n35Jcqj3IlHHbixwuxd1OIDLnkezwfjZduqxcKppEB6q9zAiUyo8rZVS83XKgjLe5a
 Scp1hyh9CDqqxKa3Qq+Fli7ap9jD47stxa4DtZLss+/99h/E25B4lx0gbJY8xO2IrN
 a2ki0etoVq8uVOSEFuv0MHs7+1Bq6/Hl6g9zuRMxDom31YSVbaGAEV1fFXOUaNWqfv
 Ahbo399auNubA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=a3yxogGm
Subject: [Buildroot] [PATCH] package/python-can: remove msgpack dependency
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dependency was made optional in 4.6.0 release here:
https://github.com/hardbyte/python-can/commit/6058ab9dfe8b3ba5d23cbff670c0fe767147390a

python-can has a lot of optional dependencies, most of which are not
represented in buildroot. As msgpack is used for the virtual multicast
udp can interface[1], which does seem like a bit of a niche usecase,
just drop the mandatory dependency without introducing a user-visible
config option to enable it.

[1] https://python-can.readthedocs.io/en/4.0.0/interfaces/udp_multicast.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-can/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 34ba35bad2..e3f47813af 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
-	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
