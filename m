Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40913C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F8840BB6;
	Thu, 24 Sep 2026 18:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoObFW5vn0Nd; Thu, 24 Sep 2026 18:57:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9A6FD40E20
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276272;
	b=raj8bTAy0h88UpBx2V0Zcc0HTSAoKUdRpYuBY/GIw8bCHkBeurA9HW+qz1R1ERKrkxS2
	 r/fxsafVZvjIHy6i0lA9g2nLMbSE7nfw9lwdby6WEZvMfZwxKRq6IxGMayksn3XVeTs7X
	 I5Pw8nK0g/MCB8JEwsm113lEjDPWXxjpQhqphpcYRuILTfr0Sn1bHzUz7FXxz/lHGcoKh
	 IXqGioAme6MdN9jd8emhBWkhjCDJn2PaoSY3ecmKLYf1Iv5Rcfet8ZqGsXlmFOGp1ZgYa
	 ZdYth+luSB9j84XGtrlB/Aul62TD9dGD6pszUrzP4fhmb4wxAG86FngbJzWu8N13HKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276272;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gixbKFgO1Aysfz5T94Wjr0njeQsc5wXzQchmdbUqZyw=;
	b=pjKOWQC1AnBsfVz9dGaU9i3yiRQ7/Cq1cnvWFKH74Z74sBM+NA5O4DOoWblfl1RLk0eW
	 Roi/ruGyprchUblBRlTqJrB7/8xLpIR5xFIubJlEyLC7HnE0TsRb9LYnpWrkPQB1UVLRX
	 e3haci0j3k2PjwqdrsVYA7nyUam1iOczldM6XjKPUG6Iw89U8IAQYZri47+tgi549Jw4Y
	 4AmUbCQ+M/cJ3M+l4N9bURIEkzdLcJyiDCyobdUKjGL6C2dz7fL8e139Ydi4Tkc2Ax9OS
	 pyYchLH/Ehv3+Qj74BCfufrwLTYfqqdt64/z3XzDbr3UWhe6nWFY0RzTchOkJTDBYNA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276272;
	bh=gixbKFgO1Aysfz5T94Wjr0njeQsc5wXzQchmdbUqZyw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sHP7yl2+57MFmJ0hRKiwdGcQuiTUhuJDDs6hpIVrYT5vL0YtliD3vn9CCgLhVhKW4
	 t6+RBrgTLmALAlYdkAA+E3vbikF/5litAEM7ADkPjBG2g3IbJk8AuugHjr8ezr0QPN
	 8JxWB291JWm0aVsjPzpsGq8M/e1Vp0HtA2dIu2b6aCXdCinPf5zIESs34wO0jyWIe0
	 ubkTGRgs5Tgn3og7ZwtztdBs3qzoDa4ns+pRAYCh5ilIlfWnXj2sMO2adr3SbHP7wh
	 /OUPWtxH0+aU2AT5cMD3j/mwCP1NFDUyQlZPfNsCG+bTW1KN7LoBU0kTxzxOjVGgfS
	 m4skvB649VkwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A6FD40E20;
	Thu, 24 Sep 2026 18:57:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56AA8332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4219C40ABB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5I6cUt_p40S for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9A0DF40AC3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=KJAWdGIaS/nEn4XHEcbK9pSa0KHhTcNn59fJvLxHUeDRt1/ALhRecuqwwj2PfBFOYkES
 /HVNkepVbfwS5kjh25Xj9HArSBmxkSqXuMIUoOBZJ0XJx900S+AqnU+JycnkAk9TZmKW/
 efYD249+VEbbUkt6YCYjye6Cd0b+dSmbsT/nUHb009tK4ySX3jLAfBJA4h25jYlXwhZ41
 2y5GZY9XEuWSamvTSMhZz9LPOYylnnKEBJaaSi6+NyayMlcab3VMOjqQfrIYlqzXvU2zM
 dfOm5y1XsQgOim+IlxRXtkfQOIcO/tr3SWyN/OaKdFUDUXoO3nruP9Fk0ATtGqkpJPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CAdAARQr9VUKZbKUFj8Xmb7RFCVuOa4Sk8+dCSETMlk=;
 b=d7oi5DEY1fLhGjhnMonm/L3VJ23sNRFCbmtp63m86UtgHGdwAXIs9qc9LO3RHQHxas9k
 F+OPIQ/IvYYFc0hNisQ/lDd8c//tOYuF3yt3llJULk8hQoHdZTXwJKv5enUsHiBEIDcpd
 Ks3A6rHx6LPGIQkDtvUpTL+GpFzjlLZK8G6Kk2JlsIfAHCpbcXU2BHfuDpuNKg6lP8Ai8
 +ysximnjTKXiqsRlCmugDEmbPwKLsTfdMelqb2bDnevTi+ULAql7WvfPLPa0WMX6xlQ0F
 5LtpOJfchOHgpJFJxgpaFDs5LsszykNvqD+yxY0HRO0Z21lUjTVAUwVtn56aRqeO4bA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A0DF40AC3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C7378D5AB; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 79305a51859bc5c17b6b9d5fd2c4abe8a747e898
X-Git-Newrev: 5cd2a457cae0ec936ac74fef251318c313d920d6
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.3C7378D5AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ghostscript: link
 with libatomic if needed
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3340647144764981334=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3340647144764981334==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5cd2a457cae0ec936ac74fef251318c313d920d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/eed/eed88a2a77cb8c4ff8c59bac5091221e6873004c/

The build error occurs since 2024 so a backport to LTS branches should
be considered:
https://autobuild.buildroot.net/results/1ab/1ab4767c1198838c3e3d126cdba790197d102053/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9c0385972dfd2e244214ba4549e2e8d011a26565)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ghostscript/ghostscript.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 250c851b28..08e2667981 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -37,6 +37,11 @@ GHOSTSCRIPT_CONF_ENV = \
 	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)"
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GHOSTSCRIPT_MAKE_ENV += XTRALIBS=-latomic
+endif
+
 GHOSTSCRIPT_CONF_OPTS = \
 	--disable-compile-inits \
 	--enable-fontconfig \

--===============3340647144764981334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3340647144764981334==--
