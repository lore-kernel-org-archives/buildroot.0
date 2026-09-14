Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF56C88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB9254052D;
	Mon, 14 Sep 2026 20:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlZ7sz-4oJxY; Mon, 14 Sep 2026 20:27:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1913A4035C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789417678;
	b=Vc7Ajt9AqobxeWGWtqHET0fvrkvwaoeqITlCMD4wnkStLYMuCxBLYbmlspNhAlvngMbG
	 jZ+IXnOUeolbeS+jqPkDLofIfCgvLXWeBeBqjvzhXNBAwIeCt9QOCebRGnxDcsww9swVn
	 vTUNUl5n+T930nHovxr9q4BytqplldzuO9uBFC/pmGia3FWRMro8Y7DITQ/TaCKQU+1eR
	 kKx8Cy5wEb9Sr8nxs8w5CgYuKqvUc0bar4kY9rlzu3e6kfTFWZoCBZcV2ywfZmQ2v166v
	 Z45gRLiqQ4bZr+G2oTmWZSyazD5zLPRo5kEmSu0w0S++P9spgTZ2C5koRTzSx3ouleg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789417678;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=roZQ4BM2Mjyzm4hH8Ute+UNUOffMRvrD62Nehx6WvYw=;
	b=bEj+ChG3CQwSwVGY8Sxql+YfTXUTXJr5t4y3VaGPWrtkIV5LPaPlEkywccMx0IyW1Qwz
	 7NcDBNCRezTW3Sj9nMSxOCMFRbEZ1Lnc20Xm1fVILLaztAsQRilnJYudLaYV6aBc3bbrm
	 FSCRgCvH27qB0kD+P/WSmVr1Ecl1sfusAwQHfM3m9yFspEljFKo+/onUZrN5yndNwdN+6
	 TX4W4EWO0XPp31pjVwD7I4bjdoNDTIgppH/JM/oQ6TsciJw7FfbytrQp5HFyS2QGcXihb
	 vL/2fDBpuf2cuS9wdMfr799Wq1rSTGtynpHJVw9EKazn9uaKuo2boO+kSASDm7F8Udg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789417678;
	bh=roZQ4BM2Mjyzm4hH8Ute+UNUOffMRvrD62Nehx6WvYw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sa3Z2jLjBjvT9wfZXS5yeXVJqjna0Z1ob9idS9+d5QJybwuMe32unw2Un0emlKtOo
	 1uw22L0pCqXwfMmgjqqGOQsaMikeSdjSqcPlT+pEwnP+tPQka8183XTgfdjOMgRS62
	 PGJ+4dgvS42Jz4+iKKv/f+MqbRAEcfkCXYEEy/elWOjfmobbLOwF8EX0ubZMCev0ev
	 bHpoSqKsFOR2pOgGl1BK8+MkyCDz7Qbe83NIIxondHlgqa/SEY3xuFdL4IsstPJERx
	 76z+pdty/ysYABnouHPGwprSKAhgNEjhGfNYjUVpU28noI0PKlToZmJUXAq8yKu/W6
	 Mkhf1LEE515sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1913A4035C;
	Mon, 14 Sep 2026 20:27:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7491493
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF0F3807A8
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZFEJFb26Gq7 for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 20:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8DD7E80799
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:39::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789417675;
 b=D1QT9ac0/DNz03WqSftYhHHH+kIQjtSudj15SvAs6Y9UkKjFWZKU2/2TwhXUSMXC1/fR
 xWSxAl5T0gDWnxzFFs/EweafFFxy10vyXX8U9nzYHLRZY+jynRiUvR1KlQCA1f/mR2136
 Tpp/UrZhjbM9pDiRL36P0Mnarw/louUryXkzdnGhQ4ynvcS4Oxz8ydRZCnYzVo2BcT4sT
 /+7pC2J70mtQsSMQ5UhM0zl7lL9tr3wGAraNPpNunSW9ssInSYvICRnsda3A5+5jmNg7w
 qiQENDadq519AbypwZDirR62eOueUFlNreMu20UE2N94rRzLFQwiEKOYdqeqqI4vCcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789417675;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=iF9YO2w609crJ99ANLpR8cgGHjC9mrnM9BWZOAzW79U=;
 b=BTlPKngY6tvsiUbbJe+EbSzd2/J6RGKMTV9Jd9g9YcMuZzcAcrMotWaDooKVkwig4MG5
 Xj2w61lhCN4BOZPEZUBkXyAt9WY5eHWnnMNmsboW19+YFPjZutU+c4WzP7YDJIREX1NC6
 5BBrhYdCMrxc11k8mF/l/SE+sp+k5nBJ6cCmvmdzcZWLf5Ta1hPz4JWp7vtgi6auqVmI1
 MDc4b7NHts9Yxge7PT2bywbSh3GoGD9ua+F0vvyLWl5E7nazGEoHcUCp62dM6kTEvIq5m
 Qd8zuJfewQDvWpr5AzLWM2s8IXMgjd+i8RDqaVQabMh1Hp59EvjsNAMg6R5pzZng8UA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=D97F23ei; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:39::10"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=D97F23ei
