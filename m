Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B924FCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76FA380DE6;
	Tue, 13 Oct 2026 16:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekF1eJr7-lZ8; Tue, 13 Oct 2026 16:43:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BDFA80CBD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909808;
	b=X6S0Zg9AGJXKM4lJpD0NM3LAAz9O2ZqpPCP4fqAD5EsFMAL8koYLteS0OoMaj70acxsA
	 bXJdzswBTvmqMVinUGJn10MNb0e+M+eI7sMDm9zdNSEPjCUTRPKVBDx3JIuc8klj2LQi5
	 3HAHg1rOfEn6b1IPOw1SZt8fDlTJVGJazeTWc4mDxYEQ6Gpdo6wfHBoF4X1ptt11Kfpzu
	 yUNyokieJ9cqErqaFDGu9yyIxo/OJ/9V768s/1YN9ZhZcftJT7VJbEO6MPSv/tzujB/1g
	 rGqAPV7m/gfdLj8idgdTnxkAQJkq0EHTFouq+C7i6ACyhHdOjVOt+XBZAqp1FuHl0Ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909808;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FsCZ5o38hxViZnApgFGKwc2huXzZgLDNtgUqZktMQkY=;
	b=pds3FrrANkboBtUz/zRPlpaySIapNjo166PK+A7Hv7FeXBB+IhsB7D8vUFKos3qKGI17
	 2zMgJms9yPP6tPu8sDy+0V3tDE79aJRr1EYdvykiDpZ1sPfxSYINCr5G7ywpnGgccoqum
	 auIpTu5hI2402Z8oQvZPNykkqtz34JC0tTh6kzF8R1Zc6uaUJyQDujc/RvuWKMRbRRNo2
	 9oVklrwfA9tt5tit4Xy0vs6fiobxRIo5EaKfOrF5J8pFQvJTgnGyFqHEHX2m8r6IPklyN
	 l3OgVRwRSClo31OJJlbc1hUJJRPGjwfLNHoTvxi6xfZOtOSUt5hID+wgg0mk5PAB8sw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909808;
	bh=FsCZ5o38hxViZnApgFGKwc2huXzZgLDNtgUqZktMQkY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YLes4PJ/JCVkHpahLBZ0Fc6LrDXh591bLpOBbF0CwIavObhRskdeaTR9SEZGXa+fE
	 xnBMp+E40qppHcyge8/kxXKs425yxpliE6URs+zhMsg2qGLRd65A1/A3SuCMA/ODT4
	 EnRSHsm4aQT1vtwoxllZ6LgeGTBasbJtieRXm3XJp1+6sh+THcK5neJ1i8USUd6qfO
	 VNdg5e/+MdmCmbQo44syAA6b7KxDtMNoag2YP29Us59nWE8ooe4gXaqaFZcCn2YOJB
	 Xu+2bXjbu935GJKhrzQhqVa+NpJLSLLugt7jKUsM7dDsmDNALiidY5Vr6BMcnd7mwn
	 Zxhi2sqKBgdBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BDFA80CBD;
	Tue, 13 Oct 2026 16:43:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21928129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13A3C4007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2FNVJsNVnYF for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 34E404009D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909802;
 b=iau0ZWv1hV28Fins+6yhATWRcINxSGM1z39QSnbgntizrQSrOVokjD3ih+4kmUMpaCds
 fqjyp84GGM5axt12oT7dqSk0pCqX26s1bKxbeRSpXBJkENn30MVDYnbqCfFOwMH8JMFcB
 v3bSfs0feIh3oh1co+CYCwm8nj7OPBk9eRKhN1vO+fQ71Be5HtOLGwgwMR96D5LVmteKj
 L2rnIdxHAInpMS6Yxoualld44C7K18KYTUYo9J30sV/8jZw09Xy3MmyhQ+kJqUfwipk6D
 BMUf2usrZg6ufORxuv1BiZtv0U6kd5xkdj+MkKd6Lbq+Y6dLvnaTyt2JnekPTRKDYXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909802;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DzTb77w1O6yrk7IF18uP0bU/LqopCHw+iJtvoFuG+7U=;
 b=lQFapwPNOHawA1D/zhNc+SUFTJStiTvbXF2ZbRAWXdeHXhgMTsyNK80sVNSalgVbOhNq
 kEbFktMXFwG7Iy250+DWEPA4Syqrhhv/pqxf8UaUxQa89mMWBLJzXfd9v+nvNJPApYNk0
 7K02S+nNB4r/UK6tKHwm4+O1HXOriOXda6udPxnsh63PB0AWEaFG3gk4foFSK7E09TesR
 I8lnHoCbXhldjZqRzvBUJAwxQoIouAgnstanpSG2a+lDyC0JVzES85gU9IocRpXo+lTN6
 FjXhvctqlsIe4fsI21Q+Wy4inS0M40uogVLhES+YgQhVia5J6DHujNVjQ9TfSn/kfHQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JsipDsoJ; 
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JsipDsoJ
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34E404009D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:21 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-49dee4c5427so1406828fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909801; x=1792514601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DzTb77w1O6yrk7IF18uP0bU/LqopCHw+iJtvoFuG+7U=;
 b=JsipDsoJ/wMrfYT7kTHFZJ/hZLoU697dUvULnjlfpw9AYZ9rpQMqSJnHEehYiGR3d4
 m8iKNchrD10/1ngguQmkDbC+LT1OfEdWwEJjd2xKSr4a/wCnWrzekRm9Td5rb/CXs6sb
 gbVIpJ4IkMCTwHmc2gs2AitocMSAxE2NY8p+foKpIwB0tnKIwxC/rFZJBNFGTYmy6Swr
 rO4DZVTKTPaY5Lk+6d+KSNSCvjNkUmz2MkAI4xMchRMf7EqLxdcW8+dBLOLtAQZjtBqF
 zifU2ogRqLrsOeA2/tc0yX2VSwVA1LPPEAGi3nFS7ZdJ2njYVwtO9O5Mmbhm9lShC+w3
 OEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909801; x=1792514601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DzTb77w1O6yrk7IF18uP0bU/LqopCHw+iJtvoFuG+7U=;
 b=Xxw9x1fG08cyQg2PRGLYXOYM5hP5jMteY0OzPGs2X+qlYztQ+zQ33lXXc0xd+1as7P
 Tvtld5arEuXJhdZxnfvz9SC5iccB9T2S5d2aiqk4d1kW+s32eEy8iroR1Isju1tKoZpq
 WPAwqZdhqhQW8XNYQQyV0dsF+6MdhBmV9FkvygMhO2Q5jexOvRxBC8gznAP6CP8ftvoc
 PeJ6AYxi3dCOTPUq1dbx793giJ9mSwP2yxg2TIwndXCOSZVrK9QJWS8db0CbRpfoa2WP
 tSsnhJX80Y/8TdE7oInP5FJAMq8xJWc2TyitTQzga2Jdcqi0mcJTULgxLNJtVJkGQ9Gh
 Nwqg==
