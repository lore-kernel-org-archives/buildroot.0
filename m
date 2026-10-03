Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDC9CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895C860677;
	Sat,  3 Oct 2026 07:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9pOrSx5wEWP; Sat,  3 Oct 2026 07:13:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8C6CA60634
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011619;
	b=GmF/IXB27BEld3fgypGx2yGsFgPrv0EqYhs8Co+Dvn7xS1ZefEtDLCmakikmJLAhYhop
	 KbwC86OdwisY8mgX1wZYX5Yk4G8l5xUG7ow8XyA7FsLPyundNVU7PrPPh7yT+e1Oji4bz
	 HMedcVkgyzo3WeD5C6jlwSCRXaW8vsg05nHJc7IknaxEzwSlRBM2FmISjfdrz8gfJ4HOK
	 M9zSX+Vl30oZuqH+yNYGU0sXrYBa82NQO3LzMajUJPiucRomf3KwDArTpsS6u5GYQp9Qz
	 p+1Hw2GAEiT0walZAykebpyww0PxU3cBFiK09I1FP7XGIfd42fdXB0IM+om+LwWIy6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HgUr4vn+Qi0z+VT7w2e9QGB8G64WjpNiFIyJbGYw6zI=;
	b=ZGdcYxnHvNVKsrHHpyZkyzYhonV3bU1sR+/M0d/MFRnwZ0BTnBxzxUZhSUszt57cd4HZ
	 0rtGzKA+5ikondXp+BmDsSPSIm1b/M7oo2O8CkEENEZfQcSAVLWDtwC/7ZshOtkdSB+0W
	 jxx7TQsm9eSDNnCiSKq99Dt61762A7mKP4oBOEwZeRiAguLuxVXUxh/btKe0vQUxRamh/
	 CARtzzK07iuxczSGZYoHYdb6dKr9ryRQkGVQdxQMlViAfvtoUL2ElxQ1jIN/ZitklnH0i
	 Rv9gqcfWgOcE7CWtAmxvkvS9Kxf0Lzi1R0pwj4GkUs11fh+CVzf/WH5ZfnTK2Zf+4Fg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011619;
	bh=HgUr4vn+Qi0z+VT7w2e9QGB8G64WjpNiFIyJbGYw6zI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OzS+Es2cfX1uSYo2bRR95nGK0bhx/kvSHORQcU0zkpmv/w+7+atmoZDc5n37cSpqc
	 3rzGhBgOFrUbYFLoeHJ0FC2jVs0bjc1LFqkykmAPQa5KnpbSI0jK440nYC46jWm9GF
	 J4hJAEiXWL+QvIhKGlB79uI3lE5CIfIdXzf4JAPZ7Pp+uZZs4wP2uqGyDK8LXgbFrY
	 eODfyNWW3KEW7dW7adluGa2F6gVvo/9/VIGnyGC0qNYF2EeIGFpPG5LFNUTZFAocyS
	 6tK5hvX9Ac2dv7Mf1nUGk6WYRw7duZnHFLOMCg6XLgLi4ThzFWIDHhu1dYGFKUsZo+
	 rbrxtBmMn3XlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6CA60634;
	Sat,  3 Oct 2026 07:13:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A97834E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C4E440F5B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwHw3D6NoJlp for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:13:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6915340F56
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011616;
 b=iBneGPr9zyRF0CBjB+7cYL+3VnOWjlYHiCWrh/3gakEM/dMG79xx5Rz2oBROROOkLnV5
 e+wpnFTrLGM+N4qrYqrcV4B1mvGqrlQpUYQ2GY1ptnc67M5PGkRu/vhF/I17F/LztoyAw
 CC7d9CTh5S4GF8WXeqaondHz+csvJhb1SBE/WJUUvdEPn6Oni90PuV4DRCZ5/lJ5MYeLV
 gjRL2VDwasTCtDxFEiuZ+QOvobc4436sAH38+BDMDJZ5CGEWIhOPfBozvE4gON38zrUej
 WzP6sVDs5GQ6gudUBGQP9p93RPY6Cc417mAUYswpEZ6zUBZLuVjb3EnfLAeZb8dP8OQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011616;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZS8rPGM69yNmjRpfWWlXau1qjUd7SKy2LG96ZYMJEhg=;
 b=DjHUPDzLWXmgrSYhLMF4JrXfcT2PFT3r/8zsRDTInANCMLIGTwAzSxUi5Yp49RLXoiyL
 dqyrOFtrmvWMSQX8VNzYu31YcoWkxUtgOofiGSOGNa7YGQL4hcgtlk2qzHs+SyCLk7xqx
 uQPbSP9uZDSaDOco1tgTRjrdnBqO28xsE4vRR/jRbAIk89h/+RFkfCRQ5Z9EsKHDiDOYN
 U01jAc+PscH6Uw7d9oqLGLfb94jEAax0d8zNUG/gcnoWiwtrTE8YBWBdXazgK3qMLOogQ
 EFLPWWsME45nABv2vefdDot+m6/6p0A3yF1cGATTm9NtQy4AVn0zV8XIXERa6rIsZ7w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CIdFeT6c; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CIdFeT6c
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6915340F56
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010932;
 bh=ZS8rPGM69yNmjRpfWWlXau1qjUd7SKy2LG96ZYMJEhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CIdFeT6c9bfQmz8suORQrBk1Wx1rlB0We+EjBy52DDMpjLWXeLf4sBk+6/LdYKQ9R
 L6Ht6YQ47W5njKivpV9kpI+iK6W9w4JvHWNFwzChO4Uzxs14QM2Jqh7Bzm1VXanQSY
 YT5E4cLyCXchJGyc4seh2Acmh2Wfw1h/lLARoEkfhxglNYU129XTetjm+OPw7EoOfm
 VrylXnCRrApbUdcS2NGwoBGpmPZLYOy+szxD3cbsIEO70Jrgxbf9jBNnsIPH2QgJzx
 0sIfHawQMdo6fEtYESFzvIqILKrFHiQNFPdPPFJeKs4EUq0zJU1MBLJ+HnTgPr9jie
 wmvixEKXpLiYQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 L6Cc9rx18x4kgxZjDJ43kvkl+SbrxZNSqMOJbtqVq2weXNFDhDSv8lFqeLK/Vs09TEaBUbTqkGB
 yexM70ht246PtuiKgwoEXyM6kYB7ZyXJ+3vo9ckp73/wKd7y4GJAO2zgPEKrgcoWtDmQPySb2b8
 OmNs0Fc+n6EkRXIUKTFv5RyFwG+3J9kzvoqvSe4oJBOo5uI9u+4tHZVU9ipY4ai3Bx3zxtgeTK6
 pFlVwYJlLok91dMhfm9lxEYHe8EH/1QxSOnmjg3A7XpwoR3nZkoerT16B6qTewo7C9bQO2Ib0g2
 UXaGE5I23ph3+tWrIe4r3s34GQkioqvf2XpvqJAHNSR+qg7zJ7V8eCEAfb4BuINOk+HNVmdVsCn
 uQIygQdMJx7xyEtJza9QzkL3Z1uzpPucz0K5HBgJCyW1vJtKVkyfn9FQ8xeMILC1UQcKScKBiEm
 ekum9ORzIcLZNlhMu8UCggtJcQl0mbMZskgLFhX1kydNxrjtFHUGi5uPHF/1QyTxSxbO5tkcp6e
 sbQAd/eKW6RrggjPK3CrvVuTtFEzDL4LB+ckHNDqgN6eNW8UBp4uhy+I5YjxuD9r1qP7kLyQVfu
 r/dnUxB0wWamKfC7tlSP4vwUFdnzbxwOqvLH/ySkxckGmSwL/s36nR/NyU1cXqOK
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF772A4C5445;
 Sat,  3 Oct 2026 09:02:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-2L8m;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:08 +0200
Message-ID: <20261003070128.1295458-96-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 096/114] package/python-twisted: security bump
 version to 26.4.0
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

https://github.com/twisted/twisted/blob/twisted-26.4.0/NEWS.rst

Fixes CVE-2026-42304.

Updated license hash due to copyright year bump:
https://github.com/twisted/twisted/commit/ac504cc8088734e0bcb8c9b372d52534bf9252e9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index f3cf53bcaa..beb1c7f3b5 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
-sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
+md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
+sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
+sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8db5d3750c..09198d2afc 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 25.5.0
+PYTHON_TWISTED_VERSION = 26.4.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