Received: from mail-pj2-x10.google.com (mail-pj2-x10.google.com
 [IPv6:2607:f8b0:4864:39::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DD7E80799
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:27:53 +0000 (UTC)
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-396ccb1a990so2148167a91.3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 13:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789417673; cv=none;
 d=google.com; s=arc-20260327;
 b=Wb6VIOo2L+D1OuzEmqTAV08Qkkbr40UwfPV3ob6TI3AxZrurOZdI47dtGYKcgZkNUm
 41UEt4l3pbM6vhXlalztKSh1MQZyuyrTyFZWv1J8ICuXLKdioYBTsmrpaD1bMwnv/PeH
 5tCAYbcPWRyWEhT7l0odNriZ7HrQvzy4b9g7pkX0BFVTTULayz4u/JlCdyso2Xgzj7j/
 R1qzXuV4O3G8w3LQZkdJU53Ud8j+CIUUBeQ/4SmYNLa/Y0bzkaSUrbhig8JNGcJuYdG4
 Ok0/bxEsJyiKN2rwq9ntRtBqgvkBpPc8HXwmF0IYo72Q3+qp+dMW4eVU207Fw4m2UZl1
 sbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iF9YO2w609crJ99ANLpR8cgGHjC9mrnM9BWZOAzW79U=;
 fh=wfIqN3g79reBEwzhF1UVquW7NrVq12rAr2Dpt7PVsNo=;
 b=CMAy5/d+jqiZ7Eb1cWSN7BCGYh1EFou96L9MIhoMrL2RxjNM9K9RzuSbrTNQ9EB8aV
 8c98yEj4NhRmKzPNd31HNZ1HP4wGM6AQc/Ag41u+szE4qr39yFWj5dwldW0IrFd2vc4+
 nEl1+/6WXtmmzLrOY7tjLSlDSQyoH3GXmvFyWaVBJ/wXYqOQMio3uos8d9pPPITjId47
 NEO3Rmpuxvb21EX+Y+v+uInkwD3CML1SldCV+WQ3s6i066tN6GrF8zzso+bhJvATNmh9
 cllOah5zJDHHfUlsZ/4gR2t6tAPfIZTjTW+PDt0uKXWTEuM0IgL2kufAekh/VNCVNBA7
 g3Hw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1789417673; x=1790022473;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iF9YO2w609crJ99ANLpR8cgGHjC9mrnM9BWZOAzW79U=;
 b=D97F23eiX2NGtSTrx6e8UKBJ4VOCtRaMFJxG+HDMMg0wz13c/33O33aCYDfXbZOb1T
 i90gw0bPKqEXgnbEDo6pxO6Ayn5hFS82XahNTeQcPmCrDi6KbPrhAK6DA8V7ZMatjbtH
 MlnDpqlgwanZ4sO48l8fo/XJ488NEcgXj9PAoVKceejG9CRZZBxWNdB/vPQo9P3JKAGF
 RILpHaqqc/Iajx/WPk5S8q5EpX4CpHR8eZ0Z7DOgPa7sFk40mXb5GE8v4o3LvAN6bPi6
 xAMDn4iseKhxYZjsn8g38HwKA6njjIp26qYP+KjffzRe+gwUQGv8e3s8lujJpDfjH63M
 QiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789417673; x=1790022473;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iF9YO2w609crJ99ANLpR8cgGHjC9mrnM9BWZOAzW79U=;
 b=QLQFCOKqiRdDA03dVK6qRTSkc8tXV7u8/bxizmYYA0kF/oR6Gjcnyi1BPt6KoP3Xsr
 OIE09H6beX7a1zicnkjIV6J0REdrZgyBKVJN6HYpkVaXisDEkiS6I9LHNFKpS2irjy26
 3R/GgyWZnXipW4tLj31hgWPsEDITBA3jPgA2lxL8QDhhKzZsRr81lKD/lfqbxDd0/ni4
 SqCAcueRk36niIfQTBFXyhOjeQP+HuyiwJoBltH69bWniocNNQ+jirwOs8OB5meQF3Ti
 jUw7TQuXOEyhpsx0iHj58lun9KZN2GEl9RcA1YYjWFktOhM5EJRuyHKvRcqNuWJnMRJ8
 torQ==
X-Gm-Message-State: AFuF++m7atBZmoUu3Ccm1m1H/yJL23PORAdSqLfhAUBlczb7GpeXNwbT
 oiIxFqOhGdtfINE9Y5aue2hf3vsJT9leOD0QPyYRETNgms2IXgLSLZdrr+g8HxYP+SwxQNRuiJ9
 eNp9c+muPJqWVzJ8sVRLggGfG/Dxuk1datfVxqfGF5Q==
X-Gm-Gg: AYBFou01ln/IrAXy9p8sL98dPCeDGqjZ5wLE4Z+GHij32gpunH87K569S90/Er8qwXH
 13Raq0HV0t3ijO+0+YfnU+oJ6RvmtqW8M2KCCLn/FNteFHJcGV/Buu47PJH5fEG+A9EZmEZdO2H
 xSwnJhHlOZ0TH5Oz8OFIRqK5E62Uv+sJbbZEaanOhDFIPi0Zpp+YZZbtcX1icUlBTk6TWOblK3K
 WHJf1QlR15lTs2m7LphSpDAQ07dn0j2OXw1LhkrFL3gf/S4e8DweiQItr1QHw2nasxrRKOIaAp3
 MsIjBZ2+v9aS4+Ca1ZGt6PzWOxdl+YeouTs+PLhQXX/SXPvKGVoM1vLMVhlFXzojL2I3fnvYizb
 +ONX1jSQ8Xmm4GU5ioMllrARjbzpO2L6NhF7U1Vew
X-Received: by 2002:a17:90a:e7c8:b0:39d:f7dd:4e4f with SMTP id
 98e67ed59e1d1-39df7dd4e6dmr4340507a91.10.1789417672951; Mon, 14 Sep 2026
 13:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <FfB4hHudSTlCrinyaiQWX0uqh2zlb_Fvqiegzc40Se7JoDDmmXXNpHJlJZvW89FZNi2ymPJRnsaHWAv6IJhOnHqfEfRNfPPvso_7mMTOi9Y=@protonmail.com>
 <CAAHg4ZiXTMa0+QeA0EpiZQsZ8DHgqPMmg+X46asS9wtFLt1SZA@mail.gmail.com>
 <eteXMUrQDkYrliOFiQQJe0RjiY0NsuvjHjvhMZbaLDtXfgf1YML1TKd1ZOZyLT6TlecNjLt3wAV5zSoTqBgQ9TlNi98Pm6FV8P1GZnq1pU4=@protonmail.com>
In-Reply-To: <eteXMUrQDkYrliOFiQQJe0RjiY0NsuvjHjvhMZbaLDtXfgf1YML1TKd1ZOZyLT6TlecNjLt3wAV5zSoTqBgQ9TlNi98Pm6FV8P1GZnq1pU4=@protonmail.com>
From: John Ernberg <j@j-ernberg.se>
Date: Mon, 14 Sep 2026 22:27:42 +0200
X-Gm-Features: AcwNN1XG7sjcsDevGTRszAwOfYTv8vL47SbdnMLI6QE5YyDKsHAEHp-5jmOMNww
Message-ID: <CAAHg4ZhZNvdMpfuV6QQgD1FKMuyzu_M+tnpZcq9Rrev2NWJ=fA@mail.gmail.com>
To: Benjamin DeCamp <benjamin8532@protonmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/usbip: use kernel source when
 available
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVuamFtaW4sCgpPbiBUdWUsIFNlcCA4LCAyMDI2IGF0IDc6NTfigK9QTSBCZW5qYW1pbiBE
ZUNhbXAKPGJlbmphbWluODUzMkBwcm90b25tYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKb2huLAo+
Cj4gWWVzLCBJIGRvbid0IHRoaW5rIHRoYXQgZXhpc3RpbmcgY29tbWVudCBpcyBhbHdheXMgdHJ1
ZS4gVGhlIHBpbm5lZCBrZXJuZWwgdmVyc2lvbiBhcHByb2FjaCB1c2VkIGJlZm9yZSB0aGlzIHBh
dGNoIGNhdXNlcyB0aGUgVVNCSVAgdXNlcnNwYWNlIHRvb2xzIHRvIGJlIG91dCBvZiBzeW5jIHdp
dGggdGhlIGtlcm5lbCBkcml2ZXIuIEkgdGhpbmsgdGhhdCdzIGJhZCBwcmFjdGljZSBpbiBnZW5l
cmFsLCBhbmQgaW4gbXkgY2FzZSBpdCBjYXVzZWQgYSByZWFsIHByb2JsZW06Cj4KPiBXaGVuIHRl
c3RpbmcgYSA3LjIga2VybmVsIGJ1aWxkLCAiU3VwZXJTcGVlZCBQbHVzIiBVU0IgZGV2aWNlIHN1
cHBvcnQgaGFkIGJlZW4gYWRkZWQgdG8gVVNCSVAgaW4ga2VybmVsIDcuMS40LCBidXQgaXQgZGlk
bid0IHdvcmsgZXZlbiBpbiA3LjIgYmVjYXVzZSBCdWlsZHJvb3Qgd2FzIGJ1aWxkaW5nIHRoZSBV
U0JJUCB1c2Vyc3BhY2UgdG9vbHMgZnJvbSB0aGUgcGlubmVkIDYueCBrZXJuZWwgc291cmNlLgo+
Cj4gVXNpbmcgQnVpbGRyb290J3MgbG9jYWwga2VybmVsIHNvdXJjZSBkaXJlY3RvcnkgZm9yIHRo
ZSB1c2Vyc3BhY2UgdG9vbHMga2VlcHMgdGhlIGRyaXZlciBhbmQgdXNlcnNwYWNlIHRvb2xzIGlu
IHN5bmMsIHdoaWxlIHRoZSBwaW5uZWQgdmVyc2lvbiByZW1haW5zIGFzIGEgZmFsbGJhY2sgaWYg
bm8ga2VybmVsIGlzIGJlaW5nIGJ1aWx0Lgo+Cj4gVGhpcyBhbHNvIHJlZHVjZXMgdGhlIG9uZ29p
bmcgbWFpbnRlbmFuY2Ugb2YgbmVlZGluZyB0byB1cGRhdGUgdGhlIHBhY2thZ2VzIHBpbm5lZCBr
ZXJuZWwgc291cmNlIHdoZW5ldmVyIGEgbmV3IGZlYXR1cmUgaXMgYWRkZWQgdG8gVVNCSVAuCj4K
PiBUaGFuayB5b3UuIC1CZW5qYW1pbiBEZUNhbXAKPgoKdXNiaXAgdXNlcnNwYWNlIHRvb2xzIGRv
bid0IGNoYW5nZSB0aGF0IGZyZXF1ZW50bHksIHNvIHVwZGF0aW5nIHRoZQpwaW5uZWQgdmVyc2lv
biBtaWdodCBiZSBvdmVyYWxsIGVhc2llciB0byBtYWludGFpbiBhcyB5b3UgZG9uJ3QgbmVlZAp0
byB0ZXN0IHR3byBkaWZmZXJlbnQgYnVpbGQgY29uZmlndXJhdGlvbnMgd2l0aCB0ZXN0LXBrZy4K
CkFzc3VtaW5nIHRoZSBuZXdlciB0b29scyB3b3JrIG9uIG9sZCBrZXJuZWxzLiBJJ20gc3VjY2Vz
c2Z1bGx5IHJ1bm5pbmcKdGhlIDYuMTIgdG9vbHMgYWdhaW5zdCBhIDYuMSBrZXJuZWwgZm9yIG9u
ZSBvZiBteSBwcm9qZWN0cyBhdCBsZWFzdC4KClVwIHRvIG1haW50YWluZXJzIHRob3VnaC4KCkJl
c3QgcmVnYXJkcyAvLyBKb2huIEVybmJlcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
