Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5380FC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D785960C27;
	Fri,  4 Sep 2026 12:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97vAMeiDvdZy; Fri,  4 Sep 2026 12:19:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 35DFF60DD3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524352;
	b=IZFI1VfFOeYXE8Wg8ELqrU4MCp+OF+gAxjs40vBEZ7jY5Vd92gxCTZ1HGcqB9vtfkbpz
	 KdPzep68f0BASKcFYb8nwe9bSgNslHwPQxZmUJ7kEZiZs/5kYp5YyR4pEBK8tSZ4AKzZ8
	 uZeaEOHRMem+LOedNFZTCco22Ozy/jiTsTfUeX955n2wGRkyeDeXwp4dsbsQqnbPDGd7y
	 4RjYwTRxFfDA9hxqXfUps4SPritnRvhFGPBJdIiww3LHDPjbakjIK4+t+0yFhSnLqUr5h
	 G/d8G5sWUrAeiVtPnz5yzifQV4zJyI3U0NvYPnd0v4ro3XXiSJkoYgkwcld+ZJ1yHCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524352;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=37SpmVyTMp4jlOx5WjMYJguX9cW2qEMRQ+zU9tXpKZs=;
	b=idrP7QuITBbFPLi7GWGbbGqSO6AoVAvEzN5HaK+CYd52SCsE1sbVqnmM4NUhxOV8vxlb
	 24SD+Ifayy3QtVctaRqleCyOW4RXj+qWjUSUSmkF8nPSw+kDtj9LCoNHkPoQo7gTsjVyS
	 q+GCO/LTXwdC7wXkV4xMHrb2nhuG0+fGe0f0OcNmj5YDHRrOSlMfBkjCJJgwaNcsQotYf
	 xOIAPKPOMXdcjZNsUPXggBvaHcU3XC3rnIurWLWkf+AdEYyJCcSIKwzx0bPtCxNIEmN04
	 KYqBJMZYs24q1GnAqOehF+DNEQsRHtTmB/iR8fvqGCfnTDP1Mh6CTfF7nhELL9YALxQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524352;
	bh=37SpmVyTMp4jlOx5WjMYJguX9cW2qEMRQ+zU9tXpKZs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qc4RPB+7kshc6AauqdygLzJ2YBZ6cbDfNbL3c/AYfZTQXIPGIBSS8IQhRSxFJDppw
	 uxj8bSEjOwSWMl2cQwqQTlfZVxfxjEx2zwvZR1X0LnX0BCZeHQjYAk7m4lcFJ4F//Q
	 +IKma4kQrNnMo8UHJhAwBYKEv2ll8YJXRX+R2v+6OKmqZb9K22kIpiP2VmPBQzttAV
	 Zud1LpLnDMIr9sug5G6vXdA3cmGS3IrCOXgutAyQiuj8eMK62A8+yG11gtSaghsqP/
	 RCSwb0sHaBFBcMyC/pox/36Ml33Zc/78AchvA4AR+o4sE4WBFQNIW43z+Eb5brsBkK
	 lCYM1SQo+tYrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35DFF60DD3;
	Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B50EF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29D7B60C30
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bbepjxJDtQX for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A70F760D88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524342;
 b=G3PCZY+z58dzDVzXujerzE5CNg6miIlrQkMlvdvfeT61X2khqWWs1Sco1ynlsEdTM20A
 GnOeSAoyf9f09bO+UiMdYtiS92uFJWdmUf3GCWCl56jdxpN3vw6aNEUsGc193eYPuKRg/
 UZTXlGQg3+oAl4lRaqi7BKa9Gnue7GQQpM9NS/zCeWzQeNRb8r2TDRsKN0cdMCpQ0ESpP
 9ltuKpB3k9IAEfwZoVOjiEhWnxSd0o1kcTiF0/0WJWsJS2yqdNbC+9MBipppiUt85BFT5
 jtzgDismfEokqvD917BUb24m+nrJ/fJeNnbWUZXPK60kOb4aDV2zo/OclaQmkCZZh6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524342;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=xjVJeCPc/ezWhD/sGJ7Soiip2Q6eGKT+6dOel+OIWtc=;
 b=YWBlr/vjNLAHWVavKipCaUbK6j3zZ4S00XQhzElU0oWpGtX4ZNYhGhUnKESQa5i8eDcF
 5lToi/ttNqFam7WElbvius3qsVW8LwIIiyaPQKx37zMB8dKrOwmW4I4zbjcO19FA/XPEF
 LqmIxiPF8+JZGyJTewmR5LxeyV7Ra1J/DCiAfzjfQRCUjEPP36BihMWcmHbWWm/mz7Ptu
 QKn7X0Wqy93NLlWwSliEOvzfA54yzKViJSklY3pQJkkRwox99RLWvA8f2bpA0ynJhqU2G
 onMFQZoX+oml3idLq+3Gu2KlpetOr2s7+D9uo9dcJjFW+wBlSA8OoUfT47BRLWUtFEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ATXGEkBo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A70F760D88
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49557167508so10788205e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524339; x=1789129139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xjVJeCPc/ezWhD/sGJ7Soiip2Q6eGKT+6dOel+OIWtc=;
 b=aBi6eE2GhRnm4kaFyKRxs8D4Qaoe4Xd5ZowRcaGyLUcFvZraCHJRad+eVvCzStZB38
 TRqwVA8qw4nUeU4vugHFb6SP1stceqU/U3UOGw6FW1i9pzA9m4/aVbUbZc2kgid9iHKn
 7mU4GEsHg5NB+0GizFrapd9cHKzgtoCLpX/V4BHiti//peRYnHbdgR7eof448nGNhWKl
 mCEmG/aiOo9tP282u+BGZtgUwJhqpgjSiof33deptjapR+TaiqKQ3BO9SYqOjQ5Do4M7
 ktj3OkxYRrI6Jmw8n20gtmqtDijAXXXdDVO6c2qmOteqwSM/p0bA3ZMry1crlb0fnQI8
 07xQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByJSYYHgWhlaXcxK4BYB0XehzqlIxb46N8Gjc3BnU46SGvihmZ0H8aek7tJPnixRZFbCeQ/FnQld2s=@buildroot.org
