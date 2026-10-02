Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075AFCA5FE5
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD4781371;
	Fri,  2 Oct 2026 20:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09MKzmDB5oBg; Fri,  2 Oct 2026 20:55:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D809681368
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790974528;
	b=AMajAR9lE4ntCxtZ61jcOe24+0CJ8H3LMEH0C6CVRsapedS0kL/koilCxvON6NIRyhBt
	 +RBMsj955cc+qd+DJkdTIWgz5OufAOA0FjOJpPhPMH/VkluZXxpIlfsHzNXUL9cJyD1++
	 LeFuZhVjq1CULXVh+adtXgGs6y55ZSKP7hAfbD1xjcGnVH43Yyy7kSbUedl+yUPW/t8kO
	 EOjBjLi0/I7spUAzpnrYGj9HZYA9gN8VQ55wjf1xOAkffrZOChFc0DWsWySzI4N2/+bXr
	 cHIjDu9m5q3RXxRuBeL/7jKxaNWPXHp1OuVmhanujm06YJm1jdDhYHAmvw6tG/805zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790974528;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5WfOc54izTgkCdgD5D7ABLbTTW2gnB8xzbXXTdNmfII=;
	b=RnSz02/zqryKdaug6sHUe8V5xMaHskqwtn3UxSQq8BCZpfl+sKJfwN3+E/RKxI+2+Q8H
	 yoh8ebYasX+u/OBwA7P1D+b31WfC6S9hA3xAAn3Fdub+auQ7Y5IPdWb/3CZQDm/nDM3N0
	 Q4kaVA8ejbNw3PP+9TNzHZYSOUIa/fcf5iW2Xmr6aeeUNSlGlxramTKj2QU8ziCMM8b4F
	 FTZ2PM8kQjP8LFPTcvLgKtsMqYHd32gm+vjVnDVo7iEZNhvu1FUBqsWchFj5TReFdcXKK
	 vV3gmxmHKrATcb4Q+z/o0hbM4vWY6KdrntxK9YwHVtEmiLuN36665/LA/g9WTfJz1Eg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790974527;
	bh=5WfOc54izTgkCdgD5D7ABLbTTW2gnB8xzbXXTdNmfII=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P01LDybVsqRcN2GgWVz6pD31/leKLRpL0IRnGGiP5MdRAY250qYivu7YNWphSOp36
	 ROffg8fi+cUk5kxh5yOVJyKbJB97ES6ZbBsCwoNsiAiF/Sz0mVW1VSZgcYf7Kvh53C
	 PhcAQPLUFnnTXKi3PaJJR+LwTVnanhxpgAZD75pvg6eWRVRV+1/5lC9Lmq3hhhhxux
	 rWAvnVF52C0xZdafULfsVNRgl3UkHC+laBB6MyX0womExYD+NVg57zXsOCrhq0MS+T
	 2oL7es2+v8+s8G1QkSDkQ3Uageck62MxjWuZtWVg8nKeutyDKsw3LBLZHAiPyLCcfI
	 8wQREInhP4fqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D809681368;
	Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43DAA2E0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35DD240590
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nARTG7RgpauN for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:55:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 56D1B40585
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790974525;
 b=Wug+r5v/YBUo6p1v1/eOkCGTICZDaERhyXtlnQueqmkO3OzONMqpgneY98L+cA43PtCl
 POLCbCAoP9z9ugVKVngvR67gnB3u6NoN9iXCHt9jU9beTZovbNW6G/nEOKR2uC3wsRtzA
 Pw5BHz93yBNUnZjqqDMj1xfJIQTYa+lMstul+jIl3CWj3+BX4702RHTaouGJw56lGsRHa
 jxjNy63ETLQu+dGDib5VoWl9oLCVCb44iljthnRlSVey/1FlE4UGSxTTRXA2LG47sxbwh
 IXu27XHIF70KjgjTq7i2GSQTvmXz15fzvy4ncWPeFLy1XZfmCbocqsbl96tVQSFXLSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790974525;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yqYUFq4tpi8EG8kx2CYcofd13hu89p07qjZ92hh9HZc=;
 b=MMp7qL56pJAtWjqv7Ft53Q8EzlCZHJHmT8EFDDS52Yo6rpqSNKExjHVPUrYcg1gGfY+v
 fZv20goam5EUjP1arHo3QUao+vGXfhMK1EGMrtYM9sPqInY6BNEzOqSMN0xr81xEXR0O+
 G6m0kMKFebFRx+0zNeOL591DAURg5lSXXFqwhBJjGJRsDP3Xe3v4XtETWYf2yHhzvacgv
 wdcl7OsH7dIPF+AHcUeJUG8nLr9VUFLmhmxf108ztqsv2tqykVoZu+KiMapJFtKWac4Gq
 jyJG/z1Q1fibhuu91yY7lDoNKgrx/RO9V1AppTNai6RWKInN1SroPfWBB5D9wtz2Lkg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=s0CjEwIm; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s0CjEwIm
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56D1B40585
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:24 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6cfed5dd083so159888eaf.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790974524; x=1791579324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yqYUFq4tpi8EG8kx2CYcofd13hu89p07qjZ92hh9HZc=;
 b=s0CjEwImvKcCJnV5EPsSqhJ5R5otm5TtdK9ha0aDTZDv6sCZrvzklEJDt3gbVMn2VX
 JUNFLA24r+amhFnIGAf/xG2jppjDB0Lf3WYlZVuy3OA+xKT0zdgdf3vPDoLBYMIlIGwP
 E2hyDBQO22EteudXswN4TMCLgu/cg+/VwUtf/Lnj2/uvmoJzb/zrPFkmAKrvARRaTMIF
 hGJAh+qCuDfo+c+z1ryp9hn010pIBQyvZdazzJ5UfGnu5sbHTZGDy8XFW0R9L0dQucSQ
 r8H5ezhT9m5k5wAt6oRm7hpA2TEscuqE63IQRySqmERBYUyfJXaqtnPu6IotUbcvuMx0
 7yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790974524; x=1791579324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yqYUFq4tpi8EG8kx2CYcofd13hu89p07qjZ92hh9HZc=;
 b=a7kNx6ohrVC55c4+uKP63wgcZ2i1iFaReRKq9MCknzEel/BFMV3Y+88xsCzqS3Wr6j
 7tDDiCrJ34rQAlGxsOCIV+7hmgyb4RIFajpdSYuWR7z3K7P+bOkfGZprPTnj4xxg88E9
 WKC0pt0L2jNXgvcIQgJNOjVIxIYepfntC9DCePYCp9cpxSbj7+YtunxQVOJWmGg7Uww0
 C7vHS/ntQcc07oKSJNyIofDhgxikxSspC9ZtzhNQw7uX/498zph6mzZvVqYUrDkAdn85
 k4draQUoh2n78WbyWKcf2UYNrLVOUs3M/ykwt+asibtn+HDi3RIGqqg044dghg1N4kxF
 e9hg==
