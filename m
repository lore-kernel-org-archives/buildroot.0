Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9164CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A557981677;
	Fri, 16 Oct 2026 15:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJIQ2mrS2_cV; Fri, 16 Oct 2026 15:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BB44C81669
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163055;
	b=tAScoe28kJFlHwTm84d9HhF5JRUUVruLHXujPjLOjKqjzFHcPoAaBh0IZuovLnsTVEv+
	 ZleCax/J80BgfycODn739yxSw4iZ0yU0O08ox574H5U5/+oDYrGmw3uzrA7j/nsRzMQxG
	 oWQ0zly/n5oSKP+zSB1s2kGVxWPsXRm7nVKt6YIOWNzM5OH9hw8SKkk3Bs840AydTa0Q8
	 6QcvsmhLOppclwkMaYgdxaeJiMOjXRCTQZfQ4OHHdsx4qQ80XaA0Os3RCrsrn2XMe2j8v
	 zayzrRpP0YBo1C/qd6N3pqLLOZc8dljdJolxPxOoUByk4HB20l9gv6oQkrttvb5XcKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EZyi3pxBRWZofrKzxBctBDcW8EGRzF2g8obt9xfK4NY=;
	b=FznY6Xvw+NY+u8uhpJY19TyXbqMI82r3pf9yMvjxDb4umyg06UzNUYMqitnW1P218UKA
	 AoZKKBjrgJLmX8RDlY3Ce3cKOvr414/8CLB+fOPHeLJPXSdCpFbdnHYKM74lPfOiC8DSn
	 DJqHf1MYUXw2zKTIc6kSxu8fzXDnBFqF0yF4a2/KMbf+hdzTnTHfbB/rvVOQRyswWI9/B
	 e3pXeisucwV/CZI8ZNqcR1frXnq7/K5ls0Axfm+GWj2s9P/zlkuUlVxW9Ql7efVebXQb3
	 JalsRy8isTr4MF85MQUCMTeYwVL/TEeGiZ3hFANDajyuEPqimg/YOgt0yhaVA0OqpvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163055;
	bh=EZyi3pxBRWZofrKzxBctBDcW8EGRzF2g8obt9xfK4NY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TcMunSvF5hhLRMXSfnv+URsZ6YGA0glfLMlXbXof5iN/ajHhocFXWIVfmYYu9qJpF
	 npNfyHNRl17ANEAFdpN7kBONRXtBjlR975/PlrwhQooVzoK0OfOBLGdQslwzTPK3Qy
	 hsB9QBYY7xDfEjLVlvZcbpy+xI2t3UbLE/mJpe9B3mil9WcTY8CPEGLWuA4eMpCv0u
	 8aXRHDwvJZjh6nseKMEPzSzi8rXzhkA/B3/Gt1Ta3cB0uBKlMtB33C4W1zf/rErda8
	 AFEG+OhHGrlitKw/emfDHW4y0hw6kfwLKivdia3tXQ9eEyXtwOumNtshpJ5aIBxpOq
	 NDdZsk1Hm8cGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB44C81669;
	Fri, 16 Oct 2026 15:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E1C57AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BFAF606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7B8-LgNlTeyS for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 513F760671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163053;
 b=piIaCiGHwddre+5pELl2FMUuDysdnJipFPvJhDNE+uAgsdtQr2wsgr0TS+VMgTK0Imm9
 5DxYrm4ULJf1aoV6nB3M1/boyjOqxYYt1+COLcFF0oknTdeqAJz+y1w5vMnwPKR4sbX1V
 t3YMlqMiyAfE3Vprnan0Y1jP/9NsfuRq1/9qA7pi2OJcqH/PZnoEopb0fM6JchYLOUlGl
 ioaA1IWa5QEpiAVbrZJGx2RV2WF23lBqq4NlRxRs5fnhZ/spAZdZv9dfPOvRMMk7TuWbu
 sVS1eDN5l4Ut7TAbprGeC80pHxXXqSOLlMvubFE1hTUYf8fjDSJx51nkDPmARs97vNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163053;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yjPlhuGkBTCqYPU0hnffnq6UKAOPqXyEjqJYdXttL7Y=;
 b=RVIKLa0Jxf4GAKvGnO0aDW0VU+L9ejfDiMbaWs1ZAIqjpChMbF20VSddSg97NNzn4OX3
 /SEgWqSYRlMMVLu7U0R3e1KeD3Ixwl7mv7DHQRP7eZx8upfL4gJr2/XL3VnBHyi27JbV3
 k6f+UOos9N8aX5+Dssl3/HhQYgGYhTAWUhlH6zVxljYzlYXFo/DFUVVtGrtfU6h0pe0oK
 B8WuesZUzJZwzGoOy7Lwxalukw38gXCwq8h9nq8GJC1YOoce5Z5djzMvPX4K/yVIiZtV2
 MyErdxESMozW3CKR8ZIS1WMIvpz/mPltBtrMIaYsE6w2iSrKHVv2dwNrE9tjYnUlDfw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ieOaHqIh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 513F760671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso1708020f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163051; x=1792767851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yjPlhuGkBTCqYPU0hnffnq6UKAOPqXyEjqJYdXttL7Y=;
 b=WPVGNCVeAtuQKHeOAI5vIn5g7mY01OxsWiAlIy7IrlNEcMk4OynelHZ4YNHmkREgTR
 7nlzh7Rm82xj8ir7fu3GSinUb9PN7ybUx008f0D3TgDyB8swKCSH9voJb6y62+aau7XL
 DS9TtFEEtk9/ntnIo8Rl3MsdSJsgLnKWXdHUvkICYHlshrB0BeBPSJipOlIuRNq1Rzx1
 EAOXa2q3ZSFMG2ZWcGcBKeqtW4tIBYU0mKx2ti0XWtmN3UJ8sdj+XA2B1SYPTjtISXZO
 ZVP3b1Y+6Bi9JW6cS7f0j+oiZ+e8gcNe3yHpQNMUczUzXOVqRxW2l5sos341zcrXpB1I
 ni9Q==
