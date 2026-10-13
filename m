Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD86CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97FAE80D98;
	Tue, 13 Oct 2026 09:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaaBXoywszsC; Tue, 13 Oct 2026 09:43:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D2ED80C8A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884604;
	b=dX2C8sPhvTVdNtTX0AqN4CKW/i4N+3SWjSPv35eoLJJ+xmJyULM98UuGhC+ymIEGX15P
	 dwVkC5mLhtgQIsOLz/rZ0vbK4zZXuMhAAHt5uo7RVjdG+nWuxFmfRwdWVF5s/k9QwzSa7
	 J0i71OaqpFza45sizM9Fu/mcR5WAZHx605ei+57WHZT5QGFzbZcABXIg7hgoR2vn7NE5z
	 Gh2JblWfiPnRZ3FR7GrNfK6Eim/7f6G3Bfn8CvPs5eVz4qnPmeUE356i3R7Wvj5i7yODv
	 NRnCq/5FDWMM33mofRteE4RwhMSzss4kIR8+zPPWCzoisJL2hUjOG0zcP9qZpj95X8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=VQ/qIy3japKS5eFPjEycFYc7gQrz8LICbIT8+PMCiHc=;
	b=MMPrJR1dNblxQN6WGMXr2FkKCb4vG5tDUcChkA3NoTfpa5RoukhBtoS1MBbeOmAWV4/t
	 o6r5WylwBOnsErzql+eQVgl29xqP2OkcSgUO3Gt1vVB0ZSW0rG+gnGDqJzs8T4RU9U1Y4
	 0SndeOv+L9yC5+r0GxiOFVYpdy9Cf/EUn4rpyYO73l915AdPJSH9XYkUkCVMoo5dZdmAW
	 lhx+u7vgczKP9CHAr5d6eg1uHUIxPoDIVXIDXBDe9igEWHDKCfjorSReu+BgyuDJAjTfc
	 NQeW0Q6JfRxTm2wpXi6WZM5EOa42d4Zsfp9pSMLOJLh9fQF9s5ontZJeSgfzXdw0TAA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gh6jdbaX;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884604;
	bh=VQ/qIy3japKS5eFPjEycFYc7gQrz8LICbIT8+PMCiHc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AvXIAGjCkH88Rp3ZKoXzAeVdtTM9JQBfPc+oF8FJtUV3dsW3zN7anwQWeIoU9RrRl
	 L2OgvzigqHRY3WC8rfYaHzGOZiP0aDqc9C1kJx+aWxufnf67BHTDqfn4/n9x9Ibc7R
	 NFmcL5QaGpEmanNPHm5uNpuVquFXt8y7MsIps+707VRarxadNFk7nBOK8aZ2Aj1zH1
	 L+zt4XPE100HGkLtQqHzlFc990R6UzXYL17ASHUbV6LET4HhcE46oTa52K35BK5zH1
	 M9x45UjgNQernRp07N7QJk40gPzK6E01J9fNRAxklVgt6FppakdkfTqWhyArVvPL5P
	 qQQNrsJM7OtQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D2ED80C8A;
	Tue, 13 Oct 2026 09:43:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B75C362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CCB980B97
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kt-MJy1Zh2tr for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFB5280BB8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884587;
 b=VxOyjbjWeJ7QpisnJmv6icGWnoanNqEVADwSizxQ+2F8vcJyyt+xrMhPeJZbuCtROTGF
 o57/00FEdk5xMC8BgyJZ8K59vbTrCUaUlyJ5CzgBJEW9Hjb1f3PkdzYTKp2S7LxG+wdKR
 vIshMTZRqv6FE8vqEZcbH5x3goal8aTyDI8C7CLU9Q+itmmFt8ekgIijQECNCr3bAoUvD
 HIM0e/KuETcPhk2om9WgWmHmx5nRtgW1qfESrWFri2tTPF9ists0AtmOSbTbLXCzcnqi/
 yW3rOjYFzuck+C3ZJGj5Ik7rtstSNAR9+q8LRoas6lDscy+lVZKFnZZCpls5iyDMJfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884587;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nxG9at+ZEFWO3Uz7LTHiaNSHNzXY3tpTzmnBOyN1kWY=;
 b=V3lvdGEpGWIuv1rrCD+RutaacCa6lnIEod/mdvvDNfmPZot62PUppzccY6+8FDD0sWcz
 g+JUuHpkLz1aasNq3iaBs0tr8qKsoicAeLjd8O5v8akGOxC5of2xCI8ucgvUinwzxmqI8
 cGL8jCj5zQ0xu9PSojC2wq59auh1FLeGAURTYsg15l++8rL7TdrIBK2R4znzp52iP75m3
 CqCT0TuYFub8KiQpqGyMqJbtyORw/lAjNcTUrUyS6B1ZhkDLr6SrDOkpCQXFNsOxgRmoE
 fPwcWvIX/CyFG0S5WRXxIpv00gONYVuUp4IjCmbLTS/x3x3xwMwA80mm0nT41ceB+Qw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gh6jdbaX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gh6jdbaX
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFB5280BB8
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso31514605e9.3
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884585; x=1792489385; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nxG9at+ZEFWO3Uz7LTHiaNSHNzXY3tpTzmnBOyN1kWY=;
 b=gh6jdbaXfqemoS7WTPN7RkVC2c5FSPMlO+gBZ13m+HPfukpXFbqbqbjmBH+1Tt1mlK
 zgSGTpTmkvOdF8ExQr8T+Kowgla6ak0V3Q2deBB4LRYZq7RLh3x3A0elMOVNZS0VYh1Z
 JNpYewWAYvAypi/Aj/OvgXsJUXXEraS/KiOcX9qtIUA9tbCGXMbuUKFV10nvlB5AZmiL
 EgXpTCUOW4/rC+JZ1f7QFIkxBaThqZE/Nbad5zZOQ1gexboEhZJIVKdiJzTzzw/2ZGeN
 fI5VN+NL3r1hV15dfUw66bmsjMgoYs0W2LyjE6X5ZlnHIi0u1MR+TPGl+AAN4wLZKkAR
 AqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884585; x=1792489385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nxG9at+ZEFWO3Uz7LTHiaNSHNzXY3tpTzmnBOyN1kWY=;
 b=HvlcvJnFByUmk83favZTq7yRdEOba0lNEXG872xOT9sdDN7uSUcIpu5Hc2sUiiOXVu
 z75UkwO63ONR7iDBH7QITICyp7495KjSIYiFyzISImERGh7UJhQHWfqspi1npBJmBpeJ
 0BFeIvm+KzBijVF+iLtNyax2d9r/2QCz5+4vzTkv7OkZR7mavzbaifqe7JrJuP5oUcmH
 0HAoidfC94qTMDy7dJ1fVn3Se09zSKnEF9lwZDL4IXJ36uYnfi3YYeWjZBOd4I+ZX/4B
 Q9zwtEgUcqiKaXOZpOguHPjcpFKa6L8CGKOEvR6w7jui2WKpQkFF/KcS91F8vAyyc5Zq
 JhRw==
