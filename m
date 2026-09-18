Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4921FC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0148F60EE8;
	Fri, 18 Sep 2026 13:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEPwpLWA7Fbi; Fri, 18 Sep 2026 13:08:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3B57260EE3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736880;
	b=Bj+7RDJbl/G8XcczBHsUTZki7ZKj3TnIcnGR/FrpP4vosk6HqskJ5d/1kbQulZA/f228
	 QDd4MrneKgTxF0OscHsuTj7qKS/5l+hz0oRNJvfqIhTNU01uSvqIEaI6LlL3+YEr9R0x8
	 qJPnWXN9R3z8fT3s4w3nRyT//MM/MJseWk7MzAckC8iToFVGluzCHP6Rdkua8pPLv6aTq
	 C33MwmkNWSOtMmSCRqyF4SLtHJENxvYgMQyN1AsMkBlS5/di7UOTBqQZpgDVunx2zwZej
	 aH5f5LKLEv4hjCu59uzfeOPqvw7v1xY9WpBHzhI/5U5g7M0kGMDcJZJOPE5SjvnUZFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hOzHARCKi+hEtmWA1pQUi0Hc6WjkwpQU7X/a7KpEBF0=;
	b=EuS+dH0MFPCuGNG24Zop48QU6V6M+1qGzf8W2O72XbqDHYxAbk7omS13VPBQxGAjzAIo
	 rKW6Vz03//0XvBQvPfNGXTZu61JvPndocnDEsry0yxwSZm4Pk991Ge9TL8EL/DV+vJWui
	 Ul+6F3fBf03kcGWIdzLCYMHBqTdswRfIbsV9vg4+cdr99FWscUM5VTnIQhZ0d23D/ptue
	 2pc3ylb2qoej90UYnMmq9jxjpxpoUsEcw2xFcDXudeC2taDjsnbMFz0tvBo3Fda4xgiAC
	 Z9BKge1cAB+D78n+VQYWS+CUOAMHCPXyfnQhKycUs5/vd7SCj4o5hbLe9i+JRg9M6Rw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736880;
	bh=hOzHARCKi+hEtmWA1pQUi0Hc6WjkwpQU7X/a7KpEBF0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wq3QUpoA4ybbTjHIxKVv0qDzkvDUm+kwf7biAIT96EADeliHpttZEGmdmQcXJI2RH
	 TYFFDkOpa2hnuC/46wntBYyxsXz/kfkMY8qRWNHOUeqojpUrNKBfvxWZUwIpATCXU3
	 /kV8dgGrs826yrB2OvR6pIHxaot2GtJhLrAIpoPPH59+6uzERUWdVxUD2wKojlZheu
	 npizyrHHdSwqYdNb8S1t0hQvGv5i7qYNECASogEbgq8gGgP90tc6mGAPTZ1nlgZTPS
	 Q5skXtbFZbu/EWp+hLgoRjC4IoeQ4cpV5GNIIxA7feLOWLC3nN2c/ajOL8YhuGfUNV
	 AW7iBQyt3gf3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B57260EE3;
	Fri, 18 Sep 2026 13:08:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B9CA224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38E3D60E5A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JL6RzbQrmTW8 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07BE060DE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736838;
 b=pUY589YrEclEYS29HBYM/RW9OjCZJhImOofbDtfjsvfSHYEBC/oM7u3m95ZSDkiBD5CG
 zaCsIUKzytUvh0Z3BkbKZOoYc5b1TLdHnkZ5ebLexCsJJZ3fuPQdwKrdKs039Cyj7hvKv
 b9kHYViKOD86LhzDQu5WUpfPrpssP/l7LS7/SeYPuhLONEiThSEXluqJhwrRPDkX+SqYF
 oyLPxl/KnEb2xqysEHK5rH7wGeEho3lz/+PITA4vFcO5vaHlTjQnWzMQAdy1OJmsbu6UM
 Kc2zG1SHLYDml8FyD7HQ5WXFinHYGxlRCHuZx9aO9hJwM2PqoP9HhxH8/su+nEpyiVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736838;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=kR/rfuAJneWoAP4cmx50X5MNrr5q5Kp0oik3IUOdlwc=;
 b=D8igglTTcdqInnyjmx0GgpGuoEzX8K+WBu0dvQthkQPPttfjk+S3y8p0RoMMi7QmxMf/
 o5TkNlyFx93THG/G2T8MYfhTnqV3mZBDfUjzbVIkNCJzwuIIGu9HnkyCuLRVAJl3aLcD+
 PGh+mcfbJo8IWsLz3pQ3GWcWxfWrwi043rIEAhlttJzeSJxnviQGbwmv5zFPyDzXEoZTg
 zUTcpdjMLt7yKJZc9vPwRhZHmDKN5pQiNDCNXPGnAjGbxTrJ+g1N0iQGaZzA4raDW9ppT
 lOheJWVEqZBcMTF4+Fd8pK+OBxQ2MxBAmwqG6Cozq4u20xW24g15U4kw2UTSZ+FvscQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="NYV2sPZ/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07BE060DE4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:17 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49d1ca5b0d6so5706875e9.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736835; x=1790341635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kR/rfuAJneWoAP4cmx50X5MNrr5q5Kp0oik3IUOdlwc=;
 b=fq2RC9dzl1Jb9OG2jkmKqRot6ffVWn1NDqjY3fmaZ77fIdJ2w1pnmdC+QshX6LuJnl
 pLbMyl9sM7G7O3LBtnPff0g8zeSW+yF+cU/UbnbEYrIM/tHRAvO3iM9jhwAe6I9yOiEK
 kwgrc9NFzXbjMQZynwu+qa+0sJ+BXoQyMiidSb2ea6SqbueJBLYxrUjVjkh3fSg5xS0I
 D0obsslWslHYF87/y0OFLgVya3OyrZUVORUS9+LZ6nweSONw2jQsESLEd3aB2XjTycSH
 C3Gb12rtBNsxt9o+XMUcsZvZxRXjzHvplmA92foO8Hn+LeqoAl0h6NBNkaftu18nyUzW
 90Dg==
