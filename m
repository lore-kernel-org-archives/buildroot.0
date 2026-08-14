Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2443BC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBEFB4078D;
	Fri, 14 Aug 2026 14:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Em2rnQknBWGb; Fri, 14 Aug 2026 14:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2435840817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716437;
	bh=jbaxA+/N7SvBWgJkBWq6oIu9OHoJqnc8nsRwkK/YH3Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ngvupsd2izqndADRRX63gXnysgJ7FQBweNWtBQk97i36WsbGt08NiMP5mjeJyB8tr
	 Rvx9VVjxen4j9ZAdCi+Uvwz2B2uuzO3WLK8lVKASmjQ9t5jdoYIUorVpZjvfm9q/YZ
	 TTdUs171n2Dr7hufuO/grvmR6qEfnZZRjzDoXmMG8g1qi6+tptCER3cIpOGRNYLWNZ
	 VwlR83xaYSiFen28BHAdSFDmkRftPtv9edGgJFyjYUbQWO8ORxWF+q5n1l15uprcN0
	 VzViu+odhdQ6JH9Fjc5POiBhm2ni7eft5ZudZegRr0qs8JHXsZ3UMjYMaWOWGjRSRX
	 t4yjjB4wNtIRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2435840817;
	Fri, 14 Aug 2026 14:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4999A1B8
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B6A48146C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlMU3Jwg70y7 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80DA880EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80DA880EB6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80DA880EB6
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:07:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so9653545e9.2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716432; x=1787321232;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/6e13yIfVEJgp/T0tsqhRT0G6SnQeVyag6/vx8Uu4rQ=;
 b=A6li6jPiSvqBuDGMT3Wzbu8oXrx9gUp2Ta+e6esv/wd3u8Sxo+/ik0J9PlDygudoHR
 qiEodUyHgwNWbwzZJupbXZpMSjkveYOYbE3E/tnzh45qetuia6mp8qK4GDPV5EKVt0ky
 DAznebVUn8p1igg6Jxd0iC0H8u1oNPiWkytcX6IBp5OFFJy7xbjausNPmBafCiA6W9z6
 UskzrFn7uroH+OAaProndvxxRT/n3rBM+rdsardYgLTUjhmwBgi3faQDS/Tbh+eea8ML
 Y/tN1blSFW8XdtJtooKWti/4adRF+gHmKsiM/swk8QqoZgtLq2rrf0CN3WFuRtzkEJvJ
 hjdw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rofvq5MT4cQg/pzuYErWupd9AJ8N9w6yEKD7sn+82GcTVNOvNXLrmiI7Z5Cxe7Ujt0hoSKmt1yogVA=@buildroot.org
X-Gm-Message-State: AOJu0YwzlIJKpZDCx4Bar293f4XPiHweZMRdx9JMPVEOxkHJBWHLDEbg
 GBDiWkn2A1hWzKF0aMQLr8grRTIwCCniVioZCt+Bay2Y4BtnJDh3a5z9kp3LBV3W/GJXz4Aghn3
 Gb3rS
X-Gm-Gg: AR+sD120l6cdVjQt74tObM0bvsuIbZFW+tJ+S8HAzUo222VAN2wGqNQB16x1Sibwvs5
 uOv4DkBTu1LMC/1hbtXIaDCRkP45NKRCcYQUebgZLZHCo2flo0QNm//kjXEYG8QN7Xef7R6tzKs
 q8oaqy3qn2jI3Ub38oPYHGrE6+cnkQ8pY0tgyCgoEV7vsQGFg1rB/j0gQHtr8oOLtUSq3O5suzw
 +FtI4v77QymLV0GC8CBNX613DvCUaujFAvhZWuu8kZNreiOBZ5NoC+IeBvFZhLT7dv/9+4LGaJi
 D+qdg6xpWcfV77UGwHtGICBM7XxUDOJoIVtlP8goF/wZ9RDdTx2gy1m7BgFRBZ2ALioDNkYVOe5
 R6uSHssSD7Dl7mY9WbVoUvrkufoTgz09KB5WYf8LEtiPzkBpvZd94zgXDVfK24cMGLmDxNm7t6x
 PlDV4bmbXoxu0ssWkpiwVJuWcaT5NahhIRbe5O890lE8WsApAE99B/7wXBN9RXb69n/kugQ9GEB
 G83fgUjrmpS06Tcm1H0AWA6adabOzeyTRhG5JmPkgf9syEVieKPbaquCLk=
X-Received: by 2002:a05:600c:3e15:b0:498:ee7:e407 with SMTP id
 5b1f17b1804b1-49987999622mr89166205e9.17.1786716432552; 
 Fri, 14 Aug 2026 07:07:12 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988adfb67sm59341795e9.3.2026.08.14.07.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:07:12 -0700 (PDT)
Message-ID: <e718315f-7603-4ed1-9e57-8dd29769a1bd@mind.be>
Date: Fri, 14 Aug 2026 16:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>
References: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
 <20260607085844.1334630-1-jeanmichel.hautbois@yoseli.org>
Content-Language: en-US
In-Reply-To: <20260607085844.1334630-1-jeanmichel.hautbois@yoseli.org>
Subject: Re: [Buildroot] [PATCH v2] package/libglib2: disable sysprof for
 the host build
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

On 7/06/26 10:58, Jean-Michel Hautbois wrote:
> Whether the host libglib2 picks up sysprof support depends on whether
> libsysprof-capture happens to be installed on the build machine, which
> makes the host build depend on the host environment. Disable sysprof
> explicitly for the host build so the result is deterministic.
>
> Keep sysprof enabled for the target build: it is useful to profile and
> measure the performance of applications running on the target.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
