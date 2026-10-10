Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA289CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96164608E9;
	Sat, 10 Oct 2026 09:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7Ib7eUJ850V; Sat, 10 Oct 2026 09:23:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C45E6608FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624203;
	b=TwanFLEXAM6xhrivEOYDsQ7kEsaRISbMXA888HMfDCjvp0x0FgVPlfOAUb0tSOdoylEk
	 TNJCwkrJ7GWasg2RpNs3ZoX5BxUQAhjLIltNu7p/4p6DDATig+jz8l4Eh+DdYIbj1I4lE
	 puPHXi+fkXDsOZvOxsLzSRFRFR4hR/MQIxSKr+yt2i4uYYmkMnb8xSesNwrA4mCQBKOwa
	 by6Y6fNIERf3moYa3i56lRBJ4R+V1lj9N99BVtfyb+dXTpfahmK1MoD8yH7b4Al41PqaD
	 3KSj398tjY2WkqPBBe7SSZOS2ySjzEAxXuaDuD2TOiJni/Y10uiD2HzEqe6kStAtl7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w/G6Vs0Sxuunvo1hgoo42xGEIFjd7dRH01/XVDI0XcY=;
	b=SHHn5Y3Qy3+JUa4wEOmf+UwFXunZgRaVELBAYbnGQMkKCBS+ae7e7e/mkpjxmL0kFJpP
	 wnJJqzJXL0q3TXBlD6q2Ihdau/HX0H9g0YSzGDM1eMlhL4SO9Pzsx2KTj/6fBPY5rzp0b
	 L9orNk4/WyfuhZbYU7X77rgr34vxTNaYMnJFrmWbxBXXOhjkQof2LN0FH89hZNhL9hyy5
	 UVy/+ZALUcPraecXs+YcmVK3SSkdFHhapLsVMze6Kfzq4Wng/sOIGoDC99N7dMz2Ha29R
	 L0DRnTrcXbp5Af1feDE/3eHe+wv4NDcGWbOznhlXa91ISGdQ7KnoakPqbYdVw4IMrJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624203;
	bh=w/G6Vs0Sxuunvo1hgoo42xGEIFjd7dRH01/XVDI0XcY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NVzuuSR9lLmOME05IhgUqnmaASvybUhywzkO0oK0HiMTIJpFruRAe20zS57diq3Tb
	 EMIcIvi/yepfaVBf3/hAyrCF5McVWwtKAmcPEx+6IqUUhT/SqRkxOAdE6BslV26kDk
	 9q5VrUhJmLa1eiwxWr4SHlKo7oFItJs21rRPOd1TJStPmqfsfZPUDbge/FrIL6iTJ4
	 vTrjBi1ocGHGbMcdEuSGKiPL/iDd3swNbmgrAlghE7xaUehGvMKibOONTfdqQ1n5NC
	 YR+VO6uwKQkiW7EjR7hxX6SE9jawTMtnMOU9Yp+vJIErpSwpWxTR+c20p27FxBlGyG
	 CtAXrJcbqbjcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C45E6608FC;
	Sat, 10 Oct 2026 09:23:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF50356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F5DC40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T71XHDqj_qtX for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E478E400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624197;
 b=Xa9oeEHFU1juQfG0rXhM9O+5OoIIggH1ForVePv2fna0h9i6Ts9bsFFzKmPWRJ/iTpMJ
 xX2LGyRcZLvSMBsYSXO0CgdWoKikkI/EkSFgXvjokWcQfB/afFQmZDpcmIV4GeRmdxII8
 uM0jUmN+4SzOgA2oEqaktYRKrs122FUzwfI/KgUlcjbh3sjxw7Spav0COARVbcfLz1nKM
 ecNzJeIRXphK4LZryl8CZgs87k3efhwW/Q49ZrV5wUQzJpTpYzGS/8+1J2hWh3TTW0URs
 V4pCcxUUDik/ubB4mfv4rBq5bkxQSrLI08FjDAmhJctLYjs9XZ2biYIXFYiWFKgD62w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624197;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=H9dtBeRkUid2GhYLR8nJofWIoMsTEWoQB/nRor9pcBo=;
 b=pcRcAX23rQzYuZQWYUlhSsY7xWj9yC5aR5M13Ngdj1J1o2Yt68ML1ablUENo53SV+0C0
 OBETDLpRtIIE7QaB+WQqgVQ2HfsFe+1IDT0LdtnEY9HVwlINo4BkjjSq4GAb1SeIpuxHi
 fndxOzqKXk1lTLRoms/fiGaN6MCdFbxLDd/IXq+AetzSKKaU17LdoUMBlvGg0zSDdpgIA
 /YKk/pP71smEbbrE0ryLG/79IRDcJwSuKHK1jqJZ0BrTnQkdgYpAfloojLm0PEAsczVKT
 W26QJZ4HzIxUvF33JtwVhrVcEudcgJ4VVyK+fKLq+4/JRZ5s1RlTTnRsnY4tcy1yV0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MjFiSvTc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E478E400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48b03f23305so391918f8f.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624194; x=1792228994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=H9dtBeRkUid2GhYLR8nJofWIoMsTEWoQB/nRor9pcBo=;
 b=N2TeP7DmFd385xoEE1xw3VEb9QKaBcjU570sI3h0JK+xu4lbcqdqH/KK3B6Ze/xE7V
 8lBsY7Rk5OiJepwBzCZxhCdPcjxoPtPGITyp4RIac9SOYuk4FPETuVWncv76YNtVlJz4
 M/HEjRXqxI230CHuiNk35ibWzKk1m4egwSnifURvb3fYBnYflmQetzXC4NPouIDLOIwn
 EnttrHXD6gRAeuSBpVtI2cwBYSFeLcEshB0ZWJKaTw1JX+3HPtKIYL8rorHuT7p1Llba
 QvuT37oi/qcKmrVHlFJ7U51sY5K1fNqRoicJQO8/pcbK3IT/VNFR2Fsopr4d7kEpYbyk
 VTWw==
