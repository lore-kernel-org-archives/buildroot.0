Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548E2C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 207B683D5E;
	Fri, 11 Jul 2025 10:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJwGAD0Jf83H; Fri, 11 Jul 2025 10:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4153083CEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4153083CEE;
	Fri, 11 Jul 2025 10:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 754A01E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2308E40510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0uOxgsl7qWS for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E54440094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E54440094
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E54440094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1317803f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230700; x=1752835500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Up1LJ2CNHdSjcgISNNMZVVD//PZQObsHbBxx2MKc8Xk=;
 b=M77zba70r/8XzuF1aUKWx1Jy9Zevg4mtcRlAwyq7q46SrP/IzMlkdSIT9YtzkwLcJ6
 YW/xk3tfeCzUGl6tjJnvVvqep9HytQ+W5dGJ68CRRYcZxjfKNSQZcrtFZGxChKSHmYTa
 iG/HkLoLN8+VIuTIVmhdD5q/DIdAbSpMutWzIZp9eI1jXkfE9a8yT2jlePxj/xWfaUam
 +Z7lLP43/u1tj1BzwWpPTwpD4TVlIJ2hCU3Qim0av7bh6YDiHFtLfiVgrTnOD97eWmGG
 Ks4KiEr7PdClOzDBJaUjdsjS/NTeWNF8IZ+tzPh1su9LBTsUMS1GOc3unFlLE9/WzTUn
 dUcg==
X-Gm-Message-State: AOJu0YyzVwFua72au3i8HHOPOZCPR2AA30FsH5uzBxgNbsNoy4QA/to+
 ifXE6oQtobdjSiHKflxHV3Z34hs7JXhfejNOzmE9y22vBySOOHmYzLwOdHqCPpIQhoo=
X-Gm-Gg: ASbGncudqngv+zqBNN0t+zYHmphHl4FF6/py3T9iz+IlgDJ64j9jRduI9XMzcMFg95q
 UH+cNjn5RB8RkaImxrliVXLW9A5Tw1pqVCCsree1eEGz/u6qQN0nLlAN3slyREvKCOy94LsIMKS
 qfWb+Yngyp5KZM4V7afNaLS976XKgW71Aa0RGsYe7uQQCknv/C8xr4grX7fvn3IDPErywvqSn1v
 8lWq/lMIQBiZoUBhVgYHHW0gdEkPgPqKJ6sx2NeT/OEEsNpyh758tteCrhLfS0P2xCav6PoYh1D
 COQ0XziDI0QFmR2cyEwgpGRog448nskn0YJkuurcwUXBa6oc43kLEPrHkMRyH12urKEsMAvFHO2
 /h7sdXZZ4Ov6549VPC4ZTVmUN
X-Google-Smtp-Source: AGHT+IEV9SSsDMhMZd0iR7vzgygw4VHgkiyYFQzaFqDo9bkxtJoLPLPzcOOLzoYByvq5eFd8NbkVew==
X-Received: by 2002:a05:6000:3108:b0:3b4:9ade:4e8a with SMTP id
 ffacd0b85a97d-3b5f1e8f62emr2586863f8f.21.1752230700079; 
 Fri, 11 Jul 2025 03:45:00 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d867sm4178656f8f.61.2025.07.11.03.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:59 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:59 +0200
Message-ID: <20250711104459.824301-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703200917.4054251-3-thomas.perale@mind.be>
References: <20250703200917.4054251-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230700; x=1752835500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Up1LJ2CNHdSjcgISNNMZVVD//PZQObsHbBxx2MKc8Xk=;
 b=ZMdETGQ2HE5S+7buiFQID6xXkhe44autFf5eGMVU0caNU7kh3kERBOPOQkOFJjydps
 OiBoK+F154KkGR8/wd2+UvlJkvGbY2r/R8TyxYeTQKhBxOaIOpBCx4JBtvEKUWZhyevE
 S0Q2grZTm5lhAnrOD6a3vuJLgSIKk1m9rUkFwrpAj1gFyzG0X3K3mMu6Tuw0TqFPqWRU
 ToVF2rPFdKWSUEYm7ysIxtaNTshAbEOtLRBJZUOsk3pJGiHpMPaoLcCdk3SDujiY2aLW
 k1Cb7NpySKQnS9z3zbvqHWTVrDFtP4oTp5Evr72lfaXoirs5oG71ieZ6PBkqaoQSux7P
 L/1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZMdETGQ2
Subject: Re: [Buildroot] [PATCH] package/python-future: add CPE identifier
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
> The cpe:2.3:a:pythoncharmers:python-future:*:*:*:*:*:*:*:* is
> valid for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/6E3F033B-5565-461B-8450-D23E68419313
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> See for instance https://nvd.nist.gov/vuln/detail/cve-2022-40899
> ---
>  package/python-future/python-future.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
> index 698863a13d..6276440c40 100644
> --- a/package/python-future/python-future.mk
> +++ b/package/python-future/python-future.mk
> @@ -10,5 +10,6 @@ PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/a7/b2/4140c69c6a664
>  PYTHON_FUTURE_SETUP_TYPE = setuptools
>  PYTHON_FUTURE_LICENSE = MIT
>  PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
> +PYTHON_FUTURE_CPE_ID_VENDOR = pythoncharmers
>  
>  $(eval $(python-package))
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
