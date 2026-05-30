Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECEFCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A44608528F;
	Sat, 30 May 2026 10:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Py54DW9LSHNI; Sat, 30 May 2026 10:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFAF784289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135866;
	bh=CBSkc9XTWInikZiMlxJBeZ1WEgYWQeVNHnS9koLguSQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k/opkWrQBsgavhUkykt7KU0l9tEKfxapzVgzXxslioNcV+JNyQ5s5X1xASJfLorM4
	 yOA7Jo9dGHb7/J55QTF8RKGfYYTuPTNhW54r0fSlYOHCvD6m93ttUwtGQ++A+lNcLK
	 SxPBZ2CM/UxOa/39fIUIiqZkNjBUrHFp4qOA3QnJ3NDdNFEsI1/TaFXbw6sKAdqVDg
	 MfkQhutOfwrd49rXMb4HEg2EsJOiRC5t5AgNVkE2pvFBUxF1R4UxScqnlk1TEZS3CQ
	 g/1jdCIQUYtBVdZkGa+y2DPD2yt3fIVu0ITzJ2JQjK3AAG8D0DFejCm4Lz8VuEKuPP
	 w4OZ8/c3sCQkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFAF784289;
	Sat, 30 May 2026 10:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3026E12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 113904081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbHMbdWBuLnA for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC795407D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC795407D2
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC795407D2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:11:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-68be16c61d1so2999915a12.2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780135861; x=1780740661;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E73ggPTFtVaGJastI1wlf09Rw3Ckzx0kBt9AcYcNIMA=;
 b=Bjk+YEbgq5gmCDX8uWiIvOS09nPuafDh6BYwYp94QgnkOjha9BHytk5I+FTiuFAjiz
 QCjv1YCc8DUgx8nYpCm2zXc9vtXc1EBX+jMmglRvQgW3GSAS1BVqv9PYLs2qhyRDTQEB
 7w3SwLbGQQdWKqvBxF81u+QyJ3EJe8TCvFaTDzH70M0UqFtPdVV6mlIk7ZIq9cfhidqs
 9ZazJw0nQ2CmjwPQXBmehjifzEIOsszKvRENgdWWrvjHHW0M/7q5ucO232StrJqTXMXh
 puQpfj49JW3gmhmp+ZPahI51vcbAdOfXChfuamgQM4vghtYSXxsSLe5lsE6U1c//qQzS
 vvjA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8iLDPFipyams0HwLiRW4x9WMihbqAf7BvnSGcym+y0p+Fae5DtVQ0csjDoxZ7DoL2UzpBkLjJOwqY=@buildroot.org
X-Gm-Message-State: AOJu0YyMfox+JTaOEcQ31Pe3ehVy57yqr5GS5iGmHzpAGBOMr+u1QKIY
 upcDWbEvOiyHAMHxLVIzVuc+UzgJPjSxdBF8AxG+/wxbxereL+MOo3/LThrlx1wl0II=
X-Gm-Gg: Acq92OGZ7CdM3mopgDsTCO/KQTtY7tzD6YEsaLG629K4DMQa4VCSUzP/ueh+1H9cSpi
 XbjfIkL91OtolQ0osTjal72CkfTdPcSHkHyxd0wJevXTEsNfWvhFCsQObDy7LehVbVX4FfvOE0+
 i/zHK0cvXfLbnCarKNfyHYhFSgcC8tNBYeH70JV0D+2GBvwpDwr1N+c6F5So/Q2dqZDPYQtG0bH
 vEUX72J2wUiSj46gRCh+p0LWvfSS0NwSWriT0PzmvpAJsLh9kCoZGBXig6ElZL7yyQFAQtz55w+
 b7xeU/qrsXSjE0x2BzWs9CEBDe2MSiZlnTICzvMMjpVq8COOhsToOjV7ZaR9Tkyfyhoyo9N4Kds
 bJsrj8WXJkdNsC8KPKHceUkIaZbQ1IgTYGN806lednsvpX0tOKI/3HA5UV/1eMe8bswe0vzEZkK
 YeLZoN6fHq8jcjJrIHPffVDQanHLohFJ1iHMUuGpn0lfo/rRduQL4c9LwYjREp2hKWCGPpUXGbp
 dOgW5t+fKVYG2Ge9zg=
X-Received: by 2002:a17:907:6c0f:b0:be2:27e2:d7a2 with SMTP id
 a640c23a62f3a-beab4f1fc5emr173890866b.25.1780135861231; 
 Sat, 30 May 2026 03:11:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef?
 ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85773e4d91sm4392643a12.31.2026.05.30.03.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 May 2026 03:11:00 -0700 (PDT)
Message-ID: <5d0650e9-05de-44e6-825e-8d9c9b94b719@mind.be>
Date: Sat, 30 May 2026 12:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
References: <20260529094514.178266-1-thomas.perale@mind.be>
 <20260529094514.178266-3-thomas.perale@mind.be>
 <87bjdx8edy.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87bjdx8edy.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780135861; x=1780740661; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E73ggPTFtVaGJastI1wlf09Rw3Ckzx0kBt9AcYcNIMA=;
 b=eKcKPvsPsfn+6PdYHX3hJPYRy2pqDyC9TsheE29fBiDh7z7kvC9uC9UrvellrV5VZk
 mRtO6XGoC7XIwMfwY9/RvZsG3KYS/M773dQSFRaeQR43vM0MmuUGkVGrqKOcYXzMX0vT
 7r3KF3TOEiUIKNb+h8tyECY6DyOXavUEK6McwXpcF9DjF4uVLAp38EUsvli3/zViIWC8
 yCUl0jIAOdrshUgcYcsbDQs0c8F5SnRe8Iv8IZ74WyLtE+hMoq5Ext2okxn0f9Iwbv8j
 Eopksw9bsW+iWw1S+tVPQx5AWa9gfgxgOmuh4ulLcj8fVodQqqFLePBEXgA+lpo+Fp09
 UI3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eKcKPvsP
Subject: Re: [Buildroot] [PATCH] package/redis: update CPE vendor
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

Hi Thomas, Peter and all,

On 30/05/26 10:56, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:
>   > The CPE "cpe:2.3:a:redis:redis:*:*:*:*:*:*:*:*" is valid for this
>   > package.
Although, the CPE vendor "redislabs" has also been used in other CVEs; 
for example this one https://nvd.nist.gov/vuln/detail/cve-2021-32625. 
Not sure how to properly handle these...


Titouan
>
>   > See the GHSA [1] and the associated CVE [2].
>
>   > [1] https://github.com/redis/redis/security/advisories/GHSA-c8h9-259x-jff4
>   > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-25243
>
>   > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>
> Committed, thanks.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
