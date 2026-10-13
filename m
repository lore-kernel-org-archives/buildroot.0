Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885A7CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B767405E3;
	Tue, 13 Oct 2026 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wn0LrTQ_WxQl; Tue, 13 Oct 2026 17:51:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4E41C40437
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913902;
	b=AjFPwGM4uTsqFIuKYSKs6088X9QPHUrKIA1vv0p8A6EfkjmPAH+/BGMDAqbRZyDya/B0
	 O004F1WPee61+OpoQlqW+OW+fQdh3cF8XSg1Hxcn/3GwQ0w+akowmYsFgYWSRsmcKCHwM
	 A//GFKdFH1gviZUVX1Q4Bzo7GI6bzI7gUfcM+XPjLopBn0LDL3/1D48TDofqi9jcBi9ou
	 +zB0YxaZDoDY2ALGPiHJAtHgY8RRf7rjua9+izwVNrP06aG5pgff173whtgHuKHVOIAgq
	 wl5PAnEmsMBggDEDhGE17WgaT4IY3qq/CRbGHORq4c7THjSsAarR5JX9t9ghkop2mPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913902;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7lP3zdKuPhz6628BpuCdpTEINTwsadHBkEgAyYg4elQ=;
	b=kraiioFQi+tnalg8QHO1b/eFebePKNTA5QnqRWehVEv9chnfk3Lkhzz/19yV4t+dcq5q
	 /u3RsoIR+HIdC9OFjJfFqHw/X0sCOtUny7aiMTPvVEuGU+HqWlHwhGu4/qqdRWekwgVN/
	 cXQ6lSe807JrGJWK1togWejoG2iO4ekPz/aL8uetzAuDZ0RM/ymd+0lc0ZtBrSX2WZsJ1
	 KTKbiG3INvWWF5yhyXLLBc0Q2C+AotLrgY+BrXEuytOHXUTAC2c9DcqsuEzLewE8efgoN
	 nRW2/kEU/gYNb7Znaump/a2RKOg9krCkDD85hc1+SV2p1mIxHmMcjww547lspLv0WVQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913902;
	bh=7lP3zdKuPhz6628BpuCdpTEINTwsadHBkEgAyYg4elQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sAuVf+SgMereXHyvGNoHrxxjw/oXK5/apzIFmO8h6bc7/tHGspmEnQPt7Co/aFu9R
	 Mi+O5nJ1eHMY0Y3maNUBGStLPAoG8W0zjzAb9kyFFim7Wb9p42lxAvkKwZCnRFAMmr
	 Gybxol8ROMKDSKUH5AB2DGIXaOR9OIEt+fvkdVTlW5o/n5OORHFz9nQBQPnDhRsciA
	 SphrZpHp27HQkDzZqwc6JHqmhU7eqjDXLoXiCalLsaRyJ2T6+NGQCz+O84Xkz14Mjy
	 xp1iglYm9l2NtmpDAoR2gVPHQofqUgGcvmarc1mhIlk9168qe9yGMm3RjQ3TRtCWmc
	 BnDYPTJ/bhl8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E41C40437;
	Tue, 13 Oct 2026 17:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 553592AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47697402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-gdSC3ZpOHZ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 59C104002B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913898;
 b=fzcGHSxpezjUj6kO3SxljwOzbi2k4AmfzbL8zK8MElzgObyzmzd6DVdOedgKuPS3DGT5
 WtouGG8fwj6KWqmj9d9nhpfwI8FUq/Mt3gOBKh5T7kKSscOZpN8yifbMQHN0zWUFpxl78
 3akxGI0nUUk8Fi5W9vdue8oJtwzyCLp/Dp4zCJlsoNRwvAA5ZD60Wz1DX16v2CDZZQreb
 /r0z2O0uG13If6ZWQ8jSWuwaaqq34xBnV96Ud+7iBnxYPURrpvVq6ptOxMH6gDh08FQSE
 pCkI5V68pqTt/JmWLWiXy0Xw/7tdeJUIs9ZAewvuhPy+bsviH7eIwIfss4l4T4yfziQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913898;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6haSk0KEi27FrFduKzjAli+TKWd7Wm1kzRP3XiGAgRQ=;
 b=GkWyBH9mVQdYPul9Q2WUAbqbkt138S/YyPzQPkzYYIRvlZEawHo/tGSt5QMUkBIcdEtY
 RZE4213i6wigM2iLsg2GHScHkp2G1EkQPZ5qxvqKXQNfit1oh3ZNna5YBiIOz9RFL/dcr
 gtbkcVswL+/RhQhMq2jtWmIsOnJsHBD/8K6co2zts5OPYnUGkk0aD3PzWxUZwWPAD3xZF
 gjQDFhArTTk2GcyykW5SlM5JQrIYgTXRY7rwCFABS0JZxNOj7f8uC5B4GfX+YIy/Juw/5
 AwdjevQHGy2uP8ThPbpdECwN64jayRw84RGBn/SoUq5r5OctDtirI3bBtecI98zxj4w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=g3TXsHTK; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=g3TXsHTK
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59C104002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:37 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-825b40f8a26so1609396a34.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913897; x=1792518697; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6haSk0KEi27FrFduKzjAli+TKWd7Wm1kzRP3XiGAgRQ=;
 b=g3TXsHTK5Y7hoZbRZwgoATKVby8qBYeWy16+zvU1Ds2ehBTZcybHysrYcHPuM6iQiy
 8fx3lAW77SwaNqdUUDAZwTijK9Lb6VYUI3pX2QbAVdofOUYxJ7xDlbstVM+L+C37uefU
 rhHuRFozTewtHyy1kyzwdjcldYlqRQZU8014InBAqi9ErQ+fvsiWwnBkdk/YDF0ugjIy
 uq5JoEvIgK5xGSC2pX0nncJcnsW7U+LA/oWr/y6F1+/13OHAvM9XHjqmKDoXnbPlg6Oi
 mpWJo3ssYw4XgE3B224PKM0TMtdgFCunnQjSINvHjaCzEDk3Y8zpIAALkbMZDIHWEs0J
 eUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913897; x=1792518697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6haSk0KEi27FrFduKzjAli+TKWd7Wm1kzRP3XiGAgRQ=;
 b=Tnz/8iqu/2J9FrRg2f7Yil8+GoKdEvtt91vtxEfCfqklq8q5PEVmOcMhm+0BglRVyz
 18Mbosq/v+h+5+AXaLF4PJ8+kcapsYXkqd5Q8BLoy8+GI35ohsw2VMVMBXkwaXuepNTb
 sMP10zVfloEUNabu+3WEvsb16MZiGBXBdXPcChfGCpx2Ufj7hYE/EghtnYzdcRdCeIfu
 SE2AeCfr+p7N4n1YuKHdpNLlrxWxyckAATfoH0LKMcts/ZkIuj5P/iPtQb7CMTQSL3Bg
 guVedxnCcL+DMVeOnIeSa+HdUmEoIWB/b4YFHvnwOQ04k1fl7o337O491P6z42R5w1Xz
 G97w==
