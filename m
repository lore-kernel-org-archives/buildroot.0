Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9DECA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C9544052B;
	Sun, 11 Oct 2026 20:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOyZd1nmzeeP; Sun, 11 Oct 2026 20:59:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A89434053D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752345;
	b=FpzNh7WP6qPVghU1tO6FxrWQaFGKxkXdKEr9KgtayLgMbHeHMo2ZeRGONjFnwG6T1uY9
	 a5vl12RURVG4eqgBmZkCrzPnPkXhPCw8EzVJbSOIbFadF6k8aOxk9rgpuuZhZ0phNXKK8
	 3XRL3m7PDenqnbzY0deCgULcjt6E/oTj1VwpxxbkTnxsuhYHAOqjXQov5/FINO4NNQOg5
	 kbsOWIUity29coM5MZZE0f8qG38zYsIwrh2GgXwhBEXjc7N2cuxB+t89Lss1+ooKjlHPv
	 OLSE1xN1hK4tuicJ6DQRB1ZtM6HbyExQoNFzCTn/LEvu5XHbkqg+GRGYfmAztJl7D2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IWMhtL18b6OHoKzUSb1MLnw1seoPNYs3vNTPrX5feLY=;
	b=TJ20ci6jTIBIj54tQfn9hE7LnXwGwdrTmAVplkKEnutUQhbu2r6KVTVf93DEhhPkIc+j
	 9kc1nAIw2c2SMT/xaje5hSfcJzwIL8UDnIjY8vJOLsCjwemPdwb0/j8XJKTCUPwO0+/Nl
	 euojzW5u8OiD+SWkD/K5UDMzbeij+MsyQZMoIkL7FmUvxWoXPx0zyRv+TWNXTLmyhQXeW
	 QmbQpsyUxIfCZm5VxY8mgXsDdiuzVepAq0FBjZ+Bt9TpcmAjEWYrUNQcyln7r8As+7NqN
	 9aTlgdb8/rEsQnCjfP/6WOXBL/N8zGNAliAo+b0+c7cQujayu5TTbqoL1MmfDWgCbfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752345;
	bh=IWMhtL18b6OHoKzUSb1MLnw1seoPNYs3vNTPrX5feLY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hqj+n9CEk8rZyPPKgpbU1suv3xCg6RVz38hkK8u2dCm9d6nFTAmr8u2z8MCdroI2R
	 qhGtbz7BHlJqZo7k4mQ6bnHgJ3cBIw/5U38CS3999I3nAOhLCiZfubo5Cf4g1T8w8K
	 r+b00HsdteZSGjiTe+Yf4uQte4X73k6Auc00JQ2duC7OxFguJ9eWCR1gr7xiqijr06
	 xdPpqykD2HMB7XciMjANPG2SxerS7eAYXxZi2R3svl2fCEw96Ipo48IVk4rom95plw
	 kDZykF3HZeLK4c0d950z3WcbdOj58AhDA3LulmLVOGTM/TET25FS6/EHfiQh/0y3X+
	 I67zprZVzJA+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89434053D;
	Sun, 11 Oct 2026 20:59:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3482B1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26674605EB
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smFppnAey9s1 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:59:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 317B1605EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752343;
 b=Y56/2RFnAabj7b0Ayyi7kt++CegZ33m45ZEs5DfbjAaP4E4nUJF66U4x1fLAU/ozNMVg
 rVF4a0b1y+vuYuJv2r+UPUEevLQ0MugvdzOlfAP53RQkYKyPulk7bb3olSTRvwvqnq/u5
 KpyCP/Y/vzza328o/qI5fZdOSJBzE8TygdofORM2pRJjzcxF6agR+ziWBv/n5RPIObPdL
 4Q5YpJtRvbqIuxsEsVWnQzLnoCQUw06Tkzy1m/AXUp9B37p+WjyqVMPbzD2XeHXRdS+My
 DP5j+4bhaKmonGwPzIgiFcZ/IMJSIuIqRqzvTlsbBM9UYiWVr1VMSIsg5P30EYYxG2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752343;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=5f5qWG9CE3eIWmdtfq1U4KSlDQyDR+s55H77korU394=;
 b=WpFiAU92qk2GQ1rc6xUDFNh78plq160IeEwPrJJzlR6/agMQm5m4VbWq1dWXhvFwQBjH
 iWVcNC2jX1eWe8oL7fROQN2Zoc835japqIfI1Gwfda2pYlNYHZ5HkJWu5DCc5QU11i23j
 F4aVgiU5+4yjQC3XjnNZURHAtjuq1qitUj6vzWAW7iQ+fmvkoldaUJnd/QAqGPf249xf1
 7j5a2HdSZd0D+DPskCpXg/g0+E+fcvcr184szmXPWjPjxgYhRaYKGBOuAXinW9t9dgkX4
 gOYIbqUov7Ok/EV1wzJCF+8b0451StOtcLCNFfVwfGIJdazcVBmOXgZZhfjNL5z5/pw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Awg5IV/i"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 317B1605EC
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:59:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6afafc89b48so1774079a12.2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791752339; x=1792357139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5f5qWG9CE3eIWmdtfq1U4KSlDQyDR+s55H77korU394=;
 b=UD1rI6ZB4G9ptlgPmlu3PVweLclD3ICBhXjmHjbeDAlzi4zszqmuHoIOrjV0gGn13x
 VeBg92rk99l4DJNDPTmYPSdwqWes1m/obkmEqu6QSbD1TBVTdwAk5iXxWOupXY7MGNs3
 /il+1AL5ZT+JLpHxowOqaUvsEqs1XauYzP7JllGtM07lOT7lzMB9MjLHCkETyzjsk98C
 txrDAOjcgCGOwmIYDxylXuXGZRex/Af72B5LEj12o/JXlZdowyMLwgr/ZgyNb5fhhegI
 57xhnw3RsbHHZg6mKyCsI1OyMzI6D5EmuPEVNw59ahD1vyigf99aRHCF237qKtyd3aM+
 jSBQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByDW62rm1ZPPuqpGX38/jg4G11oQLPHHHtciqZNyRHlO0hG3J0IlZLfGHMvhmPoR1eM2yVmSSCtYJs=@buildroot.org
