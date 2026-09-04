Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633F6C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2449A60DA1;
	Fri,  4 Sep 2026 12:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFfEI-cPtenZ; Fri,  4 Sep 2026 12:18:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E95A060BF7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524280;
	b=RCSnZR9VLIFtcqrg3KW0M3Dw3QisRyMLSgmBDpdQLR5hAqrSDBgYnNFTaBY5OE0CWlka
	 md9RIuJXTiZ16toH7L7WsITtrKvL+N2YQ1CIx/E/vkTXNRyKffC9pjr2ryAdgqAjPe95f
	 KkKxY+2gT4BPIg0m5BRdt8BiuxVqQNNfjUlQKy4kOvShQOyTrhY+uJOvXkNr+OhyjAbAZ
	 5XF6MO968C+hINXefJD1rW/Me2l2AwpzingdiaR0VZIQvvGDZgqv2OGrHH3v/BewQ2NNQ
	 7f2NxhO/623C7mc6n5HcnJVrrbBd7ZXMgzKt5T+6qZAUvnbFRisRkLlC4Br1Bhj1qJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KN405LKU5QGvE1MGd/mIqC8UaNV0JFKxjPRRd5isME0=;
	b=r5lZPVoKVCp68y1seHxmI4IjFPs6IZWmDmCB+xnF+plXar+J6o0TBOHsEzn7wbx/6ulr
	 spt15BopBXHaTC1njF844IIVIBq5A7ADAHK0KAbKd9u+xtV4Z8VD0C6s9FgpY0Asfj+Rc
	 9NjE5aTssoqZ9oyCC6fd3ZOwYdupm2nCfBoMxVO/r1xkXnLuXb+jy47LG+yPuhUohq2Q3
	 LQ6eTHXXsmQsjCm9lk8HDABeggnNeUQUETzK5BsdVbLG7qA2I5chOyx+tYoHGI1zPVH+y
	 HQCBCrGdNmopiK3TTlSU+4kRNXJcjUwGoLW/KTj+xCWu8xXIwPaN+B+s+VF8MfEDagA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524280;
	bh=KN405LKU5QGvE1MGd/mIqC8UaNV0JFKxjPRRd5isME0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GZDFh0QvIW2r1gt62wNU8g2rgrfeugmwZzOG+UaRMeHvfgbXazoecv1ALNy3l4fBP
	 EwUl6R8JAfJ4nom+asp0lmEOXRCFKeI1RbIaevR0nZWl9xdaNQ8F8MyfY4JvvTPO91
	 Uze47MkcjD28vioDF8MgnTeLIwF1OZQm3/I3gqjUrVSyTR4WQAZAoF8pJ11daHDq7R
	 zFxliUY2mqHmboMZnoHEj6YKydoHGwLAvqVNQVIKepk0l/Vol25YicYoaN9Jr48koz
	 AqnBfMmkco3WAvANnrxmWOhqmgyZe9vZ2vqkSsBnV+iNJAP9cc1yAS/1Y/DHhaV/t5
	 5LdjN9ucUytKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E95A060BF7;
	Fri,  4 Sep 2026 12:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B649810E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB2240B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VismqLO1WRdD for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8027E40B2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524271;
 b=OTPbJrpM+Kbh9P2YR3kDD/iuD5ackQh6wifvChytUddb6vUyos1kzCR3GVahqZqFByER
 E04lptRVxW1xwKk9K2kIcMgej9eEMCuTLpAZ8dnzih3/wMF/d/CVmQQqpwq+rINV+OBZ2
 g4654fpYv4MaZBT4GQe4zXIT9RDx6dMZf5ECf0OPl4LIAFvaQUKkQyfDxzNDg1vfZ7CXT
 ZNjFpdnU0ljePU6t8eHsg5mcFV6+vk2OedrSp9s3hoBi4CUVNmV1W4gu0K8nK3YH+2Z71
 RVbAUTI6QmOc6469duJUPvyPw2OSzkwr4BszW0NFKi5J+dUDXC/EBPteZrHOBbwpMTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524271;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=6ixRF6iBDnDx847NlCh3w3k0aXR4739uQwqYAdXeTRo=;
 b=OWJexBoVWUvAdXUP+Kpoyuz+1XCeqL1GGtfoEP8/s7w1wZ60YJ4xTdqA41qviu/HDp6I
 /KMA49OYeoNKvLEEKfj4+2ChDrU3Xh4s1Tm4zTTLMNSMxhOVlRmOaf/3XQcyDj1kSvxUL
 PLZdER1M+9I532sth5BDIOzNUMZSETp+fR49Oqwbbhb/s50RaCImudR+tT6NGnqYtJ6sj
 Na28BtRv141dw/TK+XGrKAnQpULdmUMh9EHStREVtw8qImo+smuRo3WXW7L27koQcBPBa
 QnqtAjyf6a+2oaZULRuqXpg5cfv7YKwbfVX0LhDDY1FvsFNl1TvLsAw3sZCnVEBDUjQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S5549Re7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8027E40B2E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso8123955e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524268; x=1789129068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6ixRF6iBDnDx847NlCh3w3k0aXR4739uQwqYAdXeTRo=;
 b=jGY96sZY9MovcjRaScPu1ZD2GM7WjF8QkKqtT3/S60nLegNxW0jNcRtbB1QXeF70a7
 UF8zUdpG9ZvLsRpSbRx3D3scxsmb7dSUexLyUNZxZzFZjk7ZcOJwHNMJwvc+CQJfekAA
 uDHssn9Tc6M4yS7v+yOU7lPWMoICrdUezx/vQxnOmu3pWtuDDQPCRsuZ8Shh2S+X/elU
 25LxZAvtWd3rtIj2PHc/kEt6faBPOCQp5p3B6BziqJTUZDpWFlYnEeEt6+EdBHFuJKkz
 wVTOLhOZATbmM1No7LvJQDZdnE84m4Knr6HEupGSDDKiXljok0KjEvUYllI2am6Pq5Xs
 AA9g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzPTdIrlr46OEtOiKbV3Fa2ZyKAx1iayiamsfjbWhzgxaG7o6zoU4W6bUwuLgfmspVOq36UTc6rKEo=@buildroot.org
