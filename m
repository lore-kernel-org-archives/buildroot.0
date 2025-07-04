Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF78FC83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8494983DE2;
	Fri,  4 Jul 2025 06:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftmnCQPuE13t; Fri,  4 Jul 2025 06:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7255283DA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7255283DA1;
	Fri,  4 Jul 2025 06:47:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A87751EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 987F240FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nel-E8Ltj6Im for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B114340F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B114340F8C
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B114340F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso504163f8f.3
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611619; x=1752216419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWAioYCWhhQyOoqYrv8/gEYfSCTrOy4ACpYM/PnJ364=;
 b=xDXJi0KlnGrRvXZf4/7qnd+qGDIAMVzz4Wuqh7nQRDHYict+drazquEzNNQwTcUaEy
 ycNUQvaoIzzrXCcODg5RtDhf79sshr3z9E2QyD1y+NqM2M0l3nhtwQZdPyz7i60Zjf66
 EiDOJgerRGSxuBEIZFy/fInMX43SiMGsDTkh3UXMtAwtYnq4jirn/qo/QnlaNDTb5Qa5
 MGTIlPBN683hrPFRIsVn2d//qBpL96MnUtSLqNpEvYhcs+zj+UzXiOpdjQI5vNhJ0u7U
 CtN0+e8BPV5c+lH1G4wcfut74OlE4cNe64t5niCunKDZfYJc+C5n8mmsHvZlDgRw84zc
 Rcdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuUw1pUCYO7q05jYl0B5s5FEB4e2Cb32PsjBCcbYhZ3Q905hgmpaQrm/aBaFEZJcDCnc4g+E0QfPk=@buildroot.org
X-Gm-Message-State: AOJu0YymAPYT+keB27KjEbZxsm09+g9cgP0FxWzBM85mbTGo7fSE9IOb
 /EdDip/zI0vJuj6bGHiZqdhd5GU++9Oef2baZW7U0kL3yCH8UdyGcy4CqF5RBt6qlWk=
X-Gm-Gg: ASbGncs0IszeK+yEObxUOJIcmlYhZ5Pj+Y+J3WWIAlowz1/XMaPuPJWLBqCqh3ADPTn
 XGjeeJ0bIuPXpB6UPP9qptJb2eux5cw+VtDmJlGaXCIlTlxKrEZ/V4db9tRscN2CLTOKxDdf0U1
 UBMgSuzt0v55DGEQav5UPe9TxoZQRLEYxNEsThrvJif16nfRud2XZZP+GCTuWhJ/RjKODxOioNy
 P+iFJVtMFkwpaO+m7JhmRCfxBNYvaIdgnH1pqL5sI6do65N9p6FPyL70FMAr/jF1B85fHuc6skR
 2sVCuLq6RE5RWRCrHPv8bQtf4wIfGiVQpnmMrWcYFML8dWeFZpZKOn8xxzJa4NR490dmXcwU0vB
 76ZctorWj0A==
X-Google-Smtp-Source: AGHT+IH75lrX2b8cXI+KhtqjHpuhqgStCMLmRxWApAotWyVwwPM9clTm9dN0KG3dtOCGSh+FO34gLA==
X-Received: by 2002:a5d:5f89:0:b0:3a5:52cc:5e29 with SMTP id
 ffacd0b85a97d-3b4964f36b8mr965183f8f.7.1751611618759; 
 Thu, 03 Jul 2025 23:46:58 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030baa5sm1696745f8f.12.2025.07.03.23.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:58 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:57 +0200
Message-ID: <20250704064657.4064364-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625163106.207083-1-buildroot@bubu1.eu>
References: <20250625163106.207083-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611619; x=1752216419; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWAioYCWhhQyOoqYrv8/gEYfSCTrOy4ACpYM/PnJ364=;
 b=HGo/Htanghkf0jjn3Hg1H120tY9sgPe/CcQMFb1eQarVd5bIzu0q+tiPZBnE65lBTY
 PX/g93PbEc49bsEBV22bzi0k0dmDE9xxXhukBe/ruxLN4/S9yPK/7ZbxwhGgl5ovUc+x
 qrrAzfCfaYgdOuxsbXScIKbQuJhXlfjZB6M28hgUG/RfrG5QvyUzzD45Pii63YcTF+Fl
 +wbWZOblW8VuYrNx51pwaGExRZYq0x2BVChKB4cqVxz1ywQHw4PtKgWFryu7nQ/OGrNj
 OdgkdeADXRQ3coXvMt4c2/SHQs7bwCtQd/HsGmThP0W6RGZtauwo4fZ2VinFynfJr/Jt
 XWxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HGo/Htan
Subject: Re: [Buildroot] [PATCH 2025.05.x] package/systemd: bump to 256.16
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

In reply of:
> Systemd stable versions don't really have release notes, so best we can
> do is link to the diff between the two tags:
> 
> https://github.com/systemd/systemd/compare/v256.7...v256.16
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x. Thanks

> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 976d88c1f5..e16823ca78 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  896d76ff65c88f5fd9e42f90d152b0579049158a163431dd77cdc57748b1d7b0  systemd-256.7.tar.gz
> +sha256  2600db41d9ebd717ca786d754d17699038147b8fddaf15fc935f775a06c0df92  systemd-256.16.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 71fe0de550..bf0f2c1e90 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 256.7
> +SYSTEMD_VERSION = 256.16
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