X-Gm-Message-State: AFq9FYKDWoHXrrcVted09U8uS7kA7xlGKrywpzCdzbOnqHZm1UqZYvJl
 4OsLTYG9WVuVSkbQB+eRNn1WAnFz5BimR2Aj2ENmCtp/JwKto6pJ0C5MeZuXnFN2diiTn4GujL6
 lKceFvqE=
X-Gm-Gg: AYBFou1xdC6gO3YQjJ7SHkbq9jxhAJtMPiMMboaMNGsA6i8P/Fkx2G76B+QktJCkc2i
 ZqKOKfB5MTIyvxCuwhcgjq78VS6N2AfnLVmVVlnnNycbpA2KvMDYYHumXPcMXW6bOlqAOkbM4V7
 9ndHhechlDgpzht3Dw3xkuVnwR9tKCOdVUA4NU1H22Jw7qo2wD53aVZ0MlKciow32jqDk88EzfM
 TxKlg9ePCMlZhviLUmKoWHbD1EX0MsyQ23GelaeyOrtlMvZs5nzeDXIuhigsMtJuLUjj93X3TzK
 XFXyV+NR2cf35Lj4invqSzFSigNXOWXb8AAMx9g7vQ1acyFRlXbIgWiqn+OPSs71D1ZiwNrFELe
 jTBR+CAglaa+2Fa3ZLJG1EnYNEU+nFZV0DogcHsN3EAJA1e1Q2XV5LUzQSOtEasM0e1l5Eiklaq
 iKA5diWDeQ02U4bt7yWqtb17Q85Rta0VnHU7arE2yyI07HvasnPR40XxypvFU1VfpQkkKIr32Ts
 qiBfD85CSnEBb5xCKYkNHCii5i1UIiWwtGHbVJGMw==
X-Received: by 2002:a05:6000:4020:b0:48d:ec3c:3247 with SMTP id
 ffacd0b85a97d-48dec3c3363mr16431931f8f.44.1792163051232; 
 Fri, 16 Oct 2026 08:04:11 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4e7889sm5489749f8f.24.2026.10.16.08.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:10 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Devoogdt <thomas@devoogdt.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:08 +0200
Message-ID: <20261016150410.67769-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001075427.539773-1-thomas.devoogdt@barco.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: also disable
 internal ccache in the build step
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> WK_USE_CCACHE=NO is only passed to the configure step
> (WEBKITGTK_CONF_ENV). During the build step, ninja can run cmake again
> (e.g. when a cmake input such as toolchainfile.cmake changed), and that
> run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
> sets ccache as compiler launcher again.
> 
> That outer ccache runs without the CCACHE_BASEDIR that the toolchain
> wrapper sets for its own ccache call, so the cache keys and manifests
> contain absolute paths, and the entries only match in the same checkout
> directory.
> 
> Pass WK_USE_CCACHE=NO to the build step too.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> Acked-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/webkitgtk/webkitgtk.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index a2ceb516ae5..14be8c0cbaa 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -22,6 +22,7 @@ WEBKITGTK_CMAKE_BACKEND = ninja
>  # Buildroot adds support for ccache through its
>  # toolchain-wrapper, so tell webkitgtk not to mess with it.
>  WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
> +WEBKITGTK_BUILD_ENV = WK_USE_CCACHE=NO
>  
>  WEBKITGTK_CONF_OPTS = \
>  	-DENABLE_API_TESTS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
