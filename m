Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FF3CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 09:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48CB181EF4;
	Thu, 18 Jun 2026 09:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_iaaSAEROd4; Thu, 18 Jun 2026 09:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EA4281F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781774974;
	bh=7sAzTvNy5faQpQkgLigOlQx5Iw+NgZ9mCw9UmigQGMM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MfRzDMSvgV8/X+dBU+58grwi2ZoRH/y4F8wtvsBJo1fQxZYhGC9gIoT08cPe6jZiL
	 LzX1N3A46KfY6YDcvUweS0t0K1qRDJykxAc6dGNcbJ0Ct2ta9TwuYh6uvIsf2HLdYZ
	 QYyPnHugDyI8f2IvWQX+JiUXW1xiH6zBAK14S0QOUOBCXPdd17XmvQyORh9tanZcc0
	 gf80sN997VgOz6R1BIr2Jbj6KsdjBgvYn00AaTUCE2XB7lXHciV+9x8u0Rf56+wyCm
	 CY1aCr42bdHQ5LwaRm6AsrbfYI68zJ3iBZ02UCvMAwpnZICaOUZ+4gQL/jvqLX17AP
	 1cWd9BdPhAcpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EA4281F20;
	Thu, 18 Jun 2026 09:29:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB4BB183
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 09:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7B0B6109F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 09:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-C0FO5gl-5N for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 09:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACE4C61083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE4C61083
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACE4C61083
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 09:29:31 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-68f36e1663cso1102826a12.3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 02:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781774969; x=1782379769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HK3GlrW6DhfkoKMld3V8cxm3+cGkeE/T2p9KM4ZFUCE=;
 b=rSyt48QbX2JSwATXZBaQywJY2hqr9jcS8zPvQJ9dBFDH7tOrBypqUPsoAcFa+J/bpV
 KMG9wmW+NdcjSte9XqQ2LmOYHqFQkILxmYOrUzHJO71+vDFlIqoVy1jCxlkzUb4ALsLP
 /8OkMikoHU9RSaC0tKL5G20DnK45k3XC3GVueqp9G30qvW6QZ2CsTUbgnf/PreCHioTw
 2WJDBxg5IPtUcP3iDyGYhpimdgGsXRDAvtGMROkuvQIHKWciumxkOC5qXVSlSiclHHRH
 llg1TvJDz/ayz2EeOepz9p8jKChX1Mi+9sS9lRK2MGEOxVIBt/AZfY0ReISjYs4lqgtF
 jaIw==
X-Gm-Message-State: AOJu0YxswREQVQA377EowfoXJjJDYLiWSZo+q+RcmilULsWSHFC1iprR
 BmTbRlBFckX1Dy4KmfKYGDzUgReJVmXaZa6u84KD1xj79FiA1fczId/zR1H/
X-Gm-Gg: AfdE7ckC3f4fJcPZy7RpbrY0JUSL/SkQUESrCwNlm+aRW7JnR2Voj/mEq09PHNcavQY
 blFh+lduwzQ4nCQR2Z5+BfK9kF5mTAOiVW/ANolFJtcH/Sh+V8DgaiCOrYMIc3Db/ezOuOeOlw4
 JagLIb1HbBkRTDohkVGCH1shG4rftFVgITVPyN/wcbcAPjCELJPIiOIQNcrATdXNz7gRlPD9QOG
 69S2lw99wk6tJf7QeYthECcOhKCvI+mTinLn1oqWDdWBxV2VlJzF4v+bCPBTFILERC8sy0U7/KN
 psMCCDPe7SnamLfdIra0AXfInJvx5ei1sKE8cI421yyVKyK/4VtiBwwHIZJC3cvLxnf4NfSrVSk
 7TgVzEOfi8TMXNaGBm6sOTrhDdPaFMA/49ezhnjbcwA6bP3wzSr/2Q+Lc5xpdURa1karE4PntVM
 gOWyEVp2nayye5EkEfhMUKAXVEHu0=
X-Received: by 2002:a17:906:5189:20b0:c06:1310:21cc with SMTP id
 a640c23a62f3a-c06131023b0mr281387366b.47.1781774969283; 
 Thu, 18 Jun 2026 02:29:29 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6958486e233sm1525282a12.12.2026.06.18.02.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 02:29:28 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: shirokovalexs@gmail.com
Date: Thu, 18 Jun 2026 11:29:26 +0200
Message-ID: <20260618092926.41905-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617161331.141666-1-shirokovalexs@gmail.com>
References: <20260617161331.141666-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781774969; x=1782379769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HK3GlrW6DhfkoKMld3V8cxm3+cGkeE/T2p9KM4ZFUCE=;
 b=Kb8klKakis30qgrs9TFIiL8lsfoI8wLA3/KuIpRuYhmA8ekgaIEYt/wR+BuqPiNacR
 xOWJPqWaC95IDL+19FjFhBMAGCLyoK6yyH7eQLsy0qWlULUkapzJdGOVdn0Ck7vEH8XB
 Q4GP8esVF0/F8k/Ae4YL5AkLejA3GTlvk0H3O//lb5tSEU6JyXRQGOGWT6hTZkWVpau8
 1dm5Bi3Fpz3Luv0BpL5V4qgZaaQFzreBu579DMmdlTetJMymQ4hWlsfgNnndi9Aau/Uq
 LBihvnJztkICPeoffTqsjOjR5rUWpb3wuHxsg74rfPcUt39im7jkcWHmZDEfHCsdN9jK
 F+pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Kb8klKak
Subject: [Buildroot] [v1,1/2] package/aichat: require SSE2 on i386 target
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

Hi All,

Just a brief note: while I started with the simplest fix (disabling the
package), the root cause may lie in a different area.

As I can see, the broot package is now failing as well. It appears to be related
to SSE too (at least according to the function names).

For example [1]:

	error[E0425]: cannot find function `defilter_avg_sse2_inner` in this scope
   	--> /home/thomas/autobuild/instance-1/output-1/build/broot-1.55.0/VENDOR/zune-png/src/filters/sse4.rs:332:9
    	|
	213 | / unsafe fn de_filter_paeth_sse41_inner<const SIZE: usize>(
	214 | |     prev_row: &[u8], raw: &[u8], current: &mut [u8]
	215 | | ) {
	216 | |     let zero = _mm_setzero_si128();
	...   |
	266 | | }
    	| |_- similarly named function `de_filter_paeth_sse41_inner` defined here
	...
	332 |           defilter_avg_sse2_inner::<SIZE>(prev_row, raw, current);
    	|           ^^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `de_filter_paeth_sse41_inner`

I'll investigate more carefully to avoid having to fix or work around the issue
in each package individually.

I'm also sure that if this is a common problem, it will affect other Rust
packages as well.

If you have any thoughts or ideas, feel free to share.

Thank you

[1] https://autobuild.buildroot.org/results/156abd4e214e230d36426fd407a7edb030fe0f31/build-end.log
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
