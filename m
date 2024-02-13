Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3633C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3196822FE;
	Tue, 13 Feb 2024 21:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqrU2buCDqu0; Tue, 13 Feb 2024 21:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A346E82393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A346E82393;
	Tue, 13 Feb 2024 21:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB5661BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F5C4402A8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr4zWTiOOQgg for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 929BF41561
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 929BF41561
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 929BF41561
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:16:06 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7c4359c5d33so194809439f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858965; x=1708463765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSxsfW/ITZwEKemOsvncEHOXicRO2tKX6wy8sM6y8Rs=;
 b=fcozNcC4BRMdCukigQQHKuG5TjjYCx6be3BQwZQwrY7CVn3I44vTRgt4jvBNI6C8C0
 59Dn/7mzmTt99ktwoRLM9LGyHOUNbWPTt0Dsa6szHX4TItnjrmJelToiZZRPOEAgMsoB
 FhCXDversb2B9QjJllBhjlCJaNwSvI7g3oYGvMMivxlj0d0eghruY2X9Sgvzckiqv7SR
 v8xabqDHTQdAb5XvMkAfWt8QeohkaKGXIFJhx2Kxtt0P7iJIGvb1baMFcAQOs3biX2hs
 vV2/LWrLBqhxpwah1B3KKV8RFK+Bi103Dw/xPeunkFV3Tkk3Zbi3F0JoYeEhwZsSQntJ
 Kvrg==
X-Gm-Message-State: AOJu0YyeZWKi/PlAz4d4plp52ea4PIn9yf2tTjdVbZO+SSTRZnq2E3pf
 zKOz+0u9/eSkcZYtuMr/Ywe8o4t1LdgWLJnzTgfVhSLA84HEE0dhPcwj8W/rBCxxIw==
X-Google-Smtp-Source: AGHT+IFOVuc5jT/Dy48R6iix7I/v9KtRYLdRK9Io8u1klUC8CWpLRxHp6xMD8T3LyQnZC6SecaTwfw==
X-Received: by 2002:a6b:6501:0:b0:7c4:4e99:cd03 with SMTP id
 z1-20020a6b6501000000b007c44e99cd03mr961238iob.13.1707858964356; 
 Tue, 13 Feb 2024 13:16:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVAr2pASQOMwrb+qpjvCvDfnofXeNSs2Qf0uWyoUKBCBEr1RGFN+WCdbYjEW8n2W0kheCudNLvi1nZAP5+GgsvLxba9Zjx3wTfZINvVP9EeeQYZj5GfeFXEiTSKTU64mSrXIC11c1hzz48D0dcwXLNz+JUrU+G6/OrDr70h8Qv1hvYtYHt2Re8hPROUZaDeSVPnKwkskeGxxYpqW9XA+7o88ELSu+qBTC2chKVyew3IYPq9AJ1l10lQQUqnLlSQ7AT5sGziLTMSrDkV532oXa3vUFFrEp9Yyg1BXGFfIrRGe3J5pX+0P6pO45ZVgHxmI9pr7SQulPH6bGEQdwKxn2BboywsVWF5LMwgHbK+xOOS8rkiL3Ar3C+1ut31JmhCcvYdKUtTX4Qu91Ob/u24qzI8dTf3OHqBAfVxL/n2hAtspl9Ui4NI0F5NCz3ox8s0P/MfcjtpfwSM7e2x055gRZM0DG7dKYtlx8WxZt23R4pRzFFFcuNIl53Rx9QFm8dGKHf0DSr/WkdxkaGldn87iXc5WMEldXi7gsjpzLWiB2TPTjuGIAiI2M9wAuS9yZkxvf02L6OXEmHow+IQx8MCfG3gTPgJlxNvQrXtBLgHeWjSyFDsjEiayR+dlGJvQ4k3nZSax4djHI6FWKk8+trO5iiG+TyASZpoNhmQb8jJZeKr+LSsxig4MHfVNSj6p4D4aIO4aDSoVFRIa4w2+iM1/KqFP0OaDHY/olIFv+kZl7fEqAcpXOqBqw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:16:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:11 -0700
Message-Id: <20240213211512.3918044-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858965; x=1708463765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSxsfW/ITZwEKemOsvncEHOXicRO2tKX6wy8sM6y8Rs=;
 b=YYGFSOSMdHOWBtX8dm1QradP9zIAWzHsGq+meTT8nMEixyelxbHZM3BfOgoVVZiCS9
 0WrWY0UwbSbXFE9BBL1/w9mQxOo8Y+pjra/M7PBCiho3V9MMFsDM54Fb2BROUz7a7t2A
 F0fFuP+Yl4ukjFgpaFOc/7LD1z5Rx6DIIu9q4gdlY9zgQUiZ825B8hTtIC3cMbMRiIpJ
 OnSsYiCECGssSPs5Zmo9AZ/8vptM9Ft4t+UTaclnqVa88+wel9yd2lklzuNq35dK66wi
 9rRHacJ+K57ulNKuYknzsoevwxQPqUtX6BixuvK+jOBwNXXLanNKeh7jS7x0uBTKjZRP
 +ScQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YYGFSOSM
Subject: [Buildroot] [PATCH v8 25/26] package/python-pyzmq: add cython for
 python-pyzmq
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When migrating to setuptools with pep517 support we need to add
host-python-cython which is a pep517 build dependency for
python-pyzmq.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyzmq/python-pyzmq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 1d9a7d01cb..f1444b9124 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -13,6 +13,7 @@ PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
 PYTHON_PYZMQ_SETUP_TYPE = setuptools
 PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
 PYTHON_PYZMQ_DEPENDENCIES = \
+	host-python-cython \
 	host-python-packaging \
 	host-python-setuptools-scm \
 	zeromq
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
