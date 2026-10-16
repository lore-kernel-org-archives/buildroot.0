Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6430CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CF640C56;
	Fri, 16 Oct 2026 15:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6zPVIAc-d0g; Fri, 16 Oct 2026 15:06:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6CB2140B5C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163174;
	b=IF6dAKWk6cLkHxOygEGbiouW722zDLF1l+sDKrjxBNJBh75JlSH2SckFpvnX/sZ4SZZ3
	 lXr65iUaOfBauS1sSElPVdGzH6ifqZxZGQH2m2sf+j8NTPQobBJj6vLWJyCw4z/klaqM+
	 1/3RTWoj4jUkcNDDlgls77Myws3R8d9QCQmfblkvSn+NXWl/hUZfQxfv1/AIBoFd3U4np
	 MTQKAakYO1iEJ/LiFITJXDcgcBjYfCrQ/FFG7XP7G6gZVyiVgJgdMGJdt7rHiHtiLKyXg
	 y1yMZpNUjSnC/NafTYoKhN2+ZHbVZDPVawWXJkVeYIID5DSB0t4oDhp1axavCcd3oIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RZS/7oYyF9q04PQgBVvIe0VVWOYmmCJzqL8N4Kgwx2c=;
	b=iBrYTWJdTieERgh4D7DZXzh6RnV9nj2jtkPJukoU4WDiX5s9xPPB3XodVcyRNCvji//6
	 BL6KSjJzYKROC+6u7WP6NSNUzZUjimNhgqDotEBsjwPgLBW0zTssHD+jNnJOD9wsw4MIo
	 my/WtmiZDP1uCUkARlTDv/UZDCWc5AxLbEnuOKq8rDf3m5qRThbMtKzuHWCrBwp6ipHVZ
	 09WJH4W+BBV2XBXQQ9SZ3FBUDb6W8zKBoIA3/i+214lmckrt7CvJQBxglgZxc6IbXkgzV
	 BpZJFRmalbK9pfaTuUqaM7tuQRhJKbSXcQEffuyfFcd/1zybqOG+E95tutZ2yjY8KTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163174;
	bh=RZS/7oYyF9q04PQgBVvIe0VVWOYmmCJzqL8N4Kgwx2c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GLRnVhg1juxL35VzSM1vBEWFRs6DTBra3HyPsBbmsxrQZelb9twLaSYC8Z94q6j2z
	 vsnNvFBsXyl8MajhURQdzPBYTMGJY/anqKSLiZ0/JcSjIfd0y2yRXzATZN6aWnimwS
	 ROt9Cf/nWnlCDQeUfyFz0D3T0HO/qrhos37ba0b5XzyA0Fh/dQCZzI2rGFnMZFhef1
	 Qb0JkrIWV/cCKE0QrmpG4x4X7Sdx5USqY0bqgLK/mrqZYwv/YjWYNDRd8Axkp6dwhR
	 F2C8h3mamS9G0IrRtKxFCgx9r/odHwLvHQb6+uAqPt9baF2gKIbGttN+3V8wk5ei9r
	 0IdnNbvVgD9JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CB2140B5C;
	Fri, 16 Oct 2026 15:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87AA07AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DDA34016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEX0t8i3TfPk for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 80CD340042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163169;
 b=KBBisyESQpk9hePvJ0Vn4jBVq4kZ2zRb/7l/WzAk3XJNsyqR3UaP1YOB9rCFRmSxxVBw
 Q3YbHtx62EYE69YPlj4ULUj2QfP8fRs8KtEV8HJxUE7Sk2qst8L8w+PqvOFBbUAqwJlKl
 G1ZdpbM9LDsfs7ntgtZdTv6XLgMLbDZDjGQKoEQwMea5EDMhG4sSLyQ+JIX0eq12jnKMC
 2IipsEOyV4zVrq2dGsqw+hqhDON0V5bqw0X75l+VeAh+dLu1eAwYByHARHDG1gaPrVUMf
 b0Qk2mLHGP5x5SyutKW9g3K8RXdfkRmLsM3yZqHM2oeukNT3ihaDwx3Bbf4CtV6LGLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163169;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=LiQAujjnb03pLAZ3+usT/Sl522E0Tcwmvc1PdKdCGxU=;
 b=S5FU9aC1+JZDM6GTDB3b06/fCmWEkbaKqYjZw8kZgbqY4fQHxH7J4omyAgvjzfPKF6Dy
 yNKW/bzOsjgLyQxKSKKeHSp5oUdSm27CPcb8pbgWgFU3tc49/62lwF6Op+zgC0cVCBAlo
 Rd1I1fWz0ZOpq8azFpEG8DN7v6pRXQ5Bz04KuNpvpiirv8oDFwYuOa/o7L9NlRHR/A6in
 Ffp0N+ZJ4hz8RQcIMFWda+tgWazNyU5oE5Nhayine/CguaXC85rQ807kwDNq2F3ccAito
 rhAlJnNRQanvTr6HVaOkeTBde73OcwitYpm3FqI80Bw0bkGPSaCsbg/Qww+vZjK6hrg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=U120tnvq; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80CD340042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so326895e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163167; x=1792767967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LiQAujjnb03pLAZ3+usT/Sl522E0Tcwmvc1PdKdCGxU=;
 b=t7WsuYJgghbro+ZiuaMGEvzHoWVt8qUldxyMv2/ErRj/dGG0pFIpqiD+xI1GDW74Ci
 vOP5k/XUHkuXBOJNkTC2T5eV+Gr8Dc/gxImtEyu8CFby8luz02ptsZM1V0tpHbMJa4YT
 DxVw2fsQafORZ8Uq2RGJT/NB9gZY+cOeFHhV7EOr5U7Puplb2NF5UDZuWRedAGW0l4fn
 /+xA5+h8hDVkT9b93WIcBjN6fh8begLLOIXzgnkX7r5jknOFOnRThy3AktgEkjzmDG1E
 rWwp1T/7qQsveYr/RUTbvwa0M1UOcUCgKLtHZkB+TfsUqL2XPt+JE69Ke2NetlTMhOFn
 JRhg==
