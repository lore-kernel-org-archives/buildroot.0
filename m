Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F07CEACF3
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FDE56117B;
	Wed,  2 Oct 2024 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8rlrze81D36; Wed,  2 Oct 2024 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC4161161
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC4161161;
	Wed,  2 Oct 2024 19:37:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31D381BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DA6C4124C
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0YN_3SGyqYd for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E8B641240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8B641240
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E8B641240
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:37:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A8CEC1BF205;
 Wed,  2 Oct 2024 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  2 Oct 2024 21:36:47 +0200
Message-ID: <20241002193648.2910408-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241002193648.2910408-1-thomas.petazzoni@bootlin.com>
References: <20241002193648.2910408-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727897823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkUTR/AeSFBEQ4X7kZH7+YHBQkV8wD4qeKgZlIx3CKk=;
 b=ZKFFv0pv/bPNFPZngWjKs1g4mzgnEnnPnooFt+f3zr3scuuqD5WRUS+zY9uNnpqZKKJXnK
 DX+NMT5jj6nyDLq3ILgNDGk6Q8aUceKy+gJBrLCVDLOCoMDP4p9PBO5uvifsvuZe2r7l8q
 90QP3NB2/EYEzFCB/yKfBE31WvA54D3mdnSc7C2FVfZRurRI+GVLBg+f2iMaHhapZMA1a4
 fA4qPmS953Ypk4gFHqcVDn5IsocPpwEIJ/PrVKYK63yNXCjrw2lXV9BcZTDLDHaE9oE6JC
 jrXXoGK4lJvGu5rOwXj4GYubtbDC3g0inYyAm+dqsFWk2vesfA5E1wofSW7C7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZKFFv0pv
Subject: [Buildroot] [PATCH 2/2] docs/website/sponsors.html: update sponsors
 information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move Logilin to past sponsors, update details about Smile sponsoring
and Armadeus sponsoring, and likewise for a number of past sponsors.

The text about Smile as a past sponsor is reworded/reduced so that it
stills fits in the size of the block in a reasonable way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 83 ++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 49 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index af691779f8..e90393be40 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -20,23 +20,6 @@
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
 
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
-		<a href="https://www.tap2open.com">
-		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
-		</a>
-	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
-	        <a href="https://www.tap2open.com">Tap2Open</a>
-	        financially sponsored the <a href="/association.html">Buildroot Association</a>
-	        in 2020 and 2023.</div>
-	    </div>
-	  </div>
-	</div>
-
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
@@ -46,10 +29,10 @@
 		</a>
 	      </div>
 	      <div class="col-sm-12" style="height: 150px;">
-		<a href="http://www.smile.eu">Smile</a> sponsored the
+		<a href="http://www.smile.eu">Smile</a> is sponsoring the
 		Buildroot project by hosting
-		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2023">Buildroot
-		Developers Meeting of February 2023</a> in Brussels,
+		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">Buildroot
+		Developers Meeting of February 2025</a> in Brussels,
 		after the FOSDEM
 		<a href="https://www.fosdem.org">conference</a>.
 	      </div>
@@ -69,30 +52,12 @@
 		<a href="http://www.opossom.com/english/index.html">Armadeus
 		Systems</a> financially sponsored
 		the <a href="/association.html">Buildroot
-		Association</a> in 2022.</div>
+		Association</a> in 2024.</div>
 	    </div>
 	  </div>
 	</div>
       </div>
 
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
-		<a href="http://www.logilin.fr">
-		  <img class="img-responsive center-block" src="images/logilin-logo.png"/>
-		</a>
-	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
-		<a href="http://www.logilin.fr">Logilin</a>
-		financially sponsored the <a href="/association.html">Buildroot Association</a>
-		in 2022.</div>
-	    </div>
-	  </div>
-	</div>
-      </div>
-    </div>
     </div>
 
   <div class="panel panel-primary">
@@ -111,13 +76,14 @@
 		</a>
 	      </div>
 	      <div class="col-sm-12" style="height: 400px;">
-	        <a href="https://www.smile.eu">Smile</a> provided the meeting location for the
-		<a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">ELCE 2019</a>
-		meeting and sponsored the Buildroot Summer Camp that took place on July 1-5 2016
-		in Toulouse, France. Smile sponsored the participation of Romain Naour and paid
-		the food expenses for the meeting participants.
-		In 2018, Smile sponsored of LLVM/Clang integration into Buildroot, see the final
-		<a href="http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot">report</a>.
+	        <a href="https://www.smile.eu">Smile</a> provided the
+	        meeting location Buildroot Developers days after
+	        FOSDEM 2023, 2024 and 2025, for the
+		<a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">ELCE
+		2019</a> meeting and sponsored the Buildroot Summer
+		Camp 2016: Smile sponsored the participation of Romain
+		Naour.  In 2018, Smile sponsored of LLVM/Clang
+		integration into Buildroot.
 	      </div>
 	    </div>
 	  </div>
@@ -174,8 +140,8 @@
 	      </div>
 	      <div class="col-sm-12">
 		<a href="https://www.amarulasolutions.com/">Amarula
-		  Solutions</a> sponsored the event by contributing
-		financially to the <em>Buildroot Association</em>.
+		  Solutions</a> sponsored the <em>Buildroot
+		  Association</em> in 2018.
 	      </div>
 	    </div>
 	  </div>
@@ -213,7 +179,8 @@
 		<a href="http://www.logilin.fr">Logilin</a> sponsored
 		the ELCE 2018 Buildroot Developers meeting by
 		contributing financially to the <em>Buildroot
-		Association</em>.
+		Association</em>, and sponsored the Buildroot
+		Association in 2020, 2021 and 2022.
 	      </div>
 	    </div>
 	  </div>
@@ -377,6 +344,24 @@
 	</div>
       </div>
 
+      <div class="row">
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.tap2open.com">
+		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12" style="height: 150px;">
+	        <a href="https://www.tap2open.com">Tap2Open</a>
+	        financially sponsored the <a href="/association.html">Buildroot Association</a>
+	        in 2020 and 2023.</div>
+	    </div>
+	  </div>
+	</div>
+      </div>
+
     </div>
   </div>
 </div>
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
