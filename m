Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D874E63CA0
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 12:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1D783576;
	Sun, 25 Jan 2026 12:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3z4qSWRIV3u; Sun, 25 Jan 2026 12:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0732E83224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769344940;
	bh=mHV3RY6Ug9f82R4+hbTxZESXYBhMDblCsBq0vfp2ALo=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EZTIbu2vuqfstLDjqqUQSPSo+Cjg7W4IgduigCIcPtnwRKiRJpGYX0is+yVRD39+A
	 rHXp2TGuxQ82a+fFaBMop7xFWjn68nuPJCoGS0DbaM64mqR4OXCUzRyWZ1jrql4coT
	 l+WB7ZNZFxqcgDm1cscHD6iExUxsHQfJXeu/WK40dr1iYy4+evMS0dETGza7ZM1ghP
	 4MJgsw71T7bcZ5r1xjIfuAD+zfcXUvpDg8sG1A70slNc9Ia6suGCNZVoUFH7fvU0/m
	 s3yACS6ILtQu0EMSoRooByXomP6fRmR80u/wDXST0r2EGurKcbgvhhJ5Oc0Pdg3K/A
	 4UzpLmd8biI6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0732E83224;
	Sun, 25 Jan 2026 12:42:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD3D71CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD2894094E
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9GKaPB_2oht for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 12:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=michael@michaelcullen.name; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94F6340919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F6340919
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94F6340919
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:42:17 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-59b6f04cae6so3795387e87.2
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 04:42:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769344935; cv=none;
 d=google.com; s=arc-20240605;
 b=WU4+D1chyjr73u44XHx/cRYWunYRzbuUYMgNE/CBeDoQfZbOELc6xXvb4vjaS7lHBo
 F2GsS16JFYfPP39PS7MIrGMB8kiTfji6FpfMUkaE6URcAr0l6IkGmaaC4zaYuIPNgYoK
 gczhdin7sHeB+mQynu9c6dUQ7e3MayUR14Hxcm9jO5tVzYNOLPWkj1RsNCWLDhf4hAjj
 BYsLkXbxEgJLnjLe+iS2BwMTnJOgRw1YyOmyuGZfBY1KD70TNjR0pqVZYJ/JKRu1LndU
 YzaJxZfJdTW4j5mKUQgFccGiY5shXekfLBri3iJc4vYC7DNJ7lRDGLhSoWnxowxmpiBV
 7NgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IXvU9R4YG3ecOCRvaLB/XUFYSmBOAh5RayVFwur1eJs=;
 fh=o9xmTMHJFfnruQT1Yf1NYueLEL2avAP9Aa1EB/WvJrQ=;
 b=eH136p/kPldhw1X6I0pZJ2Fc/Ey03SlpamGjb3hy+cpcuEdLE2ucz0jomaSSHScJf6
 AyOGqmpvbiUJtl+TkxH/JvczbpfmiBgAEIsuQXhUij6HKw/k3Zz7EU+lmmn/aAqd6yfA
 iCG8Y++MeI4mWy00Tvr6n+R7D1M1tnTfKMchwqk2NVTeSHYlb4NnKCm7z70Tyx6K9Mju
 +hnS/u2Ewn1lFgyttdKjLxDLCq8PMlzWEDHXUthe8EIl9xYA3cdBjRXKM++LU899xTGU
 ToVQpxdTB5xFOi2g7GDGIWnnHjwcghzzQhuB25WqENBi63dw+m7Av8/t/2rFnydaVMFq
 tRaA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769344935; x=1769949735;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IXvU9R4YG3ecOCRvaLB/XUFYSmBOAh5RayVFwur1eJs=;
 b=tdITC6WK4uSxmTrXuf3JPHGSZLqcynM1jvuqHgSXfA+cQuyiJwYVx3wOFslUu6f6A5
 Wb3/glzSCIOjeG+QWVWDZ+kMfjv9OGlsCY0MUjXN+n/FbgutmktdT8JOAp280SZtpUyg
 qqdoK/4huChels3OxQ4T50zNQEFAOOCIAocYaQ7Bxgb1QTWq6NcPfNogb5F99ZzvsHHC
 tTAPI9twCorpiP/16fDbv/p/gpxX9YBblUqdXmbxWlPKAfF7ISF9GJQJSy8MJCMCqW/T
 eYNM8y5Ad3whG7aqsFXVOQK+sX1gXswlVE74m/pCn/f9EaNqN4x3SNrw58GNz/epmzM3
 Ry/A==
