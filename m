Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA529C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 13:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FA040A86;
	Mon,  6 Jul 2026 13:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDqG9TmqXh1y; Mon,  6 Jul 2026 13:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 176AE40A87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783346158;
	bh=b/5fv+qGZyS0QTUz3mRgXFju6+w1d/FjMdzIfrWSDME=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JGjl2pC8WS3iZJ6gqgxQ9QO+vn3erxNNdCNF6Q3BI+LomKe9/7i37tNwpEC9OHVUw
	 RpNaL44xxh47hAAqCIGAVFwYZSFPe8X0hu6cCsKvzdPLMVUISufZOHVdO9QCmjjqW5
	 V9Nag42ro3ZtowZ7A6jpSrDsfeJ/UG2O2u9+S6TWhiJJ6F+vEl03M+h689+OWxL8Ta
	 gk0Uw3lW13cw+u8haplZBqneFbOi150ixb+AN90NqniLnTVzKnsqYX1iw60is2RDbM
	 51gyVg2vPwr9aZ31AFdjRCcOeV+AmjN8LUvriM6+7xJOi94hVsJA+9ffa6aigw7hdd
	 HlFboVuvp8jdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 176AE40A87;
	Mon,  6 Jul 2026 13:55:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B526F2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 13:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 514FB81370
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 13:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZc_RqX1rqGL for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 13:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA78A8136F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA78A8136F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA78A8136F
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 13:55:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493d3135e9bso11190875e9.2
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 06:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783346152; x=1783950952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9DwOwBh07zxAXiX0XVWU8Om+xqmE9KfB2KzDmCW6Oo4=;
 b=BYDXLhGbljR6cKiSHpQwnUXT/X9/hfXZorT0+pAqsko4ADPv3rJhIlQdSRYXpg35c3
 WUW0egfpguyKCqsVUNsnYOm9WV74cEgM+m0Mziaz/F/JMUe4aTBUpyV3hUcvgDsRuUH/
 Ambmf0jJnwvQDG8r9en3WwspzKUOzALUpDmk1piYrqn5pKbfnJhOKfIYp2fcYbIrhlb0
 EMJJzCcDbcERMe0oQtEKRBYn5HNdm9oOXVAJnPAb7CGK9Ii8tbpewjBHeZwcyJCrgAmM
 wno7GQMnI9VaD1UvzdbvN+g5nYv18uhWxWUewc8nU4ZyWIlTglPuGtijYozM1O4ma9cR
 IrjQ==
X-Gm-Message-State: AOJu0YysS11DFHSqb/i0hMQMCiZd107MBjp0hpcsJ6wddFKhsb0CPLW7
 3kIr+ojDRRjKO3KD4sVupoD2wUZEutrG8KQ/MMz8KPBZLgk6gjDDTHykvM41P8IQB6dahgnJTDP
 ht1ev
X-Gm-Gg: AfdE7cm5l4Z4EX44jwem9Tbspe7+NXZji9zfK0w1qJw40KkDd6HxbCqgs/11e2lSWU2
 +LFea71mT4ZY04sEaVI/35+yn/z3o2zTkZzhge7v6c9Cszrq4qm5ME9K6B5LgQU6ZZQhmCpD2q5
 TyuWIyXl2IW8r2bPFhSi+X40qSEvrsfmHsHtnSrUhcT1yZcvOwEbdaOGvhGerpoVmS7dI6v7EQM
 bE19Rp+qxZSGdrMnw1IVHgQ35cHamQENNIFYXPkKlAcSaIz6EWvapFvfujJqutboN9We1/z8WeM
 Fl51fiMlba9zZn6spBDzs/dURgAZmR5X+0A9rRXtGF3Gg5fWxaFYIxjrHytVE9Ye8Z7kKVzsntA
 mwEEYRA317JNJ4bZvOwH8jLoJ+9x89iQ1oGOz6UZkLAV18naMjvJbUp4Dw/kuL2y5XALgLXnppn
 tEYv5vSLF1Vsm+1JvH5BsEi44FRw==
X-Received: by 2002:a05:6000:1b85:b0:475:f0f0:9ec8 with SMTP id
 ffacd0b85a97d-47de671c0eemr231268f8f.51.1783346147503; 
 Mon, 06 Jul 2026 06:55:47 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f213e8sm21949866f8f.34.2026.07.06.06.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 06:55:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  6 Jul 2026 15:55:30 +0200
Message-ID: <20260706135530.408536-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783346152; x=1783950952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9DwOwBh07zxAXiX0XVWU8Om+xqmE9KfB2KzDmCW6Oo4=;
 b=BGBcXpZQBURctG+7gAA2z17qPCmpDURJNTn/gWdySHgROMTfgeMlilQpmz6x2cX6Gz
 IZCuamz+35pAERaqdP0gjbB00gzbZPWMg1xfO36zgiVzAvOjUlg5t5sLAEg7JR47cCXW
 FU4DYqqyPNjTq+CD6mPBHqwt405vyvhkFl8kWs83cfoiD4MVdSsQdulAl+jtPpl767Vs
 bZ1AZf1yEf9u0yTOM0zzooieCQoEgSyBJIzcLRKapupiKF8M5UKlcrCia2kr5soYLScN
 yoNnxUNnQYMWuK8q6ybyWCjE48TjX3f9lIbV3aMp3T0DmYbhPmwpsx2bP9aUAUXshR5r
 TJnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BGBcXpZQ