X-Gm-Message-State: AFq9FYLrT4ER92SmsPut44LjnGHCtx6YVZIg/VUkJFGB7CgPe2oaEXyz
 TXcjAa2ivtrlIAOhcRBkFaI0iuolQAp55SehAPoOs2px3fz7MdxCfV171aaPxQ==
X-Gm-Gg: AYBFou0W1CEdNP53Gx2pkMxPoLxfFkahB5CswhfG0zZKkBW4mMvKbqySFZkAmZu/2OW
 7qUMVsKAz+vO9DNQ8gT+5mulQjw3YOmL0Rg2Bt8QBNUSFGKZi+iftDoAS8apH6pgbKicsP9GvmI
 fPLW4HVtRzVHIz8CnIrRJ6sh8A9OkQDeIeb05A9bz6TxiYfpul30jA/F1VsNQCnNblBomCmMrLo
 e+GccDz5oe3cup34oLV/avncUPig3NADx/4yRsayydR08GEUCde3OXFmirq1KJM1DbfJPONoY7j
 2VJf7gumLSesXir2rTXvlFVPTNjNfCoP2xvTBVhh9ZkSfsrMc7k9ecvLn5lDt7UscUUAkwpeFG7
 96rwx7wgZlDfLeiseigDT8QVJs/oFLMRr7ZjWI9sE/iWgEm6OdgYOLVvcQ3dnEUfCn6E7S6gf4f
 GS8MyKGL077SPD/qsqlVJdGEzwOmBfUf4Pz3FOL3cYcUtWPCxdVaxocm988cUJwUoTJSjapnDHO
 dc2e11GdWnrzxdK+SGJgVjvSO+Vv3h4l3vzndciLmySu5mgwj8K86Xo+mO3r6XDL2GQ7NwHMIjG
 SibUSf+eShZ37yr1X8ehIEf4IOhtdEi/rmQkhfZX0LYVPZshuphj/Aoc6quCvX5PgspOufaQWBg
 bNTlGP/2U9KGvn6lfAvej4X9fcvPZk3QOCq5j76fR9Ag=
X-Received: by 2002:a05:6870:224b:b0:475:e2e9:4f4b with SMTP id
 586e51a60fabf-4a2a8a0cc57mr11204448fac.25.1791909800921; 
 Tue, 13 Oct 2026 09:43:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:02 -0600
Message-ID: <20261013164254.1476592-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-multidict: bump to version 7.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 50a36404ea..f444ad438f 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  efd429da40e56f8f5e8da04b381d7002  multidict-7.0.0.tar.gz
-sha256  a7fcd089a0af2e0ef053c0d39c22c9ebf2434dddcb91034fd2f59ec99623788e  multidict-7.0.0.tar.gz
+md5  014816498e1cc303f03b9e552bd68153  multidict-7.1.0.tar.gz
+sha256  61a4e5d81b8d4e4ad61964b230129e7a2b914793d96289029078fc9009f074ec  multidict-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index f7db1ef314..8e33c341a6 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 7.0.0
+PYTHON_MULTIDICT_VERSION = 7.1.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/c4/64/642465a4827331a98ba4ae29f97658be25d1bdcb868872a2f78f7482b507
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/84ddb5ba16c4eb2c69c71db76ae3c579fe546e511f7170c7e27eedbab7c1
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