X-Forwarded-Encrypted: i=1;
 AKwUvByQf3n1J5eBwZny7lNi44SGJrl+YAqaFjNb4a8FaQOXw/CCBSlGck8rX4l+2SPpgj3Lqa9PhAKRSIU=@buildroot.org
X-Gm-Message-State: AFq9FYKGF5oUBk/ePHrANeLnyFnWzW/gfx5cV7wQFdsd5nbtLPPbMEqS
 4AcSnjtLQNT1F6p/mugXNv0JqoQ6OUZltgsepSXYDq4oESgL2i1A4JLUcYZNXpF5VO6MQUc6Kz2
 a0blI2us=
X-Gm-Gg: AYBFou1myYfH6wD/4C9HAiNnBeyIlZkYeT15zgfffc8mUoYFkFuTCWR1lAR56lQo229
 Aefyb+z5IXfdn0DWUg8RZvyQ1Xx6tJ3amyughm1wba2rL5/gax7MXIhyE7N9wjmxJHlfsRqSTjL
 YZSCiYmnMwyiDlVuFoRn9VRpfRCFSTr1BtL7q1QatHenp+ZU0pDNkYjSvwClr/C2GGPXPf+Q46K
 JjrwyISWfeESUt17JGKxmvKqx+G33gcwrySLXp9MbxJrrZww18WK32VnZTqX/8mRmCuFwj0+k/1
 Dcv8iuFAs03ykD0KaPSxXsLzXwFiRTXu0Xk1h612k0n9RR29VW8jLdP/YXEAFtUfnAgl6G+L6Bg
 MAXKhb6eUKYaIK7LqKeciPNrEcPIzeApy7oHQJ9egc04K/3mx7YTf0Xy9JLaAXgL0PIeKyswB1B
 YFqKzmrxY92eRTNSNq2r/doPKC52pNT/qFuOmbvGfcSeFMXUzf2WGl1ujyofv0hd7exWlMaFx2y
 JkpdsrK+c2khEQeVjZ44GXjFgrmXY0IAHrKXmOeg/qIYsXZ2Br1kpDMxUnaNjT3AMU=
X-Received: by 2002:a05:6000:4b0a:b0:488:8411:1d08 with SMTP id
 ffacd0b85a97d-48dbaced58cmr7313772f8f.48.1791624194356; 
 Sat, 10 Oct 2026 02:23:14 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ac94c6sm8278549f8f.42.2026.10.10.02.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:13 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:13 +0200