X-Forwarded-Encrypted: i=1;
 AKwUvByNsQjqaf5nMlqJfG/4V/zK9NtCPmtN1nA8WMjpmVzWN1z7qjkPcumCWITnMM9M9I2nJHigTmPeN/E=@buildroot.org
X-Gm-Message-State: AFuF++niqFRLJzIXs2q18gunkeeXJBjwFa9/3LpdsJHL0sWuqVRNlTH6
 Bqf3dbgs7/4YEN2S5xxmuJ7WD7EKKSivY6iy43Er6TIh1C6E5fMFLRpg8Tmz+xHBxmhxY9z8uMG
 InozX
X-Gm-Gg: AYBFou2VkpDrDkV8LQqV/8GK+6xhB+YIr+cMQimN1pHHnwIAzdp2LHNdV2r36xbKTmh
 RUQYda5YsLw+ENJo8ZOO45TilvR4NbRSh+w1BT6ptlci56lAMEnQfnRjS0es5eUGxFcCvbFTl+m
 qHMlpV/q6pmK3IwRBm7LrwjL49av7kha73NVUzaVTaFItnQqD2fjB8ueCEJ0Ef2e/+iHoD/iBgW
 hSwhrdgSiiQL4ze7XPcFSx+y0mCQUTl4Ltk6tuqU2Ktpuv4XPy+oEVY1rvVcD3CckG18/Ew4iCC
 Rlw78prJFHJhHI9Jk0vmiOX6bRZUPSG8Rr1RQRdZE4+V8nyqCE2eYb0AK4bY7VGcQXywkGacaH6
 hB03ErTdwqa8GhAlIjWJ3woUxa5u4vEKwz72RRSaBgEZ3aERxhRDWiIpNgJd3PTRnlSsYK6E+hl
 BX2oYr+nqUyybOSsRkWB1bqzw1V/JPtqg4aPHZf5yn21RQXR6ELsEk8PKdhozuuquo
X-Received: by 2002:a05:600c:530e:b0:49c:cfbe:5a76 with SMTP id
 5b1f17b1804b1-49fc568157amr30663485e9.2.1789736835187; 
 Fri, 18 Sep 2026 06:07:15 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7d4b9ecsm56137165e9.14.2026.09.18.06.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:07:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:07:13 +0200
Message-ID: <20260918130713.160603-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20251119202120.752806-1-bernd@kuhls.net>
References: <20251119202120.752806-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: bump version to 10.47
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
> Release notes:
> https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.47
> 
> Updated license hash due to upstream commits:
> https://github.com/PCRE2Project/pcre2/commit/4f5a2ada2ec070896f96a2652ae05df41c4be14c
> https://github.com/PCRE2Project/pcre2/commit/1fffb0d44e7a62ad290cf24586c78bc04b689144
> https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064
> 
> Added license file for sljit:
> https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/pcre2/pcre2.hash | 7 ++++---
>  package/pcre2/pcre2.mk   | 4 +++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> index bd2422d991..17f15c0fdc 100644
> --- a/package/pcre2/pcre2.hash
> +++ b/package/pcre2/pcre2.hash
> @@ -1,5 +1,6 @@
>  # Locally calculated after checking pgp signature:
> -# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.46/pcre2-10.46.tar.bz2.sig
> -sha256  15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f  pcre2-10.46.tar.bz2
> +# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2.sig
> +sha256  47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7  pcre2-10.47.tar.bz2
>  # Locally computed
> -sha256  9cf7ac6976099a1d856826d3ef1b093bd6b84489dc6100628ac79e740cf9885a  LICENCE.md
> +sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
> +sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index 1d0a3b845f..f2b5608150 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PCRE2_VERSION = 10.46
> +PCRE2_VERSION = 10.47
>  PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
>  PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>  PCRE2_LICENSE = BSD-3-Clause
> @@ -22,6 +22,8 @@ PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre
>  
>  ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
>  PCRE2_CONF_OPTS += --enable-jit
> +PCRE2_LICENSE += BSD-2-Clause
> +PCRE2_LICENSE_FILES += deps/sljit/LICENSE
>  else
>  PCRE2_CONF_OPTS += --disable-jit
>  endif
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