X-Gm-Message-State: AFuF++nFYgQIGoCFHRu92YxXS3T+WxhfWH3KtZxsXPpW0qLJ7GCsXUEN
 TCAY/WCj0E8+P+EpAzxzNn8tDv42zw3RC9iYb/xi7Bucvnpew2PqMBViVs3DmQ==
X-Gm-Gg: AYBFou0g3sRT0Qus8za5CvWiKS1SFCTW9NgPYRmVLlSMK02f8bhg87hM5vj1UTyp+ik
 BotZWu5iKyXoS8COd1nqKreGs0yLoWfwfxzMBJ+uRkUgJL/aH4DJSv/Kf+vAXNhrocRPSuakjQx
 Fyr4Bubv4gpCPleuVoIPr7UrVlrDHYl8PjbFPsTgdifSiAv7lq3jFKPsIW/WeCAL6kwxLtmIVa+
 Ja/gJi3BH3V9zsji900vAlMBh5aD/cOmvO7rEPKb0bS6rkMhfFBzTHRo8UVnqFjin9L1RuL8xJm
 5BHLu0tshyl9Eu1V4IUeR2pouy1dNyy+XFFrtn0Qw5r7WAUU6321yukSvCXcf7749+OTDYSohQT
 EXArGrFLDYV/QiGce1DZJtGOKIDwDKEhyA3rjl3QlOCFuSCJ+QI20WHtxbGfAOhqAHWvSeZzbQN
 B5oA5k5ueB3X1BDS9opRf+jew28O2dt0xLbUedpKX1/GBYbWdlrCK3HDLsfk7cDBLVFkESHe1rO
 StrGK9ltK2lO8GVr8gaPuOP3gG4hfrSJKOr9aRLGUxI99kXL5MiLzWDIJTMcUa5ElcGemw+lHQm
 cB0vwq+UNNFmY9g2ZMrBlTimFfmR+iagX+J/ZDFyMI7Vtwkt9jSX8do4y6N6THouTIZjQfNkBCV
 icakUnjg4p3NqIABZycC7YIn2ww2CFEqbEgwnZdlj+Q==
X-Received: by 2002:a05:6820:6ad0:b0:6de:2f20:edac with SMTP id
 006d021491bc7-6e09db97fd2mr398526eaf.35.1790974523840; 
 Fri, 02 Oct 2026 13:55:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a9b0f1bsm3197929eaf.7.2026.10.02.13.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:55:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 14:55:14 -0600
Message-ID: <20261002205517.4043570-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002205517.4043570-1-james.hilliard1@gmail.com>
References: <20261002205517.4043570-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] package/python-uv-dynamic-versioning: new
 host package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-uv-dynamic-versioning.hash          |  5 +++++
 .../python-uv-dynamic-versioning.mk            | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.hash
 create mode 100644 package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.mk

diff --git a/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.hash b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.hash
new file mode 100644
index 0000000000..75589ba4d2
--- /dev/null
+++ b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uv-dynamic-versioning/json
+md5  31b72e92d7109418ce8cfbcdf0abb042  uv_dynamic_versioning-0.14.1.tar.gz
+sha256  8642db686ce5c50417035e7a257ac73b7e5c3a7a32c33e45bd7e36ba22eeb648  uv_dynamic_versioning-0.14.1.tar.gz
+# Locally computed sha256 checksums
+sha256  42de23e93562f776f8cfd25fd5ef60f1637504133e4eef42c3a120b4e7e07163  LICENSE
diff --git a/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.mk b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.mk
new file mode 100644
index 0000000000..f9e07de4a3
--- /dev/null
+++ b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-uv-dynamic-versioning
+#
+################################################################################
+
+PYTHON_UV_DYNAMIC_VERSIONING_VERSION = 0.14.1
+PYTHON_UV_DYNAMIC_VERSIONING_SOURCE = uv_dynamic_versioning-$(PYTHON_UV_DYNAMIC_VERSIONING_VERSION).tar.gz
+PYTHON_UV_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/6f/c8/fa500ee29af69cfeeea5ff6d6597919f1989b2e3f1a236c3006bdb21d320
+PYTHON_UV_DYNAMIC_VERSIONING_SETUP_TYPE = hatch
+PYTHON_UV_DYNAMIC_VERSIONING_LICENSE = MIT
+PYTHON_UV_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
+HOST_PYTHON_UV_DYNAMIC_VERSIONING_DEPENDENCIES = \
+	host-python-dunamai \
+	host-python-jinja2 \
+	host-python-tomlkit
+
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
