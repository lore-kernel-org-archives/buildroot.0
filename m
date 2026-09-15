Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA6C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE05C80DD8;
	Tue, 15 Sep 2026 17:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQNegxO83Ooz; Tue, 15 Sep 2026 17:27:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6BE7C80E2D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493248;
	b=IWvsC/C+YqjiG+WXpggT4Y4l9XJ2YaDPtz8HC74ayX/dK6mKiUrrJwFFLrvsYH/IjK2o
	 nMVlIfrHSC9WQSdoKDqC1QZIWp2xiIcye+dvYG51D87L+3BR/jADO8BOFpFVXDxm7HdOl
	 8Ps/oVR4uj9jKv3UwaFvx261K4+NgRWFRigQLprk7kzZg9fzz/8goFe68cL83scoWJOGy
	 ZYo/xY9R4uubSnpj5niUI20Lr+YMMnbVZ8ipUFP11lOXJHU/T3i5nDl0A8WT3WNvUp5De
	 JY1HJD6zoKNmBU2VtNXbkiDd/QMKA43RMWHFzFwEh7ZlmaB0jfZVnlOJEaaxJNldLNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=68aVlqGKhAN2REO9vVjJJ38KJD96zZJKunDf9DGp10s=;
	b=C12JTwFLLZXJy8RWEoprFNr5g3ZshVOlQDC+q9rBSLNyoJjBCiDr0xfbtcx9GM6k/iYu
	 uW0Tyf1d+cAO6n8HNTi9iubfFfr3jBjHTzQcNYM8gd2xiQqaCuCe1jPMJkYS3oBf4GAzH
	 7VW589MKzdNnbriJS4pqMDRF2uw0kpIkKIaKl9dlQaEMC1/PrlZPdR7aj6WS3FrOx1plI
	 P/mQXeTNv/vSph9ww3sH/FEGGarY4Jsni/k+c2syHT4Bio7zyrXeVlffwcaTXeygcCgkg
	 X8ZGmYHSUwTjy1yI+FQnJDzfJtFsgIxO6LvscRVTOqXJaOk4K94m/OREBLT7B/eqUbw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493248;
	bh=68aVlqGKhAN2REO9vVjJJ38KJD96zZJKunDf9DGp10s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AfmaOSn5dKDurGq9SW7oTAvmyU0BGsLfWDSwlq+wCFYzuVz/Ko9wEbIL4D3MqVm79
	 +tKj1RjHtYLvI2a5EozCDC/OhpFmkfeHmrt6ZJJSxKBl4MP1VVQSRuVBQv9Sx74HJV
	 5tfJkvCxlDE/TjwCgP3d5XHsTUTqZEFP7G8LBeoe/IE/DLAFQ5iUrS3eS8oI7SCIQX
	 IBZeeSULKgqlMjr5s2xBPddqhsDvQTu38d9C6ugME1rpI4Je9GMPP3S+KxTQUc9oVF
	 AAcjuH7iO3SMIkZyD43l32gdKHsVv9Ln1P0e1Z4tNOajUikisXfqIt482FPh6/j1ue
	 gnC3nonr90lZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE7C80E2D;
	Tue, 15 Sep 2026 17:27:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFCF42D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A58B280E2D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdkhoTRkO7l4 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0ACFC80E2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493246;
 b=ne/ZQlmTABE4JeFmPHs8mtV+AfNe86HiNQtFGayiiaat/bqBwJ/P0ul5lteX+yAVWQ88
 yoZJa06PnkGO9FcemRQLvH5nntQWgBtWMoR38531SRMpHVxWhSKPesQuQhvqfce9Lf8No
 X5zOtH24b2pxxg4fNEgGc7vfGWBPSq47a842XPqm+KTPWH2NXk5JY4MI77MUiz5LeAcws
 sjGlX3VsFUiqwtAwZaACW1W2CB8EA10s8DnkOwpI5ZYtedMvHRsc6zxyYqNxhKin/eC9F
 zOniy1rP4bmGA+6h9YEa7cIW/IBZoO8aMh0LuWp98pzsWbWf66/qPdZ4vHaM2yMTHeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493246;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zv1dFcRJQrn3/P8Z+omj4aL2PokWXtlCEQKLibpaXKc=;
 b=nqdjZksDRtiAZF9Fkkr7toMy5efDkSXcwQza6w/xgrj4JgTLtche/jGvdmMlcVr9VdK9
 D4MFM02A4Z7CZ7/NfKoO8n0FnsNsWaSQWlOs5rOM/7WZcOBxIrGjCKvxxXbqxh2qPW/wf
 ruYv2ybNlTnWneXUfjskZciJD8DhoXwMG+aZWd7xBKNnjGor81pWkW6uyoaO2f/cfki34
 vUDKphI9a0pLsEs4Sz9MPQgzbO4h5FQoQVjP2g9Fo0FONRxBXHW9Dkx+u7D+TKoAyT//E
 uZTAm37lwcbZbFAYd7ojQSKeX4YubyK8xcM8V6qdQus/XPj97x1QANin6/+XREc4FlQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ACFC80E2C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D17E95DA4; Tue, 15 Sep 2026 17:26:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:24:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e91ffb1afbfab37a6fab61d01619c8759ccf8162
X-Git-Newrev: 6b716763e9618c287d325bd3b42afb61a1a50769
X-Patchwork-Hint: ignore
Message-Id: <20260915172620.0D17E95DA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: propagate icu's
 dependency on !BR2_BINFMT_FLAT
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b716763e9618c287d325bd3b42afb61a1a50769
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

gerbera selects BR2_PACKAGE_ICU, which depends on !BR2_BINFMT_FLAT,
but this dependency was not propagated to gerbera. In practice this is
not an issue because gerbera depends on BR2_USE_MMU, and only noMMU
platforms can use BR2_BINFMT_FLAT. But for the sake of completeness,
let's propagate this dependency.

Note: in the Config.in comment, we handle it like an architecture
dependency, like is done in package/icu/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gerbera/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 3078d2017f..0219216276 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
+	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_CXXOPTS
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_ICU
@@ -32,6 +33,7 @@ config BR2_PACKAGE_GERBERA
 
 comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8, host gcc >= 7"
 	depends on BR2_USE_MMU
+	depends on !BR2_BINFMT_FLAT
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
