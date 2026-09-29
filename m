Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95513CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 19:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A57407B2;
	Tue, 29 Sep 2026 19:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtA6fqYebgVX; Tue, 29 Sep 2026 19:33:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2D67A40766
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790710428;
	b=rLQl+WzCRTJTK90holt4fn358i854v4DyzlPieJMkVbQ7QeU53HtHOZwXEdhMOI9FWYD
	 f6nKyM+xddzdhI20bhpHMW94mypbD+DogqJkBfJVgtqYrDtXRXM4mlAYYO3Dzjm1WRROw
	 gMbmrP5LSqaNkB8Zjwf5GVRJ3jFVVOcba1nXZpgo2IQw/CrEeywoq1ZLU9AO3wjNY/Ri8
	 tVHaUGgxN4bEgvbvJEzZoblJky7T6zNLAogaJVdh6uOaATCCN0HNOFgbDi3ChE61z0sqg
	 Efq7BK4NGTiWedUOHar1p3oxShJKpG2Q01lRMTmThcQ8OD6y4YhNWXvxH1Rt5sn60Mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790710428;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7jqMaYVl0hA4aGxoeFwa+IPhdaZvz36PzS/w0ICAMvw=;
	b=eajvtGJHRSZPS1YOToOhoyu300g+LoVwI8+Uy4hpIEbZiwGL1h+fGzFceujccHeqj7d3
	 pTEhByDgdkFtj4GKtj2L3eHUA+ICJ+hRctChWezPsdCTzvo5c0s5xhEryJtglX3S/skA2
	 5tQeqYLSJt/DxoEwnMKvSZeyDiX9hc2ft/d3+sTzR57J4aD9QzxECS8sKnrvWqB/sHQN3
	 ZgX6q0Lg77W9ERMx8pCWDFqG0B04GGawnwasG0e19bWFCBF/6zj9kYeS4qs0Znlqo0h29
	 9SfBnVp0+ZKIFKohuOTlxW+RlexIF2HTDKtgAJfiSZ6ghWQH4t1kjr+x0L878AQqG5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790710428;
	bh=7jqMaYVl0hA4aGxoeFwa+IPhdaZvz36PzS/w0ICAMvw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RYddROTs8HbL1DZBb1sWEYymFwQd/N4aWfLXMooT1lIOeHKS046OcGidnp+rFx5Zx
	 F5q3XYf4OZL731FaVPqEh0dmtBHAftzAZbDr2jogF2xW0ICRfsIpb2UDmnHLLSIbnd
	 mhm1lnyMmDYmH8Bv6RjvfaMi/Vck3mn3Rbh5fxhuT2lRTqcz/w9jTjMKReEUGHz+YK
	 sGTYrk3QPqbUIPpPUpCXHa/Y4XglmYRNxIs2cTWL4zAJ6RLczWtOlmka1ybQc6/uIY
	 Qx9DNCeva9GH1534yiEzjHZ1uC6y8ce35npPcKSIIfRM5vCBrwwAp+WZAjOoz463A8
	 NRmUDMZzihN4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D67A40766;
	Tue, 29 Sep 2026 19:33:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBB624E
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 19:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D7BB4032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 19:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9ITtMznZCND for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 19:33:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1DA12400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790710425;
 b=NQ6XQM0p48S7yELrTzoCU9El0KZxKXZ2QT9FxLwEIZRingITwd6p9EY0vve8+zutDl+J
 zsovR8y0jaZ1bJDg0uqqE8f/SGbWH6c/2hLIuutt9tFBQunkxhEJfV9i9tKc3Aen01Fe1
 yueKwpOmmeXkdddPJ8UPr1grJCn4um+N5SMyP1bnA3zdPDNEa5mPS8Bdhx6Dau8DF2PFq
 0exwiy6/k+W/WyYox7eYLWQJ0RH8ZvdGp4POQTuuQvgpwMc0sOL8NwFBxZe5X5F7ubkWo
 DXTZYJ3VGNcIV3uHcMpIzD88NCOwCS4cGSTlUir4J7wqFCUelQfSvvCBlcqRk3GFaQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790710425;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mlatQ899+fGYypeAGJq2+PrClGddSJij4EvBO3NEecM=;
 b=GSjCSTo+v0xjI7yt6+Clk9F4j6GQbKOTwer43Nzr63xmGBMKGC9sHImzzthjrWRlJket
 0mwX37favZUsdwqPxECL7ODs9kXucJBKusEcBaxl2F+/2Ag7bxEOGBXMOlxMPFs7139oG
 0ErElD/omosGqZFle3SmVhS3vTjozMV/FfNIgy+HeaNDBFYUQiKvpZscbnVs1tOmvnaOC
 Wi2mrob3lSuhzoXsFGEo7HozsHSy2hVtsW/yUJttcw7sgEga6mK16xAi61LM5R8YWzZrf
 WQSq0OIpo4fa7SVLEJxv5ENGApPuTo43psCdJzcPhCwbqZ5sUHCriQyZ+x3psC1jyMA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ja5O9Ska; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ja5O9Ska
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DA12400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790710422;
 bh=mlatQ899+fGYypeAGJq2+PrClGddSJij4EvBO3NEecM=;
 h=From:To:Subject:Date:From;
 b=ja5O9Skab9Ut6rQhV6qrB7/OXCFJXCFfWFBjCA7kkg+Ur2O0tZ9rWGxBGIJMUMEsR
 LDfrSlKhq+ENlGoInYGD4GyBc7o5TIAdWJRO0KOoYBU1tdyiZ7mZdVLGRY5YExYI6a
 MC+J7CSJTXeiIr0k3yry88E3LN68OJYDU6qcGurkpV+GZsNf3xj2TNI7zdbpYbWjMH
 b5aK6BSc4IbN1i153ZGVFARLZ03PAayRB/mFdUKwmF965a/LIo0lVqBjwBKXbN36Jz
 alZzlI58X0gUYm3dm3mUk+ApeMF5e1Fo/ZL6V3fFk8zN1I/NrLvFYNTg6qU6TjckyN
 /o8Rol82EMW9w==
