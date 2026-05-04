Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4025FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE6384612;
	Mon,  4 May 2026 14:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGkcEXRr8PoM; Mon,  4 May 2026 14:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8B68463C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906043;
	bh=LnnWR8/fOG7h0JXMRDICIyleFOBcyP/XMHa0IYbMjO8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sIv0KMYs+3lIl7VXoAseE+6Hq8ibaQn1aY6QrZztBUyN14QPUOwMRv/Yd0nwlPgPW
	 b56fTzzPy9sLrCaaIrKqQgx7U7NhaKZBwITt2OGDyWIY81mrVAqlLtfD7Euk/QDJ4G
	 Q93290H1aysh2T9nPkmaEOKmkuIlRhaGxvzq2sMaOtfCIkEi5Wdrr2NZVv3YLNTm4a
	 vo/h+1WwFWyTXo2njjlnsfIF/J1fKMsqNNgEx6AsWOBVqLdzqzfGt+I9TBbZphhRAe
	 ZfhIby0cVmGk/VWD6aUUO+Ysw60OT2xJVz0Y+91w71hCLksl/F4AINg7v5o80zN6PM
	 KcqOkdMl3pvgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8B68463C;
	Mon,  4 May 2026 14:47:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B098A190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A282D41BA8
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LxCRjp85Y0k for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A02B41BA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A02B41BA2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A02B41BA2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so604173f8f.2
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906036; x=1778510836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ucMFoCOgJcnsmyBYoJe6ED7nSfH8mEYtoCVN7bzf2+g=;
 b=MeNcuRCvNBYP7Y6jURxchi0NLGrswYMRQY+kBNod/U+Ji7Ty8BPEs/1KV7XGKfnJsD
 WruSAoGyPgP9Jgk4UZVKG82cZFGcGkHHXPRE912rFEkTiePGVN9mx/Zqsmn+27H+a+Oe
 vYPOEPa62b+bYuK9HOydiKpaUBKQJDU0c6XLPRkZxi9aTbOUE2ieExzUIJIciO6oLxhx
 4+/1WxPbAbKWetn2K1lx8os/f1SLeo1wyYUvze4tPMMB9KPdnBip+WBX9pgMZNi8GQDk
 maVlgKSN6PBCqTVYQW7CgagmzTxghN71Xlk1hFzpeLWBRE0XSzDTjVzgBFndrepmL3iz
 mTww==
X-Forwarded-Encrypted: i=1;
 AFNElJ+i+jjGkasEwX7l3C6HP8KAtsa3sRPFdtAuA8wm7OtgbnPm4e8bO2SOrzrnsfzsUDB8yLrS1JCvvSU=@buildroot.org
X-Gm-Message-State: AOJu0YzG5778QlSb81r3Rp2osimubNSwNEllE1szQjrG+q/OcGqKgw20
 wqsjHDQz4q0PWXDrji0CfqxRXlf03+WmX+hrTq0CXMtuVIGMQv7kvIzvtsw3lDDqYLk=
X-Gm-Gg: AeBDievwjiBgRMcmPHclBIBR5kM0wNgLD9LA/cIQT6u/kPLT4EeKtvaxuUnFiGNEwCe
 HwYfSp3AZ+2EfBobqySxtNsEkU8xKQO/5+vHiYv1BYP0d2h65xaTiSaKbeQWQS3V4AHoxB2doAJ
 U+eY03Y4zVcTCYuw1YRbVIEy7nt1gMpdokTptQwXpdvzabb0yct4ByCfjQZXzYNaUAjKorSedc4
 SKJMotnr3bO7psx7HBVmvC1kB4m+uKDhlVCAVVGM7XePqa++0rPNW1gmsEGI+ojYlIX8lyWRx1+
 UbU60YA1iS+QaHUNEdpD/L+7GcPYWVCaaSvqitR+H2jUJxh0Hnsn1cxkaEd75/6e4xCAafOYJfU
 YSHivSUqfKwdpiAG5iplKvzIKghoLKq87DIaltACb9oVmVdpSA/Kj7fL2Iip12arOE2ez4ohcsW
 eZ644gmisTN2GC3Be0wSKecVEV1dhern/aLLt5
X-Received: by 2002:a05:6000:2489:b0:43e:a9ba:b194 with SMTP id
 ffacd0b85a97d-44bb5c43349mr17773355f8f.34.1777906036110; 
 Mon, 04 May 2026 07:47:16 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8f237368sm25214147f8f.14.2026.05.04.07.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:15 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:15 +0200