X-Gm-Message-State: AFq9FYIVEStFFzAHnrhZWe3sSIx/pbQw5tqgVI6JKHoDeLhdOxm5bQnh
 6I3RFfsRoZTcMo2t0UqiC20dqj6RmGtDZkIo1FtkcIVu/SEo9gI5Ekicn7dCXJR/
X-Gm-Gg: AYBFou0FMDMZiTm/DFAlMUoLPg7+4p3euEgTJBz+hoS2MA3brvheSQfcZd5yiNHVix3
 POaTsp2+rkX4Ia7suulpuqIGEY6LBjIIbyOhf5eD6ryUgxtipMvOqP+V8LFk1YmtKtbJ7x5dNjH
 /0hP/0R91AJX3AqRXIsrbzPvdgglqzG5VWAF1NDgNW6TkHQOWq5o+QA5V2gAbjvll7+HrAY0d5w
 AChfxZChTuBzxyEJflI73H4TuTEX7lc11M4CRhEaXPoVgA2OnM06EBcNJzwo5ztFeTgwdVgyPxz
 /ywevLnryL5WZuXIewV9iPC95kJ6T2j+mQUWcWRutulGBdlKOnGSIIDUqO1PHdLeMbajRDRK0wE
 PUOHr1+JyZ4K4gpjLhbN5n9zcbieZInjrWnbxEYfaNfBjVvNC3l+GaIiXxrceCtbskMYbs9Mv23
 2tkxYx4+5N5tx3jMVqvqfk4q7xVbhBNswIC4RKbCyc2fpq5wYsepBa6DqP2T1m5IqZxIl9cQycj
 RlfT0li4TjIJOY3XEXbN+EzjpuymUc8H5kedaPbSZje5XySKS5ESCoFikDqgu5dAfasKIr/9N+e
 sen5tRZHaG1xy46/HyB3Cbm3Nvm38QioCAnNd6OEv/ysHboIlXakzDywlAk0tUT+iQeSxDRVd+6
 enM1eXpovUTrC6honSbNg2My4+i3cjF81M3TS3osyiuE=
X-Received: by 2002:a05:6808:13c7:b0:4f7:867a:f58 with SMTP id
 5614622812f47-50c4e680014mr13842049b6e.13.1791913897002; 
 Tue, 13 Oct 2026 10:51:37 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:13 -0600
Message-ID: <20261013175130.1822395-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-jedi: bump to version 0.20.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 194f1429aa..282c6d1cb2 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  6f7c8c61fff6da984d7297bb32cdd1a1  jedi-0.20.0.tar.gz
-sha256  c3f4ccbd276696f4b19c54618d4fb18f9fc24b0aef02acf704b23f487daa1011  jedi-0.20.0.tar.gz
+md5  900ed4ef71909892977ceb449eb42b19  jedi-0.20.1.tar.gz
+sha256  2f71208c3f9c1bca057c0e90d3f272aba44ace88fc4067d7587e9e069331b7e5  jedi-0.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 567946dcf7..2300bb2835 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.20.0
+PYTHON_JEDI_VERSION = 0.20.1
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/46/b7/a3635f6a2d7cf5b5dd98064fc1d5fbbafcb25477bcea204a3a92145d158b
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/a3/a4/4692ecd7fa700ac1066b1c1f6cadef60aa2e01e5e364710235137d823e0a
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
