Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1A3FF885D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 12:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5981825C3;
	Tue, 28 Apr 2026 12:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HaLowiXc_U9; Tue, 28 Apr 2026 12:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724E582531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777381052;
	bh=spOIDNKzBOjKydYlrskeafHERHqDOSp82pXIEC+SrgE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qcSprrgHLHKWsw6j5bViRe0YSTU2mcTDnQ1cUAoQjJX8z/8gvOodoSkLAG0JE0hdn
	 srdzSSduryVq65tL7DNX+P1KwoPpUzC5o0DoChM57lt+Wc7VejK7MP2MpiBFV4gPag
	 aZ7roJ4avzHxzzDOIZgN9uurraO2oRTXEvSf0qhrinYFNOuSIrSRuttiUhYG87s5b2
	 SFyGTWmRjPyQSJfVnlZHduQify5I2M4dbSAgOC8DHbCV1DZZgs7SfJwC98qFavXIYA
	 whtprmRHjqm7oPaKtt+fmeX/KQ37RVkbnPlyKOJWEm1l+ZWzwmDB3gxGFJbgeR64M1
	 C9inqAB3Cig4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724E582531;
	Tue, 28 Apr 2026 12:57:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC2071B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 12:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD8004072A
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 12:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaiKEbY4sRRO for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 12:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EE764071B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE764071B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EE764071B
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 12:57:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso105786075e9.3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 05:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777381046; x=1777985846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xd7jaeNzRLGmYmReFYoYkQhDYjFxzrQEIlwGKbm0zjM=;
 b=OOQtJwxr7N4c6W9iRq2dMegYICaGifQvReGNsqeit9mSzKXYCbQhMP5qjyJSETCKer
 HQneG2TRB1xcbMtfp7FdVoycXN+a87ISXluCWup0O8ZCV9fAyBbGDW/whCE/N7nBBrqb
 LY3ikNfW8ty2628pWs+t0BbImxOf8PDhefvyv1B3VNwzwNzVKR9QMTuOXsCdLmiYPKRK
 yPTUCma/AxiPUEeFcDp7NeCM9D7ZFTBdUnlpSNg6f2QoDmq6jAcd9g6FOLctuPiWLvEI
 2Boldo5AU5mbjCYWbG0KmYZnR/onXq0VkXNOeYKfgbK/dEU8hcicd4Vg7X7Ol8XwNM7J
 F+hA==
X-Gm-Message-State: AOJu0YwuNVjaiu6jvxy7BTbG+LWmdwsrSDN7nRJWS43Uoc8WNg/N4sFQ
 QNNfuwr3oYAm+dkxLRB4yVtxZ5t/GaOIvYhUCsOIftdWWn9G3k97FqiSaSPtk7JbyMwORUP1Qyd
 DdTZVHUw=
X-Gm-Gg: AeBDiev1xw/5+w7X/jIHmK9rwkI/A3bl+oS+FE5dx/hkded4E8dT5opTIwhb7Q2TRaQ
 vaAq0XpOpXa22cFAtHYSNtU77WNoBmJjEkkiL3im9D82YtcegNCsaz2d8PKjYfm7figfwTuAIX9
 f3PErb1qYt1ggXovOGIlZ4A+miud5bsjvlgFp/4D/sVe0yKMrZ28wZ2TQisTeii5z7WPD37fm+O
 8OYSBy4Zw5OAfJV4jKiD1VYRmuQlu8Lywm50mW/yzLgfMWfuei72MnGEYw8qe566TZWmVZdcgJC
 aqR0TKC+glnrMkmjubNF0hQn49kwPIHx3V/dkSU2UDbkjvhXu7XSuNe6zj58BACBJb4lQKFPt8h
 j7R3M91igdM+kgU0BfAgGsSP4YB90t3hkcBYpTnNeqHuhSCpik2GqxGVclu2PpE8y44NFykJ3ye
 t6zWYRN5gJ3xwuX7nkDGEnl3vfgn7WuFbT70wz8ZTCNKVDdhY=
X-Received: by 2002:a05:600c:1d0a:b0:488:a824:fdff with SMTP id
 5b1f17b1804b1-48a77b1f0bdmr49805245e9.22.1777381046363; 
 Tue, 28 Apr 2026 05:57:26 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774d9bd1sm28887015e9.3.2026.04.28.05.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 05:57:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 14:57:09 +0200
Message-ID: <20260428125709.31994-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777381046; x=1777985846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xd7jaeNzRLGmYmReFYoYkQhDYjFxzrQEIlwGKbm0zjM=;
 b=K5rF6Stw2g+fN/9a4/Bd+33knYH94/4QTFbFm96MOVp/yJWdKBMk1uqU2PiuTC3IAS
 M23pjkuE87wkWQTAi3NN3MZIOXNDm2HtPjvw1gnrwzUhvbMzehwMr/OEsS8bgvgjH03B
 IsmnklX2NDT2E+NEax61rFis+/60Mq0mHvCeQLioBkUMiHiR/NiVgG0OJVinJ1DGgeaZ
 OCw0U/orjaLGzkgVdActRgkAF3J8MN24AknkqsKuHt5SFASrjb+bA90M3jgPisRrLYnK
 sKfndwj67LyFTBWYbs55hBjld6/1HR1UQ0DRDEMWGFGiZUnhUhXCCmxsDeT6/qaVsvyI
 Jl3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K5rF6Stw
