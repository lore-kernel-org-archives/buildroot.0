Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4054C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A54056148E;
	Fri, 11 Jul 2025 10:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8szareALwI2; Fri, 11 Jul 2025 10:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99D966145F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D966145F;
	Fri, 11 Jul 2025 10:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6F91E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D35A040094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cn4-lEKI8ag for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF83F40251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF83F40251
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF83F40251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so1306101f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230691; x=1752835491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91qdC2Nu4y71yUJ4kyDWfS4oq5ESwSt7A6zKhwWicdw=;
 b=IKrQwO8N6u0S2VSpHaaRplw4rzQUcMKhfxUWHAQC4aXp9RjlWSBCQ4wFI8/1XYt4+U
 nxh1vkaqD476khpgvaXWztP+x/9wMCbjPBZsaWhJSS81th5N72Sy3Ue8vHaxz/cOtzXT
 SIRopcy1ubpuop3WSe9aAobJxTi2TaeQZN0QIZzq2QEFuILj5dz7Gjsi09KaE7Wk/tP4
 tp9dfmWsMxTfP+zYtwwSKUpZwdAeY00WZGSmx+iJJsRLwoi9jSM09Apb/Z3hwP6fusCD
 Jt5N/THI4wnoeE91gK2BGP0DqFC+W85EOvpxWUNjijZWwUKkBbFpyUqqkk1q2YqtZj6J
 rD2g==
X-Gm-Message-State: AOJu0YyEBH92k6urcsErgWzMaV/FKyYynZ3I6rZbu+jUX7WCmYl4YQko
 RYn2rorKWWKUahcoCxF/hEtt4aXQG+dgR57if7rOwlYrTAhcUgajn/szakHos87A6ZjusRUAFkg
 lTmJ7
X-Gm-Gg: ASbGnctVLIaYxcJ5vfWJpzt+LgnDEHE2mNC/8Y7Jyva2rrl7kGmjfjE1oZcHjHdmTA1
 tKwEuHGIlx3EavB1hHxMekwS8RNzLHcdYRTfPGmRhJWEqBas8+DpTqYdSH1m8cLXa2cfYat0t86
 Y/ZnE100o/y5eckhGDd5eCZbhsj6BWOA7eqSGnrOuMtymtdkSbhT1eUkL575P2IYNguj2dQ9hxH
 Ctjy8KtSOCAgg13DJSiQ/oWJs/bUfC6YpP8yKVCPDcad4f5Gjxp6LHCTofCCelAnJlK8MkuA8HG
 TpdLi/eABegwSodS8gL5a2MKQWz8gYCkCQzk6uj7sC80hPg+gak3pdppHnfsyNpsHUA3itjb6rs
 ly5tNswmpBsRgoQ==
X-Google-Smtp-Source: AGHT+IF2Gu1JRnyUUI6G/IoZEBw8trFcZDY9WSphgK8t1zh//IGhQoun+a2b9AbRVt1mrEIEDp5VOA==
X-Received: by 2002:a05:6000:40cf:b0:3a6:f2da:7fe5 with SMTP id
 ffacd0b85a97d-3b5f359996cmr1315250f8f.55.1752230690928; 
 Fri, 11 Jul 2025 03:44:50 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dfc6cfc8sm35786405e9.36.2025.07.11.03.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:50 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:50 +0200
Message-ID: <20250711104450.823877-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250702162213.2989909-1-thomas.perale@mind.be>
References: <20250702162213.2989909-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230691; x=1752835491; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91qdC2Nu4y71yUJ4kyDWfS4oq5ESwSt7A6zKhwWicdw=;
 b=d9FxHrM+bBpNWvpP4MjykK1OcFJX+5HMZYHtWVSD/KRMXuxSTmu0MwmpCjTZp/gD+c
 sdFLfXYAbeg5zGVN/eNJPXd7DGi+Hs/OHulultzgcijnGjOaNjyMg3Uh4WbJAxtn8A7G
 PSCjhPLhiIYxD/xcYVuwj7QpIs0RzF96HBEOPBR640iWWbA2xe4QM6bpOKyvlVt0cK+C
 9F1NB5Criep7N8Sk+pD73dwSxI8tihDtBOOo0juf+HM1fGc/YqFiKAbdIMoxG9eImdjr
 1jlyYFDvRuD5e+ZG6s6c70VgmcwUxEIty2q4TI+dYCyYEJnBnHT2NZ/7HdrazntdgTZF
 gqZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d9FxHrM+
