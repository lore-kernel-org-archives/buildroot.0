Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ECACAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB3614189C;
	Thu, 11 Sep 2025 19:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sc_St7vzitSf; Thu, 11 Sep 2025 19:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F4D418A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F4D418A8;
	Thu, 11 Sep 2025 19:21:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F7C2E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2111E40896
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaSINVJbiVUP for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:21:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23F31404DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F31404DE
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23F31404DE
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:21:42 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0785be64f5so382517666b.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618501; x=1758223301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/w4gXFsprPI7LSRESuaJHTm01SEFeXftNyvypayaBI=;
 b=PjR984X5ZYMQku/AKMQez/gLz/k2q2L4AgGi9XOfXugTMqMRm1dWjWW0QXoJvnnBHF
 CwUOSF5202b4JBfPV6C9q13/UVLkXbk94fPq91pmbElmuqg81TCl9o2x+E0mDNu7wLd2
 9TfGqBEf7u+sZFjSJujKbWMMzjDAfQgCrDdAoo+/x3G6pNXyxEkzhdQ1wZbK0BHdUxsL
 sbobG9IB7wBrJKL0cffd1X8RlOvKsLpb0jRkTA4ssh9+sxg99aLUnKr6BiowXcnfbGKx
 NmEuDDidAVRRrPs2b+Dhre52U9mF/Q2VsephQraQwsrEaRduSn2/1yGE/3QF+SR39c7F
 Pxug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUORTCpdVzR+184WvSe94BiEB3csC7R1EqyGyM4aOphC4lPwOS/F1Ff+Aw71BStDSWoO1dkL0+JDSg=@buildroot.org
X-Gm-Message-State: AOJu0Yx+TpMA9Ro3fd5lDlB26u7kZ0XXIsvVEZacpq99XFDnR4zjK8LP
 sAWw//bTJ9LBzOJsdJRVcwpBio3/Iyeg2Qy7pI84hR97HB2fKBGrTshN5p3T4xL785s=
X-Gm-Gg: ASbGnctXjH+NqBUX1/rRv+MsNz8ERVH/eJJV1bFT3VfP8p7wSj2CXK2RcLb7BznyhFe
 6xybRBtME6D+dhklxTFBMlHfdTsEy44eaOiJ6Y5En6FncNIQIo3A5atJJIYg2YJA5VrL8velHlt
 PPuc2QxJ88Yhd4HmBL9dTJpcwe3n7gRBf864zR9wXcxTSqulIhAEtDsNf69x31OL8CN3YH7GkWO
 Q1yXqFTxNNOYGMflBzguaoFg8nmOAZkKsCXQC+g2HYJEd6sKgXbmGgnOgOztJvkElwpSIdDtTAW
 uUSHn901HXeIF+7ZCBRu+T/DDJ963sG1k35POI8qWyl18GEgnrE/tMEQBCD4cSd4dE9KeL2ydY+
 FGmNHSkz95ozQmzQ7JWh//acb1hbBSJHEQZWG
X-Google-Smtp-Source: AGHT+IHnyqmYxqQvxF3hLKkQuQyIAWsW/YagpkPeUEcz1ndDBeJ4rFRQDKRQRa402icBo6IbPFLqWA==
X-Received: by 2002:a17:906:2682:b0:b04:1957:8e71 with SMTP id
 a640c23a62f3a-b07a68b645fmr331620166b.25.1757618500942; 
 Thu, 11 Sep 2025 12:21:40 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b3128525sm190785966b.31.2025.09.11.12.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:21:40 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:21:17 +0200
Message-Id: <20250911192117.2671506-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829165238.3082564-1-peter@korsgaard.com>
References: <20250829165238.3082564-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618501; x=1758223301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/w4gXFsprPI7LSRESuaJHTm01SEFeXftNyvypayaBI=;
 b=E0ewlqR6LOtem7B1eTOXQQXF/2MzGXSiZfDeLurVrAa6/Ph3VhLe9P0YhmhFMaEfB6
 mTunaOTe1qTdHOHav0RtjQAjN0UIghQ3z30q1+sdOljghYt8BaXp50firmqDQtpZ0FYr
 aOOKri9CLA0DGZ4qFG3/0I4FZ1LjdVsKcoVm48dirqLVcxrftq6a0VCMS3f9fkh8IEUj
 UHTPKxWpzF7wPTfHW988CgJY+0QsEfKqmqHBLSuX9u2roo0uUeEf5WdlMUd6sBRlUvJu
 NpWwjiGzyeAH8w6CfjuFiKiDEdzHbUh5Nq+PWw0SugnSby7zA8w+Pfl4GRRbyMdbfGEO
 L9eA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E0ewlqR6
Subject: Re: [Buildroot] [PATCH] package/mbpfan: fix build on musl /
 uclibc-ng
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
> Fixes https://autobuild.buildroot.net/results/9526503fe8e756bd4444f1fb1e9cf1391c461901/
> 
> mbpfan uses vsyslog(), which is not in POSIX so only exposed by <syslog.h>
> on musl and uclibc-ng if we define _DEFAULT_SOURCE:
> 
> https://git.musl-libc.org/cgit/musl/tree/include/syslog.h#n64
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/sys/syslog.h#n200
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/mbpfan/mbpfan.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
> index 0ac161b327..bccb3ffc16 100644
> --- a/package/mbpfan/mbpfan.mk
> +++ b/package/mbpfan/mbpfan.mk
> @@ -10,7 +10,7 @@ MBPFAN_LICENSE = GPL-3.0+
>  MBPFAN_LICENSE_FILES = COPYING
>  
>  define MBPFAN_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
> +	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE" \
>  		LDFLAGS="$(TARGET_LDFLAGS)" \
>  		$(MAKE) CC="$(TARGET_CC)" -C $(@D)
>  endef
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
