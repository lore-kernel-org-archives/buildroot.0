Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD748C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834C160D7E;
	Fri,  4 Sep 2026 12:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDDC33EwoJu0; Fri,  4 Sep 2026 12:17:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7526260D5E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524267;
	b=Aatha9LKrkATmr5mY4NQVTo3sH7J6DCMXWO88VAvDNzNgTr6iyeE9Hs2OD0SzAM1rMVx
	 S8/QyiDC1DezccCmzHHDh/pYXRODIwDZbcWB3mR3JkIluRHwQM3N9w9gmznUzFW5Nmz3Z
	 vvAhazbIDLwaUzJBRxXM+S4yCX0/GlgdIEiN7XLCWte8OvdQnSMKhWUy7isoNNTPUKwkh
	 WtruwOVBaY3YXLvnBeJBNZ48Lz5DfBc38U7UE5q1zXXnAGgQ8gAH89pBDEC34v82nZ5VW
	 FwsQeUh6kNunXTABbNSGRLI7wczdtm1cgXtfVhU0DKmCbDu+uWTmbUpqif2wWBJZhsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8RJitlBmCyOuwKm//283LirQei3uYDnDtxpwe35jy9U=;
	b=T9MygaeI3TBTrSnnFN7uGhTG4B7wEvPtCHMN93qXj1rb2nNVYtHDY/EL++ggpYMwD42O
	 r7QyOc6oieTvnRpxtLNPVf9mZajRwA1dV3Lsm893T2b6La2STPPzPfommwhfLr9Mr0H2L
	 GcNnfECqwJoHQMIO9xZIsxLmj0VQztto2zxhmgYI6NQZajJSEBCtLip2KHVxjRr3/E20Y
	 NoYFVsGKEZrVuO78IKmb4JgomqtaeEBXnv2Oa0nyVAJegcs1eoqbB2iGWH4T5qaerMu/N
	 bu9wgbQJl5vD1sDCGTxd4y43WQgM243Rfxik85M4I9PCQcUr3tCVSP7NbNTu1B5EdCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524267;
	bh=8RJitlBmCyOuwKm//283LirQei3uYDnDtxpwe35jy9U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MBGAY1DgBvqCTNnm1kQwapscMIMVoXf3+6S3W6J5NbjNxp2aVmJMTlkpvA02OR3Zn
	 69ZtysiOTWmgRofVipNJq4EUv7TCYysUmV27YaBihiEyET6wwJATmjKznFwD7xrecB
	 QKx2QwvDQBd1j1E0dZtDW/89A1M7f9bNMzS1peyLYW1jg8KCpwxvHz5N9B7tSP+ujd
	 Lg2JdNCXIUWOPjxJ6j7yAT286JzBUXoh3ZZ7sESdgwkSkxqIOHJ9kdq9QFny3bpPZa
	 wo/YF43qqcVJhApxoqopLIMNHCKmZrwA9HTvUb6SO+SspVRSmDwsgl2TUe1SeVpScG
	 NzdLNq0DbdENw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7526260D5E;
	Fri,  4 Sep 2026 12:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06CEC10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E161B40B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNB-5T-cPlJr for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC8F040B2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524264;
 b=agDgX9Fj+QMlMQPWi+nugQmj80lh9e+wv9ONuu+/i88lUVAAm9+GAQ7hWD/Yq8W17BDy
 7y2SMBpjN3UQ8Opj17MeR0kwSkzgbjMB73c0guh+2u3oUjbUBrIRcehY3diHok7r9Mw3A
 yfTW1D3GHT2kVTQ7iVJWse4KfCxeGEMZo6FEyT0qk//BWuNHyeBbVvekA4I7YjfvjUKt1
 KFssqjuEwN+QhE6v2I/3f55m3DKmE98x8t6rELctXO/kIFnlOufVQ53gNgqmSG40IT4ns
 n8w85K0QPGC+YxtXz/0wSdVp4IUfObbALM1nnRCp7oJofrhj8Tu6DSqnbnVNyiQS0Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524264;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=C5BfXnPdKmm8kfY6HKxmQWO9Qa4tBKii9GEfdAvhzgo=;
 b=rT0ZnwZCDd2RZ3o3TcjfbPXttdSsdLurnqtIb4whTbpY77GyxStBzX4NasIwMFDuj6e9
 Bjeqy2XDCWXDL7wu0WBEoDxykDCqmHm9wW41ZSMvFTDFky+KLT2LStBoukWypW6ppYwta
 HTorp4P2OnExbx7GwDhx1+WgyrjxC3HMxuAo4tXY5jX6lnESboyNfYBQD+NI9cawCsxju
 EmGBi3nrt5N6ejeLOfGwrMzD9dtBDhG9JlluqjgxlHZOIH7SGpOGUsmZCHJGyJxydvhrm
 tqxw2yDnfwtRTYvrwjVAe1W8ugya+mXqdqzuhJL7rYD3a43Ykg8kxSknD6D1ED6HRfw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gxCqSjdw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC8F040B2E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b8be0409fso6537335e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524258; x=1789129058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=C5BfXnPdKmm8kfY6HKxmQWO9Qa4tBKii9GEfdAvhzgo=;
 b=D5soN1VeKSxDP049t7jOXcuoC6VlJgsn2s2VgSxOC3UtvuF4pL02hljASK++qvMDAd
 OhuoxWRd3JipC36xET8Q5eDadfUMzgTJpkLSu+wJUte7OhF8c8UF/WwllZQaW5BZ8iGx
 Fr6tHN7ipGKy/yp444VJWeCW/LXza5dqlCGMzMRS1oc10YKC34Z18Vcz5V1WRUBParfD
 PU+cIAWBO9yQaCAqeP/kkiYnNFY+HBqSKkV9FdJ+QXdV0wkLbjK6Kq0i1KUINONBUpPa
 nq+EFrZAqpAvfcv0rNisA2flZmGgTy3YpMq5voTU3cjaHbWkdC1EzlRoLHg5ndKEeUNq
 cqDw==
