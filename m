Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1550E9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A01A94058B;
	Wed, 18 Feb 2026 19:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXecnnsxOiBd; Wed, 18 Feb 2026 19:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4996406E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771444640;
	bh=d1gwEw0122YO7zLW3BfN9p3MA0jsGxT7zjKnLJwO5YM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OQ6FVTLbEpN34gIXm9r1LwjwQslY3UKEptBnczSrlQ/yFud0zzIFGQ+0t9bSrY+C7
	 uP4edwvInF2DdHQlaBlIfBi5/Y68oWdKVc/kB3wXyoc9rNoId4du8vMlVvYd9cjMlI
	 ppWVnPJtQplJc0Q/WwKKVSBkM8dZgL1oE34zBKHbJNdH+psQRjnrbMLRKwEJA62z4a
	 XoPtVnoELFxv9WlUJL7jmS43TAp3CkZCKFiAX6I4edBh32Qk8xVnm5Ymiq5X724OQK
	 cxNsmJWsXMb/zjLpJXA3Pww0QjBQlzeny9kgHnnuT1TcsNziOdxhurVejItfNOk6Fo
	 aiXztt6rRJttQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4996406E1;
	Wed, 18 Feb 2026 19:57:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1CB8183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A717F81268
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8iLgNUQLzCm for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 19:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73AAC81236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73AAC81236
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73AAC81236
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:57:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48374014a77so2113405e9.3
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 11:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771444635; x=1772049435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ufQNXogzTgEgLC+H8heDYHcPZ4PZDUIqL37Uw0afDpE=;
 b=C4+ixo+W9hhWGb7Qi/XexHxLslsNvmP7B0oklHHIj2Vm+nepHb5rnROgOfUhsd45lw
 hhLHR4iAA5xaDnvJtOSV61z/BWb37djWi6FR6t7LTvNTXcCL0cHAS2e+0270wIC92YiX
 0pIiwGglwkvY7O2AvXiB+SFjKMwCqAdEmongLGLngJikrvNxO3jIqwRO0P7iF+HzSJ5z
 zliT/6s1pGqyTS/k77bKH28qBMBbUl7TomNc9IJHQEhVsQwsAFsw6dnThsNs+XFajuZv
 vXhOm0vIGZ5L1sdqeGf+yotyOvVlswIhO1xzDw0VWFwFSipydbknOYJ4c4nZYhgEwH1D
 oQcA==
X-Gm-Message-State: AOJu0Yw7yfnsTJMTqYOgt+7YJKgcTAjBnKy6QuWiE0S/wbeJmUsh6yC/
 6gYwfuJFTxBSSRGB9iudlcctz0KmqYqOdnvM59sUcP+8oqMeDZ1/qwatfPA0Rv5iCY06UXrFx/D
 +Vrvg
X-Gm-Gg: AZuq6aKi76ytVoNKUt+HpOa8ulTprNHBWdqi29+TIvI6EeIHkFl/P515oAYaoCQF9vg
 UvZ7ppke6qtBtQgQaiH2HkEfKuZGAeUTRrdO+7SxQvHx+osGxWE2W8/OVS23yZDWuaZ57Jqj3CH
 C6XDBYbpGARu9KEwq06LP+cCs/qYOjpsi8rh4wCoBW7fCgQoROegEL7ku+xqMUXD629SoFArHqV
 E7zYiIP3ehcsgGZK32w24cqhk7eskcDHEOJVE6JJGDNJ6lYbwaNCsuDzwxU9A7UK0QUXU/YfJG3
 q1Q0v4vxGOiQfoiWU/XaMWGOir4JIibXuqDju6LbjvqrA6hgAKG6ZoHbJCsZKbLqkLYWnHZ7i7w
 7pEye7EGtUY1uXuKO9Jqvv228YmwazA4mPsdTZM5Y7uYEpshjE7JaCQWhxadHRp03nXfcDUQfBb
 Xj1TtYrmujqGdG8hk=
X-Received: by 2002:a05:600c:3e87:b0:480:32da:f338 with SMTP id
 5b1f17b1804b1-48373a0f961mr296547075e9.14.1771444635029; 
 Wed, 18 Feb 2026 11:57:15 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4837b68e5adsm422964605e9.9.2026.02.18.11.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 11:57:14 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 20:57:14 +0100
Message-ID: <20260218195714.222471-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218195458.221243-1-thomas.perale@mind.be>
References: <20260218195458.221243-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771444635; x=1772049435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufQNXogzTgEgLC+H8heDYHcPZ4PZDUIqL37Uw0afDpE=;
 b=HYGqffkrxVtC4oriOkDALo/dUlu5Dd+eQk6K2wLIyTAqnN4kOVZAF5BLfhZcvQ+RmB
 mvGEXTG13vysqMaFZ1KQCEr/flWlUc2t5edbQqk16PJfTOoRDoRBXNWAwj2+02V3laRv
 Can3aXOPk33MKYmW7PWiikpKPDdAdUkYWJpqT5U7O/3CaCvenGDp9x+09gTVd5mGzpkc
 /lMZZuMLs3dYN83rk7NmSOjxLNgfUGPNh4ZOt8nalVtjwjSTxujsOalDF8vkkYRQS67u
 8WbvSw4tAVbLBaFGXME3C1qJF9IulV39pprnH/kIxeQ5gyv8rPkIJHJx1poYz0jwzb99
 O9oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HYGqffkr
Subject: Re: [Buildroot] [PATCH] package/libzlib: security bump to v1.3.2
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

Duplicate of
https://lore.kernel.org/r/<20260218190918.2574524-1-bernd@kuhls.net> removing
it from patchwork.

In reply of:
> For more information about the release, see the release notes:
> 
>   - https://github.com/madler/zlib/releases/tag/v1.3.2
> 
> This update addresses security issues identified during a codebase
> audit. See [1] for more information.
> 
> As a side note, this update removes the reference to CVE-2026-22184,
> which does not affect zlib itself but only the reference program. See
> [2] for details.
> 
> LICENSE year was updated in [3].
> 
> [1] https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/
> [2] https://github.com/madler/zlib/issues/1142
> [3] https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

> ---
>  package/libzlib/libzlib.hash | 4 ++--
>  package/libzlib/libzlib.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
> index cbd9313870..bc8b046426 100644
> --- a/package/libzlib/libzlib.hash
> +++ b/package/libzlib/libzlib.hash
> @@ -1,4 +1,4 @@
>  # From http://www.zlib.net/
> -sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
> +sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
>  # License files, locally calculated
> -sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
> +sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
> diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
> index bc5092d9a9..c73328deee 100644
> --- a/package/libzlib/libzlib.mk
> +++ b/package/libzlib/libzlib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBZLIB_VERSION = 1.3.1
> +LIBZLIB_VERSION = 1.3.2
>  LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
>  LIBZLIB_SITE = https://www.zlib.net
>  LIBZLIB_LICENSE = Zlib
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
