Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160CBCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B3B40C24;
	Fri, 16 Oct 2026 15:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7qsGSEUgGSj; Fri, 16 Oct 2026 15:05:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED2A540C16
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163143;
	b=DuVKLW3e/cragA9ibngFj615xlfkeiFFL3ZAxPQMo/zyU9KWNY063aCWZFkgom+SpwMG
	 rf2nKDfHdmrSmiUbwuwnhn0VRQo9Ge0nZjbQjlgs+rAxgYv3YTimPp4as/uzeNgTeAgow
	 nI5znZN129wXT8lkejY+hwo6AqhaJB1nx0uAN38BpL+3QZW0OkGYDX091B11Fbd1XMhc7
	 L9WzoHXt2kq4HVyLmxmpIeTTyvrvY8KVGveQh0K9/mdRnt/klER6NWW9AIxegAkM5kSrm
	 3CQzprrtRMkiVJL8EsNVocUjf3WsnHiXGKPxeyOcaNBrkWmYiLOnA3zWRPqab89i4tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AkXIfJcJKZyaMQXguMDXGIZQ9cCxfHqNWa5sOri2WQM=;
	b=Mishi5YPpvtNwwM8lNHUzxnwbS/a7N7KrLIgSAxXFhKVsinFf8/8qPbN6owgKdB+/QAL
	 XPLtVHzDn3gS2xS7gY4lms7D6VnKDctvOMyjvlG6cntEbTwUCASQlyUk2SLG/JH6pJPoX
	 rorVgEzuV1AT28B5EkBwDpSSc/C+6VBQtvPMvPdrkl/XJYYIaGzXqtKfSLkfqeA9yLGJB
	 kzidnf1f3oJj2/g4X9AG1dL1TrmtV0bi4mDN2ITrXN7N5f5YBVV0MruCbDPw/fvJv3Y+r
	 ykXqhgJgUo0V6IdLXJSrb+frl/QQENSBvJU2SX/O4+4XYURPRRbwnGTHSEUE3b6fS4Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163143;
	bh=AkXIfJcJKZyaMQXguMDXGIZQ9cCxfHqNWa5sOri2WQM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TvZlW96dTjqZrdPTpyeW0iKewdJueqqAAxRqqHByqhHGM44Q5Wqs6RKhPMhIdsvzB
	 ou6Gdm6t0orTJxlJYhm3m2BjBk/Q/qjukqgyf2On1VGznZxV9oLlggrzrwccSvufda
	 xKimLqv0orTGql+uxOYjhioo0MBOaicZKOiTrmk0wI4ff0YiSkxw2sjmCWquO1V/fS
	 s+XDEf1n+LXbgVsolOb8dOUpx6l7cs6h20qLz3EcxyYHHkuIOsFJx3obHOxzuKugEE
	 bsbiCNuNTxHGxTVkTTKxYRjDCTUqK2KlFr9Dtx8q/J66PRSKrNEqWNLw8ma3CEa9fs
	 vGaPPrUqec6FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED2A540C16;
	Fri, 16 Oct 2026 15:05:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E138E7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7D04608DC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WfH53kEC4f3 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B653960671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163141;
 b=BoyP72c9vktMflOxcUDY2F+7Mh4LmUF95a0xB7ASPkQWh4eHDUDCazjgFRscsHXMBC/j
 j2uv+9NyYAGpCGqAmF/MzN+Kwv9herj8up/AC35mDUpThupKJE5wCQiCJZrkiN/OMbXV1
 JMoXBezcla1QRI+wAQ33/a+fc8eBXYMGowzlhYYsnmq20ZAGc7CLxdM0CL8zeLvk39jFx
 1dTJaBdzwiVqzHEyv4KQeoa8DDICCoVQBOL9xGvMvBf35tMj+xdGUbvhUsh8JItqLcdeJ
 piQKZR9LF+YWFxMyt5hLqlvcfSsM+Fv3kCXPKqdb0p8ZOhCZbia2610eWxbGW842hZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163141;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3Gh202l0+4l9+AhkND7Fj8NbsxS3zpy1z00JerR45nM=;
 b=H/QVa+IpvS2ZooAb6eQzzOzTtoH2Ou3TOdQzq6IeE0ihI1RuBH43dfk0sX5qiyz3VfAE
 cplLeW9s94xMgTtjO7QLnHhIwbdGUh8socN1T6B/zS1kjxHYDLKI+PduGBGlD4/JhLjyd
 5/pzHdXCzabVkiShVDj40Up2feJfIlPgcMS7p6jsYnC3duj886WxENoCfzWsAmFjICPfz
 tIdAs6FrOp8s/ko8sRb1bsna3eYPvh66zMj26WQ40t+OsMpiHlHEq+eT+z9Shelf8nQ52
 yxdS/8SdO+QH5q6K2oJrl0MMgjsFtrtnxkdHQR84kVFy1D8q+8QbNscMzseG/XNDtzQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bn8IudZe; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B653960671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so429295e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163139; x=1792767939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3Gh202l0+4l9+AhkND7Fj8NbsxS3zpy1z00JerR45nM=;
 b=s68c/PDYarANWhlfY+RckW8oJey/iJKkQMvmUGckfOQLwfS5E77V3gpFZNsKa5580a
 T4eGW+y058N90RwizUJkOEMMs2v8wu4iDp0oBzA/YZ/g02OomWaKPcQdekMDLehSN9vP
 JdAugmkwPpxkpbaaHwVDCnjEBWDqjgPfT1wF6kYtm6VKPHcIilabpOLAlpSTU3+7+yHG
 P94Jr1eYVzsTxYH/0rS66ZmU+S+H7c2Q6VFX2EZP4td8Bd1xx9Tq0QhEd9pVIOE4CIeV
 BbkFGpP9/X0aPQShLfkWYIen399z/8Pz4/k+0rZSqn1gFYy6j5L5BadzVl8hem772en3
 1+xg==