X-Gm-Message-State: AFuF++mgS4ME+/wzVRbmRhn31001f2elg1fTDnjPJBJgQmIbXfM4mehU
 wpgiLLWc5a2nBXtMv13JuBgrYkjjPGIUn3Sdg8BjEoBjCk26v5MdOuackVsAXWs0LnQ=
X-Gm-Gg: AYBFou28TjOZz4IC49yqA1tHczRqrq0wNo/JS8tWzX7EJpTzglTn0Tu5Mq7JRE2BWtU
 PYGT6Lo/GQ3nS3pd3qPqJrJWUSUX+SoG5OVCvqutyhUObYy+F8DD2lAffUJA1EYnr8Vj48dOE7u
 /ylGZIjQ8yW1y6HcCzijwhLgiPf4k3sDgdg2HPGjSmmEzFu1KtdK80zJvIZgOu8OrtCjCmD1suG
 yXim0bwJ5H7KUyzpicC17ckgEA0CLKG3DLHxxZGcA6J9UIBBqkWgCBn+9631pA58nE9x459e8do
 7rOJpr5on3i9Qo9uQo8+OQ0I+dfAD+YmwPwbFwgIFzlrYbV1FYLnFhJxwvaZER1+ovltU6hv9lE
 F9ZosEZ6v66PqElh/BgmHRnZ0g7EEToyk1nHFk4Ngyg3kA644/4Shrz/TQ1GA4u0M2rf8FHBRr+
 Yvqim5NykF0T2JrtFrVeYL0cyNEk87eFd9TKpJW9JIL9lyD6ROQ7bPwA==
X-Received: by 2002:a05:600c:6306:b0:49c:f5c0:aa76 with SMTP id
 5b1f17b1804b1-49cf81e366amr117250865e9.5.1788524339368; 
 Fri, 04 Sep 2026 05:18:59 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6023d6sm149920605e9.8.2026.09.04.05.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:59 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:57 +0200
Message-ID: <20260904121857.406319-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
References: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/qt6/qt6declarative: move
 comment where it belongs
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
> The commit "Enable host test module to ensure that qmltestrunner is
> built" in qt6declarative's Config.in feels lonely under
> BR2_PACKAGE_QT6DECLARATIVE. It's because it's actually related to a
> select done in the sub-option BR2_PACKAGE_QT6DECLARATIVE_QUICK, so
> move it there.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/qt6/qt6declarative/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
> index 0a977ed808..a57b203071 100644
> --- a/package/qt6/qt6declarative/Config.in
> +++ b/package/qt6/qt6declarative/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_QT6DECLARATIVE
>  	bool "qt6declarative"
> -	# Enable host test module to ensure that qmltestrunner is built
>  	help
>  	  Qt is a cross-platform application and UI framework for
>  	  developers using C++.
> @@ -13,6 +12,7 @@ if BR2_PACKAGE_QT6DECLARATIVE
>  
>  config BR2_PACKAGE_QT6DECLARATIVE_QUICK
>  	bool "quick module"
> +	# Enable host test module to ensure that qmltestrunner is built
>  	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
>  	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
>  	select BR2_PACKAGE_QT6BASE_GUI
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
