Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A854CFEA824
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 10:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9F14109F;
	Wed, 25 Mar 2026 10:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXj2IKIumR3W; Wed, 25 Mar 2026 10:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE6D410BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774433730;
	bh=zn5nMcAZINgRdkpPXrFSHd+2dJ1qOE2lQpaxLwsJhY0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sBgTKzX0Xjun/v5PmeUB3KkIDnYLUSkWf57RHxP5+v4FVnCC8OQsqp0RsXq/6BItf
	 kd0PgZ8Wkgg1ttoZKMOhWDIdXzSwF6WPFbXRMASG2kkEqNuZbNX1M1Ly4ipgVH8C0w
	 ge5AOvxTOPcsZCnDO7/fZQpEfcmvfcOP7wRiQtj0/xzmipVDjMP8p3oXAmOz1qMBZD
	 pdB98S0q0gE6VDkiQeviS8Fl6CUxiwYgtE2jmK3ioiu8l/FdMZ9/hEvALTbrcs51Dn
	 dw0XoH8zrevHFm3VFHs0ytn+bQJaA5MUhBJh70s4h8j7ut72npg0/1Sd3UvNq/ajdn
	 7GtZj3QmLxJMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE6D410BC;
	Wed, 25 Mar 2026 10:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF5D9353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F5740340
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPcgzcZvbUdY for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 10:15:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C2E640088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2E640088
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C2E640088
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-486fb439299so53100175e9.0
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 03:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774433721; x=1775038521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ss07fGfb22YhGcBZxUwY5diMDngmpg4RfSwvkYKuFAw=;
 b=fWxxSlTvqIvlMWDwH5Kxm9d/bPeh4daU3p44vhEwwN85mbQjKCKHNOUzx7wKXBhmkm
 yopUeRYd+/5vchv07rNTWm+Hm9gtV1U4t8UmX4f1eL3sxG4TLldpBfCoa7+H7a9PYR2q
 jPBB48XNWX+QBGDZKr7nsGSnsGGvTVETHQK5BN+T/99VwjB/+jjyLCQmX57EUews6tux
 HKpPzTOl1h/Zi/nx9cvlKoqFI25QFmFoKR9DVeaQBJXhHOlB4fwnWq09xbuUNW4o2MLm
 w4T/Li4ZQvkLgbPKtYulMOss499Q2P+zwP0k4ZqxFF0md5HZog52ZunKrsv9j0f157CF
 Qy7w==
X-Gm-Message-State: AOJu0YzAgmH4Z+VLtQul8IZ6wxb2jAJTU07bH6nzaUMasdJT6TxoveHk
 05HCHSak5Tr8iPUoexlgjWK940fjPBhC+v4F6PnIb8H06GFHu4I0tYqipw2WJrco19RsUM7HnR7
 CC5lPINE=
X-Gm-Gg: ATEYQzxqiiksgks9cnuUoelaQ4iM/UD/FB1xwEwiZhX7yu7C+mcQhGbYCC5qGObhAOZ
 5JI4Mcsv7tlow5Xfasn+41XutVmJQ//XEl1lRJXuMOrUGLvIT8Zl+f3afz5Mspb5JfPTIVjsAVR
 kSyqSjdOiUHXxyytcDVj2Jz7AF3zXPURDR8M/HfjpqE52FSjA66kRi/qCiTvVXIRECY4tqutU8w
 vOdYoxSmhU9tVMWEpR4+XDIsaTWMW0gCKZ6K3vT6X5lw3bKr7bXmLb1LVcU/LVXAEhde9RdfZJU
 WEE7M2mN0dsxozmKptINxA1lTbJMe1vf/LeC+UbrmqqvB1ZorBupZjXnrKWJgQftkpRULrExInm
 ZQRN006Q1c7Y96gv7eNqdu+g/wwEHaIc61jeSHJeEZ05oHUWLLXI9y+PsxoKCa27NXj1RXQ3Dvi
 c39NwStmVDWn2LZkci