X-Gm-Message-State: AOJu0YwnZ48U7ytq1GwjXzsEiPqfpUTfcFUVa3/azyOkloxkvuU0qI1X
 HPLvbcCvM8dtqWsMgVQv6K2mGRoE7IEcNka4tbfwyeep+3T5G06rH46QQG11FtR7ykeBZ1s60I6
 DDFqjHctFLFR/TAWvtYGJrImYwno69Z45rOuPm5xw
X-Gm-Gg: AZuq6aJ+5FItJqA+Ut5RhZg7e0p/NUfaTZ7JFRng4gG+LnlK4yQ60/P6d3brohXqR8r
 9QBwbeib63bNcnjFLHL8j+wibLNQsm02FecKruMHoc1WOaGTJw0nvvpZvlm/OUlXYKikIWX74lg
 uNLljIsPFAUwxNFyUtuZPcLCQncHeaHeXunwyzJvhan7WmXOvloOTULiswXlebYAZu+OU+4eqVl
 Zyn9tiacHNRzqg99L/07rHl8XR3DoBT/qblprIqefH1EiFmkYObbrdp5LfgyhU0yQQ+IBi/mc28
 9D5G8SSkS5fSvr089VT6bQr5wWQ6Tc8rsQVX3v9WGsuSDc3kFXM4FqyVVg==
X-Received: by 2002:a05:6512:1195:b0:59d:f72c:733 with SMTP id
 2adb3069b0e04-59df72c073amr67945e87.9.1769344934763; Sun, 25 Jan 2026
 04:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20260118133155.1910082-1-bernd@kuhls.net>
In-Reply-To: <20260118133155.1910082-1-bernd@kuhls.net>
Date: Sun, 25 Jan 2026 13:42:02 +0100
X-Gm-Features: AZwV_QjOZ7LudPFL8qv0_CIo7-ly-YoBDCLj59goSH-xWzH10qT6T6peiWhcguE
Message-ID: <CAAqDjMFx+emS2e0QTDsSF4U58upqsomgQ7LXRqryiamv90gr+Q@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Horatiu Vultur <horatiu.vultur@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=michaelcullen.name; s=google; t=1769344935; x=1769949735; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXvU9R4YG3ecOCRvaLB/XUFYSmBOAh5RayVFwur1eJs=;
 b=fav+qecrBEHlXNyQOp4Gfw4g/SaK/7c1rpP/rloMpQloXbYmHndWlmcseExPlQ24ta
 CflQ548YboNTPMgzoCWCFmhfer2iqVPD7P2LTOsSFFAIVhBvbnkavRbKAPWAvSUOigTk
 EpBA5MwL+XFGOKOfgaQOUsiW5R1XOMEq1SYxGJljrV02WbjZNlOZSdZSab6u4w1G4peF
 zxpx2Skaj3J4D0wm9c31UywrulV/mSFRaOlILE4P7AmoxVm0RFHNdu0Pum5/EJnRh3J+
 1CBzNZQptoCIIH+gfbv1gVRX1bI6Em+FU19wRc8gWAUQ87H6yZtcckNokX2O/mOBUs/b
 dS+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=michaelcullen.name
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=michaelcullen.name
 header.i=@michaelcullen.name header.a=rsa-sha256 header.s=google
 header.b=fav+qecr
