Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6807CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B46F9409DB;
	Sat, 10 Oct 2026 09:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKWNa7Qt8nVG; Sat, 10 Oct 2026 09:24:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4CA01409D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624269;
	b=rO+wwxzeuPHtPLFJgN7dU4IXY3kpL+74i8k9qQGPuvuaMDiDSficNL2MZuzrjtDnsiq7
	 W95hRSyK1O8/9WPLjihxGfHKcZeR3rPvFSigaT2Tp0+hnxr+Mxmn3umZlir7mK36yMGJk
	 XYuaPRlXfwgB+Q2/Cf+VvM+/CoPBBnbfs2m12Zu0nJ6eWD5TbtgQtkNHFJjrXAp471pry
	 NEK0sE5dVdO34ul48rBFMA1Ltdb10A/c+VUkuPy16rE4PVlfis6tmZxWvl6rhJbQHBO3h
	 czVO8CpMtiYtHchsuZxFKczVFOHwnz2cZfd6ol1d46DJhi1G2MHSYOk3EaFDZvTt+dA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZilHQRFKamzB7Pj2JAlricbOl9TvkKNZPJAzjzClMPs=;
	b=nksHUwQ9DQTIDdjrGukJwUI+NA2lAZYC4I7BI6ZACfpHdFkXjO6ubwJnp5sZboXU/nvN
	 ufhfL9o7g82XopJehkM9hQ7BaTrEkWlzXqCtC6TJztZMEkL10a8meEurSEFhxbbhpL3+I
	 oYigBNYC2hvrTPm1CXctmfJum/Wmv6+woq7ISegDTDPLrn3SeX+ChRK6DYPbk2nou1V91
	 cbdeZT/C3sEhHMHsYrsp1pB0P4k2HZgJBMYSW7CUCfv/lpP1cBCMnpqhZE5d/UQLQDxB+
	 2JH0+1dkuTZQV6wx7zMn/GuZ1gCjGkv4pW5WVnj2ziTYK9o1eFfA2TvQOsqisobtwNA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624269;
	bh=ZilHQRFKamzB7Pj2JAlricbOl9TvkKNZPJAzjzClMPs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eCNYRnkPhdnXXQZW5oZ/MhUywLkWygMdN6KuCZ9UY6XlZgYT48sW/VHWNkPIQq2QN
	 AWPWi8Bsx/RZV91PF58i9gSdxLnyka/LHMsrhKZnc3s7ZQCNx6sEDbDNXT2to/hdMV
	 B+lXuZHk9Y3swfJq8lvK5WdH8J+jUWQEJTGoNBMAGTEP/ghVl859UrI37OMTBHaBZc
	 jw4Gs2vimPIWpTLxHb6nxvjMumTDUFVff3sS/uk+NgDw42aUgzEl/5vzMUwLu3joA/
	 0YDOAfYhYy73Hz7tjKqkh00DDwrcWkRBgLMBHnxJOtzf2f0MB6y8JwxgLi5IywMayd
	 FTSDcITQK57kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA01409D7;
	Sat, 10 Oct 2026 09:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF5D075
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D183E60A96
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNaM9ZPbrK7C for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 36D7260AA2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624263;
 b=jnDHF0zzKRl2VgC4mPB6rUR/nXjx8aOTsr+dvcFV8eHo1ypXBwafBawWxs3ttt6PSZ/k
 nZlPisO8D3d9nZ/QpUNsnb4YyLsWHWI135Mrk23XGsli+HELM6ZxV0F16TucjOo54vmel
 HW6Q1AUbRA0oQrioYMLh432Fr4NlwoXRkXMX+ILsLgaU9XgwsEm649pVshV2ilgjHoOuu
 BQilcA+e0KlPY2WE2DzJDMfzEXhdxaIQ7vsxJ3PkuoFFkeZDs1ySva6G5tnzVJXq0C41R
 uTJd74oWZxgUQPfsUvkXmZCW1tL0bHeEuo498fnOsVCnfXqRBVKhxCwyj271LMzmbSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624263;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=LN4ob1oojxykd1q/G6Q7yveTO0X5YdfJnFv6zw3NRQg=;
 b=UuST2sSasqq25crymZmJ7K0+gjoh0zxaKwZtunE8CLQ6G8klw/tYovunRBcwpXx04SLD
 /uJQ0RqoRekQKnYVQZlrYBtAsXC81jYhmP/0FHYY73FcSHzbqyODqALQtpqGfAbTqfHUJ
 IdoqvepEQVE09zZIXtaYyqfUMYHtv7/HlYzanJDubfhQjYm3qj5pctA61Gc9lzH3vDQ9L
 VnQWSU5wY11FQAQXIEEdOcyQ8qMBiR42bkvX2ps/JuUHk1ZWGdYvg2kFuc/XNe//VOr4x
 FgumbtpIh1EhwVcRUwZQLTLXhYC9QhCt2lk7qLZNR1MFDFTRYxRGGSdZzQYTWnqunzg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HrRSC7vq; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D7260AA2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so4762565e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624261; x=1792229061;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LN4ob1oojxykd1q/G6Q7yveTO0X5YdfJnFv6zw3NRQg=;
 b=cuhydL6uU+Cs26UCnV3nB+vT9Vf4pkZtLyaudywMuVVfWASpIY+VPJaLpnDv6NdU2/
 F+g933nK3vnU2hMR5aRpgjWKxbjEt4Ibt631OfxJ9HS74yJEeTqgE4owWAFUpNtt+vbi
 qXcq0ONt8+IUBMzyhDrdWV5fyA4IaXlwnE9vakzkPMRbFlvfOMe401ynnFY65DkBp4CO
 ZnWDsemJhyagC81y5lyjx2KqgVFBaY8Mlh3MbBzg87/sXO+axgGfbjuKH10SAWxe7XDP
 ZFSyFwK5lTlfbICqplqgB0imAVk77L/bA5/7jh+IcmcNYD2j9VtydoMPrsYEuMb+hn/H
 yX4Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBw48FvDSn0XII25R0mCVjHDko7cKDy7GYgEc2XScDTH6Rws4zMnQRoQKdtVxd7cYyWgT2JpjNTJKzc=@buildroot.org