X-Received: by 2002:a05:600d:d:b0:485:3f72:3230 with SMTP id
 5b1f17b1804b1-48715ff7846mr34476505e9.15.1774433721053; 
 Wed, 25 Mar 2026 03:15:21 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48716641406sm18326895e9.11.2026.03.25.03.15.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:15:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 11:15:16 +0100
Message-ID: <20260325101519.77626-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774433721; x=1775038521; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ss07fGfb22YhGcBZxUwY5diMDngmpg4RfSwvkYKuFAw=;
 b=Ysx5TkZEOv9xh2ij1ow/pLE9Ne0KeB2cw7dUW5jaI2h0VfRNANrG0sHlpZlvWtouen
 2bWBAsE4TIW2u+9U5unwckJoOMMa0MKGqT0Sp8T0kmnzIvIOpVo3gYCjWD0YL5iNT5G4
 7ZgFC2lwcyodfuW1DpBr9QPB8eQmGKy6DZlj4BsU86FxQCpx9rC/xE9Yc3yMzgGw/dPI
 wJTiJ37ICaxb4uWhqZDFoYpKHEOfjBDIFoVuIzORUVJbE7U58YhY+oWZGZemHpd6L0oS
 2dZ2x3bYaKSgkDDtcIIyKFIQYhEPiQ/y2Ntj3bJAAqKXmNI26KRtPhkIFvMpr+CNcGBq
 iIww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ysx5TkZE
Subject: [Buildroot] [PATCH 1/4] website/sponsors.html: use flexbox for
 sponsor grid
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To avoid having to move all the sponsors through the bootstrap 'row'
when adding a new "past sponsor" on top of the current stack, this
commit make the card rely on flexboxes instead of the bootstrap
internals.

This make sure that the body of the card always fit the row height and
the also make sure that the image always fit properly without having to
touch the inline css.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 --> v2: add the flexbox usage and move sense instead of removing

 docs/website/css/sponsors.css |  40 +++++++
 docs/website/sponsors.html    | 207 ++++++++++++++++------------------
 2 files changed, 139 insertions(+), 108 deletions(-)
 create mode 100644 docs/website/css/sponsors.css

diff --git a/docs/website/css/sponsors.css b/docs/website/css/sponsors.css
new file mode 100644
index 0000000000..889737eabd
--- /dev/null
+++ b/docs/website/css/sponsors.css
@@ -0,0 +1,40 @@
+.sponsors-container {
+  display: flex;
+  flex-wrap: wrap;
+  gap: 15px;
+  align-items: stretch;
+}
+
+.sponsor-entry {
+  flex: 0 0 calc(33.333% - 10px);
+  display: flex;
+  flex-direction: column;
+  min-width: 250px;
+}
+
+.sponsor-entry .panel {
+  flex: 1;
+  display: flex;
+  flex-direction: column;
+}
+
+.sponsor-entry .panel-body {
+  flex: 1;
+  display: flex;
+  flex-direction: column;
+}
+
+.sponsor-title {
+  display: flex;
+  align-items: center;
+  justify-content: center;
+  min-height: 150px;
+}
+
+.sponsor-title img {
+  max-height: 120px;
+}
+
+.sponsor-body {
+  flex: 1;
+}
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index eef82d2cfa..c15802257e 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -1,5 +1,7 @@
 <!--#include file="header.html" -->
 
+<link href="css/sponsors.css" rel="stylesheet">
+
 <div class="container">
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
@@ -15,29 +17,30 @@
     <div class="panel-body">
       <h3>Gold Sponsors</h3>
 
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-lts-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://evs.com">
-		  <img class="img-responsive center-block" src="images/evs-logo.png"/>
+		  <img class="img-responsive" src="images/evs-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://evs.com">EVS Broadcast Equipment</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-lts-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.openhomefoundation.org/">
-		  <img class="img-responsive center-block" src="images/openhomefoundation-logo.png"/>
+		  <img class="img-responsive" src="images/openhomefoundation-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a>
 	    </div>