X-Forwarded-Encrypted: i=1;
 AKwUvBybuqDM3C7NIU6HKhnF43E1TFYzdYrOxWbxPyUNgBsCkEs1c+QVKI2OITNgDfElyUtZ8udCbyqdp1Y=@buildroot.org
X-Gm-Message-State: AFuF++m9gNwElFr511Q9bm/6WX4DkEG3aKpooXv/qG75I5wGnkvAEzwk
 Um59ZTU6CJ3aqMFhRec13e/XRh0VBqeoaYV8Z8FJ9mIxyDzUsOJvJGtwsO9nFXhuAqE=
X-Gm-Gg: AYBFou1zdLttcgNpgw35VUAUR1eNa5FZeRfmyVmdF6Vs7/uBOBUO1pDzd4pTDdVz3s1
 LdYobS3zPbBesOgL11VZNZmM+UjQbPzpFQxGiZGABfucU/KwOqzhe33gJH6cn1RztPLqZnUdgLt
 KIXjDeuJs4xDRzRt/5u95qONQ1GIFDF5VCjoPBlyP9ZsKrUzGKRD6+9ruOjL+mKisaUZUTjNKfa
 4ZmPEfrbcdhJiO/ERZP+hjJEm+6WFhiWZXlkMWCFsof+YsSann9g9fHQwveJlRqd9iSil6QJI3b
 ohZPxyxSzKaO+OE8B/miMtulMvMwDJqPA3b+nOIV1scvU5azayJyXPiBM8YLI+wvEvDNb11lMpT
 xue6Vc1m+hQ67FR4jae1JGdCstucM3rhPatbpy8lMAWqVBvYkFgMeJNBMJ7fb/jOaBFgu/QVX5X
 QXRxWY48cE6/ufCXxB/l/3gQIvlEpWziLKN3BM8wI8P0j5wJJ0rYDmjg==
X-Received: by 2002:a05:600c:1991:b0:49b:2796:be30 with SMTP id
 5b1f17b1804b1-49cf824f7damr53463505e9.11.1788524257849; 
 Fri, 04 Sep 2026 05:17:37 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7fec25sm166571705e9.13.2026.09.04.05.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:37 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:36 +0200
Message-ID: <20260904121736.404020-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826210042.212245-1-romain.naour@smile.fr>
References: <20260826210042.212245-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/qt6: fix c++ static_assert issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since the last qt6 version bump to 6.11.1 [1], the TestQuazipQt6 fail to
> build due to a c++ static_assert issue.
> 
> Backport a patch from v6.11.2 release.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060153667 (TestQuazipQt6)
> 
> [1] https://github.com/qt/qtbase/commit/2983318421d623c6c9feff95ff947ca489f4313d
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.05.x. Thanks

> ---
>  ...e.cpp-remove-is_always_lock_free-sta.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
> 
> diff --git a/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch b/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
> new file mode 100644
> index 0000000000..3347caa8da
> --- /dev/null
> +++ b/package/qt6/qt6base/0001-qtestsupport_core.cpp-remove-is_always_lock_free-sta.patch
> @@ -0,0 +1,41 @@
> +From 2983318421d623c6c9feff95ff947ca489f4313d Mon Sep 17 00:00:00 2001
> +From: Mitch Curtis <mitch.curtis@qt.io>
> +Date: Mon, 11 May 2026 08:41:08 +0800
> +Subject: [PATCH] qtestsupport_core.cpp: remove is_always_lock_free
> + static_assert
> +
> +This causes a build failure when cross-compiling Qt for MIPS32 targets
> +(e.g. `mips-unknown-linux-musl`, `mipsel-unknown-linux-musl`).
> +
> +Amends 9b938823776865837901f29082301f5624ac2b04.
> +
> +Fixes: QTBUG-146670
> +Change-Id: I170bd9f93c1ef809f56e5b36835e457bbbe8e16c
> +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> +Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
> +
> +Upstream: https://github.com/qt/qtbase/commit/2983318421d623c6c9feff95ff947ca489f4313d
> +[Romain: backport to 6.11.1]
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + src/corelib/kernel/qtestsupport_core.cpp | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/src/corelib/kernel/qtestsupport_core.cpp b/src/corelib/kernel/qtestsupport_core.cpp
> +index 9bbe1c18e84..5f28cedec68 100644
> +--- a/src/corelib/kernel/qtestsupport_core.cpp
> ++++ b/src/corelib/kernel/qtestsupport_core.cpp
> +@@ -8,10 +8,6 @@
> + 
> + using namespace std::chrono_literals;
> + 
> +-// Assert that this instantiation of std::atomic is always lock-free so we
> +-// know that no code will execute on destruction.
> +-static_assert(std::atomic<std::chrono::milliseconds>::is_always_lock_free);
> +-
> + QT_BEGIN_NAMESPACE
> + 
> + // ### Qt 7: reduce the default: QTBUG-138160
> +-- 
> +2.55.0
> +
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
