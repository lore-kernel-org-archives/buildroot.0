Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED8EC982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3ECD60EA3;
	Fri, 18 Sep 2026 19:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPOb3GsfYuNj; Fri, 18 Sep 2026 19:35:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 081C160E4F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760140;
	b=JpPnboRzCSgUveS481np8jYKhcxm/zLg0wprnwUeR8hyrCSXXJatNWvknLTZcb0qh0J3
	 O2PcUNV1YK2e5neTRZVxtkfDRG7Eqgi1tpcRL3HWtqgm+S3f2aH+SY16Zxn+KtFUfg1g3
	 5ZH0XG4qLD7uEKx71666H10rVqlqqAysp86W1dzhWGAHUAuw33lYTKklQ6tkjlWibyvyq
	 QXSJGSECsErSoK9FlL7/bRYB7BFHlYN0B2kxu9wYb093rIqfF3Fnwb62mG2aHkDyMgJ/v
	 6N4bQ/y45GEW/mL2maAzZG+bEbbRYVhtOJHWW7Pv8W3dde55xEo2YrxG+fgPyMRJhqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XFrkAeM9glUJt72wtFAXLtTNNAPVxRR8DLdLVfK/GtE=;
	b=gCT2gZ40FRY3OSVEaj/8ybsYmMs5BPbEwVwfBVXPZ9YIkcgcTqAv1Y4j7FoWlTGEnXBc
	 4ZMrNITudmYUBJjtGMUizC1emTfGf8ic3yOjkQ9oWK+FR+VTztcERLbC4HydGuV1yBxK6
	 KUjcoXTw3SjX4wL+lg0WMfiGdg2kSQKB5JMicAbuvmDhHz0cI8l2HOtv9lvs0GkwCAS+h
	 lsjj8hRkzHLOuQjnFzxlVm9UT2Txy5k7MSaSCCIsOuM6QKo6dchpfSunP1RYcJPVG+hl5
	 MWZmc7KtU4i4J0BY/O1l3VzDfvpBABdWUI8q1+kBgU/pkbQLfYxdbxGvLEugpvo434g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760140;
	bh=XFrkAeM9glUJt72wtFAXLtTNNAPVxRR8DLdLVfK/GtE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CTXeBgIXGh27H5zdu7XGXI4c0uunKoh8C/lFnnQ523WcRk+vbGr624+ePddwj2r56
	 dazaqwrpYGsVvwOGJJDEfz/YMXn3oeaFTaKV5WPXgfYTrmWCXg0kIJm6r8uQ6xrM4J
	 zxtGB33n1FaLKvwjOA3POPmETPHejXR/LeuPwnmk86InF3vIKzTDmXw4yRq7FI4qcc
	 EVhkqYdQv9e2iFEU1fY6fOb6PGP7FhsNj1/DfIecfq1aO1d/gpEk9fIyxZedsRyfSA
	 jeS8vxrSdXo6XKXGy5wt5Zdi5hyqAfsovQ9EETk/Eut9/wTX0AewQIcuX3Hm/dC/6I
	 w/UbemuDEvjeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 081C160E4F;
	Fri, 18 Sep 2026 19:35:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8513A43A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 755C260E1F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Unzo1a62Csou for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B755960E16
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=P/Rx0u/eUCEZ1xd2twJEfHLigrjPyl9DDX5yJMcKt9pIs/dJsTXoIdAt0d6mhq/fuAhB
 1nHGX2b5vgS+jM280KudbbAm+HCW5u4xGfAtpQGkN5dMyRkfP0bn1VltRCHVCbc5gWtVk
 S6hSWeYu2H9C60PWanPmWKahKdAQnDpdsQft6R2cMTCK/PIG8S0CSVLQwz4ER2bXl0+4a
 6bzucvLlcUyu6y1tCUE3SaXs+GyhcVJbj+OETK5INiO+M9TKK8f3D0FefTxpxCsUmBNxw
 Nap6acNEZd8i+JmWADZrDiTXW/jogUrRehBBAzTIdppj40W+TIlEX3GjXYDLgYEUj6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EO8XGvHQY1oix3ODoV0iaBCQD0hniD+NJpun7jnwsV0=;
 b=bMxQ+0O8IHOKlkQV2VV/GEWR2F6H7W2hbWRs3LGVAN8pqhOd9rAAz8wc85hHXbc+c0sl
 25izGMKq4o2xf/47SBf5zl3/91tMI4JAwIXqjBxEOW0GqwXzWPX0cgDp/HZN5en2FFzgL
 CsQG6inwbn3qJ/IZgqmiWjt3gb8Qo/mg4DcWSKNVeAAISjwlLGjhL1uzlpxx3nQxsNcoE
 GPZ+8aasmZeJ8CKkkqdHjpM3wUPVO9SCeHFHIUuqU39LoH13RC5OYoppkY/LpSHkuNlxL
 y7swzJj7dLEWUKKiHbGzEV7dt+jrY1OT7uN9gwlx5i0B0aYt5fyAG7Yoyu2M3MJK6fQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B755960E16
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41CC2976A4; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:25:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 101d543e38e5be14f2b545362fdc0d795c0fab24
X-Git-Newrev: c6986e6d2e284604bcac43bf9dfd79f3d028ef6d
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.41CC2976A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: fix dependencies of
 BR2_PACKAGE_GNURADIO_PYTHON
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6986e6d2e284604bcac43bf9dfd79f3d028ef6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_GNURADIO_PYTHON selects BR2_PACKAGE_PYTHON_NUMPY, so it
should inherit its dependencies, but BR2_TOOLCHAIN_GCC_AT_LEAST_9 was
forgotten in commit 8b3993178d0ffae312d7dd0df70d30d1d3d88873, when
python-numpy got this gcc >= 9 dependency added.

Note that the existing BR2_HOST_GCC_AT_LEAST_9 dependency is correct:
it is there because gnuradio needs host-python-numpy at build time.

Fixes: 8b3993178d0ffae312d7dd0df70d30d1d3d88873 ("package/python-numpy: needs gcc >= 9")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnuradio/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 98d87aed56..e87275de4d 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -80,6 +80,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -87,8 +88,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
-comment "python support needs a glibc or musl toolchain w/ host gcc >= 9"
-	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
+comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_GNURADIO_SOAPY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
