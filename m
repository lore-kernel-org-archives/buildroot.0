Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD8EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBDE81E3D;
	Sun, 25 Jun 2023 13:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBDE81E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnREUDLUallK; Sun, 25 Jun 2023 13:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF3681E33;
	Sun, 25 Jun 2023 13:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF3681E33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 974A01BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E92640158
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E92640158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gY9C83XL5Cb for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E2EB40102
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E2EB40102
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:53:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51d91e9b533so785296a12.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687701189; x=1690293189;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4mo3OiWdHNXYosqxvpwtYjU7iZ+CTWoboxsr+N1FflU=;
 b=bOBFIfA00dRcAtJ+l5DFYrKEKXPF3hIuzqt2CjEPMkDZm6GtnOzzdTq2ELatILSFHe
 RP1cspl1dCmjUJQls3yvTqc0n0a8P1XeDjGZgvODoolBEYku5BWnyZTYuljqeYOzXFn9
 fGzaDFZHl+Sbv95TdWnnrJM8VzlvGUMtdAo3PEY8fHuEj7y2PJwCplTgwP2bRrfeoqrO
 kpzrYIGpkcwHJyphR/4FWVrktYn6SV1EJpqYH3p7cQ7irB7CFSWjxdr/uiHp4kQvQWLV
 GmXPjVQVRMHoB49TzBb1gj1K9uOvh1QOUkduR0E4pWl4feo/+SVPU+FlsewItvLP1DwR
 KR9A==
X-Gm-Message-State: AC+VfDyt/5HD5KQcKY1UYe16Yp5+epwmmiRWI94SNxDzhpfOFxGLId3H
 dTfuJcjXWG7Og+6fHv1nLVxNvg==
X-Google-Smtp-Source: ACHHUZ49vopUeBOSqYcY5fYYx+uR+ah3Q++JOylYjtMpFgdbOr88Q7de+3XgLl4zmiof5j01ZOlGKA==
X-Received: by 2002:a50:e604:0:b0:510:d0bc:e130 with SMTP id
 y4-20020a50e604000000b00510d0bce130mr19201892edm.33.1687701189611; 
 Sun, 25 Jun 2023 06:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa7dada000000b0051be4cb7f54sm1781887eds.84.2023.06.25.06.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:53:09 -0700 (PDT)
Message-ID: <c42a0f6f-d987-e90c-c367-8778bc7d3bc7@mind.be>
Date: Sun, 25 Jun 2023 15:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: "Stuhlemmer, Kai" <kai.stuhlemmer@ebee.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <BE1P281MB310985DED7F956EA79AA0C649B22A@BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <BE1P281MB310985DED7F956EA79AA0C649B22A@BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687701189; x=1690293189;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4mo3OiWdHNXYosqxvpwtYjU7iZ+CTWoboxsr+N1FflU=;
 b=iRLdAT/n59Ji3g/nF/ri3vLfWQ9XldF8c7BrhVTxb3fH+JBmpO3SCKwQIF0dZSyZG3
 cWnLtAaW29fNZFbJxgkk1Ezla1lveYGag61XZ9xkH9wSoEv1eVyVgM3VlKRcGpyCQzsv
 aw8GUL860SoUC+27tgIwqrTxozg4XiCsVPvxYsB+JTf6fE8rSSeWUwd/+FqQOG6KwYNe
 RsvfsNa61ci9CHCdupT9tNx7Y+l2N8VDSk4p8jUCjWEChVFhPa/NlJnYMKjr4wsZHa2X
 Bwn7G/09cP/bE9o/vXBap/fQ/22zi+fm0gB3Y/3CNaTYOjPcD3qgltprllfbVhgGov94
 jmNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iRLdAT/n
Subject: Re: [Buildroot] [PATCH 1/1] package/open-plc-utils: bump to version
 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wNi8yMDIzIDE0OjIwLCBTdHVobGVtbWVyLCBLYWkgd3JvdGU6Cj4gCj4gT3RoZXIg
