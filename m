Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB95CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209D9608ED;
	Sat, 10 Oct 2026 15:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lr_tx6F8STPD; Sat, 10 Oct 2026 15:12:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F26B16067B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645120;
	b=KiallcOWmHfK3p2Ks2+btn6Twfv37LM9VZgDSfhTcxjR1Mk5SxseVqIgiChTUgUDLl1Q
	 EFIQZelA4xRKp//kdJf/q0a+3Zh/uvtQgymKz2wHTytw8vae6tjp9hninTDWYuNPt+Wj8
	 ipj/l7Ez9rWftrUBiwqtAcEiqSDkz4khQueOXmY524N4XynsQu205NsXqS7H8eFhvgIAe
	 PeHRjDYsj9Usrx2dFk8F8/kkIrr09Rq7QOf5/hIyoDagdhj6mNlncJpDFysUcSPiDBxnb
	 Mg2TGImQiV8QPFcbO3ouIqAZ7rS/kCNZmszy9wiYGZyUflEIIkjVpoA8NO89h9j8q8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FIx8+oAOuwlK+61l8UplmHJyO2eP3ZGoKVe+avZGlN0=;
	b=ducwwzMt3eTRos0W2GeG1PiD+hvwgKlaY5JPUtrzn+lDAAH17r/4y7kRa6nfUjOGTy7K
	 SZvySzmU8gBGw2/M4bKaTkeCYwKB7lywAILMjAAvfcVa8D+Y2Irypzol0vcJarqAe5jkj
	 OzmsaqdqhBzBQK5rA6siOtvQBj8zlOjb5akJ1YoCOLyitnbwJ1g/TaRjns10oHR7G5pm2
	 T9R+U4Gop4LbqcRjubKDY8B4cXFGRR8TwYwMsGN3nosvCnirSZFwBrCex3VmgQ4CPgdii
	 o1b0VShTO9lMOLaiVahSMlNTJsRna56QZ0HOboIi1V0OxCbt6cli3xjwxI9JU023PyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645120;
	bh=FIx8+oAOuwlK+61l8UplmHJyO2eP3ZGoKVe+avZGlN0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=B8M8gNsTNne6VdhrcFmB0O+Vusc6vNK7D+HBmvPfGgpeWEfn0SUDo3tU8aep0nbdl
	 0zmzSb53LrerT9rkj95lR13O/CCCxJmPcC5u5NAlFlOUDRgTGmC1AzoHj9cwk0jGZv
	 AHjinw1BUUVFyLdoPjuMfygUb9CXAxb3uwaLjfBgpa+nDmCQyEXZ6q9s45I8cTIrWc
	 JluhRKqA1WwLbgzg9U0Ru/R+6aSmMhjJRCNtmoI1jheC+HDGaLIlbsk6dVYftVUXUv
	 EVHzXEvpN98aid69LTj9j8KX96TsJ/0QGEhNb1O/bEZzdVfImHVngrCJUY9R8fZG1g
	 jUvlcwgiPED3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26B16067B;
	Sat, 10 Oct 2026 15:11:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9433A317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A9E481173
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r09J9i_rGhZo for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:11:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 43E7681128
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645115;
 b=lK9WcVOKfaMemW8SU3OHUHp2uMuLDkI/WEQzJ8dvtrjgozxDPVrLVxnIWD+rTPOcvOsd
 n1h0N5KbmvQrNIBHN0F4OPLGj8RUFMZmnHIW70htkVeBwBPpIsOSC7kHT2kZUSf2J2Urk
 Nc3NfCoEsDP26hV8BIErzQ6cwo7bNFJxkCn8NQJ82+Dfk+XKiWyfFxfJO80MZ6mP493s5
 NEIca+PElyQhMt/gqLt4knTO0PHfabf6MxEbl2dAFnvtkzJDADExmmwwcngZFyWMsoS7d
 z4nStnXa+OfvdC72iPHf74JLGqQk8n4OWAqbPcl3K6Fqlo+1Rp4GzFzCalKdZoYijKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645115;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=g9Xsjc/W3+MKCCJPYbqqjqzjLmTsVgrW4JoqjM1PydE=;
 b=WQF6KR6+jXPotY1tZjoJX3WdaoemRO4EHtFjf7CH8CDdAzvrCZxvZWj3Me2VTwrChokR
 HYYBhW5K3bZn6iDx9BHoLvL1itB3238j4lmDi5JGHoqfNyarsQWWZ/Ha3reiRb+9EtLi0
 +NGRjUB+tVh9L+1yWVDgf576tYfXq86TusKWbj1CXVicvvtd2xmqm4OENT+C5wIKs1Pg6
 D8ktwez76MKdmVY1helgomoPx48N0pMPiXE7niad1EJlmKLgOuVY1LDHblg9U7bVk9I34
 7r/hexXii9OOft/95Z1CQZ6EMMEKBMLjQqgKlbBuKZp0/GA2cR68PHo7zgpoGWLoSeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="X2mpfA/b"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43E7681128
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48c45111bebso351022f8f.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791645113; x=1792249913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g9Xsjc/W3+MKCCJPYbqqjqzjLmTsVgrW4JoqjM1PydE=;
 b=Dd5bChVb8cKPSWbmeVVBUwKbpg+4t3pzT64xx+F3YxxRBFnTxXvvk/kvkhr5u+7ciC
 7pXx8P/gw1DsQs+xCU3q24RFtLVLWr9tU0MywT7h7dfCKvuVEAqM41G8y/UDnn/6jZ4B
 Cu86cBAs5RQfcUriHsbMHI0XMkgUc/b+AbRqpklZ8ZVpJu4q4nRgfFAQ4qnOJKh+nHkT
 /hAGmVB6ve2ahVS2IqTFG7DML7JB7aRD+3VwFu2ShRuaStrwg5C4bCqcU2IvmZHk7Wl2
 8H7l5WPkE9UcNRgUb5LXkt6WMiH/1jodRT59AK+b0tnpa+Q3qRLMuB2e7Rv78o4kWRPf
 Osog==