X-Gm-Message-State: AFq9FYJXIyqHmgoUOVSvtnk8U0R+HDxXW5ylkDfancJMnXt7gXRv8Inv
 kGzM08o6AP7pf+tQhZgCluJs/DtiqLz/EhgOM+6CevCQf1e30TUpcjQ18nLpXskM+xLBQl7E9IQ
 zankyYpU=
X-Gm-Gg: AYBFou33poN+lo3d681S+eZd86oWkwUt63P1ehSpXa+hDkZ/EQNy92dfbfn0Y4sMjBz
 X/+7zNZF/hd/o8XZNtHOL/ndHLKlCr2e7fSopY42ALhITcYPRFhM0skmJrS9sagepvZp6OvaL8/
 YLIDLIALIzQZP+krJMy5bdGCC888uyhGmcZ3I81cHg+FRU0kPqiVGyU4fUxmaE5e2P7v9X1k5MK
 YYW/QcvFs0Up8/J0PxRzLNnUfnf+yl/dYLucM+fH3dsJRDiY7KqsB8+pMpwv7Jk/iWXv4sm7XV7
 aKhysyIs+ejZWk/vCKQsapP6BNcQ0ieQGl4mC7tnQuL5uIQA29hSImIOqEKS9QovE4MTlqFO955
 UbrR4d1SGSAPaHMbWHE95fE7Z+RxC9vaw1TkRXmVGaUiU3OaZwLSYXIRubKc9T+pTTvY01XPI2v
 gBrhwjuYNrv/hVinoLlbaFhMrIpwAm60XYjnjfN2KoIaW4vxrEwbHqB2sVbx/cBdCTGV+SHuGGZ
 2H5MbodQBxQ/j6ar58yYXsLlgS4qxkENYIV2eSNyA==
X-Received: by 2002:a05:600c:870b:b0:4a1:d487:2dc8 with SMTP id
 5b1f17b1804b1-4a1d760518amr1533235e9.18.1792163138813; 
 Fri, 16 Oct 2026 08:05:38 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd540bc4sm5599558f8f.2.2026.10.16.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:37 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Seiderer <ps.report@gmx.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:35 +0200
Message-ID: <20261016150536.74592-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006194239.947480-1-ps.report@gmx.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/openssh: security bump version
 to 10.6p1
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
> - bump version to 10.6p1 (for details see [1])
> 
> [1] https://www.openssh.org/txt/release-10.6
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2026.08.x. Thanks

> ---
>  package/openssh/openssh.hash | 4 ++--
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index aa84d011f8..a53ae817a4 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-10.5
> -sha256  d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11  openssh-10.5p1.tar.gz
> +# From https://www.openssh.com/txt/release-10.6 (base64 encoded)
> +sha256  a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39  openssh-10.6p1.tar.gz
>  # Locally calculated
>  sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index f2e1f235c0..6808db9962 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENSSH_VERSION_MAJOR = 10.5
> +OPENSSH_VERSION_MAJOR = 10.6
>  OPENSSH_VERSION_MINOR = p1
>  OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
>  OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