X-Gm-Message-State: AFq9FYILUSmDgXahpuZnSjpQLcVgh5sIfFuBzclDJvkhgk3AcYt35Wkp
 MJZeYbDtnDphh3xsUuBkIWKB+FihU5QMcyAtonRP+VygbBw/xcNVX1z9hMrkNKCJ+dA=
X-Gm-Gg: AYBFou1KRvC0LK91yhbtcVEDUo7KViXMytLiGDtV5VVmEEv0jRNo4AiItQSBfgoFEB/
 1ZFO/2IaZRTPk33O5bNu6JKW2wWJoE6auAzf6Ef0XMnhkAvbeYLnPOaspIKvuIPtVXTV5kPtTcb
 D2Tdfn5Q9CpQGJUPd4ByeNmbtM4j4m42ZN+vY71KI6sF3tO4dQOSUInefdYAAVijdBFsruMfTJJ
 NnI8az2jUrEASvZUrWLZijEzRzb8I/LQ7eAAFbkW9+98LKNEQagD+LbbNKxeV3ZErX6UJT25S1g
 nXkZwo3KZ5ofYPS5VKMFqOwdfCwJf8fK69OH3Kc0FAmqmBzjgR1eITOrzUODStaAx9HQ9qJ7kYC
 yAViX6JRG8X7itk4lrDlJobDSmKOtDsxc+JcIUzdNEv8Gn7C0W5hAZsOULsP4UzkwfYU+v+LkgI
 dEjI7j4QEzKT7S/9RujuadxxqXGru/KyG2u9+sMyNMdz1kYZVnF8L79htJgf1anHULXvQ1gnMuN
 mNQBOM9
X-Received: by 2002:a17:907:d1b:b0:c29:4a1f:76be with SMTP id
 a640c23a62f3a-c31aa013b5bmr870045566b.20.1791752339142; 
 Sun, 11 Oct 2026 13:58:59 -0700 (PDT)
Received: from mindpad ([2a02:a020:5ce:d643:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a68c08sm389848766b.31.2026.10.11.13.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 13:58:58 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sun, 11 Oct 2026 22:58:57 +0200
Message-ID: <20261011205857.812885-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011203230.2072127-2-fiona.klute@gmx.de>
References: <20261011203230.2072127-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/2] package/pkg-utils.mk: include
 external tree info in show-info output
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

Hello,

In reply of:
> This allows identifying packages from external trees, and the external
> tree version allows identifying the precise version of the packaging
> code independent of the package version. If needed, the location of
> the external tree can be derived from package_dir and further
> information loaded from there.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Acked-by: Thomas Perale <thomas.perale@mind.be>

> ---
> Double SOB line is because initial development was sponsored, but the
> current revision wasn't.
> 
> Changes v4 -> v5:
> * Name package property in show-info output "external-tree" instead of
>   "external" for clarity
> 
> Changes v3 -> v4:
> * Add an "external" mapping with external tree name and version to
>   show-info output for packages from external trees (this patch).
> 
>  package/pkg-utils.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 17b0aa1760..454ae376c0 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -111,6 +111,17 @@ define json-info
>  	}
>  endef
>  
> +define json-external-tree
> +	$(foreach name,$(BR2_EXTERNAL_NAMES),\
> +		$(if $(findstring $(BR2_EXTERNAL_$(name)_PATH),$(1)),\

NIT: Took me a bit of time to remember why this was needed at the time and then remembered that external packages have an absolute path instead of the 'core' packages that just use a relative path. Would be nice to have a small doc-string in the top but since this is not enforced consistently in pkg-utils it's up to you.

> +			"external-tree": {\
> +				"name": $(call mk-json-str,$(strip $(name)))$(comma)\
> +				"version": $(call mk-json-str,$(strip $(BR2_EXTERNAL_$(name)_VERSION)))\
> +			}$(comma)\
> +		)\
> +	)
> +endef
> +
>  # _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
>  # for json-info, above
>  define _json-info-pkg
> @@ -121,6 +132,7 @@ define _json-info-pkg
>  		$(call _json-info-pkg-details,$(1)) \
>  	)
>  	"package_dir": $(call mk-json-str,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR))),
> +	$(call json-external-tree,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR)))
>  	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
>  	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
>  	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