X-Gm-Message-State: AFq9FYJu79w5HYebGMvRoGm9KVxjwa6r5Ep3GxJdE1o8DaurEYgCOlBe
 ENf+do1KdC+p0T9TwZwkGHXWtVk7GCW4faY+lCYSb+A2brLNAUL1/HVATuaGhrLjVKaEyMTfqVc
 jauUFO5U=
X-Gm-Gg: AYBFou3/We+FmZiZPkcHF/Og+NRoV2NS4loFCiIahGtmfpm4sR1olnTwdgwTT3kYst2
 DmUtFs+HJAW6NpH60+rFrP++AlUW4nBpUPI5QVRF7icfTRDXAbwcjgZhTxAqoIfp3+oYG9WfJdw
 ja3/lg2LdzGcweExUoQj47ryam/rPSwjex0M10I/2V48SpjzywC+Vto4xgIgjJRH1t+eP5rG4aP
 xK63hXtMMRYmfr0AdM/iqXRlb2ku9Pn/RxsZ6qoF0SIBOOMWVZYZA8NWmLEns2TsM3FnLGIbBjx
 HzTA83ncRQ9O39ENsa1GNESY6uZuCGvNYQ1r2dxeUaNoX4J9Nm7mgW1NKsqZkZFN4G2rJIQs9of
 bGYLU6OVoaul34hOjWj7Z60inbHbbESzCii7D/G064SLh62tredEXS2bgxDJHnelMQhOTY9w+EQ
 Eb36BEc7U9FFkGgijNiFpd0LL83jY4IBCrmNdYlKwpu+LTLkI6+3pqNfzdG5HdsYwfOwVrRC/Vc
 c3ZL0bgFpFWbdfefkxM+/CY69Zg+4jAiewTv2rPfTRsebI1pJGRsZHzE0xT+fKfcdCONmxttQ==
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id
 5b1f17b1804b1-4a18e4af3a8mr101841535e9.19.1791645112648; 
 Sat, 10 Oct 2026 08:11:52 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm115104125e9.0.2026.10.10.08.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:11:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:11:17 +0200
