Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81572C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737DC40BC2;
	Fri, 10 Jul 2026 13:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbyFoaJIvndM; Fri, 10 Jul 2026 13:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F28E40B2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691493;
	bh=fKC436N/XjDoejZR9fYB0LmXh19+h0OMCcK5TEI60OE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QF8pzeXEVKG9Lk8m7Tmro31z2o66fw9tjIgYEVQ7hh/6Gv5f2PVRyuGeHLKtch71p
	 5goNHkn/PM+v0h6a8OetJFsyCtJudLQ9dHMLe6oiiXlZZb0HVP0Atnn7Sr2b1MCE1d
	 jHFzfyMvtSc71OXUarlX5zWHbnlWoj1cVwY9TRE8viOYbD5Y/9NafvDJyn0L42jML5
	 b8z8ykMIE/OqRqY2vkyJs0agPOn/yySLZZtHnTh2px/Xw6tBubmV+hu2Ykhs80i5B0
	 aY+VXRRUVvDah0bznjTfXFvsr4fmDhxDfXReZAy6ZORaFlV/6gVMOT3S5HR6Z8iKV0
	 L3SoKa2sb3E1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F28E40B2F;
	Fri, 10 Jul 2026 13:51:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 056FA2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E022F606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF-hKFaRPtuU for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F8D3606C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F8D3606C6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F8D3606C6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so730956f8f.2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691487; x=1784296287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c0Spn1m37SETBPwns5Z6PlYxRwhHJ07rzr7QkH8hEwQ=;
 b=oERFJ4+l+68EkEqK9SM0CnGvT9ko5y4FlP1DPHOL6wrVld7GSi9aNGvNv+0A4j2rfH
 mEuq/xnAnPNbTwDYbV1eHPZot7CjPOauZmg9rmKSvzMEnLjgCISAi5Xkm7KeJddqkI2b
 NFV+tGz+vLgwqbzM+jwKkk5KUmBGyZ3v2GeMMtUHHIdWwGyaSdV3DYNERwsL1v2+phiJ
 bGsGpNVTwL3as3OAJzRtCDF2ac6cpV99A7Yo8rkA4ryXkbK4pz1xq4VsfDJAhEKuE91V
 GuHZW+1oPzoG1tXF8AawGjagYCDX6dseHkJ+Soh7gXsoxWLa43rS7ETfWa8dM1TA9FQ6
 x/8Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rofj783K5jwOIsPnEb5arDeky5VqE3khMYhNEkGqbA8vqj0xJTtGIJfci+4nEbATJDy6GWSfkg+c8g=@buildroot.org
X-Gm-Message-State: AOJu0YyZPkoU/YGl8+6LPsMFINQTexyAr5bVO12/MhHnABmcPoDmKPxA
 Cwn1d5S0nsQM7IhCNkeEZcz0r2A0KaVIN2xFZkQMw/cKU15uMdmcACbkNs5nsd00lN1BlAgV9Bv
 vRPDL
X-Gm-Gg: AfdE7clwQPgALkee+CO6jOYWnshpOArWDZEYOdPkf3HqV0cR1GjA/vBinF9fD8IrTNI
 UCSfdsVcSIQpIW91Dn4kgQGVkRlNXlG2AvoCcpy8kzyTVakXlSQC2A0iZDE946w7LdlRqRoMh5E
 BDwE7RBxD6WRp2sww3Xo1rFLFllEIJYpWQhXjHG7wc5Unt7k8uDJXyREzU+45Ajb/kCp89xm4/8
 +gkd+J72RyjOEvkVpLc+sKcSHJKwe1xhbtTApg0y5ojvsKn6scLsMdqQL2OexVotN2GMuhdvE9e
 jPAVH/2LaZAJ2Kl75eNxNTyEjuhvc119tZOAWUm949DSgthgr8oNvyOFRg6EKQBf9Ms+Pm4uo6c
 GS/LDu0M0A0mXTSOPXlKGEJMJmBL4WBtLCaw2NNOOdn1m7LbB1feWirdT5r7KriHI6kXyeOezzA
 ByDWxKww==
X-Received: by 2002:a05:6000:4007:b0:475:f0c2:75aa with SMTP id
 ffacd0b85a97d-47df07b495bmr12869646f8f.59.1783691487348; 
 Fri, 10 Jul 2026 06:51:27 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f2465ae8bsm6220942f8f.36.2026.07.10.06.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:26 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:26 +0200
