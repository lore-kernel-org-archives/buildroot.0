Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA22BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 935F16101D
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 935F16101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7088E6067F;
	Thu, 14 Oct 2021 22:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drReuS7goty7; Thu, 14 Oct 2021 22:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFBD760830;
	Thu, 14 Oct 2021 22:59:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5F4D1BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D66958322E
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3GNWr1CR5_y for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA0783183
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 187so6728415pfc.10
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usToAev1ucXLWlbckeDDAP8cdD1fjkBB5K4KeuQDbf0=;
 b=Rj13EWcM+aZvgVkmKUL+U/Tihvr/PlZsUXJLIzSp2pIRi88OUKYzvIhTu1ACw2Ivgs
 hfYxhuwmAmVe0JS/gXDzuDDxgxK7V6IhZ4hXN4i04ZNNtoVbBnaZiD7Is256otnhb2LK
 OH7B/X1Y4gsM3CTVBjFDujyli/+fIRUAMkj68euCMKqvO1gGcX1lMX2vs2mRNkpKNLfd
 i/7LoLAe7UIieOflmIsZLD0BN5+PIRaRhRtKRx0GWMc3dwr8efaYanZSSsk/y1f/RyLc
 T8oH3a42mGMxTIxj2l6SvPZzKVnSNortX1ust5PboDdbBNZu3hgDCIbDiVZs1nmcpgKM
 QR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usToAev1ucXLWlbckeDDAP8cdD1fjkBB5K4KeuQDbf0=;
 b=uaqiEEgRs27x6PmBjI+T2EnO75nOyZ+VWkqWyleVmOyfc6l3Llbf5ekKnNbomayZR/
 B5sMaRxWFKc2eUFvJPvFILCBmGtBZf+8MQf7YpeVPqKoMgKzPkKWvtU1AnrZYSWvJKCs
 LQSTJ6COwryxLSf101lQuapGX5tuI5Tvgn927vKTnMtf7KG8xiYDGcAqqCFXRPRT9f5/
 IVDJhmxSwhGVuyEj/6UYZ++dSyTXHR7MCDxxAyiWfA4jkiaL+OUPe1uDc1rsGEuwHwHy
 izHWkRh7aySGN1O7ddG8AqgLlNuzr6cSQffQy3yR9qganRBQJ8DMtVjJC5Az/B/EDcoD
 xUDg==
X-Gm-Message-State: AOAM5303ly/rHn5XY4W+KzJDD4S0tqjDVQZEAp7zb9nOIMfEbvakP1YF
 oubxJoI4Odk3VW+DegcODUzeoJZk1c0=
X-Google-Smtp-Source: ABdhPJykXvjTc2vFzKh5kMI0qdQSGogZfEn83MT6ToxyGjvG8rW46Qb5rXkmrbADbTNPkG2/pyLwFA==
X-Received: by 2002:a63:6943:: with SMTP id e64mr6315938pgc.480.1634252336649; 
 Thu, 14 Oct 2021 15:58:56 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:56 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:43 -0700
Message-Id: <20211014225849.832479-6-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 05/11] package/python-certifi: add host
 variant
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

matplotlib 3.4.3 depends on host-python-certifi

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-certifi/python-certifi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 7c63633a8d..486548f8c2 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -12,3 +12,4 @@ PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