X-Gm-Message-State: AFq9FYIDmyG83l93m6OtjUXLNkNGGMvXT6uNSE0ILMtZa68p8An8rX07
 d4W6b6wj+tzPHrwbVdZNmkK2Q2vlY4rkkjAzcRyDSPzEwaVdoYGJBt2n/9ifqjn+O/GVR/5Prrv
 G27gvOlE=
X-Gm-Gg: AYBFou2ov6nP+GCCBSSqT4VuryD277fi0V+GNj+4BWuPYgd8/NbZYltZNXe3Dn6q7k7
 SQLKbJPWUoiR0SKteEz03UoKdm2rOh0oQzV8esTelB/UjCXHw1WKUT0G2ZgIgJhbvVASem/s3d4
 ubRdRJjYmGbIOytC0KAZYh0mMtQyeR+OxmN+HAjpVcQ2B51ZXhyXZx9hQzjUyjwEyVCukY6xE9k
 sh7zVuyW/OccPG4WcSbbHwBQaJTX9lVOLJcJawp0854fdRQQp/Tbt1FJNncwf7HiG8s8bPlfQUf
 UI4bJTsXFlJEARprjg3ewW6vBm5ZI/XH2bMd0I2BC1G1YGUE9OA8m/7lgM5bRm2buLPsMLSqXCV
 2iAGGqTxMlsBrgtqU0KgbgrL2NYBOWaqswl33hoBW2aFDv2buzCx9FCY07ipAbLEznV2qyNWdmF
 IrhmrfFRTICYC/MHxUTUyWrwGX09QrMFkwqtkJKrC10Bgoks+KG5ZCpiCBmL6JV8nLTm1aIlqFf
 GdnNNhdtPHXfePTkgwrpdpZqArYJVp/bF4cGoks4A==
X-Received: by 2002:a05:600c:4f95:b0:4a1:a7f8:c11f with SMTP id
 5b1f17b1804b1-4a1d75e6e09mr1847455e9.9.1792163167103; 
 Fri, 16 Oct 2026 08:06:07 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ec8dfsm5925560f8f.26.2026.10.16.08.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:06 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:04 +0200
Message-ID: <20261016150606.76032-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010143708.421070-2-peter@korsgaard.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/pkg-generic.mk: drop PKGDIR
 variable for patch step
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
> This was added in commit 604d261fb0 ("infra: remove variable
> FOO_DIR_PREFIX") to figure out where to find patches, but this was reworked
> in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
> directories") to instead use <FOO>_PKGDIR, so drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pkg-generic.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f8ffaa21c7..c69bc96237 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
>  $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC):			PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> -$$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
>  $$($(2)_TARGET_EXTRACT):		PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