X-Gm-Message-State: AFq9FYK90o5XfD3xnmDf8NPSJRw//dwyzwXNFRBicqf+JMZEt8H3GCtG
 53V4MwWb3EPqn86dS8UmMpCr4udBtGa7+pdn+h/39DToLMA7u2ua022J1WWm+A==
X-Gm-Gg: AYBFou3MKPS6I+1HsbjmzVNXmMObJAqHpp+YzWLXb4z2EzFxM8WNMGK29HOCnpIJz4g
 0hnbW84OdLRVKR1su7sqiwqRZOwQN4GBRQ4SrZGwvm2bFDRQH6/AlFl202aZPeLxtnbTn/tPt3m
 sJkUFBt9oGoHpJ2xdPW13HpQ4iXSfEUuJyHJ2bwKuDnXIMGflnBS1drkHMkJHl4BFc5Qv++VqUf
 F7XQqA+eZS4zHjEel9hASsGwQNiF5kbEbq8AU9PcH5aHu+ih3uVzebXdGLKTY06R92A4KNCRnHk
 fuLg3OkdCW8oc6GRpMffd0s+MPIib+imVZvVizjqmM2lxLjv6MiR+XIBDyGCs/MupP5KQGP2/yF
 1SvJpWIbWjmaAuhA3YD9wCw0FVjqHtEmyY6B05xZeOCO+B2lPcwfi33DfFI+0hOZ/Sq6hlK//+n
 oci6IvatlLWk6b/mcZCV4LspS5fBKLyrelb93mWtfL8zLLd6FlCo/crhJ3TLhXWTXrjtFHxPCCr
 M2zbXFc+k2QGq/0k0UkL7bnDrRInJLHYHDOKUfj
X-Received: by 2002:a05:600c:a404:b0:4a1:9945:98a7 with SMTP id
 5b1f17b1804b1-4a1994598ddmr120445885e9.0.1791884584788; 
 Tue, 13 Oct 2026 02:43:04 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:04 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:51 +0200
Message-ID: <20261013094252.96761-13-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 13/14] package/perl-uri: bump to version 5.37
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

diff LICENSE:
see https://metacpan.org/release/OALDERS/URI-5.37/diff/OALDERS/URI-5.34#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-uri/perl-uri.hash | 6 +++---
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index c1548bda3..0d8fa868d 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  3736f3d6efe1710176a753a7029b7606  URI-5.34.tar.gz
-sha256  de64c779a212ff1821896c5ca2bb69e74767d2674cee411e777deea7a22604a8  URI-5.34.tar.gz
+md5  e204d211b2c865212d92df5d382864d2  URI-5.37.tar.gz
+sha256  5a8750ddd8ee743d7cc89bebdd542a9b78a34023164ebe19dea0c248e121c21e  URI-5.37.tar.gz
 
 # computed by scancpan
-sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
+sha256  e956d5d73e1b569e04b5603864903f5135103686f55f7ed2a8d92b416514268a  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index aab2b484c..6623088c2 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.34
+PERL_URI_VERSION = 5.37
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
