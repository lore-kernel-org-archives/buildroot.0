Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EFEC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0855060B4E;
	Fri, 31 Jul 2026 12:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m5mWN3tU9di; Fri, 31 Jul 2026 12:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F88760B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500519;
	bh=+ZJ1EUrsVetyKnffnzQv22ARSIPu5CaRPbj4xAAO2gQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OthzTwd1T4SeiGrvMre6Qtw9NC4/Ci64TAl3N2J4CoMfWIFG2yY0kqhyNLZ0jQXjO
	 66ixGo5yL8oofER0bk5Zb8wYT3AkBFuu0ltGJOKh81Scc6HzUBMufdAAvcXexALGcG
	 fnkOkObseqI3+er5wxdnBrcbfAnsDSgNYpUC1It4KWqn1Xg2nhQOn6MS8oyUip9ODt
	 7DyT56KjomyNt99NJ/y4DaEt9q2FZ1QYzb4fuQ/TcKNMvF/+4ChuQXzlAfO36LP5a4
	 ahM/ncXu7wXH3T7IW00oRLKo13WaS0zKSePO2+haV2tiQEoaa+htPHjirySiyr36n5
	 S5yn13mQq+WoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F88760B71;
	Fri, 31 Jul 2026 12:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 562E12E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 482F740471
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bdV1M9Cse7Q for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16D2A40463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16D2A40463
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16D2A40463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so655860f8f.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500512; x=1786105312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aZN4IPNdjOVJvDUNU5VFzZq8mgFO8oJKkYWcK9bTjSw=;
 b=ZefE0xrTrXKUiQISMr2frAyLHpNksz8N8mvBoX9562Mell16vSnqJGTjbLcCnnBSi9
 ss8t590qqd3zjOXBOTBk7MKISFIwKkBKUqeEzSrYZa4GdYv3oCEVCwyyNTTEeTGrpqFY
 EDrYSUF7YimZe5gJLRnPEsRN8fjktIKlFwnmyIyZ8s8Gs0XhZFRSHt3mviM8vhcPZXLE
 Nhb0IkKowGhRx/l9AHaqvKFgMOvU21eTmLRXRj8a+FtDEN0x2+hKvZ5nfystg1G+4GHB
 Inii47ftSoM7fHxZKgQMa7fYSfxPUbf00O+utjL8II8o/oWYVCyKbC+CrnponohD3rrN
 ebmA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rra2BDYDd74TZEn82eZqkATH/B+zU1OpOnza4K6rFoYN1sPXrFhv++xim7l4XBuoIAxjrBDwJhMz5U=@buildroot.org
X-Gm-Message-State: AOJu0YyHyYjTW7IttF/q0M1yO7R7AHkCkAhYS/TOP1H/KorQ/RmxmAPH
 nrXeNHYPc2yn1WxC3rWEya/mnQUDqdhf/s4beh36O3k6HdmwIFY3JmH5+xFyNI6n+IDkczdTxhC
 vcM4C
X-Gm-Gg: AR+sD12PHM8ZvmhfnO3zJiaxNvQa1lqxfKeQXoz28VXbisucJezmjFAmzsNT4DQJIM8
 TwONXVkp6LnmWQKbxjKZhukdbap4a//cIx3s5kkha0OzfcLynXPu9TO3oa6S6Mtyi27vs6nQ05p
 dRZNIzNEfIHDTZHaO8qcOWSnKJfh6w920jCmy8OUARZyFyazeWM2EPe0Y+JJuC0lSPqXTwDlrvZ
 oFZlB1rxGjcmV0A7X3Y6XhsIgJS9xUMLuThr3HWa3Vt6msYgXzoOkdHyJDTFNKn6TxxPTFwz69B
 dogQWVI1E2wZzg+1q5cOMpdHogVWuC6A7H1UihEQpnNL5N5qhhsuyuTdFGuw78JtH6/tzswvGb4
 QbaJONBPbkKVAXOB4+8MfpBq5leFI/FVpeTONDly/97yrRmaKeccFhV1jkjxIZ7LHydDCjPs6GD
 nBLj35UAq7Cv7vwetlAO8cFOrXO3CU73MJUWihx6vbzC4i6QOR6QDYHHbx2spVXbIqhugemNlDr
 1x2u7V4ND55XKRMADL14Yi+0ZQAZyQK
X-Received: by 2002:a5d:5f05:0:b0:47f:8ac0:ccd3 with SMTP id
 ffacd0b85a97d-47fd2abb4d0mr4184169f8f.2.1785500512185; 
 Fri, 31 Jul 2026 05:21:52 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd42d91bfsm4746816f8f.15.2026.07.31.05.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:21:51 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:21:51 +0200
Message-ID: <20260731122151.155473-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <81e1623bc37fdedb5cd3e4b9268fa03b45af65a6.1784526170.git.yann.morin@orange.com>
References: <81e1623bc37fdedb5cd3e4b9268fa03b45af65a6.1784526170.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500512; x=1786105312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aZN4IPNdjOVJvDUNU5VFzZq8mgFO8oJKkYWcK9bTjSw=;
 b=US4KydcWzsnRXgc7mnw7376WpjtuAsr1sGLJpl0k5YQnpMYQ+CxF+oeuwMItH8IAL3
 N+0IHXm2X93ceBNYu2Sa2+4Qkmcq5Zwle4ps6SelOoQDpiEQHvUr8Tb3krRsmviGOwWZ
 vGkahpC22yxoAJR+lJ5kwgcIBZtbeARwg3OzJdRmf6iCIZbp8ssKabj+NNojzEFzuSiT
 yY6hzKqE1lggmkHyNdrMvhxfX5SUGx4aKnDSyqNZlpkWbOfuMMvdNk2l5i1kLGm3Fz15
 CujhKWm97gRjRU8aO4XO1+bN79I2MXFijJIxC9itDsC4fiT52MKRZDMFCOOD5lobO/rS
 gT+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=US4KydcW
Subject: Re: [Buildroot] [PATCH] package/docker-credential-gcr: needs NPTL
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
> docker-credential-gcr calls pthread_getattr_np() which is only available
> with NPTL; i.e. always available with glibc (where it originates from,
> since 2.2.3), always available with musl (which has had it since 0.9.10
> in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).
> 
> Fixes: https://autobuild.buildroot.org/results/3ed18da254082b7823b49be4578274792bb7380e/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2026.05.x. Thanks

> ---
>  package/docker-credential-gcr/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/docker-credential-gcr/Config.in b/package/docker-credential-gcr/Config.in
> index 1b24ff0e59..6845d5e198 100644
> --- a/package/docker-credential-gcr/Config.in
> +++ b/package/docker-credential-gcr/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
>  	bool "docker-credential-gcr"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
>  	help
>  	  docker-credential-gcr is Google Container Registry's
>  	  standalone, gcloud SDK-independent Docker credential
> @@ -9,3 +10,7 @@ config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
>  	  eu.gcr.io, etc.).
>  
>  	  https://github.com/GoogleCloudPlatform/docker-credential-gcr/
> +
> +comment "docker-credential-gcr needs a toolchain w/ NPTL"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