Subject: [Buildroot] [PATCH for 2025.02.x] package/ruby: add patch for
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the change from Ruby 4.0.2 to 4.0.3, rebased on top of Ruby 3.4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ruby/0001-fix-CVE-2026-41316.patch | 73 ++++++++++++++++++++++
 package/ruby/ruby.mk                       |  3 +
 2 files changed, 76 insertions(+)
 create mode 100644 package/ruby/0001-fix-CVE-2026-41316.patch

diff --git a/package/ruby/0001-fix-CVE-2026-41316.patch b/package/ruby/0001-fix-CVE-2026-41316.patch
new file mode 100644
index 0000000000..1c5949c221
--- /dev/null
+++ b/package/ruby/0001-fix-CVE-2026-41316.patch
@@ -0,0 +1,73 @@
+From c35379df5279777fb4e02d989064eecd9cbbf338 Mon Sep 17 00:00:00 2001
+From: Takashi Kokubun <takashikkbn@gmail.com>
+Date: Tue, 21 Apr 2026 16:27:44 +0900
+Subject: [PATCH] [ruby/erb] Prohibit def_method on marshal-loaded ERB instances
+
+Extends the @_init guard to def_method so that an ERB object created
+via Marshal.load (which bypasses initialize) raises ArgumentError
+instead of evaluating arbitrary source. def_module and def_class both
+delegate to def_method and are covered by the same check.
+
+Co-authored-by: Tristan Madani <TristanInSec@gmail.com>
+
+Upstream: https://github.com/ruby/ruby/commit/c35379df5279777fb4e02d989064eecd9cbbf338
+CVE: CVE-2026-41316
+[Titouan: Rebase on top of Ruby 3.4.9]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ lib/erb.rb           |  3 +++
+ test/erb/test_erb.rb | 27 +++++++++++++++++++++++++++
+ 2 files changed, 30 insertions(+)
+
+diff --git a/lib/erb.rb b/lib/erb.rb
+index bc1615d7da..a7317c0856 100644
+--- a/lib/erb.rb
++++ b/lib/erb.rb
+@@ -463,6 +463,9 @@ def new_toplevel(vars = nil)
+   #   erb.def_method(MyClass, 'render(arg1, arg2)', filename)
+   #   print MyClass.new.render('foo', 123)
+   def def_method(mod, methodname, fname='(ERB)')
++    unless @_init.equal?(self.class.singleton_class)
++      raise ArgumentError, "not initialized"
++    end
+     src = self.src.sub(/^(?!#|$)/) {"def #{methodname}\n"} << "\nend\n"
+     mod.module_eval do
+       eval(src, binding, fname, -1)
+diff --git a/test/erb/test_erb.rb b/test/erb/test_erb.rb
+index 09496d31e25ca2..9eec43da158c0c 100644
+--- a/test/erb/test_erb.rb
++++ b/test/erb/test_erb.rb
+@@ -664,6 +664,33 @@ def test_prohibited_marshal_load
+     assert_raise(ArgumentError) {erb.result}
+   end
+ 
++  def test_prohibited_marshal_load_def_method
++    erb = ERB.allocate
++    erb.instance_variable_set(:@src, "")
++    erb.instance_variable_set(:@lineno, 1)
++    erb.instance_variable_set(:@_init, true)
++    erb = Marshal.load(Marshal.dump(erb))
++    assert_raise(ArgumentError) {erb.def_method(Class.new, 'render')}
++  end
++
++  def test_prohibited_marshal_load_def_module
++    erb = ERB.allocate
++    erb.instance_variable_set(:@src, "")
++    erb.instance_variable_set(:@lineno, 1)
++    erb.instance_variable_set(:@_init, true)
++    erb = Marshal.load(Marshal.dump(erb))
++    assert_raise(ArgumentError) {erb.def_module}
++  end
++
++  def test_prohibited_marshal_load_def_class
++    erb = ERB.allocate
++    erb.instance_variable_set(:@src, "")
++    erb.instance_variable_set(:@lineno, 1)
++    erb.instance_variable_set(:@_init, true)
++    erb = Marshal.load(Marshal.dump(erb))
++    assert_raise(ArgumentError) {erb.def_class}
++  end
++
+   def test_multi_line_comment_lineno
+     erb = ERB.new(<<~EOS)
+       <%= __LINE__ %>
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index c56d2510be..a66bbd4cbf 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -19,6 +19,9 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
 RUBY_CPE_ID_VENDOR = ruby-lang
 
+# 0001-fix-CVE-2026-41316.patch
+RUBY_IGNORE_CVES += CVE-2026-41316
+
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-libyaml host-pkgconf host-openssl
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