Message-ID: <20261010092313.139342-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927114203.2631563-1-bernd@kuhls.net>
References: <20260927114203.2631563-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: remove patch 0002
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
> Patch was committed upstream in a slightly different version
> https://github.com/openssl/openssl/commit/098404128383ded87ba390dd74ecd9e2ffa6f530
> and was first released in version 3.0 which was added to buildroot with
> commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5.
> 
> Added Upstream: tag to patch 0001.
> 
> Renumbered patch 0003 and updated Upstream: tag.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7c72511a896fe36a6ce73c446f24673691c269ed
> 
> Also build-tested using this defconfig
> 
> BR2_powerpc64=y
> BR2_powerpc_power9=y
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_PACKAGE_OPENSSL=y
> BR2_PACKAGE_LIBOPENSSL_BIN=y
> BR2_PACKAGE_LIBOPENSSL_ENGINES=y
> 
>  .checkpackageignore                           |  2 -
>  ...ible-build-do-not-leak-compiler-path.patch |  2 +
>  ...Fv2-ABI-on-some-ppc64-big-endian-sys.patch | 37 -------------------
>  ...ch => 0002-Revert-Fix-static-builds.patch} |  3 +-
>  4 files changed, 4 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
>  rename package/libopenssl/{0003-Revert-Fix-static-builds.patch => 0002-Revert-Fix-static-builds.patch} (97%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 6d2a024e07..bd3766988d 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -502,8 +502,6 @@ package/libnfc/0001-autotools-make-example-build-optional.patch lib_patch.Upstre
>  package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch lib_patch.Upstream
>  package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch lib_patch.Upstream
>  package/libodb-mysql/0002-mariadb-FTBFS-fix.patch lib_patch.Upstream
> -package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch lib_patch.Upstream
> -package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch lib_patch.Upstream
>  package/liboping/0001-fix-utf8-support.patch lib_patch.Upstream
>  package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch lib_patch.Upstream
>  package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch lib_patch.Upstream
> diff --git a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
> index 9353c1ae90..f4baf916e3 100644
> --- a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
> +++ b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH] Reproducible build: do not leak compiler path
>  
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  
> +Upstream: https://github.com/openssl/openssl/pull/5218 (rejected)
> +
>  [Rebased on openssl-1.1.1.a]
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  ---
> diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> deleted file mode 100644
> index f74576beae..0000000000
> --- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From b57cc2e4ee21babacbffc243626de72c248068ea Mon Sep 17 00:00:00 2001
> -From: Andy Polyakov <appro@openssl.org>
> -Date: Sun, 5 May 2019 18:30:55 +0200
> -Subject: [PATCH] Configure: use ELFv2 ABI on some ppc64 big endian systems
> -
> -If _CALL_ELF is defined to be 2, it's an ELFv2 system.
> -Conditionally switch to the v2 perlasm scheme.
> -
> -Reviewed-by: Paul Dale <paul.dale@oracle.com>
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/8883)
> -[vfazio: fixup for 1.1.1d]
> -Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> -[rebased on openssl-1.1.1i]
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - Configure | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/Configure b/Configure
> -index 15054f9..ac3206e 100755
> ---- a/Configure
> -+++ b/Configure
> -@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
> -     }
> - }
> - 
> -+if ($target eq "linux-ppc64" && !$disabled{asm}) {
> -+       $target{perlasm_scheme} = "linux64v2" if ($predefined_C{_CALL_ELF} == 2);
> -+}
> -+
> - # Check for makedepend capabilities.
> - if (!$disabled{makedepend}) {
> -     # If the attribute makedep_scheme is defined, then we assume that the
> --- 
> -2.25.0
> -
> diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0002-Revert-Fix-static-builds.patch
> similarity index 97%
> rename from package/libopenssl/0003-Revert-Fix-static-builds.patch
> rename to package/libopenssl/0002-Revert-Fix-static-builds.patch
> index 10ca97a240..daeece2a0f 100644
> --- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
> +++ b/package/libopenssl/0002-Revert-Fix-static-builds.patch
> @@ -5,7 +5,8 @@ Subject: [PATCH] Revert "Fix -static builds"
>  
>  This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
>  
> -Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
> +Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-3791009156
> +(rejected)
>  
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  [Dario: make the patch to be applied with fuzz factor 0]
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
