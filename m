Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1053BC5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 08:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A3083A3A;
	Thu,  5 Jun 2025 08:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66bqEhksMs-Y; Thu,  5 Jun 2025 08:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 143D580DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 143D580DC5;
	Thu,  5 Jun 2025 08:55:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DCA11A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D78839E5
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yH6b5cxWQKg1 for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 08:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1849880DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1849880DC5
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1849880DC5
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:55:02 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so389950f8f.1
 for <buildroot@buildroot.org>; Thu, 05 Jun 2025 01:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749113701; x=1749718501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PlF3VZUXET0SqN6iWPE6IZFVoRu97xdn2V5+rzsbTE=;
 b=KFo9Lae5ypaQS+uQLwULNHQJ3DUht0vBnUHm0lgCtcVyMWriLPXFd9uiaLbqnI+3GQ
 Nca4ERrMuWKxBympc1iIjZp9AXM7dW3dbeucvUrzw5KhcNfFuAKw8rhFazkJl18QDYJJ
 w6/ZUnT2bdtCuIa1pNgWMQECUpJWjxIznwbXTOCPCdH8+CgeqfJ2E7lHkWhaOepajDNb
 agjSnPhw5rO6D8HZE7kK/o9W+hfXhXqkh5A/ItVKCYGhmouddKFwgUyzI1Nw1xVzTBRm
 IooDGuEWMbFe8vL0Qp8aO3Wh8D2kXESfqQ+aF/bnx2UMf7PiGdaTZHcaeFduRquz26zV
 4d/g==
X-Gm-Message-State: AOJu0YyiYCJJpWUaDrUjrOv+dX/SHokQnNhlCdLmZ+MpfwYIALaaZPZ6
 wmTJKuq2SPhggmna18bIkdYBONGwP/HCHihUCMN/ZAslronN+5zTrNJaltN5ZFFrmzTjYYqmSpe
 /3H5B
X-Gm-Gg: ASbGncuDPMNC5O1dwIJ3haxCEXJeEqWvOlIWS9KLyy+X0ybEiEWvFwKMG7DvCFJmgKX
 eowjuhjus5HdLVHJaCUz2aPzUwvJyQqyAHU5tzKc1HBegTDRgNOX8MO09ofHOj56mYRBc0rjjeI
 JnKQvTp7wRGYFEsCAsZw23rX5rMQqKFVV8wuLrY41+7f0GcBvjfWG65KwdmWVUHIXEC55J+Qn5Y
 PWtgTmxYGd5u5p+22ULR0S9Xa+V8BJyB//WBjJ7qEMSFf/V6TSsuv7Tff2dOPWWOVgEGiuiau3/
 uido1X7GuTP8/DYqHeKLYUSSc+wJcgL8wETJt4URqVFfMYcjdlN85Ql01OZ4fLSlACC5P1g45nO
 ncWKC0mykIb28X2ucmClw2nDbSMVzDJQau7V+A+0HJ6yqi4BKo4jChFKc
X-Google-Smtp-Source: AGHT+IH1/FvfPtlSDQPSNVstdkHpFUJzRv0/L+0CFpXr11MiUAwFghkj5sPVc3BdoHh0WzUk+pV7QQ==
X-Received: by 2002:a05:6000:2407:b0:3a4:d98d:76b9 with SMTP id
 ffacd0b85a97d-3a51dc31350mr5136901f8f.41.1749113700980; 
 Thu, 05 Jun 2025 01:55:00 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00972c1sm24258795f8f.68.2025.06.05.01.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 01:55:00 -0700 (PDT)
To: bernd@kuhls.net
Cc: buildroot@buildroot.org, heiko.thiery@gmail.com, romain.naour@gmail.com,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu,  5 Jun 2025 10:54:06 +0200
Message-ID: <20250605085406.343752-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250601204529.787544-2-bernd@kuhls.net>
References: <20250601204529.787544-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749113701; x=1749718501; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PlF3VZUXET0SqN6iWPE6IZFVoRu97xdn2V5+rzsbTE=;
 b=Dcgwolev8OVmD0lZHgD+gMZ4zbvy9PS28H+PUL+scg7VV8i1233yc1l+capGUeGerV
 8NS6aqKu1KrlRpbv6jiRLh+R3q3+n2YwBp/EXHsd/4pLc/tZqccJ+7s/OQCh7z7LC1wX
 OMbmdqVEsdwBrdSxeXLnEL3qFutiY6WlmA8Jg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Dcgwolev
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: vulkan intel needs llvm
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

LLVM dependecy has already been added for Iris but was missing for ANV.
This was required since Mesa commit a512c2a8b57.
See https://gitlab.freedesktop.org/mesa/mesa/-/commit/a512c2a8b572c5da360873320dbbd343c6223cd6

Best regards,
Mehdi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
