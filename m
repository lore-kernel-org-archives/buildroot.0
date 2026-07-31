Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E92C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA6F60AE2;
	Fri, 31 Jul 2026 12:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGeFxQoxFJV7; Fri, 31 Jul 2026 12:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50EC760B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500517;
	bh=GE0xpEKR7nNMQ3CXLIIQzl1/dtdXOVUiiE26iVB7s1M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iQ/LLPnXNBiZchocbZE/llUOKUJdLEhdi5bqBDDDA2aGOCvVoHKhuYdcRoWovcQkB
	 fGuO+P9nV88rO1ko/ZP1FpAcFOFCLr6gwghsKtYW6PsnYwN96sBvxQkaPeD4MnHtBL
	 7kj7J6c1pqjuieKNWeWPs55sxEMQ6vwU0OUrZ4/P8DUT/2Mq/sc2kyiZs1wsV2IFzx
	 xolEcqrBOqRQelTCanEvTZlXShK/Or+mf1rvpDrwnUIP0ZAGEHkxkVs5q+AgJSkDQp
	 UAD3dXipX84DDH6ZeM0yQ4HcH4JnolXgmZtWvhSNmZbLSFnnRt0rBwoBz0uVTbPKCe
	 7Kv9XRZ/1+mZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50EC760B4A;
	Fri, 31 Jul 2026 12:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F68B36E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9232A40FF0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnU-Faa6M8qH for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86A7641063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A7641063
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86A7641063
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a051b737d8so1133897a12.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500511; x=1786105311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KcPWSov3Sp2Th1lea3jGDgVfyvfC/MTaMIy5u8Qe0Dk=;
 b=AMTmPWKHD3CxPHwNPvOisDeupp+QlNAQYyV4ss8wDvsyKrihqnClyBeSYPEMKRJJFd
 +1znqhXEcBPa+xGjWN/zd1h7DJJIplF4sa0JOA8oIzSqu+oLG3XEC3SXuvGiHrDMcHZU
 8LKDEzR30EpzPeX5KX3wievrzouiUm8LP/4fbEbqAuNBntnER3eimvc9Vi/7CjBAfrtj
 5AmIstneJNreiy1UFraRAXMrCGA0pR3eRa1OTZXEguKAbhCcWj/kVdWZ8Itd4X7p8k8I
 OAZo2ApECJl7lXA81lDcS+LRoQ4q7YdDFX7/VS4695JuK6DKcU+DieDJI6zsCPjvDLQu
 U/tQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+UN3/7lWB/wgwaO+KFcm08lcNVTMNHuvhxXo8NX2JX/FuAvoABLTR8oh2N4eu68bkcW8tA9N2Ehw=@buildroot.org
X-Gm-Message-State: AOJu0Yyf+3T3KAsK+JN/NTQwMZOLvWmmJceNVD8c4HbV2MnemkDCDbhx
 T8zD5Siu5w0LT70wOkHJc7JiMVxfJP2Q0IkCcXu8UHwMt3Xa7Hj0cIIElu9PHEjCLM4=
X-Gm-Gg: AR+sD10/IuZqo07rU25vPvqSjVl+jCbnIlKlTkfU9QDoyUiO76A7B/h+1G56zjwwccX
 luhPopE/Tu98SjY03TW7Tuz8Jb01sWE6Ywy4RFqWyy2X10d56PDFekZ6U+O5PDuk8SrcmODmT1g
 A84AiVubVxJgoYSYinKU24TcMLNWhgLeDdt6G/XtC3w0hTqHVycaJIYpBkHxX0S8l0EHZQulXH4
 KUNTffDtDZH4S+/5KKJl/dOmYflkN17T8SxOaVct4OyzzHST34cWvCbbpsxq0wqTWzlW7EDSSIu
 14ZwhclZ3b1GFb004nYLFx4MIGMdkpFyu9KjyD94Nd79UTKQb2f23Eg7Iwz5EvzAhwtOxlYXa2B
 DJekUlDFgMoOct8Wklr7/BpaJtHXoc69DCzAiCbMUVKpSgTNkB5HrlhnQ0S8ps8+mU5J6tQKFHs
 Iqb5swZEPMmOaPIUMRUK5+JnPRORmUQhqyugQ5La0tOzcgg3HaYiFJ395GSWVYrD6+YlVTAjaGH
 Q8t6OeSALHjBkFhS9eJpw==
X-Received: by 2002:a17:907:c007:b0:c15:a1e8:c141 with SMTP id
 a640c23a62f3a-c1fd2346fa9mr110136866b.30.1785500511304; 
 Fri, 31 Jul 2026 05:21:51 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41cf404sm4383773f8f.1.2026.07.31.05.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:21:51 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:21:50 +0200
Message-ID: <20260731122150.155418-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <918f048da1962f22f91b05a79e7943797a33729e.1784526139.git.yann.morin@orange.com>
References: <918f048da1962f22f91b05a79e7943797a33729e.1784526139.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500511; x=1786105311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KcPWSov3Sp2Th1lea3jGDgVfyvfC/MTaMIy5u8Qe0Dk=;
 b=HoYpxftNBZovVoQoiJ3ZNw9WKJ20NN1Z/CsHCTKhxEiL1/J172Qi/LbqzZ09LI1FCd
 8kQ6QkLlPMiOA3/ujY8oB5sZPcOIBJ3xV1W+x2oN4nhYgzbYOBt880SmLrvaOs4uhnXT
 Obrb1fX2cNymwOKZW8LL8DVj3LwRTsuFWQxMusare9Y9f0MjGDQpj23fUug1DKU/NBWm
 JzY+KM2E6z4r+KBWKxf264ic+xTuBdUi5ZU3bLaTlSoOPPrCEJzdGn4dY3ApBjiSJVEf
 vCuIrZ5nQ3gcx67XsPuOtEGjgCjxa/K5kXTB31xQrSmr09UR6rTLS09Raf++GEIYB2xm
 o07Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HoYpxftN
Subject: Re: [Buildroot] [PATCH] package/amazon-ecr-credential-helper: needs
 NPTL
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
> amazon-ecr-credential-helper calls pthread_getattr_np() which is only
> available with NPTL; i.e. always available with glibc (where it
> originates from, since 2.2.3), always available with musl (which has
> had it since 0.9.10 in 2013), and only available when uClibc has NPTL
> (since 1.0.0 in 2015).
> 
> Fixes: https://autobuild.buildroot.org/results/4e6e13f1161485b412d4601cb8972a1524ddd2d6/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2026.05.x. Thanks

> ---
>  package/amazon-ecr-credential-helper/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/amazon-ecr-credential-helper/Config.in b/package/amazon-ecr-credential-helper/Config.in
> index 93bfb51e4a..2efda5cd49 100644
> --- a/package/amazon-ecr-credential-helper/Config.in
> +++ b/package/amazon-ecr-credential-helper/Config.in
> @@ -1,9 +1,14 @@
>  config BR2_PACKAGE_AMAZON_ECR_CREDENTIAL_HELPER
>  	bool "amazon-ecr-credential-helper"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
>  	help
>  	  The Amazon ECR Docker Credential Helper is a credential
>  	  helper for the Docker daemon that makes it easier to use
>  	  Amazon Elastic Container Registry.
>  
>  	  https://github.com/awslabs/amazon-ecr-credential-helper
> +
> +comment "amazon-ecr-credential-helper needs a toolchain w/ NPTL"
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