Message-ID: <20260504144715.9071-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428125709.31994-1-titouan.christophe@mind.be>
References: <20260428125709.31994-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906036; x=1778510836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucMFoCOgJcnsmyBYoJe6ED7nSfH8mEYtoCVN7bzf2+g=;
 b=ZEM979RfTQ58BWZHh6vTz+/KGL4fgpjPC1kJ6sn7MBpCb7oZNQYG8jgzXpx14Vjf4u
 mvIu4MbI2vs1wBoHkmmqcIa9h2BTtbkUH0JkeAalxHa+X9LKbIdz5Pv7jvCJp2zfWjw0
 IrXefwsfTt3Q5dP88an65aeEWyoSnb/zxx8sztEaMpo/09UTvXqGn0KpNVxSiC6D+s2i
 kkDvXWaHf4sn+5Iy3No7loQ/w1QuytbSifXlVG7P/vAy9zADq9DwRBIo+HmDqg5CZzfW
 QVd2cmlPJC7ZBYpDgEbmqPE83MyZJY0Rh6aOAKgxUWWVmINZPN3NX1eulpSAimTtBhDF
 CZkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZEM979Rf
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/ruby: add patch for
 CVE-2026-41316
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
> This is the change from Ruby 4.0.2 to 4.0.3, rebased on top of Ruby 3.4
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/ruby/0001-fix-CVE-2026-41316.patch | 73 ++++++++++++++++++++++
>  package/ruby/ruby.mk                       |  3 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 package/ruby/0001-fix-CVE-2026-41316.patch
> 
> diff --git a/package/ruby/0001-fix-CVE-2026-41316.patch b/package/ruby/0001-fix-CVE-2026-41316.patch
> new file mode 100644
> index 0000000000..1c5949c221
> --- /dev/null
> +++ b/package/ruby/0001-fix-CVE-2026-41316.patch
> @@ -0,0 +1,73 @@
> +From c35379df5279777fb4e02d989064eecd9cbbf338 Mon Sep 17 00:00:00 2001
> +From: Takashi Kokubun <takashikkbn@gmail.com>
> +Date: Tue, 21 Apr 2026 16:27:44 +0900
> +Subject: [PATCH] [ruby/erb] Prohibit def_method on marshal-loaded ERB instances
> +
> +Extends the @_init guard to def_method so that an ERB object created
> +via Marshal.load (which bypasses initialize) raises ArgumentError
> +instead of evaluating arbitrary source. def_module and def_class both
> +delegate to def_method and are covered by the same check.
> +
> +Co-authored-by: Tristan Madani <TristanInSec@gmail.com>
> +
> +Upstream: https://github.com/ruby/ruby/commit/c35379df5279777fb4e02d989064eecd9cbbf338
> +CVE: CVE-2026-41316
> +[Titouan: Rebase on top of Ruby 3.4.9]
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + lib/erb.rb           |  3 +++
> + test/erb/test_erb.rb | 27 +++++++++++++++++++++++++++
> + 2 files changed, 30 insertions(+)
> +
> +diff --git a/lib/erb.rb b/lib/erb.rb
> +index bc1615d7da..a7317c0856 100644
> +--- a/lib/erb.rb
> ++++ b/lib/erb.rb
> +@@ -463,6 +463,9 @@ def new_toplevel(vars = nil)
> +   #   erb.def_method(MyClass, 'render(arg1, arg2)', filename)
> +   #   print MyClass.new.render('foo', 123)
> +   def def_method(mod, methodname, fname='(ERB)')
> ++    unless @_init.equal?(self.class.singleton_class)
> ++      raise ArgumentError, "not initialized"
> ++    end
> +     src = self.src.sub(/^(?!#|$)/) {"def #{methodname}\n"} << "\nend\n"
> +     mod.module_eval do
> +       eval(src, binding, fname, -1)
> +diff --git a/test/erb/test_erb.rb b/test/erb/test_erb.rb
> +index 09496d31e25ca2..9eec43da158c0c 100644
> +--- a/test/erb/test_erb.rb
> ++++ b/test/erb/test_erb.rb
> +@@ -664,6 +664,33 @@ def test_prohibited_marshal_load
> +     assert_raise(ArgumentError) {erb.result}
> +   end
> + 
> ++  def test_prohibited_marshal_load_def_method
> ++    erb = ERB.allocate
> ++    erb.instance_variable_set(:@src, "")
> ++    erb.instance_variable_set(:@lineno, 1)
> ++    erb.instance_variable_set(:@_init, true)
> ++    erb = Marshal.load(Marshal.dump(erb))
> ++    assert_raise(ArgumentError) {erb.def_method(Class.new, 'render')}
> ++  end
> ++
> ++  def test_prohibited_marshal_load_def_module
> ++    erb = ERB.allocate
> ++    erb.instance_variable_set(:@src, "")
> ++    erb.instance_variable_set(:@lineno, 1)
> ++    erb.instance_variable_set(:@_init, true)
> ++    erb = Marshal.load(Marshal.dump(erb))
> ++    assert_raise(ArgumentError) {erb.def_module}
> ++  end
> ++
> ++  def test_prohibited_marshal_load_def_class
> ++    erb = ERB.allocate
> ++    erb.instance_variable_set(:@src, "")
> ++    erb.instance_variable_set(:@lineno, 1)
> ++    erb.instance_variable_set(:@_init, true)
> ++    erb = Marshal.load(Marshal.dump(erb))
> ++    assert_raise(ArgumentError) {erb.def_class}
> ++  end
> ++
> +   def test_multi_line_comment_lineno
> +     erb = ERB.new(<<~EOS)
> +       <%= __LINE__ %>
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index c56d2510be..a66bbd4cbf 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -19,6 +19,9 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
>  
>  RUBY_CPE_ID_VENDOR = ruby-lang
>  
> +# 0001-fix-CVE-2026-41316.patch
> +RUBY_IGNORE_CVES += CVE-2026-41316
> +
>  RUBY_DEPENDENCIES = host-pkgconf host-ruby
>  HOST_RUBY_DEPENDENCIES = host-libyaml host-pkgconf host-openssl
>  RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