@@ -48,22 +51,22 @@
     </div>
     <div class="panel-body">
       <h3>Bronze Sponsors</h3>
-
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-lts-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.sense.com">
 		  <img class="img-responsive center-block" style="width: 100%;" src="images/sense-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.sense.com">Sense Labs</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-
+      </div>
     </div>
     </div>
 
@@ -71,15 +74,16 @@
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
 
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.smile.eu">
-		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
+		  <img class="img-responsive" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 		<a href="http://www.smile.eu">Smile</a> is sponsoring the
 		Buildroot project by hosting
 		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">Buildroot
@@ -91,15 +95,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 180px;">
+	      <div class="sponsor-title">
 		<a href="http://www.opossom.com/english/index.html">
-		  <img class="img-responsive center-block" src="images/armadeus-systems-logo.png"/>
+		  <img class="img-responsive" src="images/armadeus-systems-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 		<a href="http://www.opossom.com/english/index.html">Armadeus
 		Systems</a> financially sponsored
 		the <a href="/association.html">Buildroot
@@ -108,15 +112,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 180px;">
+	      <div class="sponsor-title">
 		<a href="https://www.openhomefoundation.org/">
-		  <img class="img-responsive center-block" src="images/openhomefoundation-logo.png"/>
+		  <img class="img-responsive" src="images/openhomefoundation-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a> financially sponsored
 		the <a href="/association.html">Buildroot
@@ -124,6 +128,7 @@
 	    </div>
 	  </div>
 	</div>
+      </div>
 
     </div>
     </div>
@@ -134,16 +139,16 @@
       <p>Throughout its history, the Buildroot project has been sponsored by
 	various companies, that we would like to thank below.</p>
 
-      <div class="row">
-	<div class="col-sm-4">
+      <div class="sponsors-container">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.smile.eu">
-		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
+		  <img class="img-responsive" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 400px;">
+	      <div class="sponsor-body">
 	        <a href="https://www.smile.eu">Smile</a> provided the
 	        meeting location Buildroot Developers days after
 	        FOSDEM 2023, 2024 and 2025, for the
@@ -157,15 +162,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="http://www.mind.be">
-		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
+		  <img class="img-responsive" src="images/mind-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 400px;">
+	      <div class="sponsor-body">
 		<a href="http://www.mind.be">Mind</a> sponsored
 		financially the Buildroot Association for the ELCE
 		2018 meeting, sponsored the dinner of the FOSDEM 2014,
@@ -178,14 +183,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<p><a href="http://www.google.com">
-		    <img class="img-responsive center-block" src="images/google-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/google-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12" style="height: 400px;">
+	      <div class="sponsor-body">
 		<p><a href="http://www.google.com">Google</a> provided
 		  the logistics for the FOSDEM 2013, FOSDEM 2014,
 		  FOSDEM 2015, FOSDEM 2016, FOSDEM 2017, FOSDEM 2018,
@@ -195,18 +200,15 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
-
-      <div class="row">
 
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="https://www.amarulasolutions.com/">
-		    <img class="img-responsive center-block" src="images/amarula-solutions-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/amarula-solutions-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.amarulasolutions.com/">Amarula
 		  Solutions</a> sponsored the <em>Buildroot
 		  Association</em> in 2018.
@@ -215,15 +217,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="https://www.bootlin.com/">
-		    <img class="img-responsive center-block" src="images/bootlin-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/bootlin-logo.png"/></a></p>
 	      </div>
-
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.bootlin.com">Bootlin</a>
 		  sponsored financially the Buildroot Association for
 		  the ELCE 2018 meeting, sponsored the meeting
@@ -235,15 +236,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor" style="height: 400px;">
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<a href="http://www.logilin.fr">
-		  <img class="img-responsive center-block" src="images/logilin-logo.png"/>
+		  <img class="img-responsive" src="images/logilin-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.logilin.fr">Logilin</a> sponsored
 		the ELCE 2018 Buildroot Developers meeting by
 		contributing financially to the <em>Buildroot
