Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE82C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2588B40BD3;
	Fri, 18 Sep 2026 13:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCGHT_9OszKh; Fri, 18 Sep 2026 13:08:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5CF3940CCA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736904;
	b=XS91fWHrl/xoBRSKbUv7rLH5P5LdWhepigp6RiqhzaGjQ2qokvzQENPK8N9+8aqNKIGI
	 i6Ki0f9110ZMNi6fas1V+GgUxmpbN4xiRTlIPbJGOiTYpwWXDJsgJwBt3KkXMzMknmztQ
	 C608CKyay7ow8D5IE2awn3j/qejyE/8dI/RaAwb7hONAtYvrHxxkQuuiTPV7axuqQj22e
	 9b0sKIM2SPaL+nuzCRrCIegvcMhBRlrvMOJzZpwCtkAT1UOyYUkCvMDbsvxfBd8m0c9wd
	 CjwUbLujmwMJO33wUPuYdh51aoumohle7jjMYPVpgIfXD2DmNRL8eaFPPD+8+2D8z6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cAVb+Uu8MBUNvtQmuZRw6dAhD7BH9OTgst13HHACyMY=;
	b=HUj9vBP6pLetv0MBo651iPsqt1b3vHUTcYo2622MQ23HFEng5LDqyu+wPLKR1MZ54j/M
	 Ih1sruS6w41M8HfUetbKvCC26TJDFepYc8Ntp1z3+Dl4LCVE8q0IU7IkIv1/+uQWaYTwn
	 SR3tF1/+O3hp/G1wGJP73/2UhUA4fVXZSLPc7TZcaw+ejJhvDbmBfUkGO9i2YCg4u4KWj
	 +Yc0pZCbOD3gA48LS3Cf0COaoJGo1LVu0XTevEYK0P7dMqfbInQbqiUeUXKTe9RIE9qYb
	 UXPtn6aN8+anTpQ55H4zrTT/SPQpFoGq3pYg4538iaYViA3KZEm7XWH7y3e6aLnkBig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736904;
	bh=cAVb+Uu8MBUNvtQmuZRw6dAhD7BH9OTgst13HHACyMY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hEsKb+B7w9bKFe3c/zS0jgJqq5H3MlJRdY6wxOxydNKaZNr9tPwq2pN+kEw+zk9IX
	 XFfVKqJKeLA4e99srRqeLDcq8b1cxPevbuH3WJJxQPnqazPLi+Oo14lc3hrwcxWUft
	 Ij96xIjqrkjtc8ww/JwFpKiO6jMpHOcSw6zgU+QpCC6rf6b+/4HIrsYq6GrN36mx3i
	 oghlOz3PvZUfgAN0EolPe1Wf9r84UqKgeLdH0QP8y6HegHI9n9f3ca0ZWg2I1GKXBA
	 orbDtACxezfZuMNzhOVr+y0rI8lhuSJTeMDBXDMJWfE4eqqwDBW8/ajJDsI+ycJ/Gp
	 voj8PjKaucmsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF3940CCA;
	Fri, 18 Sep 2026 13:08:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1EE813D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE2D8116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPeqpIfX1k_d for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 11D7D81283
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736898;
 b=Jp+pNPzNKGL0Qz2PWK0MtHYTJryr6VH3tHLDNX9Meqfn3snYGZOHVcOptDypW86jgGCH
 L9hajoXe2E+o879a9w9hRAf3kfvoNpa0OVICSxaVn38VX3ZWKbC46GDDmvCPyZhorBwHS
 XOqO0j77bZb4AalHcw2fudCu8u6whb3UWrVkZBCe+B3Kt5FQSFL4dcCfwc0PAq8o5+lZP
 LKFl+qgRAYq7dlj3zX35pCuTkBmo6lH+bb/RSyomPK1MLntzm/HyecW4zaWbcqvbWSRlF
 lW4Lr8x0Mofv6Bg3//yOr6bXE8PQ9jDVLiwDSPXoBTZaGdcw552IIqA9oQz8kifYBRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736898;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=il/leu212C4Ix9t72JJ40W6z0hI6O3vAoQBewTwQGbQ=;
 b=U7S2U+jxIaLqoQX8G9ytnT+HOi6s/XCJJmgScqzycomB8FbILyZdjoeyu+vfIoE1IVhF
 NRKdk9MjWlMwmfcuX15hZgld533vhL8c9GdrQbEF4QomXbsmJRPiWwAMwxY1KMRksVUgd
 7lOi3YEK6FmfQkeReT25bpT5Lyjd/ge6cyhPcShi5Z83Y2Flnbj82vtn5yI7EvwLpwtpk
 2/6WBPHL7+DaazIjXbEAzbQe9O73ajSRED9sG2TyWda/jWRZiD7nhpmQ2r6qq4gictXMf
 Eb298Srtkjf14Bd2c9OEW3WcDpmxucfrBzjRp/MpYdBPtDoN5nMcOluePdT4fH+j29Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CE7uPgJz; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11D7D81283
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:17 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e79a408deso4218335e9.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736896; x=1790341696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=il/leu212C4Ix9t72JJ40W6z0hI6O3vAoQBewTwQGbQ=;
 b=HNtV8v+430b+EpLu4Tw4qU5XVnk843kWWAlUQNwUQjEio/lVLi5XGpPw+OUowx2Pgm
 JDMiATRWhaBoV2Ho5l1YqO2dlqJhROgoYf7Iu6eog2/qmYAxB+5tuuvOajL6rpD4Ixi1
 +8pIMlPKMsRqTE/za18X8cvb3W7sia+Nen4XGnAp62i/ilcOmSzgY/C1qJcVTPbEcau9
 SNeWQxmLi/AET+pTWwm5GkjkwMyRCBO75Zth576vXpKpoMfbFTjvgYiG5cx4Tcq/berK
 VU5dflZOxslIvc3eyBF46uiuuOSVlVmK+Qn8+vxj+kr/X7fWXKDnDctQjBM4E6FgnSXW
 oqKA==
