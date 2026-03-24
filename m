Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434DAF532E9
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 07:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DAAB826A8;
	Tue, 24 Mar 2026 07:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDtMB4w3fcDC; Tue, 24 Mar 2026 07:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B29C8249E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774337840;
	bh=hMwUaUxH19rP3mLQso8n3HWN2R3dfuPrQo8cTvTTQlk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UPgtzy7D+YfDaLgJfDOeIERCY2msjTZfSEwhUHPUSWWNZAhJnxfrAgwZvcPzZoSSy
	 EXCkyLwFO2PpqfYh+zVfaOjiHqVYUTfFgZojha9skh51iuSwj+VyhwqnZaTSbNPhzs
	 a4+0fsPkNbwVVgwtADkRnXONeOrXmOd7VPT8+Fki9lrTchu+Pf4dL+4sBtIunn3OVN
	 gyxCLF6aeL8PnWBwJ8An1DmYOgzSANuP7dGCk7a/wpvw+utfyvxmTqGPnXEmcAdtE+
	 Nlp6lF5rkVUJLEIhuz1jdq1X4wMgue2FJNlwz6h7ptT/u7U093985Wio9NZ66WYdN3
	 2VngClPy6BiKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B29C8249E;
	Tue, 24 Mar 2026 07:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4051D3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7511407CC
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptmFdh1a3kNj for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 07:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17EDD4075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17EDD4075D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17EDD4075D
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43b4f48c47cso2612101f8f.0
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 00:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774337835; x=1774942635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MSFcr1nQf4K01UiJw+vFl7oc5apjyFW4Ypsy7rvcZ+8=;
 b=O6HFF7NMEUawyiAKHSPKerLEeZUMWpgBoUBxOXhO/oXEleQoCNpypoj2dhGFbZo8DA
 NOVzZOiEpUc6Lw3XuPV56bYi3WL9oXmbHk1HLjrd2Um1qGodbtQ5iVMk9ntSZdTW200Z
 Ct+rgPvZaEE2VoKX2VJ9fwD8QNRYHDrD4onhx2ItZ099dwtADJyd/zSQ/Hn/f0Ab4tGB
 CzS8AFoQQKIn94dR6gof5jiii8xR3piky+Zq2ytPJTZCOwWXYNapIaJjbTo/yG6lf6Iu
 IJeGxQ6yYwI0RLWr2lTUjQoX87JvX6CfeJn5sRg6NlCKmrScOa9r6GbX4M/K+W707h4v
 oe2A==
X-Gm-Message-State: AOJu0YxJm4QhA9rYwAEggGcaRuoilvTdVNThOI8srMF1YVYbl9f/xdZD
 kfP3uiPPzG+IYPzLLwawgzu9A4YtE7rF0Al6vuvbm2+vJDfli4vrVEYTntQeT2ja6xqXffSKx8s
 sd8+P
X-Gm-Gg: ATEYQzw3UsIRn3GmaROR1tFTv/kd5oFW3ooi2Ty/xLU1MdMqIpHvNUcig9vybFBvJK4
 ji1rcNHmb+pte/vuL8HJXrI80CxPjAQ2eXaNZG7oaAwYd1i9QJe5uMlzikylHMoPTErBjX4VUQt
 1S81LGaDQ4vSyQGPPr3ACtB9IvCIxRdr5rnGha/NmZucJOYEpvgTfzjSNCC8HrAWVUz+O2TmbXA
 2Ystpdvvj7Lj7HjPfwcwnqiZcquggmom1r942Uhj98qDE+q45WTM7N7aPGDVk+EMQAuO0umqZ+J
 loVmxWaEpODaRxfSP8QbAVj9h2JqE2Z4ULBAjy2gNWutIfmpEUZHvnGQOnpmlj2zzZH6cJHkuKb
 Zdo+yw1OQiPSahTn30MZWJ06bNfmvqev9EgBQ9Txydp3nH+sD/a1IFYC/DCja1Kw3FMBsh0OhaG
 OCCjxOU26vDD8j9MgT0lC9nZ1YDgR/Fca8J5/Pk/9D4YlrC6p6zor8bEg=
X-Received: by 2002:a05:6000:40db:b0:43b:3bed:154b with SMTP id
 ffacd0b85a97d-43b64286fa3mr22523173f8f.40.1774337834935; 
 Tue, 24 Mar 2026 00:37:14 -0700 (PDT)
Received: from dragon (ptr-94-109-29-81.dyn.orange.be. [94.109.29.81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644bdaf8sm41100137f8f.13.2026.03.24.00.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 00:37:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 08:37:05 +0100
Message-ID: <20260324073706.654995-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324073706.654995-1-titouan.christophe@mind.be>
References: <20260324073706.654995-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774337835; x=1774942635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MSFcr1nQf4K01UiJw+vFl7oc5apjyFW4Ypsy7rvcZ+8=;
 b=Axu0dnouRIQLr7Azybbb/TPIj1Ux9SHGx4J6ibLc1TLb0tCv5GR2lYF8d5TkK+wwYB
 Pqg2JdYcVn6rNvC3jTsxR7hE6jFUtCnZr2redjhuJDUjtyT37Z0lKV5YqqvB2MFE4fym
 32vTOp7F6VohVEMNyI78yG1zk/0cYNpFRziKs+wjYnzmidFXl7jISVwiX7JMNZKSMhZw
 8dTy7yWMZ3Efkz+hEkogvHyF8rp5+YjQ8XXcTsrppZS3lLoXhMt9r5qbCpfRFgasjiFe
 UMDZA7Ww38Sb28xbu7q05pZ285uaB2Atwow4an9W8Zcc7KQWOfWW9PoIg8gZ6yA9kTls
 /YRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Axu0dnou
Subject: [Buildroot] [PATCH RFC 1/2] docs/website: add security contact
 information on the homepage
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/website/index.html | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/website/index.html b/docs/website/index.html
index d68436c721..027fd485e0 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -148,4 +148,15 @@
   </div>
 </div><!-- /container -->
 
+<div class="container">
+  <div class="row mt centered">
+    <div class="col-lg-6 col-lg-offset-3">
+      <h1>Security</h1>
+      <h3>To report a security vulnerability, please send an email to
+	<a href="mailto:security@buildroot.org">security@buildroot.org</a>.</h3>
+    </div>
+  </div><!-- /row -->
+  <hr>
+</div><!-- /container -->
+
 <!--#include file="footer.html" -->
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