@@ -254,19 +255,15 @@
 	  </div>
 	</div>
 
-      </div>
-
-      <div class="row">
-
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<a href="http://www.tkos.col.il">
-		  <img class="img-responsive center-block" src="images/tkos-logo.png"/>
+		  <img class="img-responsive" src="images/tkos-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.tkos.co.il">Tk Open Systems</a>
 		sponsored the ELCE 2018 Buildroot Developers meeting
 		by contributing financially to the <em>Buildroot
@@ -276,15 +273,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 100px;">
+	      <div class="sponsor-title">
 		<a href="http://www.rockwellcollins.com/">
-		  <img class="img-responsive center-block" src="images/rockwell-collins-logo.png"/>
+		  <img class="img-responsive" src="images/rockwell-collins-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.rockwellcollins.com">Rockwell
 		Collins</a> sponsored the ELCE 2018 Buildroot
 		Developers meeting by funding the social Saturday
@@ -294,15 +291,15 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 100px;">
+	      <div class="sponsor-title">
 		<a href="http://www.scaleway.com">
-		  <img class="img-responsive center-block" src="images/scaleway-logo.png"/>
+		  <img class="img-responsive" src="images/scaleway-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="https://www.scaleway.com/">Scaleway</a>
 		sponsored the complete logistics to organize our Buildroot
 		Hackathon in Paris in March 2018: meeting room, Internet
@@ -311,17 +308,15 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.imgtec.com/">
-		    <img class="img-responsive center-block" src="images/imgtec-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/imgtec-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<a href="http://www.imgtec.com/">Imagination Technologies</a>
 		sponsored the meeting room and dinner of the ELCE 2013
 		Developer Days in Edinburgh, UK.
@@ -330,14 +325,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://circuitco.com/">
-		    <img class="img-responsive center-block" src="images/circuitco-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/circuitco-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://circuitco.com/">CircuitCo</a> sponsored
 		  several development boards for the Google Summer of Code
 		  2013 project on Buildroot.</p>
@@ -346,14 +341,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://boundarydevices.com/">
-		    <img class="img-responsive center-block" src="images/boundary-devices-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/boundary-devices-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://boundarydevices.com/">BoundaryDevices</a>
 		  sponsored an i.MX6 development board for the Google Summer of
 		  Code 2013 project on Buildroot.</p>
@@ -361,17 +356,15 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.fluendo.com/">
-		    <img class="img-responsive center-block" src="images/fluendo-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/fluendo-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.fluendo.com/">Fluendo</a> sponsored the
 		  meeting room for the ELCE 2012 Developer Days in Barcelona
 		  Spain.</p>
@@ -380,14 +373,14 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.synopsys.com">
-		    <img class="img-responsive center-block" src="images/synopsys-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/synopsys-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.synopsys.com">Synopsys</a> sponsored the
 		  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.</p>
 	      </div>
@@ -395,33 +388,31 @@
 	  </div>
 	</div>
 
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12">
+	      <div class="sponsor-title">
 		<p><a href="http://www.calao-systems.com/">
-		    <img class="img-responsive center-block" src="images/calao-logo.png"/></a></p>
+		    <img class="img-responsive" src="images/calao-logo.png"/></a></p>
 	      </div>
-	      <div class="col-sm-12">
+	      <div class="sponsor-body">
 		<p><a href="http://www.calao-systems.com/">Calao Systems</a>
-		  provided a a meeting room for the ELCE 2009 Developer Days
+		  provided a meeting room for the ELCE 2009 Developer Days
 		  in Grenoble, France.</p>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-      </div>
 
-      <div class="row">
-	<div class="col-sm-4">
+	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-title">
 		<a href="https://www.tap2open.com">
-		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
+		  <img class="img-responsive" src="images/tap2open-logo.png"/>
 		</a>
 	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
+	      <div class="sponsor-body">
 	        <a href="https://www.tap2open.com">Tap2Open</a>
 	        financially sponsored the <a href="/association.html">Buildroot Association</a>
 	        in 2020 and 2023.</div>
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
