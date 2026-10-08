Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EF9CA600A
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 08:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8845811D1;
	Thu,  8 Oct 2026 08:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24eKwI31ATmx; Thu,  8 Oct 2026 08:59:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D4CC681170
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791449953;
	b=s0drKXbTW29H6UNnla+37WAjs9bgOMk3BH5LJ9cQDDFOrURPlOwup5EWP+vQKPbTUb1M
	 4MOGmsWPOzGyuWTQ7menWBdvvXnD+FhQwmWn/Wqrg6UioBSKjwzf6JvKXP8XimS6cc/8Z
	 ebsdzhc7z7/9X4uzD+Qg7HHp+uHxW9zopufexgcAAoQek+7A72SdR+xbzQhpXiqvgrhm1
	 5TdCl5F8MyvJaQpbkJYXefGuO0+qKR8KBGVf9v5dGjs53tWJH9gpl8a0JrMfUtLX8Itdk
	 t3ccMH2yJwQrK8OdG6sYBHB2jfWyBcFTSzrf36yJPCImErVISFMRZh7b3H0xQ9KvGEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791449953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=M5ayomZtvA7EqVhcjQjIdT7tNSM58n2/qRvgAX5lUgg=;
	b=Pnnt5kuTBwffNnAVodrJvyUzHLtVC8bRTNI4d5SWmrOCOZEYzo0UAQxLk1aMn9f/t82l
	 TbZQJxTmq3bZ78BSJm/ntZ2epoV9HVtHnVlh5xld9BjR7/L9HV3M69Rri8iX/1cdBe2+b
	 XarW/85XWoq/enXwjSrHfwFoStau7NFANeB95MH9V41Ow/GNb2QAvTH5z8DRWrm2KR138
	 FFQd9f03tEyarSKww8za38zXfZKK75fi0r+yiMB09prZtS5cn48XWgEseWSJCwnNGzo+e
	 s0I0IqquXYCxNKLDKckbE0PgNnvNrFPULIaquudjk7t35gLWbGH7PT3pDHWmgbxUoDw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eKnruqHo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791449952;
	bh=M5ayomZtvA7EqVhcjQjIdT7tNSM58n2/qRvgAX5lUgg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pjzu78+CLoQRJ0NrcLSszRaQt2fD+f6jppQvxWkegm8S3AADkTBc8eZVLfGRC3JqZ
	 TNGCGwZbpPHzsGwsXYL92HI5+NmNnr0g14gxo++KcPHleKoqfxKT2/7NHaICMVCClX
	 RfTv4DHKMHLT4JWoGSfStz4fYELa/Xli/8HViJtdtrJ/+xvCy3o4LJ5bBAEII8RlJX
	 CqGkJsYuBX3+/pDZzqdXFo4vXdww1sXFVnG70qVDG/cz8JDrQoOw6GkOw2oUul1ZcH
	 ZigzNF68ZTSzMBHBpOGhWTTYQAER+clj9VJjNCejqQZczHcckUqUiuUMfM5se1DAyI
	 AK3FYukXHxaKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CC681170;
	Thu,  8 Oct 2026 08:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA75775
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A05918113D
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjIFgF3dnjPz for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 08:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BB6088112F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791449951;
 b=CRESTq1sWZ0F7LFkqVnhsUBWWd+hZTseeaCrVSIV/1y6Ptm8uqkiOEs8MeqHRDEj1twB
 G7+TrMcb2aoZao1zs67jj+2xbU8L4qCi8nwD4IltbBDHrv3EBP+zYMpC3lG68v0ymbTN5
 XnnUxIGdRHPItnkjeCz4rCmcDHaEp8DZ1Deo72908zAZiuQvhGyWtm6/oyiTT9Rj1prY4
 S36fdsyiiGqBOX9/fLOEwjbSzUIalN4EW0NcIfntTWaA99EJnrM5S+AIh0/hflFhnceyX
 Xz5T7G+hjuOQeT0klGI9HyeVqbfgYuh0fzT/mem3yNFkdo4RtIZ0RWB/6aVEyMUX73w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791449951;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=IRbVf3fgB6mR+0+t2OcjWSeTRtl7cn9zLEwci3roGL8=;
 b=LKAQEsn5VdC6ThbpxV5pOnIRnUh0urxTqoowobkslncNzK5WhmoraK6dDRgxwcIgRud7
 s8Z/JWJ9HCPj4VLhQNoCCceafWZYKvOWVV9+/5jYxooE92UsMcaUe7bmW8AoE1KAd+bEM
 9UgEvtPOWAAeSi9PBy9Tn37SUjzckuI/LY1bMju1fD5WpyA/3g8lJwO5mXVaTHVvy9ned
 etRUP/4CHKKVlCQ/gusxt4jzsbQfXRHJWDJHnftI+pHm/5xjxa7tB3aEHt2glxt5sNWjw
 JfI8gPHlRdojMmWnAGFP3VJssT0Pe+iQ7ch+dzKfVlm9tnEeeYJfsmX22CM0sUrTPLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eKnruqHo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eKnruqHo
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB6088112F
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:09 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2e6df2742cso390117466b.2
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791449948; x=1792054748; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IRbVf3fgB6mR+0+t2OcjWSeTRtl7cn9zLEwci3roGL8=;
 b=eKnruqHoOGviioweSvenXpwyL59mWgH/yKhzPfWFJvmOJN3R/gj8t2VRNlrKACtlPp
 uq5nSmtzJOCV+9lirL4AJAu7KFln5Evi4lSJDjE83jhAnuqbtMQA/pBCf+t+YmJ+6YyA
 S1Ql2yD39Xzrp0tN57SN5VbXm/qs73fs71EokbFfCYRXJg/6N6pw48aDskYivNUddiKh
 c5Eu38uj08+bSKZAuLbUqvUYGVUMX+8dmEQlTbjXZgjEBf+ZjKW4h8GO4E/5ks4fHGQJ
 xa56PO7Qj5oo365TASAvts0lk2K8LSG2KAte0u9VWqw4NxnMJmeRxOKA53kQDKOiMNxg
 mGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791449948; x=1792054748;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IRbVf3fgB6mR+0+t2OcjWSeTRtl7cn9zLEwci3roGL8=;
 b=p9cBofppy7Mqg3a9X+iEKuFrzU2E910AFc9hCAXYlmgYpN4PIas5f5ON/+2CB7UB3r
 HSUSbgSGbASRlLy7WTSEFvu379HWF0g6sdK1COObIFuJY737UA7TCEMqd3IgmHZpZPXl
 iBw+H7NPtP93QKdkICvYFsBuqj0j+YPocXZ1Kyii4KpaGdavePcSiB+tVPq9QGllFUje
 26UHKDkrmNaenMTZu7r2mqBIYLQRvLQA8iVc2EwUlUskBp04Hnmo48XNsN3lcgW671pR
 1jX35DiNLhBpqLQUae38p1IA4WFx+YGR1h7KT4QSjVlcq71SQf8JKIHnZF2v67dR9MPu
 d5Sw==