X-Gm-Message-State: AFq9FYI+MnFFAq/zxx5c8VOqpUy9kD8zyNETLGJqJUWN/mDikLYQh0GR
 MzfALssQCDRAS+JdVMI0GyRWvFz26xjv3rFKf/g1eQ/KFUtiRfCoGYycu7+urwxeSzP5aOvSB6C
 10Qo3oXs=
X-Gm-Gg: AYBFou1G150OgB9ydz8+lPilJjWdv+sF9DPg1YY8R71bcrjAkZVjOrtMf5lyxw0qrm8
 Ji6EbnI74MjazHbZHfY8zH+Oon81gBwOdXY+OZd384GXgdr31589wOAbl2JQGlwvxMcK9iqMUUN
 +lw0tbh+82tacF3gtGbs/t58fStrdYhVed6jzyPLckTOOEiHWyoNwImFwAA7ED0upSvMUvlkNgD
 q2VdLst6Ku5uX0alTRmki+Db6HLljSmQ7gUaBU5exYzP0kscXtH2ggI0XuRtg5Bglo1nJKcnVbz
 v0em15hK3eKKwbs5kXR2NxsotXgPZm+Uh5bThA6NLydiRVA+7VQ1yuOj7hIWUcUQed4fHNT+qjN
 zQ8Xn3WbhXCkikFxCfRl+jDWMAi3zAkgiP6iQ4RvBB6PYHvGgN5w2MYWw4jO1qOwk0HcrYjsTlY
 qai8O/Hi7UT+ICJ8I3D7VWTJ3qsQFPAg2SA0lctjngakQdmrdditOuRLIsmDMRQ4UDCXmzh5fP7
 Xg6LYFUjOBmdVf0KQF70VGoeQ0U7kShIai052AITLfIMROjw/0GW/fh
X-Received: by 2002:a05:600c:a11c:b0:4a1:97c6:d2e8 with SMTP id
 5b1f17b1804b1-4a197c6d902mr4388165e9.32.1791624261168; 
 Sat, 10 Oct 2026 02:24:21 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18ca51465sm90758385e9.4.2026.10.10.02.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:20 -0700 (PDT)