Message-ID: <20261010151121.876133-6-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010151121.876133-1-titouan.christophe@mind.be>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/7] package/openssl: move libopenssl/libressl
 options out of the choice
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
Cc: petr.vorel@gmail.com, ps.report@gmx.net, yann.morin@orange.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libopenssl and libressl sub-options are currently defined from
package/{libopenssl,libressl}/Config.in, which are sourced from within
the "ssl library" choice block, each wrapped in an "if" on its own
choice entry.

With the old kconfig, these entries were reparented below the choice
member they depend on, and so were not considered choice members
themselves. Since Linux commit 7e3465f63a0a [1], first released in v6.10,
this is no longer the case: every config entry inside a choice block is
a member of that choice. Combined with the stricter checks introduced by
commits 700e7a8d05ea [2] and fde192511bdb [3], parsing now fails with:

  package/libopenssl/Config.in:5: error: choice member must have a prompt
  package/libopenssl/Config.in:15: error: choice member must have a prompt
  package/libopenssl/Config.in:15: error: choice member must be bool

Fix that by sourcing package/{libopenssl,libressl}/Config.in after the
endchoice, guarded by the corresponding choice entry, and drop the now
redundant "if" blocks from those files.

The openssl providers from br2-external trees are still sourced inside
the choice, as they define additional entries of that choice. This
relies on 'source' still being allowed inside a 'choice', which is
provided by our kconfig patch
24-kconfig-allow-source-inside-choice.patch.

This does not change the generated configuration: all the in-tree
defconfigs produce the same .config as before.

[1] 7e3465f63a0a: kconfig: do not reparent the menu inside a choice block
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7e3465f63a0a70641ed8e49f9d40ee613f7da586
[2] 700e7a8d05ea: kconfig: turn missing prompt for choice members into error
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=700e7a8d05ea690308131f69ffc597dfab6db838
[3] fde192511bdb: kconfig: remove tristate choice support
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fde192511bdbff554320b31574bb8a9cb3275522

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libopenssl/Config.in |  4 ----
 package/libressl/Config.in   |  4 ----
 package/openssl/Config.in    | 12 ++++++++----
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 03d3def802..a76def1470 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -1,5 +1,3 @@
-if BR2_PACKAGE_LIBOPENSSL
-
 # 4xx PowerPC cores seem to have trouble with openssl's ASM
 # optimizations
 config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
@@ -228,5 +226,3 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE
 	help
 	  Build with SSL Trace support. Disabling this option may
 	  provide a small reduction in libssl binary size.
-
-endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 600829cb9e..2146481faa 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,9 +1,5 @@
-if BR2_PACKAGE_LIBRESSL
-
 config BR2_PACKAGE_LIBRESSL_BIN
 	bool "openssl binary"
 	help
 	  Install the openssl binary to the target file system. This is
 	  a command line tool for doing various cryptographic stuff.
-
-endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index ca9d1a7e50..cae1b049fb 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -39,8 +39,6 @@ config BR2_PACKAGE_LIBOPENSSL
 
 	  Note: Some helper scripts need perl.
 
-source "package/libopenssl/Config.in"
-
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
@@ -56,13 +54,19 @@ config BR2_PACKAGE_LIBRESSL
 
 	  http://www.libressl.org/
 
-source "package/libressl/Config.in"
-
 # openssl from br2-external trees, if any
 source "$(BASE_DIR)/.br2-external.in.openssl"
 
 endchoice
 
+if BR2_PACKAGE_LIBOPENSSL
+source "package/libopenssl/Config.in"
+endif
+
+if BR2_PACKAGE_LIBRESSL
+source "package/libressl/Config.in"
+endif
+
 config BR2_PACKAGE_HAS_OPENSSL
 	bool
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
