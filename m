Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8F1D3C537
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 12:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6870615A0;
	Wed, 10 Dec 2025 12:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vui57Uu-7-cr; Wed, 10 Dec 2025 12:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE00861533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765370076;
	bh=LC/5LwSTzhAOKk0fwJ2AO/kV5JXXIZzHVLJnl41wrYQ=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q8CzGPcOe89FrhncbMKuJaszxwfqvfJAGeWUGVaDnltiqRTtrzlzSF4UNCFl0+lkZ
	 8ej7P6Uta8p2Vo/Hq63q+dNxGckKCjeyO+R26t7n4/DnCnq9/Xi9g13zzHASx8wIFH
	 2Y3caZYZu/8i2Ayi+ZYx9jJGcEqup3csv+Weu2HrbknZw9t0Jj7erltuyfeQDOF37u
	 lsHja+GKMS/M0L8qk5ioXS3FPb41MeDMxYjfaGCCf6iDasCT0m/ZIVzfMeAviSvPKx
	 c+fXVFOfECXaphB1tYMHiVVkYQDWp19dMkr0ozrc38fFmWyV5C9+tV5yAb26Xm+VhH
	 19RUjFBMvKnNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE00861533;
	Wed, 10 Dec 2025 12:34:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AA232C0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 12:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CBE40DFE
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 12:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOTaX50cwC8M for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 12:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA6AE40DFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA6AE40DFA
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA6AE40DFA
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 12:34:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso4639095e9.0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 04:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765370071; x=1765974871;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N4ABZA++ss4q7degiArut1aNZs7BG7FKAttyg52x2RA=;
 b=NeriT4kbOeQyk2tuLBLO7T46jTmrQ+LCcNzA5wPKrBACvOE0FYgdghOvKMk3Ca/9EL
 ND5Qq3CFAN1Byb0diZAobdgKpPIUwZhzCuDIOcNIjw7wSbzRDv/nf/dH/ANEx6WFxhiI
 WNAVeSmWXzE8BjTqHjRBeT4JHFRUvPD1ww4jZf1ZpN+a0JpSmr3uA8TxN/Q4EaUyQN+L
 YXFveWP+DkgT8OOthPTuvmgexBjenxQM1jJztMnpcjpFIcSsd5JxV4BKRmQYgMOoAN8D
 je73cWkuSwBcoQV3ypDRCkxu7QsGS0vNPevItZEjdZqZYkGN7pTg7ya3OA4oBZP4o9db
 uJZw==
X-Gm-Message-State: AOJu0YwUizE8GZkTZ/LYjqkXgE4VUH1e3050uEIpiXwm2BW/Sxp4XVc6
 wovpJgocSKvv1p27zteFoAjsj5ne195Cd5jZvx9xltgbzvtMqFHpmoP1iT/I7yWG+qudfJxqo+e
 pc3SDewHQSg==
X-Gm-Gg: ASbGnctS7dBbv9i5LMYbQzLvVGrjCX3g75sjJuoYJP89Khr4n4eJiNV+ivjCZGpcWYc
 HVcKL3TE+rPzegMphoSecA8/Hk7BQvuMgqIQj5EXHhaZpSvFooYb9QQ66s9gAlgXhWxXj2XJGtC
 FEDWGBJzemML4w3hLGZMO8J0Rzr3dk1aWBpGGWZzGGteGVZtS+WHXG1zBXJBkOwJKpo7UUz/YLG
 /HHBQylpch57po7YTv75LXif8mQ9XEWWFPrCpmWw0/adzsVlwBQJ/JO3l4wzMU13sz/leXunyRG
 sfhsE/+bqsy01fu+cvG1QEjheRt6QTvaVkhgk6J9plcZwV0kPAV+gVG3M4tDqV1PT8z8bysg/IZ
 sPBrqz/QlIufF4uquBKc1NFYKyPbBa+JCaFSoDQHq7D7PZt37UZIUtXj1E6G7OQ7m5Tr8e4XJHq
 QoUlHonLeMi7XC+29EX4RPkuQjXw6/ssHfhmnREs7yhFHFqYcBaQ==
X-Google-Smtp-Source: AGHT+IFh8KNnTXbh/AAIabS3Az8av+4JLB52xJ8JZKUGmKj8RuQRPzocZCLPM2Si4zEEAnSAJHTZXw==
X-Received: by 2002:a05:600c:4c15:b0:47a:8383:f2b2 with SMTP id
 5b1f17b1804b1-47a8383f3d4mr13719745e9.17.1765370071300; 
 Wed, 10 Dec 2025 04:34:31 -0800 (PST)