Subject: Re: [Buildroot] [PATCH] package/libp11: fix build w/ host-gcc15
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
> The following error appeared on the autobuilder for host using
> host-gcc15:
> 
> ```
> p11_attr.c: In function 'pkcs11_addattr_bool':
> p11_attr.c:126:25: error: expected identifier or '(' before 'true'
>   126 |         static CK_BBOOL true = CK_TRUE;
>       |                         ^~~~
> p11_attr.c:127:25: error: expected identifier or '(' before 'false'
>   127 |         static CK_BBOOL false = CK_FALSE;
>       |                         ^~~~~
> p11_attr.c:128:44: error: lvalue required as unary '&' operand
>   128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
>       |                                            ^
> p11_attr.c:128:52: error: lvalue required as unary '&' operand
>   128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
>       |                                                    ^
> make[3]: *** [Makefile:646: libp11_la-p11_attr.lo] Error 1
> ```
> 
> This is due to the change in the default C language version in GCC15.
> 
> This patch backport the upstream patch that fix that issue by not using
> the keywords.
> 
> Fixes: https://autobuild.buildroot.org/results/da7/da71db9b04f181b9d2e72df73ac8541709f5a1d4
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...ange-bool-attribute-true-false-names.patch | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/libp11/0002-change-bool-attribute-true-false-names.patch
> 
> diff --git a/package/libp11/0002-change-bool-attribute-true-false-names.patch b/package/libp11/0002-change-bool-attribute-true-false-names.patch
> new file mode 100644
> index 0000000000..d63ec74590
> --- /dev/null
> +++ b/package/libp11/0002-change-bool-attribute-true-false-names.patch
> @@ -0,0 +1,67 @@
> +From 89ccb1f097f56a0933f881af051422b8d67e457f Mon Sep 17 00:00:00 2001
> +From: dlegault <dlegault@blackberry.com>
> +Date: Fri, 2 Sep 2022 12:01:23 -0400
> +Subject: [PATCH] Change bool attribute true/false names to _true/_false
> +
> +This prevents conflicts with true/false defined in stdbool.h
> +
> +fixes #472
> +
> +Upstream: https://github.com/OpenSC/libp11/commit/89ccb1f097f56a0933f881af051422b8d67e457f
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/p11_attr.c |  6 +++---
> + src/p11_ec.c   | 14 +++++++-------
> + 2 files changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/p11_attr.c b/src/p11_attr.c
> +index d425241a..a420efad 100644
> +--- a/src/p11_attr.c
> ++++ b/src/p11_attr.c
> +@@ -123,9 +123,9 @@ unsigned int pkcs11_addattr(PKCS11_TEMPLATE *tmpl, int type, void *data, size_t
> + 
> + void pkcs11_addattr_bool(PKCS11_TEMPLATE *tmpl, int type, int value)
> + {
> +-	static CK_BBOOL true = CK_TRUE;
> +-	static CK_BBOOL false = CK_FALSE;
> +-	pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
> ++	static CK_BBOOL _true = CK_TRUE;
> ++	static CK_BBOOL _false = CK_FALSE;
> ++	pkcs11_addattr(tmpl, type, value ? &_true : &_false, sizeof(CK_BBOOL));
> + }
> + 
> + void pkcs11_addattr_s(PKCS11_TEMPLATE *tmpl, int type, const char *s)
> +diff --git a/src/p11_ec.c b/src/p11_ec.c
> +index 4fb4efc3..16e3b3af 100644
> +--- a/src/p11_ec.c
> ++++ b/src/p11_ec.c
> +@@ -590,22 +590,22 @@ static int pkcs11_ecdh_derive(unsigned char **out, size_t *outlen,
> + 	CK_MECHANISM mechanism;
> + 	int rv;
> + 
> +-	CK_BBOOL true = TRUE;
> +-	CK_BBOOL false = FALSE;
> ++	CK_BBOOL _true = TRUE;
> ++	CK_BBOOL _false = FALSE;
> + 	CK_OBJECT_HANDLE newkey = CK_INVALID_HANDLE;
> + 	CK_OBJECT_CLASS newkey_class= CKO_SECRET_KEY;
> + 	CK_KEY_TYPE newkey_type = CKK_GENERIC_SECRET;
> + 	CK_ULONG newkey_len = key_len;
> + 	CK_OBJECT_HANDLE *tmpnewkey = (CK_OBJECT_HANDLE *)outnewkey;
> + 	CK_ATTRIBUTE newkey_template[] = {
> +-		{CKA_TOKEN, &false, sizeof(false)}, /* session only object */
> ++		{CKA_TOKEN, &_false, sizeof(_false)}, /* session only object */
> + 		{CKA_CLASS, &newkey_class, sizeof(newkey_class)},
> + 		{CKA_KEY_TYPE, &newkey_type, sizeof(newkey_type)},
> + 		{CKA_VALUE_LEN, &newkey_len, sizeof(newkey_len)},
> +-		{CKA_SENSITIVE, &false, sizeof(false) },
> +-		{CKA_EXTRACTABLE, &true, sizeof(true) },
> +-		{CKA_ENCRYPT, &true, sizeof(true)},
> +-		{CKA_DECRYPT, &true, sizeof(true)}
> ++		{CKA_SENSITIVE, &_false, sizeof(_false) },
> ++		{CKA_EXTRACTABLE, &_true, sizeof(_true) },
> ++		{CKA_ENCRYPT, &_true, sizeof(_true)},
> ++		{CKA_DECRYPT, &_true, sizeof(_true)}
> + 	};
> + 
> + 	memset(&mechanism, 0, sizeof(mechanism));
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