X-Forwarded-Encrypted: i=1;
 AKwUvBywj/40oSwISAUsrGnYieIZ317D212tkTEOqP94vXj1SqxAgI6f2p+KIC6YD3srNqQbuKIAcyJj310=@buildroot.org
X-Gm-Message-State: AFuF++ll4l2CxXRv1A8Y2R0NqezXy97sG+fEnjP0dDB9h6zyiQ/0qwzI
 ZtfKBPYRXX3VYCYiagOkCLez4vZEVImgcOayB2tHO6LkHgtI13A5bEUf01p3OkVK33jZqlbFk94
 HULbX
X-Gm-Gg: AYBFou1ztBfwmuxkhKnXoA6N9pr0pwLL8x7ZjbLsQ+nJIQTW+TfSPKyhsgBwyiiB8cX
 gG8fnGxfveNmLawtqDDKgKRw9QbkEJNRuJ6W1NSvNY53emtad8f0OJbor+aI4tCVDtltcrPLtpq
 /l76I5kzfPgtXuiB6FjOLOM44Ee47wbpeY5VnrpOvLqZK3aklS46Cd5vZY9yiyGgeGRk70btgSE
 ptzxQq0pO4MJ4TRJvcGpQ/GE9WRhKJPcghaG81j2xwJJ0syZu8rlDLZytozN+I6HnoHbvbmP1MZ
 tRE9KTuXs5x2Poxpd9+d7KjNRXXkjg+4OgSnk/oIBlvuy83aXeKbeICBe2wGvUbJktiw8JVriAv
 Y1e2fYng7FO7rF8MVbFll6iLn9aanLGBi6sjlPW0UlS9lh4Od6F5QN9W6QsM0SmpaBr0bOJ4Ly9
 cWUQ6JZaesqPA+EJWbUt0TFVqLy9KZW4+IAY2mib+JHtTFl/J+Exp9B45QhYW1XhF9
X-Received: by 2002:a05:600c:6212:b0:499:9240:9a1c with SMTP id
 5b1f17b1804b1-49fc56f8327mr27144025e9.15.1789736895604; 
 Fri, 18 Sep 2026 06:08:15 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7d8cee0sm50289785e9.15.2026.09.18.06.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:13 +0200
Message-ID: <20260918130813.161602-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910215723.2585965-1-bernd@kuhls.net>
References: <20260910215723.2585965-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: renumber patches
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
> Buildroot commit 99bfbef093f41f20dff305dea83c7763c8b34a1b removed patch
> 0002 but forgot to renumber the remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  ...02-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch} | 0
>  ...03-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/apache/{0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch => 0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch} (100%)
>  rename package/apache/{0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch => 0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch} (100%)
> 
> diff --git a/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch b/package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
> similarity index 100%
> rename from package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
> rename to package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
> diff --git a/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch b/package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
> similarity index 100%
> rename from package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
> rename to package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
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