Received: from [192.168.0.120] (82-64-216-142.subs.proxad.net. [82.64.216.142])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d218b4sm44543475e9.6.2025.12.10.04.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 04:34:30 -0800 (PST)
Message-ID: <84af515e-4b85-4210-b095-cf7929acc75c@smile.fr>
Date: Wed, 10 Dec 2025 13:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>
References: <6938f69f.050a0220.24fcd3.6d11@mx.google.com>
Content-Language: en-US
Cc: buildroot@buildroot.org
In-Reply-To: <6938f69f.050a0220.24fcd3.6d11@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1765370071; x=1765974871; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N4ABZA++ss4q7degiArut1aNZs7BG7FKAttyg52x2RA=;
 b=a1axlTqjr1924Vqculqs9PqUKBA6F8azdL6FBuwRo53s42noZ6/G0R2cmDZ9Th1bnq
 8lMXckSaxmBbpKNX4IEw6866r2Kyuc49yTyiDewmFAyoNnsys6K/uZJYHl9SKvZnt2M6
 8b9f9KjxJd96f5MO/cyk6k/nDiXsiFg5qUU7c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=a1axlTqj
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2025-12-09
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKT24gMTIvMTAvMjUgMDU6MjcsIEJ1aWxkcm9vdCBOb3RpZmljYXRpb25zIHdyb3Rl
Ogo+IEhlbGxvLAo+Cj4gR2l0bGFiIENJIGZhaWx1cmVzCj4gPT09PT09PT09PT09PT09PT09Cj4K
PiBCZWxvdyBpcyBhIGxpc3Qgb2YgR2l0bGFiIENJIGpvYiBmYWlsdXJlcyBpbiByZWxhdGlvbiB0
byBkZWZjb25maWdzIG9yCj4gcnVudGltZSB0ZXN0cyB5b3UgYXJlIGluIGNoYXJnZSBvZi4gUGxl
YXNlIGhlbHAgdXMgaW1wcm92aW5nIHRoZSBxdWFsaXR5Cj4gb2YgQnVpbGRyb290IGJ5IGludmVz
dGlnYXRpbmcgdGhvc2UgYnVpbGQgZmFpbHVyZXMgYW5kIHNlbmRpbmcgcGF0Y2hlcwo+IHRvIGZp
eCB0aGVtLgo+Cj4gUmVzdWx0cyBmb3IgJ21hc3RlcicKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+
Cj4gQnVpbGQgZmFpbHVyZXMgcmVsYXRlZCB0byB5b3VyIHJ1bnRpbWUgdGVzdHM6Cj4KPiAgICAg
ICAgICAgICAgIHJ1bnRpbWUtdGVzdCB8ICAgICAgICAgICAgICAgICAgICAgICAgbGluayB0byB0
aGUgam9iCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgICAgICAgICBUZXN0
TWVzYTNEUnVzdGljbCB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvMTIzNTAxODYyMjYKSSByZWNlaXZlZCBhIG5vdGlmaWNhdGlvbiBhYm91dCB0aGUg
TWVzYTNEIFJ1c3RpY2wgcnVudGltZSB0ZXN0IGZhaWx1cmUuCkkgcmVwcm9kdWNlZCB0aGUgdGVz
dCBvbiBteSBtYWNoaW5lLCBhbmQgaXQgcnVucyBzdWNjZXNzZnVsbHkgd2l0aG91dCBhbnkKaXNz
dWUuCkluIHRoZSBDSSBsb2dzLCB0aGUgZXJyb3IgaXM6CiDCoCDCoCAnJydhYXJjaDY0LWxpbnV4
LWcrKy5icl9yZWFsOiBmYXRhbCBlcnJvcjogS2lsbGVkIHNpZ25hbCB0ZXJtaW5hdGVkCiDCoCDC
oCBwcm9ncmFtIGNjMXBsdXMnJycKVGhpcyB0eXBpY2FsbHkgaW5kaWNhdGVzIHRoYXQgdGhlIGNv
bXBpbGVyIHdhcyBraWxsZWQgLApzdWdnZXN0aW5nIHRoYXQgdGhlIENJIHJ1bm5lciByYW4gb3V0
IG9mIG1lbW9yeSBkdXJpbmcgdGhlIExMVk0vQ2xhbmcKYnVpbGQuIFRoaXMgd291bGQgZXhwbGFp
biB3aHkgdGhlIHRlc3Qga2VlcHMgZmFpbGluZyBpbiB0aGUgcGlwZWxpbmUgd2hpbGUKaXQgcGFz
c2VzIGxvY2FsbHkuCgpEbyB5b3UgaGF2ZSBhbnkgbW9yZSBkZXRhaWxzIGFib3V0IHRoaXMgcHJv
YmxlbT8KCkJlc3QgcmVnYXJkcywKCkVsIE1laGRpCgo+IFRoYW5rcyBmb3IgeW91ciBjb250cmli
dXRpb24gdG8gQnVpbGRyb290IQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