X-Gm-Message-State: AFuF++l6y5OHy7hntkqLtX62J6TVPwFvXTvatKB7cjQlqm4IkE2eOLix
 ojdbdcxwoI43xc3GEZg1JH2V4oArkqFqiJpAHI4fMB6fAdyLKX8MA7Tu44unEeyM
X-Gm-Gg: AYBFou0SSHC7AmGnVlIow16dKKpBPUnEcd6Ex1njzcMU1JXGhG6TyGlRxTteRQzuC2n
 LRd7k9MMIdON3IvpQyuN6pATHyuCM3RUr06aoMVUYVemP6gOfWZSEOYTiRcqdmDNItDpqaDLM2W
 eZy2S0WWKPLsQ02Uq7pIcAoSBnG8nq8PXxvl1NlJkRQ4rIibGHJJmVVYzVruhIp9hgOaj1LLuwT
 TYbvwN3yRxHClbAPcnjl2TFKSUPVqJf9Yo2bXnFsKG1CEqBsm8+AWqbhaY82CYdwbgtj9+XLU5U
 UU3xwvZo4pUaHca+I4Ku4ovBOW0xnOyE1F/ToEAtnm5DF/wuPEF0BZ+WRZ0pgf9FZ0proFu9QbP
 VQHLiUrLCLC+sRSboIlT5O4fGWi7Adq3l2ySGmL1xu7ePQEetVoaY804lmBGQg4wbLYzhUhhkD3
 uw7ec/EeSBTZ2YwM/qy1GHkh8nWuLc/yyejpUokigdLi8f94rnMLkOfxz4HfIgsrZyn/a7RP+ZY
 yqENDLxmGPqYaebM0L+JJ1ldCawEltTTJlg
X-Received: by 2002:a17:906:f5a3:b0:c2e:485e:dec0 with SMTP id
 a640c23a62f3a-c317c0c855bmr456959866b.39.1791449947560; 
 Thu, 08 Oct 2026 01:59:07 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c317c33ff6bsm197171066b.73.2026.10.08.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 01:59:06 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Thu,  8 Oct 2026 10:58:58 +0200
Message-ID: <20261008085901.2692162-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 0/3] package/firewalld: bump to v2.5.2 and adopt
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

This series bumps firewalld to v2.5.2, fixes two small things I spotted
in the package files, and adds me to DEVELOPERS for firewalld.

Best regards
 /Joachim

Joachim Wiberg (3):
  package/firewalld: bump to v2.5.2
  package/firewalld: minor cleanup
  DEVELOPERS: adopt firewalld

 DEVELOPERS                       | 1 +
 package/firewalld/Config.in      | 2 +-
 package/firewalld/firewalld.hash | 2 +-
 package/firewalld/firewalld.mk   | 4 ++--
 4 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