Subject: [Buildroot] [PATCH for 2025.02.x] package/ruby: security bump to
 v3.4.10
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

See the release announcement:
https://www.ruby-lang.org/en/news/2026/06/30/ruby-3-4-10-released/

Also drop patch that is now included upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ruby/0001-fix-CVE-2026-41316.patch | 73 ----------------------
 package/ruby/ruby.hash                     |  4 +-
 package/ruby/ruby.mk                       |  2 +-
 3 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 package/ruby/0001-fix-CVE-2026-41316.patch

diff --git a/package/ruby/0001-fix-CVE-2026-41316.patch b/package/ruby/0001-fix-CVE-2026-41316.patch
deleted file mode 100644
index 1c5949c221..0000000000
--- a/package/ruby/0001-fix-CVE-2026-41316.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From c35379df5279777fb4e02d989064eecd9cbbf338 Mon Sep 17 00:00:00 2001
-From: Takashi Kokubun <takashikkbn@gmail.com>
-Date: Tue, 21 Apr 2026 16:27:44 +0900
-Subject: [PATCH] [ruby/erb] Prohibit def_method on marshal-loaded ERB instances
-
-Extends the @_init guard to def_method so that an ERB object created
-via Marshal.load (which bypasses initialize) raises ArgumentError
-instead of evaluating arbitrary source. def_module and def_class both
-delegate to def_method and are covered by the same check.
-
-Co-authored-by: Tristan Madani <TristanInSec@gmail.com>
-
-Upstream: https://github.com/ruby/ruby/commit/c35379df5279777fb4e02d989064eecd9cbbf338
-CVE: CVE-2026-41316
-[Titouan: Rebase on top of Ruby 3.4.9]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- lib/erb.rb           |  3 +++
- test/erb/test_erb.rb | 27 +++++++++++++++++++++++++++
- 2 files changed, 30 insertions(+)
-
-diff --git a/lib/erb.rb b/lib/erb.rb
-index bc1615d7da..a7317c0856 100644
---- a/lib/erb.rb
-+++ b/lib/erb.rb
-@@ -463,6 +463,9 @@ def new_toplevel(vars = nil)
-   #   erb.def_method(MyClass, 'render(arg1, arg2)', filename)
-   #   print MyClass.new.render('foo', 123)
-   def def_method(mod, methodname, fname='(ERB)')
-+    unless @_init.equal?(self.class.singleton_class)
-+      raise ArgumentError, "not initialized"
-+    end
-     src = self.src.sub(/^(?!#|$)/) {"def #{methodname}\n"} << "\nend\n"
-     mod.module_eval do
-       eval(src, binding, fname, -1)
-diff --git a/test/erb/test_erb.rb b/test/erb/test_erb.rb
-index 09496d31e25ca2..9eec43da158c0c 100644
---- a/test/erb/test_erb.rb
-+++ b/test/erb/test_erb.rb
-@@ -664,6 +664,33 @@ def test_prohibited_marshal_load
-     assert_raise(ArgumentError) {erb.result}
-   end
- 
-+  def test_prohibited_marshal_load_def_method
-+    erb = ERB.allocate
-+    erb.instance_variable_set(:@src, "")
-+    erb.instance_variable_set(:@lineno, 1)
-+    erb.instance_variable_set(:@_init, true)
-+    erb = Marshal.load(Marshal.dump(erb))
-+    assert_raise(ArgumentError) {erb.def_method(Class.new, 'render')}
-+  end
-+
-+  def test_prohibited_marshal_load_def_module
-+    erb = ERB.allocate
-+    erb.instance_variable_set(:@src, "")
-+    erb.instance_variable_set(:@lineno, 1)
-+    erb.instance_variable_set(:@_init, true)
-+    erb = Marshal.load(Marshal.dump(erb))
-+    assert_raise(ArgumentError) {erb.def_module}
-+  end
-+
-+  def test_prohibited_marshal_load_def_class
-+    erb = ERB.allocate
-+    erb.instance_variable_set(:@src, "")
-+    erb.instance_variable_set(:@lineno, 1)
-+    erb.instance_variable_set(:@_init, true)
-+    erb = Marshal.load(Marshal.dump(erb))
-+    assert_raise(ArgumentError) {erb.def_class}
-+  end
-+
-   def test_multi_line_comment_lineno
-     erb = ERB.new(<<~EOS)
-       <%= __LINE__ %>
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index e8bf51ea43..dd97a6d867 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/
-sha512  356fb47cc56f2d25198cb95253fc20ff7d9a6fd1fa53bc475e5c440012aebe27562537c399d271357235114ade263fd625029b66cb0f9b526f9c04f169fb9580  ruby-3.4.9.tar.xz
+# https://www.ruby-lang.org/en/news/2026/06/30/ruby-3-4-10-released/
+sha512  c28d59946c0a1b8e4385a772e0651c6f4154c18ab8a2a62289c3213eb4fe937cec0942e0076cda429576e58ad277b18f4b5611e644d15b122c1cd96baf10f284  ruby-3.4.10.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a66bbd4cbf..b0f0c2c103 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
