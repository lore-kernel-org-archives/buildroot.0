Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396B7C282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 07:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83ACE40C1A;
	Sun, 16 Mar 2025 07:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahM0Hg_aR-uN; Sun, 16 Mar 2025 07:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4324740C1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4324740C1C;
	Sun, 16 Mar 2025 07:58:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D92BEA
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 07:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E13E560722
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 07:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4h2YEnVtCisZ for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 07:58:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F72160707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F72160707
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F72160707
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 07:58:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0F4844414;
 Sun, 16 Mar 2025 07:57:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1ttise-001OpZ-2z;
 Sun, 16 Mar 2025 08:57:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Mar 2025 08:57:55 +0100
Message-Id: <20250316075756.333766-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeitdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepjedvudefudfhledtkedvffehffeuheeitddutedtgefhhefhgfffgfetuefhudejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopeihuhhrohhvshhkhiesghhmrghilhdrtghomhdprhgtphhtthhopehhvghikhhordhthhhivghrhiesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/rauc: needs libopenssl, not libressl
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes http://autobuild.buildroot.net/results/6efc1275d3aac9f0a4c000f3d0911b5a880e495d/

Rauc uses X509_PURPOSE_get_by_id() since rauc-1.3 with commit 375dbb16dd94
("src/signature: add support for codesigning certificate purpose"):

../src/signature.c: In function 'signature_init':
../src/signature.c:97:13: warning: implicit declaration of function 'X509_PURPOSE_get_by_id'; did you mean 'X509_PURPOSE_get_id'? [-Wimplicit-function-declaration]
   97 |         if (X509_PURPOSE_get_by_id(id) >= 0) {

Which is not provided by LibreSSL:

nm -D target/usr/lib/libcrypto.so | grep X509_PURPOSE_
00000000001377b0 T X509_PURPOSE_get0
0000000000137850 T X509_PURPOSE_get0_name
0000000000137860 T X509_PURPOSE_get0_sname
00000000001377d0 T X509_PURPOSE_get_by_sname
00000000001377a0 T X509_PURPOSE_get_count
0000000000137840 T X509_PURPOSE_get_id

So force the use of libopenssl.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index af0b99c36b..701ffef76b 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # uses X509_PURPOSE_get_by_id
 	# uses ENGINE_* API
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
