Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AC61090237
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 15:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD6D4418AB;
	Thu, 19 Mar 2026 15:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oyp-vBnT5d7x; Thu, 19 Mar 2026 15:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 382D54101C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773932575;
	bh=gjTZ5//9etCSZnoc/YQRSvMBpYLC426gUz4YmqHbAS4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nACr+koAww9R96EazJuKtacBRA+XPZEmf0HwGQMLqz50atHjukldC2klWxBuaLyuL
	 nDY3CX9qxrKvu2NPUgohjZAeF0hik9h+M4jdmRB6nwafyoLTMzKryO69prHe9eD7v/
	 R9eQ6YsoDWTLkKrURS7BOfZW+3sex01bwfxCYHx3SPQV/MeTaBZNO655VIaLUHgRt/
	 ViPN+j51QAv34tzPnw460nanv8bri51N+JO6GbQ3jAaZ7EwJDP6PgW2MmV2ETiBZdH
	 n9i1gvKwUUR6ULbykw1TSB2mvAuVe08C13bTvWzDhmOHJvhshAuPlMx6nD4sABHZvL
	 a+PMp3VI6J0UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382D54101C;
	Thu, 19 Mar 2026 15:02:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31FBA1AD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23A6760D6C
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIrmmC4XeZuD for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 15:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B134260B02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B134260B02
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B134260B02
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 15:02:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-483487335c2so7951945e9.2
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 08:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773932570; x=1774537370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ibmv9czLX3LULHSoL48PkZOaADdSzQ2PxNbRykZQI+c=;
 b=JebUmUhXw5a53e1vjuWohlrUN37cXdULaGW5CPd5W4+Y/S27xjK20gbc89PeNISSfQ
 xXpn1go8Ibw8DrbR1EaapVJIFGiGSBOYN34eBmrx4SfO/EGFNVVyHUEJBli86drM3MEf
 bpkqKr4CyPXJ/0MtcZRnx1AQAK0LXhEl1rd4zs+tAKw9TZEzUJ6PVaDhSBX7G6mhPiEV
 gdw21L1ICBI/FcWhEYWVWjMBnCE9Ox24VLyYoC6wReY1/OsyNklzz1AKxJVCJSKBAv5d
 eOBgpg4tUk3sULEjqiqm1tfyW73EU2dQw+FEyqI/DM8jfXyws44EEcgci5Sn5MaFZ1sp
 invQ==
X-Gm-Message-State: AOJu0YygVAuuW60DXfSSEVxXTGr60uJWed6urStyxzmi9AXpx2U0S24i
 gcXoEB4VxPDRvE60t/8FuCBPtMn4p1xKHihd1e8BLFwZ/fSdWOKn346gUI3ijpSqc2IVF3H/dzp
 9srsW9H8=
X-Gm-Gg: ATEYQzy7wq2WEBJnY+zlAIbuJquxtNaiA+1qXl5mnFrsxf7Dpv44pnJuRdUCoA5AehZ
 moD7+LbKYqt7izsfzr60rZ8Ch0ZwGLOkpLFJxrZxIRnCdCbrBjia8W+7bYfkVCVxdDa1pRrWsuu
 IdMkhV931JFvB/WOYzxcIc+1VvjErl70yeaffIdh70Cj1QPWEp9qTnOylCV6mkMSVo+RC+OjWku
 dTkxJ3KSTYpZxVsMeK5Ch1It5NehB6yzP2EZYbq9Po+2NongJGneCet1wgz89i7WVdf38zu+TN/
 FZ/0hI+EPAXu7A4ahhHI1IWlpocA1AFFozIjQJJrYReWXqgKZs3xsVdJ9KUtbtcdXBR+9Y9t1/0
 YZDWzuD5PcN5JYkefnuJUVAtCsyNFlOmbfP++LctC8MdqQFgbaOLlZ/5UEz7nzlBcaauTUzbnox
 08QXOdEADGPYzIMbqD6QQ=
X-Received: by 2002:a05:600c:1e0d:b0:486:fc95:1a91 with SMTP id
 5b1f17b1804b1-486fc951c49mr33095315e9.12.1773932569038; 
 Thu, 19 Mar 2026 08:02:49 -0700 (PDT)
Received: from mindpad ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fc3b98f2sm33411105e9.14.2026.03.19.08.02.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:02:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 16:02:41 +0100
Message-ID: <20260319150246.10937-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773932570; x=1774537370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ibmv9czLX3LULHSoL48PkZOaADdSzQ2PxNbRykZQI+c=;
 b=NmTOJcOi9fKaovBu6ZgZ0QLIjDcjMIDuqcpF25YBaA6+mq2xTrM/RIoOSF56e6w+h3
 XbvsVHi37G32X+cnJ13T+1f1YgVK5ZPD/r1M7dCMkXV7Y3QYwaCZPhkXIMi6vN3grd18
 +KuiqoTkvZu+tZ3aJp7nwmbKddd7NPCapDH6VZ+E1oONEwBeDIf242/1IUN43hncHerU
 xydCnahGXNpXvGIFe9NDjGsKcefAhpJqfzXiHJNXiQDtvVD1P7S6K9tU1wWDr2gdov4m
 v2g5ezeATAWNFDiYOOg4k/BlPRZeThBaCNNbyvzsvMvqTM4gyyVkqDscGhlnnV/WBRbf
 Nyng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NmTOJcOi
Subject: [Buildroot] [PATCH 1/6] website/sponsors.html: remove sense
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

Sense is no longer sponsoring LTS for the year 2026.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/images/sense-logo.png | Bin 2616 -> 0 bytes
 docs/website/sponsors.html         |  21 ---------------------
 2 files changed, 21 deletions(-)
 delete mode 100644 docs/website/images/sense-logo.png

diff --git a/docs/website/images/sense-logo.png b/docs/website/images/sense-logo.png
deleted file mode 100644
index d4cab95b82029f5a7e9584e2f1fd43419799aadc..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2616
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

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index eef82d2cfa..63f580f062 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -44,27 +44,6 @@
 	  </div>
 	</div>
     </div>
-
-    </div>
-    <div class="panel-body">
-      <h3>Bronze Sponsors</h3>
-
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-lts-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
-		<a href="https://www.sense.com">
-		  <img class="img-responsive center-block" style="width: 100%;" src="images/sense-logo.png"/>
-		</a>
-	      </div>
-	      <div class="col-sm-12">
-		<a href="https://www.sense.com">Sense Labs</a>
-	      </div>
-	    </div>
-	  </div>
-	</div>
-
-    </div>
     </div>
 
     <div class="panel panel-primary">
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