X-Gm-Message-State: AFuF++nGKUTHPj5f8fbIpyT2657E+ZiS3KWvZUTWadRCsP0mQUQwgPhz
 hRd+42VlK71tL3rUqPucKxaNtS2JmC3VK8+6f2u5larMLB7y6K9GePzHimgv21NCQqY=
X-Gm-Gg: AYBFou0f0qhYblu0ahDa5ziOrbggudEpw90n0ECqji4wnACRNPmGw4o5mS472q6QyHv
 w4Amb3U7N89vfmnZIyJm1J63W3GByuDY5axh8vxmu9bQlewgujT9hYSzEpMnb9gNhDgvKf3yGGV
 vXuMU41C2grl8BRR9ge2pDzSMe5N9muOXGqQUzcJQq2oCF6VDtZAFAXCDKEGd6OMSlNRK4Ikb9L
 OGJzyNY+isOjN9zks5y0T58axqFBh7ed8XCiTAAvB3FyOGuF9onzmRuGc12X/vwXLMYPYY/UhOE
 iNm7hbJ5WMJI9VZ0z86hGXlsw9sPm+L+ImgTClw6K2f7CAc0tRab094gD6nNYLqi4kHzIsx7898
 YaizJmFqlCr9tIesSTwJ7v3VAvtQ2zKWT8UYb9M/Ey3EjK7FzCzXQTZDxd3E8r8YGdMTkvJPb4R
 +kwCpAvkNyaSJ3Tw2/hgxzT2W6L2/4+AowsRQlSvYye8pAhCO+dXCnQX24Bul7yTOQ
X-Received: by 2002:a05:600c:1986:b0:49c:fa21:e744 with SMTP id
 5b1f17b1804b1-49cfa21e906mr32180725e9.26.1788524268269; 
 Fri, 04 Sep 2026 05:17:48 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858bcefd59sm3270823f8f.19.2026.09.04.05.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:47 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:46 +0200
Message-ID: <20260904121746.404367-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902121126.184398-1-titouan.christophe@mind.be>
References: <20260902121126.184398-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2026.05.x] package/redis: security bump
 to v8.6.6
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
> See the release notes:
> https://github.com/redis/redis/blob/8.6.6/00-RELEASENOTES
> 
> This fixes CVE-2026-62356
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.05.x. Thanks

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index bfe94b8a76..87877c1a4d 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  cd04337495fda9be071d4e1e3c6a61134f83995bd23d1794cad18f878b7012ad  redis-8.6.5.tar.gz
> +sha256  8b1b04f77910780a141bef7d66990d2f6171209ce615dbedbfa3b82ebfaf0887  redis-8.6.6.tar.gz
>  
>  # Locally calculated
>  sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index b08cf9ab92..88432df3a6 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 8.6.5
> +REDIS_VERSION = 8.6.6
>  REDIS_SITE = https://download.redis.io/releases
>  REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
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
