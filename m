Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC07AC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6094A60D90;
	Fri, 18 Sep 2026 13:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOMGH6O9xhKL; Fri, 18 Sep 2026 13:06:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1E3A960B7D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736771;
	b=jc0+iIyQgOrSRS/4M8+d4SJQwqhuqwTh7FC7o+YuGioJjlG8Q/+qShrhoF0yVnp/9m1t
	 y9Bt45GhGVWbK+hAd0hGBbi+WjVuliNya4lCWMD0AgcgGioKQlF3V/4aRpbtfgK7HBIJ8
	 f0pnJQ4yKvJ5h/J/0FFKZfuZRSLcoubYYf4M8CmZ3jXknBD4r+xhN2cpQXCkv3KmWdZue
	 miwN0ES2JzXBeBd8prmTCjn7bytFgJ5nPWfWk41nl1LejVA2eiRJIldblusCMTJ/ZKV9b
	 qncaaWxPOpctdLm5DHsN7kZSg27xuWY8aOeWXB44LxCTs+Q0RfSlnOUzFwSuVVhwOQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wc37KG0lHydpPfV9Cv9jWh7Ik9oUtccX8okKkvzktAs=;
	b=cuhmjEBbwUbzX4hrUMl3wBi9698bR6xwtWob9WgaMU1JwlgKRKm6f3rOlnuWYGYjbdaU
	 RRlkg3GCT/2RkQrWaiespKg/6GUXCWYRhJrEQteYIBVva0J+xc+b8UXB3Ngv+OKoIIY1u
	 i1y7Qmb0qZ0S+FaVvfZXZ4XXvZwjqvXuJ6wSmUqeLV7l7K5o14+lo+qpLEEUDy1eTC0tM
	 0mQJxILOpGXZui3/gBuTCFiGhDFZl8yg0eihs55zaLfNx2BTMcOs2rAjS54fqP0hC0mA1
	 bYFxBm8X2bNT35pf+lZO4xL7L1tWhncYqCyy94TSGYDLD5UXZblrpFdO9mNAtzT+fug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736771;
	bh=Wc37KG0lHydpPfV9Cv9jWh7Ik9oUtccX8okKkvzktAs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n1Sy4X5TJKxXXLo5DTfyOrgTa+Z9EPUbtnFs/yDrxwL+TxA/JKDE4a8EvVxYJZwQZ
	 RCKnqZsLsmAvoIJ4aku0YBaNs5bzUlU/H26XXKNuyol7tyw7U/+FFyCsn+Vj3oKwM1
	 L2xCikAgosN82+ycUvFO7ijdZWFo//bMdWZ+nYwu0Ac8fw1o7Am9UgmSL8rriJWKI0
	 5ikagsF/F8cgoiyXl5LldsHqYV7Sn9PLdRXwK9LSNbHAQGB6tABasCwuwmkvswliAU
	 sgRKJRjEQTqkD1JA2cDsxtGu8pZQaHheNr5Mg8jwogts18XxUaOd01B1heu7byZHcg
	 o6xnjaZFCNpxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E3A960B7D;
	Fri, 18 Sep 2026 13:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5DEDB0C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8427140B7E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-Fn9l0-IVsn for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A447640B70
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=oGrc+ut4/7+zz40bs1XW+gV3UbNtnYUK70QQv6V4YvTTok4cKYxnAgcexvtvIyVtkMlp
 j/TpXWvK7TR1qxJHRMxeXUeutnCem3Qmni8KchpAxAmwC0eMQxBaUDwLEoS3m5UUGh+1D
 jkWqM4iS2JYP3JsVnwvz95glOICAUHNSTzXKk0HAX+v4YwHZp3IDgEYgpKYxKtt64jqCg
 ebYvKAyhxTpzyhH5zn51rRmecK4k0/xe47BCjyLWAdcLjhf8Eg38/O9dEhpmRBo2c8vDB
 2DVBPF/2OIc0cfLmJf9/x8h8cJFYQ0qp1tdA+2XARlBP0KalWo0e6wsqIc1JYrili5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ujQuGaY66yVu9+Rv2AnzJabwxRkDDFT8XNft8egVQIM=;
 b=sIoC7fx3tIeqidPoJH7mRNvMRiRZ0XHx5ejnS6dZuqjfZ6bUggT5eI2Ewr/eOtgz4ae6
 mO1bNCxAPejfHWn6QzMzQ3K281uTcLHWjqQDQ1nUAEnmttDVkH13zNrl1Dy2fngLp/9zM
 4jScrY3gto9XIo7g+4lHIe2wPE4j+Tqgriv8Ze0b/gTPb2cIcmpBGOvDOX+4V1DZQbdty
 H2tbKpzzmuCeQwPQ+jdKFw4bAxLrNjsILT5S/d7QLLpvZQXqxbY0Rhr5MHBw0/OaC8NOO
 VhMTVuutVBhmwXDREpQYgOEh9h10p8gl2RIg42JEZehwXzSvgTFEEDwsqvvmvQvnMuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A447640B70
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D61B976A0; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6b69e037cb5c60c2ea4912c41b61a18f3c7b4c37
X-Git-Newrev: a6af92fb3d461ce81e003addd582899aa6445214
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.5D61B976A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-googleapis-common-protos: add missing
 BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6af92fb3d461ce81e003addd582899aa6445214
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS selects
BR2_PACKAGE_PYTHON_PROTOBUF but did not propagate
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS.

Fixes: d37766a886a8dc3d49d45e14955411700a5efd26 ("package/python-googleapis-common-protos: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 548904619c6498edc3a522d2a20dbb4179a206c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-googleapis-common-protos/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-googleapis-common-protos/Config.in b/package/python-googleapis-common-protos/Config.in
index 8f487f5ee6..541cb5bee2 100644
--- a/package/python-googleapis-common-protos/Config.in
+++ b/package/python-googleapis-common-protos/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS
 	bool "python-googleapis-common-protos"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	help
 	  Common protobufs used in Google APIs.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