To: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:15 +0200
Message-ID: <20261010092420.140123-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003180459.1243570-1-contact@bearware.dk>
References: <20261003180459.1243570-1-contact@bearware.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk-bin: CPE ID for
 openjdk-bin
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlIENQRSBJRCBvbiBvcGVuamRrIHZlcnNpb24gMjEuMC4yIGluIE5W
RDoKPiBodHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/a2V5
d29yZD1jcGU6Mi4zOmE6b3JhY2xlOm9wZW5qZGs6MjEuMC4yOio6KjoqOio6KjoqOioKPiAKPiBI
T1NUX09QRU5KREtfQklOX0NQRV9JRF9WRVJTSU9OIGhhcyBiZSBvdmVyd3JpdHRlbiB0byBtYXRj
aCBOVkQncwo+IHZlcnNpb25pbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmrDuHJuIERhbXN0ZWR0
IFJhc211c3NlbiA8Y29udGFjdEBiZWFyd2FyZS5kaz4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYg
MjAyNi4wOC54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2Uvb3Blbmpkay1iaW4vb3Blbmpkay1i
aW4ubWsgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuamRrLWJpbi9vcGVuamRrLWJpbi5tayBiL3BhY2thZ2Uv
b3Blbmpkay1iaW4vb3Blbmpkay1iaW4ubWsKPiBpbmRleCA1ZjE5MjJkZWE1Li40YTIxY2JiNDYw
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3Blbmpkay1iaW4vb3Blbmpkay1iaW4ubWsKPiArKysg
Yi9wYWNrYWdlL29wZW5qZGstYmluL29wZW5qZGstYmluLm1rCj4gQEAgLTI5LDYgKzI5LDExIEBA
IEhPU1RfT1BFTkpES19CSU5fVkVSU0lPTiA9ICQoSE9TVF9PUEVOSkRLX0JJTl9WRVJTSU9OX01B
Sk9SKS4kKEhPU1RfT1BFTkpES19CSU5fCj4gIEhPU1RfT1BFTkpES19CSU5fU09VUkNFID0gT3Bl
bkpESyQoSE9TVF9PUEVOSkRLX0JJTl9WRVJTSU9OX01BSk9SKVUtamRrXyQoSE9TVF9PUEVOSkRL
X0JJTl9ET1dOTE9BRF9BUkNIX05BTUUpX2xpbnV4X2hvdHNwb3RfJChIT1NUX09QRU5KREtfQklO
X1ZFUlNJT04pLnRhci5nego+ICBIT1NUX09QRU5KREtfQklOX1NJVEUgPSBodHRwczovL2dpdGh1
Yi5jb20vYWRvcHRpdW0vdGVtdXJpbiQoSE9TVF9PUEVOSkRLX0JJTl9WRVJTSU9OX01BSk9SKS1i
aW5hcmllcy9yZWxlYXNlcy9kb3dubG9hZC9qZGstJChzdWJzdCBfLCUyQiwkKEhPU1RfT1BFTkpE
S19CSU5fVkVSU0lPTikpCj4gIAo+ICsjIE92ZXJyaWRlIGF1dG9tYXRpYyBDUEUgSUQgYmVjYXVz
ZSAnXycgaW4gJChIT1NUX09QRU5KREtfQklOX1ZFUlNJT04pIGlzIG5vdCB1c2VkIGJ5IE5WRAo+
ICtIT1NUX09QRU5KREtfQklOX0NQRV9JRF9WRU5ET1IgPSBvcmFjbGUKPiArSE9TVF9PUEVOSkRL
X0JJTl9DUEVfSURfUFJPRFVDVCA9IG9wZW5qZGsKPiArSE9TVF9PUEVOSkRLX0JJTl9DUEVfSURf
VkVSU0lPTiA9ICQoSE9TVF9PUEVOSkRLX0JJTl9WRVJTSU9OX01BSk9SKS4kKEhPU1RfT1BFTkpE
S19CSU5fVkVSU0lPTl9NSU5PUikKPiArCj4gIEhPU1RfT1BFTkpES19CSU5fTElDRU5TRSA9IEdQ
TC0yLjArIHdpdGggZXhjZXB0aW9uCj4gIEhPU1RfT1BFTkpES19CSU5fTElDRU5TRV9GSUxFUyA9
IGxlZ2FsL2phdmEucHJlZnMvTElDRU5TRSBsZWdhbC9qYXZhLnByZWZzL0FTU0VNQkxZX0VYQ0VQ
VElPTgo+ICAKPiAtLSAKPiAyLjUzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
