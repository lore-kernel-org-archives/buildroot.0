Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9038C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84F598109F;
	Sat, 22 Aug 2026 12:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_h11zK7BRhU; Sat, 22 Aug 2026 12:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402586;
	bh=MWEatmXkZl+UwECctRdwax6OoCH/8gQEIFP5LxIR10U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qDJ0v5q/+uVovMMukOcz1kTDljE05ffOdqzkUwhFKjgJFITfSOfGWHstzti6iZClb
	 pvf8Nb3Zl+vPz6D1bV01dwQgXUQDsuwtNr0jIrSYArAq3cEwazV9ynBC5Aldo04JJN
	 UztB36J+3bxy3OKfnnEdZBXxlM/7RLzwtx2Maxjz1keOtDrj39KAbgjuIviW1/d0Tf
	 1sDJEJhZlIt/NdlZUzrHjDjGJxlT046M5ZzGYbhQxChVweirgd0EQ5CI29ttQW9J5g
	 SG478iAQiGkQ6roOrW04oNM22uI+EV6M9l42hw4xisys2XQg8D9xH15yd/SYIVwkkd
	 x1sIb1w+xOz9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B576380F01;
	Sat, 22 Aug 2026 12:43:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D9F5118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8393D80F01
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUaUFKtEP5O9 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:43:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83F6780EFC
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:43:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c197e7e4e94so350199466b.2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402581; x=1788007381;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I96nYjm7c+dhSUhJH4HHeZ38givRvnvgMWnYhWTMSxU=;
 b=Vm8cGeAxMy5mhMtiWpvaMdKeUT2YvWoOvM8ArDcysn7P+/1rEDyjbj3TVJTfQzYCDb
 7SAvFgXp9voD/uZbTJaIQJFgpkpnvsNS9nlAJvDVWLROOOzEf6XQ8NGctLNxbOeybsx9
 OyiMeS+qdkWHcbS83Avyksj63UJd0FVPopDJhWN+IiU2uB994XApLOMahSkZMuto9UdO
 jcwpDRL45eq3EBev5Q4mRpUSDgGNsd6W3dhaYCAoGgiXt/qcrpOW8c8EIjy0+1dLDvdi
 M+N+tBNGWQcoNJuniOij7JU0XMCrZUlDUZk72LTGVW7vxGZpwgudEu/Nib/i+s6gGMS+
 e1dQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLBnLxpEr/6Z9D/Xqy3GyP7oFZnJ3JZmUPg7/QEretwjhXi3/WT6f7a0ExRtDXtw7RU/cRIEaiyEk=@buildroot.org
X-Gm-Message-State: AFuF++m0DI40vyritMpG5JX3wxMrpR8iM85gWbRSinKH55SOFN00bpjN
 TxfMKe6uPPjmQjdjpYPv+fjBPlgSCGu7nHatyh1APg912Naoldv5HpUeTKoxyDg+lc4=
X-Gm-Gg: AR+sD1108R1NfdtB8pU8/AlJiVK3e2t8nBIMrK3aXBMwPmRYf1Ezb6kfbmE9W779Szz
 rwISHifpauVN543QrB+QVdtNwqsnPJRAax4fn043OdPTwQZBxNoDO7J2kQST4x9On7IbUY4jB7P
 wd9dy3a6Lb2oJKh1vdUZlA+b95Up72g113hWzuHaqWNgFgqkw2fJSYMqwJ95nfguGcnqQf7xW7r
 YcCrtLO8De4SZyFioViCC1H2U6+v6LFDZ/4QjkQpMZ4y7+CyQYFvsrD4GlO9WR73kr35Off/L6u
 /v8k6f3bn+RCbFtHkUkgjeyJ/CSXvaczY9zlPyeTV8QeQVxiBPGGb+oeoRN48IKokegBQpr1YXy
 EXS38wReQtvd08PpSQ/E0V6rEJlUR1yz3HteN21/f/cGlHoQVFhugcMfKG5pVD66xatb7pS8LWE
 M4RHcvLaFphGPPGlsloZJe/oxgZo5KUhTwnFB9oMbi4Hz/ghx8/nZeeeTdOJoMwQyJ3ng1TiJdC
 Rp+VVHJQ7qUGFwFKomTV6gcX5gZ7Mf9fQj7Wuc22Y74r2GJJnUHgw==
X-Received: by 2002:a17:907:d28:b0:c21:72b:dec0 with SMTP id
 a640c23a62f3a-c249238cd9cmr593993366b.5.1787402581258; 
 Sat, 22 Aug 2026 05:43:01 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24968a2183sm302779666b.58.2026.08.22.05.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:43:01 -0700 (PDT)
Message-ID: <df0ba9d9-bc5a-4c95-be29-7fce257ff46e@mind.be>
Date: Sat, 22 Aug 2026 14:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conghao Hu <ocd2057try@gmail.com>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>
References: <20260809060542.31279-1-ocd2057try@gmail.com>
Content-Language: en-US
In-Reply-To: <20260809060542.31279-1-ocd2057try@gmail.com>
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/qt6: bump version to 6.8.4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 9/08/26 08:05, Conghao Hu wrote:
> For details see:
>   - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md
>   - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.3/release-note.md
>   - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.4/release-note.md
>
> Qt 6.8.4 LTS source archives use the everywhere-opensource-src prefix. The qtmqtt and qtopcua repositories use the v6.8.4-lts-lgpl tag.
>
> Signed-off-by: Conghao Hu <ocd2057try@gmail.com>

Applied to 2025.02.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
