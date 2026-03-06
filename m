Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BB8FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A887A41DD4;
	Fri,  6 Mar 2026 19:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPHdDPbSCAiE; Fri,  6 Mar 2026 19:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBCF42189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826830;
	bh=DgF+7z508JRD5PaHN9bwxJNfgMqHkpAyBwjZiAct1Lw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B4An1qS6nHTTPvl1qioBE7Aa8nV7gekKppro6JTJR7ZxeFIsL2kjQqJA4wfuZ2qtc
	 LKa/dZTpD11IJPzHFns0IKzD/14XkU4JMrq1VMI35wBzsSND9m1geRTaF6LLn2QkRU
	 41AY0v5Ly8QpF5snlb/FuZrC+cl5sjNhA9JDMoFjUaDrRVWv1tTftssK6ktENViIf+
	 4YkmAOTrRiJHCF8Fdm9KeEvohzTeb9gYDTyPz/2nL4/ixh5Zoapw7KaK8vO1c4+NBX
	 1djijWkyrNSmZ8lt9lnr/f3wgKo2nBNvR75an1LJhZR0OfD2u8/lej4oKhvemLCbS5
	 Vo9f/VVXORb+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBCF42189;
	Fri,  6 Mar 2026 19:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93E11223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 856B683D9C
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnsyKAoB_TG6 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 791B983D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791B983D8C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 791B983D8C
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so4362853f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826825; x=1773431625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yRVKU3YwPG/tjkeepuzzUlBER6XV8/p9kjzBQA8ZiGA=;
 b=nGUAu5UPqIfOrJkfra4d4UcH0x6jMeNES6y9sYsJK5wCy9+Jx5mCATVTreEcssg8DS
 H8cOO4QkaCt1LWkUb0oJYK/YCq1D9FMy8HbnjSNTBl6sRTdyb3STpZxw3KtjZ7bgpt7m
 LlMNo7frhv28ufdRNv0XUJkPHewjYHgCEHg+VusHltKxlFqN1QIuAhLkTS/fXfthFxeg
 GFInoDcqF/ffJr1DmmQJY0T7UxkVgVpbunIvg0uaBoAOmHeckcLjLtHVLFcLQOU23GFm
 UDWxBNlsuLxmWyzoCc/lp8VN5vCe8FoxPy1s2JVYKzKVLo835rObhNvZf9eQ9Z++SsdN
 0qvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR5ANNgJqIh6GBOTrZmINlzPqlTuqt8YyAIffrYreinTlMukwgJz10nUpuGTUlYMhgmzexoIuOUhQ=@buildroot.org
X-Gm-Message-State: AOJu0Yw5SOm8BCr+CpgxCMErdzXhqLaZkxW7yrYv9a/wv5yfx+dbBIXA
 QdNCfVJFOGOBcKevs9q3FdKw5R3LJRDTBG6UnVHJhU0cy4tHa95uq9dBi9jFiGIUGx97xru4CU+
 So8QH
X-Gm-Gg: ATEYQzx7q6ATOoOz1dJy1dpTZRkKBTu7TrgKwbvWPpp2FesO/owLyweTIILjppQ/xTb
 6LLlYNVQVvkb0s1gqucykWvAp1mw/KVZqaJMzhT1Ev5hO1VFjjmX7lQnbW9sWPVth5SVvujVy+k
 KiYcscMK0JZj3IQJoGfM/wCd3OL0cDysQ7Sd/cFRTYchViMyehm72Mrd+IVlpGeu2xuERFLgWJc
 pCdymctQFOVtFDjLOMaVKdAuQ3P5PEE2lkBqlXbpUMCN6b0WhavU+GopZJKgau4SWrA4EfoTtet
 vyMfwLQmUepEkXaFkj+jXO2DJI9mfRJXWfyLc4QaXAmXRA1ucvX5YP+GWuF1hRcKTBek6N8bZlo
 48Rzqcd1IJV0li0j0uprSLibwZwrMuvaz52Oy+GZzmlK7NLlAWQNxIxMH6Cq8FGhYBMhv4ufExc
 8/8GnKV+81D2XDA0Ac+JBV9nPlkA==
X-Received: by 2002:a05:6000:420b:b0:439:ccd7:cdd1 with SMTP id
 ffacd0b85a97d-439da66936amr5481399f8f.36.1772826825504; 
 Fri, 06 Mar 2026 11:53:45 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9d8sm6041150f8f.21.2026.03.06.11.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:45 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:44 +0100
Message-ID: <20260306195344.8784-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221165149.3917530-1-bernd@kuhls.net>
References: <20260221165149.3917530-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826825; x=1773431625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRVKU3YwPG/tjkeepuzzUlBER6XV8/p9kjzBQA8ZiGA=;
 b=Hb/ZZaO6/Q53rWn7wWF3WS3C9KtERHR1xPVQKq4+EoiO59Ru5JRLCGd04VNREtl96Q
 w/hs/gatrdFR4QuNsI/Uef0gCfj/sKgaaov6R7gD+/P0yc4UViTU1FS1bBkzINLpML/+
 Le/H/ppbarjROQPPim10q3CPSMLYoMNhmbIeDJpl8flV5qn4zDxA3kAcCtRcruLXmZ/k
 MwK7g7Qa7Fz+fJ5vKhgiyaXyhUYme2SUbfYCMJXYGkL0fC8EMGixuSKxvLI33KoRUg8l
 0KSUrpFnKAIBp4K3rST/nL3PJYde7Jtosbyl2e0Mi6NdU6Q6UPMJqc/rORHJgM+hgft1
 vF9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Hb/ZZaO6
Subject: Re: [Buildroot] [PATCH 1/1] package/mpir: fix build with gcc 15.x
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
> Fixes:
> https://autobuild.buildroot.net/results/8e8/8e87fc05c41eb420a026a7df86efcd9662b74353/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  .../mpir/0004-fix-configure-with-gcc-15.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/mpir/0004-fix-configure-with-gcc-15.patch
> 
> diff --git a/package/mpir/0004-fix-configure-with-gcc-15.patch b/package/mpir/0004-fix-configure-with-gcc-15.patch
> new file mode 100644
> index 0000000000..32ca76dde6
> --- /dev/null
> +++ b/package/mpir/0004-fix-configure-with-gcc-15.patch
> @@ -0,0 +1,41 @@
> +From da003143cc6f217dcf474517d54b3aee06c9c18f Mon Sep 17 00:00:00 2001
> +From: Leon White <l.white@interstellarlab.earth>
> +Date: Mon, 25 Aug 2025 17:24:55 +0200
> +Subject: [PATCH] fix configure with gcc-15
> +
> +Added to Alpine Linux with commit
> +https://gitlab.alpinelinux.org/alpine/aports/-/commit/ded83e23c95b2560d2d77c0e61a6425872aa273b
> +
> +Fixes compile error
> +
> +conftest.c: In function 'f':
> +conftest.c:14:48: error: too many arguments to function 'g'; expected 0, have 6
> +   14 | for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
> +      |                                                ^ ~
> +conftest.c:13:17: note: declared here
> +   13 | void h(){} void g(){}
> +      |                 ^
> +
> +Upstream: https://github.com/wbhart/mpir/pull/300
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + acinclude.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index cd917567..53b9ef9c 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -590,7 +590,7 @@ extern
> + __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
> + {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
> + void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
> +-void h(){} void g(){}
> ++void h(){} void g(int, t1 *, t1, t1 *, t1 *, int) {}
> + for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
> + #else
> + int dummy;
> +-- 
> +2.47.3
> +
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