Subject: Re: [Buildroot] [PATCH 1/1] package/mrp: fix cmake 4 compatibility
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
From: Michael Cullen via buildroot <buildroot@buildroot.org>
Reply-To: Michael Cullen <michael@michaelcullen.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMb29rcyBnb29kLiBJIHN1c3BlY3Qgd2Ugd2lsbCBmaW5kIHRoaXMgaXMgbmVlZGVkIGlu
IGEgZmV3IG90aGVyCnBsYWNlcyBhcyB3ZWxsLiBJJ3ZlIGl0IGl0IG15c2VsZiBhIGNvdXBsZSBv
ZiB0aW1lcyByZWNlbnRseSEKCgpPbiBTdW4sIEphbiAxOCwgMjAyNiBhdCAyOjMy4oCvUE0gQmVy
bmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JvdGU6Cj4KPiBGaXhlczoKPiBodHRwczovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZDkzL2Q5MzgwMjVhODgxYTE0MDAzYzFiNTAw
NjVmMTYzMTE1ZTM2Y2YzM2UvCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRA
a3VobHMubmV0PgpSZXZpZXdlZC1ieTogTWljaGFlbCBDdWxsZW4gPG1pY2hhZWxAbWljaGFlbGN1
bGxlbi5uYW1lPgo+IC0tLQo+ICAuLi5tLXJlcXVpcmVkLXZlcnNpb24tdG8tMy41LWZvci1DTWFr
ZS0ucGF0Y2ggfCA0MSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21ycC8wMDAxLWNtYWtl
LVNldC1taW5pbXVtLXJlcXVpcmVkLXZlcnNpb24tdG8tMy41LWZvci1DTWFrZS0ucGF0Y2gKPgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL21ycC8wMDAxLWNtYWtlLVNldC1taW5pbXVtLXJlcXVpcmVk
LXZlcnNpb24tdG8tMy41LWZvci1DTWFrZS0ucGF0Y2ggYi9wYWNrYWdlL21ycC8wMDAxLWNtYWtl
LVNldC1taW5pbXVtLXJlcXVpcmVkLXZlcnNpb24tdG8tMy41LWZvci1DTWFrZS0ucGF0Y2gKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjdkZGYwOGNkNmQKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9tcnAvMDAwMS1jbWFrZS1TZXQtbWluaW11bS1yZXF1
aXJlZC12ZXJzaW9uLXRvLTMuNS1mb3ItQ01ha2UtLnBhdGNoCj4gQEAgLTAsMCArMSw0MSBAQAo+
ICtGcm9tIDIzODc3ZWFmMTA0MmI1NmUxYmRjYTE4ODM0NDdlOWE4M2Q1ZTgyNjMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4g
K0RhdGU6IFN1biwgMTggSmFuIDIwMjYgMTQ6MjY6MDUgKzAxMDAKPiArU3ViamVjdDogW1BBVENI
XSBjbWFrZTogU2V0IG1pbmltdW0gcmVxdWlyZWQgdmVyc2lvbiB0byAzLjUgZm9yIENNYWtlIDQr
Cj4gKyBjb21wYXRpYmlsaXR5Cj4gKwo+ICtGaXhlczoKPiArQ01ha2UgRXJyb3IgYXQgQ01ha2VM
aXN0cy50eHQ6NiAoY21ha2VfbWluaW11bV9yZXF1aXJlZCk6Cj4gKyAgQ29tcGF0aWJpbGl0eSB3
aXRoIENNYWtlIDwgMy41IGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBDTWFrZS4KPiArCj4gKyAgVXBk
YXRlIHRoZSBWRVJTSU9OIGFyZ3VtZW50IDxtaW4+IHZhbHVlLiAgT3IsIHVzZSB0aGUgPG1pbj4u
Li48bWF4PiBzeW50YXgKPiArICB0byB0ZWxsIENNYWtlIHRoYXQgdGhlIHByb2plY3QgcmVxdWly
ZXMgYXQgbGVhc3QgPG1pbj4gYnV0IGhhcyBiZWVuIHVwZGF0ZWQKPiArICB0byB3b3JrIHdpdGgg
cG9saWNpZXMgaW50cm9kdWNlZCBieSA8bWF4PiBvciBlYXJsaWVyLgo+ICsKPiArICBPciwgYWRk
IC1EQ01BS0VfUE9MSUNZX1ZFUlNJT05fTUlOSU1VTT0zLjUgdG8gdHJ5IGNvbmZpZ3VyaW5nIGFu
eXdheS4KPiArCj4gKy0tIENvbmZpZ3VyaW5nIGluY29tcGxldGUsIGVycm9ycyBvY2N1cnJlZCEK
PiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbWljcm9jaGlwLXVuZy9tcnAvcHVs
bC8yCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+
ICstLS0KPiArIENNYWtlTGlzdHMudHh0IHwgMiArLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50
eHQgYi9DTWFrZUxpc3RzLnR4dAo+ICtpbmRleCBkN2EzNzk4Li5hMGFlMTk2IDEwMDY0NAo+ICst
LS0gYS9DTWFrZUxpc3RzLnR4dAo+ICsrKysgYi9DTWFrZUxpc3RzLnR4dAo+ICtAQCAtMyw3ICsz
LDcgQEAKPiArCj4gKyBwcm9qZWN0IChtcnAgQykKPiArCj4gKy1jbWFrZV9taW5pbXVtX3JlcXVp
cmVkKFZFUlNJT04gMi42KQo+ICsrY21ha2VfbWluaW11bV9yZXF1aXJlZChWRVJTSU9OIDMuNSkK
PiArCj4gKyAjIyBsaWJubCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiArIGZpbmRfcGF0aChMaWJOTF9JTkNMVURFX0RJUiBuZXRsaW5rL25ldGxpbmsu
aAo+ICstLQo+ICsyLjQ3LjMKPiArCj4gLS0KPiAyLjQ3LjMKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
