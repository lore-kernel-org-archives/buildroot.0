Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0C8CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C664B843A6;
	Fri, 15 May 2026 13:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIWqH1qaz1yg; Fri, 15 May 2026 13:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E04843A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852074;
	bh=NHAhloJr+5ausUrGjBhsN2MeCOJQfbBDWjG1JTc3Lqg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VxyqIZOPzWqbH5Yh8sLXX9ZHPHrpx1sRmvxBdqVbsDDyxrNSCYesR2U+rqbZY38Tu
	 0DDuhUUSXqzlsOvqKBSEBh/+x7sAKDdq1AULM13FH2FO1k2p91qLofkCf6GpxBuNoz
	 bnlzhKMUhSc1UGjc6suiLQOZLoLbCHjXh1ix7+4b9GRzYs/unfQKn2Bn65Dk0seXTw
	 hYWEdTi3M8W83QbYz5apHD3Y03yS7wGEH3wd0I0yUBbZ8yBs1LfVz31OFRiBAWq7fd
	 M9tYMTptGE4+rAgeWzd149N61M4tbTmKkLDDXfUFLC+BOWhbM5me3XILc4NiyvQqiD
	 wAQvnm79M814Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E04843A1;
	Fri, 15 May 2026 13:34:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61FD036E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F3E40E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_MqNqS5oIad for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16E3040E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16E3040E23
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16E3040E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso82661155e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852063; x=1779456863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0urC/aZQlY8cIDE1j0ETtRpYjrCkZBIzVXzmYvpBN4Q=;
 b=EV1oPnDJusrbQ37CogsUZgpeFkVhj4r7dGwNTMx+lL8re8efak10c80IgGkvCuXT5+
 iH0lgZuzUOmUF13RGRhSPZ4dvf9+NWrIZVJsntIIKpgLUJNXJZcpgbUWuO2LEdmjFp3X
 MNOIowgVgw2gm8BBgoCUY4PJCkE5kOV+xc7pKYaeYu+L5t8lsQcndbq1rtm89S7T2kJk
 tLPlotOuhof2G078Bv8faTYAWCA5vZhpg+oWkOpkdtBeD9RIoTxP8XTV6cOogsVMuy+L
 3cWsp5j3N579xo3gzjefBIAbN9UNgjcl25a0x5iAPoX11JB64KH3quoNK3hFmOpxbmzr
 BXyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9hrBljvVqCQIgPPKR1u13OlQwBccQH8t3jR0fD530xtyIquBVCrXgPJ8iHGEEEWtHpX5qGlTUEQaw=@buildroot.org
X-Gm-Message-State: AOJu0YwgFgnwMZC/ysxXl+CzkQwTVtg4WLojkr1u9t1qgdPjgK77DccD
 bChcER3TG5HlU7F8ETMs0ErA1aSLUzFMKaRk9NT6v9PDdtSrYBzFkroMmP+atM4GXDg=
X-Gm-Gg: Acq92OF3KQwZ+lqV0HjZYaCSYEbkQf9F75oxkRWvBGQflooGPvChfhPxSbAI3+kUiFC
 +wbbT4dFXHywlST66796YXVDKEAUrHPgVxoqrWiGV57yzPUWuzmHZ31RvOFTA4Z7uosY3AGCil4
 rQxD2g85CbUJP/sIej8+B7tplAcQZwgjD9Irsrn9tUvl7Zl96R/cVgR1qnZDwOKBLjGcKKPWh7s
 /6/P7FqkzfizDnlLVU08Pyy/Kon39QhGA8gUsurCC8D/ZNSyVLINIR04HAymXRAUxmCmsNXNmxg
 O0sOwD7zMbvLiOoBxajwdBFIRfXaUFDc1/LzAqUtAq/Bm0N1shNh/szqBvBXvlv5/0/IaJj358y
 4Nu2jzz3tXSiSEOuHFZHGGitcsWmu7+Z7PazPgRsjnA+k0oRDD0kzrON80RS4J4Ywcd5soEVVfJ
 FZZBAXgqsUAZ+JfDJY3SV/B/wSK+BONfZPJD17U3fVItzpzFUAq2IKGBY=
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id
 5b1f17b1804b1-48fe60eccc3mr53410595e9.13.1778852062981; 
 Fri, 15 May 2026 06:34:22 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaf0fb46sm15920745e9.11.2026.05.15.06.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:22 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:22 +0200
Message-ID: <20260515133422.317096-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501123100.1918951-50-bernd@kuhls.net>
References: <20260501123100.1918951-50-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852063; x=1779456863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0urC/aZQlY8cIDE1j0ETtRpYjrCkZBIzVXzmYvpBN4Q=;
 b=HNxeQhUJ41l9gckNKRpi0zCszqKKGJqtxei/h25sAtyNBzT+qrBYKUZa21fZfAO/LF
 k4PlLcder0nzZss83WDyqmASHyoUWwrIBZyazf6JjdWxG00RoHfHfnRV+kgQ+spSO4Vm
 2ZY4hq8HCHFovtvaWoxJfJuVJHqZob+Jxvytv4H4bszTn4IFck78Q0UGkZVWs4meD0Xd
 trcSKPAKkxQ0mtryh4NXZdQ3i9h0KLNMJlz3bSsZc8mv5aPJNQSYJbAJuZGPKt8P2U9n
 ebp+mKxhuqLPHzN/np+WaavJhQQqkd8hRho8YNTSxpjvfJWfQIlXIcEU7ueAtcVywefW
 NzlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HNxeQhUJ
Subject: Re: [Buildroot] [PATCH 50/75] package/python-requests: security
 bump version to 2.33.1
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
> https://github.com/psf/requests/releases/tag/v2.33.1
> 
> https://github.com/psf/requests/releases/tag/v2.33.0
> Fixes CVE-2026-25645.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-requests/python-requests.hash | 4 ++--
>  package/python-requests/python-requests.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
> index 1bc440667b..4fda8ea71e 100644
> --- a/package/python-requests/python-requests.hash
> +++ b/package/python-requests/python-requests.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/requests/json
> -md5  cb3d3c58f07cf23f12c345f2c96a6f12  requests-2.32.5.tar.gz
> -sha256  dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf  requests-2.32.5.tar.gz
> +md5  ebc3b42b51c6245524345d170e5d4c50  requests-2.33.1.tar.gz
> +sha256  18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517  requests-2.33.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
> diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
> index e5aa7006ee..3af00a7b9b 100644
> --- a/package/python-requests/python-requests.mk
> +++ b/package/python-requests/python-requests.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_REQUESTS_VERSION = 2.32.5
> +PYTHON_REQUESTS_VERSION = 2.33.1
>  PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
> -PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4
> +PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/5f/a4/98b9c7c6428a668bf7e42ebb7c79d576a1c3c1e3ae2d47e674b468388871
>  PYTHON_REQUESTS_SETUP_TYPE = setuptools
>  PYTHON_REQUESTS_LICENSE = Apache-2.0
>  PYTHON_REQUESTS_LICENSE_FILES = LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
