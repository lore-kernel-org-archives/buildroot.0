Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19466CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2BD760628;
	Sat,  3 Oct 2026 07:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qf5W_fZxPXyd; Sat,  3 Oct 2026 07:03:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E5A506061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011034;
	b=hAV3xpE98Um+zoZ1BJbQKBEvpm5tPrKgfqCgFtWP6tknYYzs3AL8ELSptfXCX2EFyFpy
	 CS3A+3DT7dRMoeoGzQoQVYNd1SZPHCH0xsPzc4NvbPYTYI/qJrdMRNB6MM4BwgO+WChd8
	 V+3S7YgNkIxLDT1vcRKWMi7qSf+12r3BrhzJWdRWGO9A9bgyCW8jaro7ZuVgtmWTAyD+w
	 XEXTyIinLyl5KYooHs63FctmIV57kjDRcR4quj4KoB2JOU1BowTP91qgj7opS8nx3ZDBz
	 udh5/QgVsI2FRKcDzmYna/8uTyGLaFEo6YWXrHELDyxTdl71ja8GSgBIjWf5TTeStYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DN1M/dPojTSZvoeqnOXiWzpRQWTOLc4WhbYKttXmvww=;
	b=EzLY723+eV2ZcFeobeK8mf8MixVK7ZQPE5nYASqYBRY7bmb1NpoRtcLrXfTXUZSnL2Gh
	 2UznVGZ+P6OcLDUGlskAr6hMN/HbZgBcqL2DLYWQGrW8IXnXkGmEy5DfnEgCkxIoBnS3T
	 9OrB0UP2cyg4dcdB27OYWLio/A8zcmAcWWipWUE5O+ImBVWyih4sUevcYxoKKRblesm2i
	 p2W/9YeRlukmPmbZGvdeaU0h6VWjjcaqMapg++LyGJQaVLsb1ck6MTZeD0o33vTAM9Md8
	 qpL/Myg/qE54/SgNRZpOvp/9QXvZvh+nfMQMZNImwMrEpFuwWvE79/b3TzLDOvYkBpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011034;
	bh=DN1M/dPojTSZvoeqnOXiWzpRQWTOLc4WhbYKttXmvww=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fYNH0wsyHkE1Q4qB9b/eGHskP/YEFvF3Kf5f8M0yAaHR6ZnsN591aeefew+mIO19M
	 GvcC85252MBrncjbjj+RZT9lsA65GhqWFOHh0qoz5u1u/eNSpk7DN1tPrYxBFFcmn0
	 U5oxECQFrJqsEsAglia+huDvLg9Yuo9y+jN0h3jmC5LIzllPP3pSwDhboA9N0Q/n9P
	 ysYT4S2oqatKqPmqmzULQcBxWc10Z+TwRq7Jq4rP7bYZfnL2DcuBBRnzfdCnvH5Zow
	 /sHSbCkO/A3ZTe1hF6pYkKfdXX+rX1bYqt0FvyN+ndfztVsSCreonju2VBjRf1+3KQ
	 oy3y80TraAGHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A506061C;
	Sat,  3 Oct 2026 07:03:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 956B4263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BD5D40C03
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MP7DB80NqESV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:03:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8E13240BC0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011031;
 b=AukTlMI+CLebX8k0DdHoaLlsyHL7kNJnOg1mDMSbeTvHq893I8C87bf4C7LQxooZbX1T
 aaUJWlNSu+R2u5iKwFKGBvQWoHV0xDUG4JvGL0K23OZLu9OkotdIKPpJSt1oNW57wFGNh
 cnV2wtWmZLxQ6iPb9jQ9tYOzIdJg6oDglcK5ARyGph4Ar3u2wXOZ86ffM05l1unjJnYmO
 mSQ82xKWpZvAKIr1MPx6jnPS6rKg1kJ8NuuuQz1+ltY6jN4Zer4tOWQKO47id6ErH/ec5
 c37ILX+a09Ny0PbmC4NgoVUm0YQpQw0cVja7Kc7Mabh79MvnwLd4ytVB+BBwihS5AQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011031;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=caEOkLywdyXUvFc9uizrZzBrRAkQBaoM+zgrUcsRNvo=;
 b=DgRx4xrKg6UW5xPn4y6iAVrVYZ/4RPiUcJaHk2FwFtWxfLpqEKpgLM0WX8Z2YpfH/MPF
 qpkF9iTN2wqP98X7DkUqDBS3rCXBAt52N8y0Mv0KaUparxGq+SxiLwn7kJLN7/vmmS72r
 jyYuzQchIeebw4/muF4Xv9LOVcqRv7QkmPOaxRJBU/gCJGp4NGkGDpkVMqRv4POAFycW0
 JCVA74nxgTkf9QJO1len34VQXxQxKz+qvROxCxqZXEke0oYTmtiHXqqRMdEIAH2HaJFF+
 tQIHosPQpwYGpUuulpd3DSMqCJLmLV3QlnTqH4byBTxc1R++v2wqC+5pHBZVijLd9iw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=A1Vyxsyc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=A1Vyxsyc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E13240BC0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010922;
 bh=caEOkLywdyXUvFc9uizrZzBrRAkQBaoM+zgrUcsRNvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=A1VyxsycBdzZUqYthO4jJU5i7NuVEkYopke6MIFZ422bUzP54BTEoETqYzJfwTHK4
 Lf3Yk1kDJK+vBwyY3Uee3COufbKiwJuQ38bZJK9TObvAFIgvz3tzj0INac36F9TArC
 81dtxbL8LNM9ELnsFEkcb+JTiFgcnQgVRDvkGu876brlLML6snZ9f9OeIQ8sDdPpc1
 kxl6+1XZUMa2RTgy+RwkXGVnxqm1r/eiTS2xYCL8YKEaowVtfBihUCKKXqHRfrUn6x
 pKKve0E9rxndJEL9Bikd7SKAIQjCMHXxFKmuArG5vPrCb02csYSAGn/PW9PdVy9ybZ
 R2D5iWWq4cDZA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 1gLKWOSX42urvMZcL1uHJ3T9/lvOG4IIlcEZWOrriL/fYeVi/YyemAZEpCKtSg7IBMO/wQCGZ3J
 rawsaKh87GbOOW5P5lOS0zlkovZGcgJQlfniS4bb/llW91KQ/Z9zPDIKKSqyoOvVWovkt1MyMOh
 U+zvdignSsUlNDzVUxX6YSa2rpwqLFJgEgFQn9gb1H7lT8sEJiUS9VuGCmsNRSZ0UFf4TqHbCye
 JflqsQfA2WYxGJ+n/+q1HedH7dTlseYsObG4+WfZ/4WbyYIBZBCOdXjZUN5gXHgdWCooLu2X58f
 j/RLTKYkxg015NTKa01uQCxj46KQonws8gFh8ST7PM2L82sI58XnYXSnnn6yGq3V5PGmSrd5vmH
 38j0x/LyUbgjhG3CI1sZuBzp0hib0rL4ObUGw4Ax+PT28tjSXEUaZGzRus9dzcm4CcDjkBq6Uea
 q8AYn6F3JAEmSGfjmMLVHgtoZcGm9V//p3p6Xq659NDkFHauOVOQMLQdv7r/XExILGo7x23eIJf
 h0Te2ncL0JEkCK0vdq4M1iiIUychEF6zs0UsYDNxUmEbji0nJgG9IHl0iGjcTH/9Z0j9Bzq85Qx
 wQSnzubuZwqTGSUt7A+38Wep24q+EOTvkrY7RVZeFM3TAgX3tit1I81q8yxpi/X4Dw==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCBBDA4C5412;
 Sat,  3 Oct 2026 09:02:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-2Yko;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:22 +0200
Message-ID: <20261003070128.1295458-110-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 110/114] package/python-yatl: bump version to
 20260805.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 5e11fcc17d..7cf7c0485a 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  aa1ee295477870a084a891f864fb6f0f  yatl-20230507.3.tar.gz
-sha256  a7d60abff563d7eb680f4f97efb107b60b32f80061c45bf4fab15c4ea2a057e2  yatl-20230507.3.tar.gz
+md5  520fff685092743ec36879f439cc8bc0  yatl-20260805.1.tar.gz
+sha256  ca09b1a4be97dece288db44a98dbdd3070f889381e503bc5be7603829879e92e  yatl-20260805.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index aaafef8988..4006f59374 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20230507.3
+PYTHON_YATL_VERSION = 20260805.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/bd/3b/723a667a24512a299e1e139608e787c3b24b7819302c15c7aac09c3bec68
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/33/bf/5456f2fa12811b4ce4dd82741ad781d834ff4f4865b75f775e50c3e9ac3e
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 PYTHON_YATL_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