Y2hhbmdlczoKPiAgIC0gUmVtb3ZlIDAwMDItcGxjLXBsYy5oLWZpeC1idWlsZC13aXRoLWdjYy0x
MC5wYXRjaCBhcwo+ICAgICByZWxhdGVkIE1SIGh0dHBzOi8vZ2l0aHViLmNvbS9xY2Evb3Blbi1w
bGMtdXRpbHMvcHVsbC8xNDEKPiAgICAgaGFzIGJlZW4gbWVyZ2VkLgo+IAo+IE5vdGFibGUgY2hh
bmdlcyBzaW5jZSBsYXN0IHZlcnNpb246Cj4gCj4gICAtIERyb3AgcHJpdmlsZWdlcyBhZnRlciBv
cGVuaW5nIHRoZSBjaGFubmVsIGZpbGUgZGVzY3JpcHRvcgo+ICAgLSBSZW1vdmUgYWxsIGNoZWNr
cyBmb3Igcm9vdCBwZXJtaXNzaW9ucwo+ICAgLSBBZGQgY2hpcCBpZGVudGlmaWNhdGlvbiBmb3Ig
UUNBNzAwNkFRCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgY29udHJpYnV0aW9uISBJdCdzIGdyZWF0
IHRvIHNlZSBuZXcgcGVvcGxlIHVzaW5nIEJ1aWxkcm9vdCAKYW5kIGNvbnRyaWJ1dGluZyB0byBp
dC4KCkhvd2V2ZXIsIGluIG9yZGVyIHRvIGVhc2UgdGhlIHJldmlldyBwcm9jZXNzLCB3ZSBsaWtl
IHRvIHJlY2VpdmUgcGF0Y2hlcyBpbmxpbmUgCmFuZCBub3QgYXMgYXR0YWNobWVudHMuIEluZGVl
ZCwgdGhpcyBhbGxvd3MgdXMgdG8gc2ltcGx5IGhpdCAicmVwbHkiIGFuZCBjb21tZW50IApvbiBl
YWNoIHBhcnQgb2YgdGhlIHBhdGNoLiBUaGlzIGlzIGEgdmVyeSB0eXBpY2FsIHJldmlldyBwcm9j
ZXNzIHVzZWQgaW4gdGhlIApvcGVuLXNvdXJjZSBjb21tdW5pdHkuIEluIG9yZGVyIHRvIHNlbmQg
cGF0Y2hlcyBpbmxpbmUsIHdlIHJlY29tbWVuZCB5b3UgdG8gdXNlIAoiZ2l0IHNlbmQtZW1haWwi
IGFzIGUtbWFpbCBjbGllbnRzIHZlcnkgb2Z0ZW4gcmV3cmFwIHRleHQgYW5kIHRoZXJlZm9yZSBt
YWtlIApwYXRjaGVzIHVudXNhYmxlLgoKCiAgSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIGhvd2V2
ZXIsIHRoZXJlIHdhcyBub3RoaW5nIHRvIGNvbW1lbnQgb24sIHNvIEkgCmFwcGxpZWQgdGhlIHBh
dGNoIHRvIG1hc3RlciwgdGhhbmtzIQoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBbZWJlZSBM
b2dvXQo+IAo+IGViZWUgRW5naW5lZXJpbmcgR21iSCB8IFdhc2hpbmd0b25zdHJhw59lIDE2LzE2
QSB8IDAxMTM5IERyZXNkZW4KPiBGb246ICs0OSAzNTEgNjU2OTkgNjEwMCB8IEZheDogKzQ5IDM1
MSA2NTY5OSA2MTA1IHwgRS1NYWlsOiBpbmZvLmRyZXNkZW5AZWJlZS5kZTxtYWlsdG86aW5mby5k
cmVzZGVuQGViZWUuZGU+IHwgV2ViOiB3d3cuZWJlZS5kZTxodHRwczovL3d3dy5lYmVlLmRlPgo+
IAo+IEFtdHNnZXJpY2h0IERyZXNkZW4gSFJCIDMzMzcwCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEhh
bnMtSm9hY2hpbSBCYWVyLCBBbmRyZWFzIE1hdXJlciwgU2ViYXN0aWFuIEdpZXNzbWFubiwgVVN0
Li1JRDogREUyOTU0NDI5MTgKPiAKPiBbaHR0cHM6Ly93d3cuYmVuZGVyLmRlL2ZpbGVhZG1pbi9j
b250ZW50L0JlbmRlckdyb3VwL0Rvd25sb2Fkcy9EaXNjbGFpbWVyL2xpbmtlZGluLmpwZ10gPGh0
dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L2ViZWUtc21hcnQtdGVjaG5vbG9naWVzLWdt
YmgvPgo+IAo+IFtodHRwczovL3d3dy5iZW5kZXIuZGUvZmlsZWFkbWluL2NvbnRlbnQvQmVuZGVy
R3JvdXAvRG93bmxvYWRzL0Rpc2NsYWltZXIvTE5kVy0yMDIzLnBuZ108aHR0cHM6Ly93d3cud2lz
c2Vuc2NoYWZ0c25hY2h0LWRyZXNkZW4uZGUvPgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