X-KAS-Sym: v3:f51bdf72230551df:TZyObzTwpxMOQXtnJQn8js2C51INGe6YlfElLpVV6ulQF
 IjK6dCamVXzbXeTmQkPgFCxzUES0HjdeiJaxT3op0qo+9QV+SYdSHkqHykUE++sSeDLvLlsiUDa
 L3Gq7WqN554AZ3tna5JZjEOjaVnXk9OeO78AndazUnbOl06ocHVqYH7r9iny+SDUc8sM/HhaaVx
 qTyJBVj5MAMeu/aerVTfkV49LtN/SySu2WUvHepHtbgpjpyPgxfvX1C02C06KjaFeQibj//hXyd
 3ePGjCDCd8uugHcRtXpJH/ZScCrCTQqEZLgt1t4kaC8QrylOKGUV5LF2+vevAwBxzfKcF7Rg==:
 YA1fclDjQp2o4jcnetaQGUgCugOHj6nsbzWa/tNQSWnmT+xIqe10NACvXEyxX9FC3n7VbZV19xn
 D2UeXr0FrUEUijLB1zaviwc/xBtIlmJHO6IYwBbfiwrH2F/X6J/S9/Fba1UMw40I1W9Hr2CYUTV
 clseqwS7QlmCdbU8j64aQci9BUyH1y43Sp3SAH1z8UagSs1VhOdZYHxsT5BF0GXysnYXlE3XFoq
 ud3ezBkweaththUc1zgynAjLIKhi88jyEuOh8INg4gdxOTKh9hNwONGEX+OWF+9F8Mn0O6UHiQm
 UMncVAmj7IideKVUNxCsxj3oTKhhHPj7a2F/PMIH4kTJJPuvNL+BoLM01TXb2NjTgSx0cwKz+R/
 iVV/RbihN22wMHshN97ggZKbKOsnBwYQZX0XVy1MdMmrcybskj3IlEBKopD1CMeA7uDhbD1o/tA
 RqP0K2t9zvag++f/ps2J1Amj9HAvytbpYdYO2WrRDca4+Q65E5rzDxPY8GwHqqk/gilA85FpMnr
 EH+KscfdCO7RAHKKGzKKkOTCJWh7L8y1+GFJhha4SrxlHHSOREUvTJ3GZ2tCB/dII84uN0+KdNu
 fnIlXPMF2utSbBEHTUgZgmmdhwo0KjUJWMpALv6rn9/0zA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DB27A4C2F15
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 21:33:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49606)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBda9-000000007xh-3Wk4
 for buildroot@buildroot.org; Tue, 29 Sep 2026 19:33:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 21:33:42 +0200
Message-ID: <20260929193342.1905539-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/rsync: bump to version 3.5.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://download.samba.org/pub/rsync/NEWS#3.5.1

Switched to sha256 tarball hash provided by upstream.

Added configure options to handle new optional dependency to libidn2:
https://github.com/RsyncProject/rsync/commit/f0177d82a8fcbbebaac2bdf556f983160ae03988

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commit/1915a4f7200942fdd6203b07debc24b57ad70502

 package/rsync/rsync.hash | 5 ++---
 package/rsync/rsync.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 84cdaf680b..3fc2603049 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,4 @@
-# Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.5.0.tar.gz.asc
-sha256  c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33  rsync-3.5.0.tar.gz
+# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.1
+sha256  c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef  rsync-3.5.1.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 391659a33d..af18dbf608 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.5.0
+RSYNC_VERSION = 3.5.1
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
@@ -34,6 +34,13 @@ else
 RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+RSYNC_CONF_OPTS += --enable-idn
+RSYNC_DEPENDENCIES += libidn2
+else
+RSYNC_CONF_OPTS += --disable-idn
+endif
+
 ifeq ($(BR2_PACKAGE_LZ4),y)
 RSYNC_DEPENDENCIES += lz4
 RSYNC_CONF_OPTS += --enable-lz4
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