Message-ID: <20260710135126.758993-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706135530.408536-1-titouan.christophe@mind.be>
References: <20260706135530.408536-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691487; x=1784296287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c0Spn1m37SETBPwns5Z6PlYxRwhHJ07rzr7QkH8hEwQ=;
 b=OQfML60A4xt3YNvN0TSbeCL8cH7g8Bg7FB4VW9TpjOHNX4Dj7a6cXz4S2yDayKq8Cj
 WHw7jyYOsQ8X70xexhLW/judtLV/TPtELS4CAzVgRh2cYr2pHtCHbXBrbKqJ3p9imMdF
 ya452MwPAnP5u3sr1XHxlXzgssJoSVIjg3tZ2CxpwR4Jk91PTRWYI5lgXsZzZk7xDUaC
 pCUY/nG1jKChBEtjLvaOXQ32XSemv4LZhiv1wEzqWZbyLszqRiOKhmx/26NCh56My8ye
 tRvfpai0Y0Mn6KSffflAhOOW1SM1GjtkAYLHvDcYY4fRsRxHwQmNq1XHFOd0p608eGXe
 RgkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OQfML60A
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/ruby: security bump
 to v3.4.10
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
> See the release announcement:
> https://www.ruby-lang.org/en/news/2026/06/30/ruby-3-4-10-released/
> 
> Also drop patch that is now included upstream
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/ruby/0001-fix-CVE-2026-41316.patch | 73 ----------------------
>  package/ruby/ruby.hash                     |  4 +-
>  package/ruby/ruby.mk                       |  2 +-
>  3 files changed, 3 insertions(+), 76 deletions(-)
>  delete mode 100644 package/ruby/0001-fix-CVE-2026-41316.patch
> 
> diff --git a/package/ruby/0001-fix-CVE-2026-41316.patch b/package/ruby/0001-fix-CVE-2026-41316.patch
> deleted file mode 100644
> index 1c5949c221..0000000000
> --- a/package/ruby/0001-fix-CVE-2026-41316.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From c35379df5279777fb4e02d989064eecd9cbbf338 Mon Sep 17 00:00:00 2001
> -From: Takashi Kokubun <takashikkbn@gmail.com>
> -Date: Tue, 21 Apr 2026 16:27:44 +0900
> -Subject: [PATCH] [ruby/erb] Prohibit def_method on marshal-loaded ERB instances
> -
> -Extends the @_init guard to def_method so that an ERB object created
> -via Marshal.load (which bypasses initialize) raises ArgumentError
> -instead of evaluating arbitrary source. def_module and def_class both
> -delegate to def_method and are covered by the same check.
> -
> -Co-authored-by: Tristan Madani <TristanInSec@gmail.com>
> -
> -Upstream: https://github.com/ruby/ruby/commit/c35379df5279777fb4e02d989064eecd9cbbf338
> -CVE: CVE-2026-41316
> -[Titouan: Rebase on top of Ruby 3.4.9]
> -Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ----
> - lib/erb.rb           |  3 +++
> - test/erb/test_erb.rb | 27 +++++++++++++++++++++++++++
> - 2 files changed, 30 insertions(+)
> -
> -diff --git a/lib/erb.rb b/lib/erb.rb
> -index bc1615d7da..a7317c0856 100644
> ---- a/lib/erb.rb
> -+++ b/lib/erb.rb
> -@@ -463,6 +463,9 @@ def new_toplevel(vars = nil)
> -   #   erb.def_method(MyClass, 'render(arg1, arg2)', filename)
> -   #   print MyClass.new.render('foo', 123)
> -   def def_method(mod, methodname, fname='(ERB)')
> -+    unless @_init.equal?(self.class.singleton_class)
> -+      raise ArgumentError, "not initialized"
> -+    end
> -     src = self.src.sub(/^(?!#|$)/) {"def #{methodname}\n"} << "\nend\n"
> -     mod.module_eval do
> -       eval(src, binding, fname, -1)
> -diff --git a/test/erb/test_erb.rb b/test/erb/test_erb.rb
> -index 09496d31e25ca2..9eec43da158c0c 100644
> ---- a/test/erb/test_erb.rb
> -+++ b/test/erb/test_erb.rb
> -@@ -664,6 +664,33 @@ def test_prohibited_marshal_load
> -     assert_raise(ArgumentError) {erb.result}
> -   end
> - 
> -+  def test_prohibited_marshal_load_def_method
> -+    erb = ERB.allocate
> -+    erb.instance_variable_set(:@src, "")
> -+    erb.instance_variable_set(:@lineno, 1)
> -+    erb.instance_variable_set(:@_init, true)
> -+    erb = Marshal.load(Marshal.dump(erb))
> -+    assert_raise(ArgumentError) {erb.def_method(Class.new, 'render')}
> -+  end
> -+
> -+  def test_prohibited_marshal_load_def_module
> -+    erb = ERB.allocate
> -+    erb.instance_variable_set(:@src, "")
> -+    erb.instance_variable_set(:@lineno, 1)
> -+    erb.instance_variable_set(:@_init, true)
> -+    erb = Marshal.load(Marshal.dump(erb))
> -+    assert_raise(ArgumentError) {erb.def_module}
> -+  end
> -+
> -+  def test_prohibited_marshal_load_def_class
> -+    erb = ERB.allocate
> -+    erb.instance_variable_set(:@src, "")
> -+    erb.instance_variable_set(:@lineno, 1)
> -+    erb.instance_variable_set(:@_init, true)
> -+    erb = Marshal.load(Marshal.dump(erb))
> -+    assert_raise(ArgumentError) {erb.def_class}
> -+  end
> -+
> -   def test_multi_line_comment_lineno
> -     erb = ERB.new(<<~EOS)
> -       <%= __LINE__ %>
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index e8bf51ea43..dd97a6d867 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/
> -sha512  356fb47cc56f2d25198cb95253fc20ff7d9a6fd1fa53bc475e5c440012aebe27562537c399d271357235114ade263fd625029b66cb0f9b526f9c04f169fb9580  ruby-3.4.9.tar.xz
> +# https://www.ruby-lang.org/en/news/2026/06/30/ruby-3-4-10-released/
> +sha512  c28d59946c0a1b8e4385a772e0651c6f4154c18ab8a2a62289c3213eb4fe937cec0942e0076cda429576e58ad277b18f4b5611e644d15b122c1cd96baf10f284  ruby-3.4.10.tar.xz
>  
>  # License files, Locally calculated
>  sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index a66bbd4cbf..b0f0c2c103 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUBY_VERSION_MAJOR = 3.4
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
>  RUBY_VERSION_EXT = 3.4.0
>  RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
>  RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
