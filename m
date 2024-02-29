Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455E0C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 11:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A3EC41759;
	Thu, 29 Feb 2024 11:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpwaG0hR9WsZ; Thu, 29 Feb 2024 11:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B04E417A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B04E417A7;
	Thu, 29 Feb 2024 11:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD8371BF36E
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 11:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA871417A7
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 11:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYEj2owymc7c for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 11:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AE5741759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AE5741759
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AE5741759
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 11:38:09 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dcc71031680so750220276.2
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 03:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709206688; x=1709811488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dGJwWxEyeVPsJFm5zdQcmIT+s6Iuiiq0RXQAAgsk1w=;
 b=WBdfqEcQZEN7JJOk1CixnOgqiFNINcu6b8te9tbnebZsPysRKZkMwzaJsCExq0mHEE
 glOWZJf1ncAZlAyWEucHCtln1u/r1libQgLAgprMpDcLyyvsA+OlKT27ZXptn1uig54M
 rH3AvmwtK9+1iVotGugepPSWHz9aSvqNpGIgywW6651gbUiScUZGLHUwN3C0+M61kisK
 0pW5utlxcOc8EtSDgzgEh1zvgbLAogZ56T1IcWhScBGTxUjObgvx5xezUvw016+zIvQJ
 /ElXv361++L08NJN/YBLeYXn5uDXLrkrBJv5Xk5QQ0iURlvytQwc9ltXFX3R5uZxa6cD
 bbbg==
X-Gm-Message-State: AOJu0YxMuagSxvlxMVqmi/XQi7vg1vkg7mO2BUFPp23SZjhfvkeB8PAn
 0lRun0i3JJfdi111Q3Dw9AjUHyAUPFqE2ookLL8xyC3/KydAnQLa6eTrzTNGf6CMF6rStHQeeOl
 taRlx3vFSassj/Ka4TKMBvCUgtYquvNSp0FD55Q==
X-Google-Smtp-Source: AGHT+IFJDz62ayt4sNVFVMy3Ft4dTt2LEGhibSjMZRSg+uevOGLUHGlOizhJuNnuaGaUIW2tGypaeIFj3mld3/gtE64=
X-Received: by 2002:a25:664b:0:b0:dcc:9d30:58a0 with SMTP id
 z11-20020a25664b000000b00dcc9d3058a0mr1739564ybm.64.1709206688363; Thu, 29
 Feb 2024 03:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
 <20240227163019.2876942-16-dario.binacchi@amarulasolutions.com>
 <20240229022222.exmx2cgijdjrtnwp@dasso>
In-Reply-To: <20240229022222.exmx2cgijdjrtnwp@dasso>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 29 Feb 2024 12:37:57 +0100
Message-ID: <CABGWkvoCD4SJsRPP+uv2N0evUF8YFv9eRBHew1Lhj+UZwP9YNQ@mail.gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709206688; x=1709811488;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6dGJwWxEyeVPsJFm5zdQcmIT+s6Iuiiq0RXQAAgsk1w=;
 b=jiwMpnN7TglVtGZ63Zc8UP1NSnAylsIhU7/wHntP8WiiVvpwpkee29BcdlA3xdnfFF
 ry7KLG44I9MEvzlULRb+gUexKjYuIK4cKJ69Lyp7wXBu8LSQvdkNw4bG8SYiJKhyjVYV
 gwHSALq2eD7vh6Cko44UCU78i2lKCrUjfqOY4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jiwMpnN7
Subject: Re: [Buildroot] [PATCH v7 15/17] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywKCk9uIFRodSwgRmViIDI5LCAyMDI0IGF0IDM6MjLigK9BTSBBbmRyZWFzIERh
bm5lbmJlcmcgPGRhbm5lbmJlcmdAdGkuY29tPiB3cm90ZToKPgo+IEhpIERhcmlvLAo+Cj4gT24g
VHVlLCBGZWIgMjcsIDIwMjQgYXQgMDU6MzA6MTdQTSArMDEwMCwgRGFyaW8gQmluYWNjaGkgd3Jv
dGU6Cj4gPiBSZWNlbnQgdmVyc2lvbnMgb2YgVS1Cb290IGFyZSBjYXBhYmxlIG9mIGJ1aWxkaW5n
IHRpYm9vdDMuYmluIHVzaW5nCj4gPiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3MgY29weSBp
dCB0byB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+Cj4gPiAt
LS0KPiA+Cj4gPiBDaGFuZ2VzIGluIHY2Ogo+ID4gLSBSZXBsYWNlIGBmaW5kJyBjb21tYW5kIHdp
dGggYGNwJyBvbmUuCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NToKPiA+IC0gUmVwbGFjZSB0aWJvb3Qz
LSotJChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4gd2l0aAo+ID4gICB0aWJvb3QzLSQo
VElfSzNfUjVfTE9BREVSX1NPQyktJChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4KPiA+
Cj4gPiBBZGRlZCBpbiB2NAo+ID4KPiA+ICBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsgfCA0ICsrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5t
ayBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ID4gaW5kZXggZmRi
MDU4ZjNiNzJhLi5jYmRiNjUzMjc4ZjggMTAwNjQ0Cj4gPiAtLS0gYS9ib290L3RpLWszLXI1LWxv
YWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3Rp
LWszLXI1LWxvYWRlci5tawo+ID4gQEAgLTcwLDggKzcwLDEyIEBAIGRlZmluZSBUSV9LM19SNV9M
T0FERVJfQlVJTERfQ01EUwo+ID4gICAgICAgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoVElf
SzNfUjVfTE9BREVSX01BS0UpIC1DICQoQEQpICQoVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUykK
PiA+ICBlbmRlZgo+ID4KPiA+ICtUSV9LM19SNV9MT0FERVJfU0VDVFlQRSA9ICQoY2FsbCBxc3Ry
aXAsJChCUjJfUEFDS0FHRV9USV9LM19TRUNUWVBFKSkKPiA+ICtUSV9LM19SNV9MT0FERVJfU09D
ID0gJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX1RJX0szX1NPQykpCj4gPiArCj4gPiAgZGVm
aW5lIFRJX0szX1I1X0xPQURFUl9JTlNUQUxMX0lNQUdFU19DTURTCj4gPiAgICAgICBjcCAkKEBE
KS9zcGwvdS1ib290LXNwbC5iaW4gJChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluCj4g
PiArICAgICBjcCAkKEBEKS90aWJvb3QzLSQoVElfSzNfUjVfTE9BREVSX1NPQyktJChUSV9LM19S
NV9MT0FERVJfU0VDVFlQRSktKi5iaW4gJChCSU5BUklFU19ESVIpL3RpYm9vdDMuYmluCj4KPiBI
YXZlIHlvdSB0cmllZCBkb2luZyBhIGNsZWFuIGJ1aWxkIG9mIHRpX2FtNjR4X3NrX2RlZmNvbmZp
Zz8gV2hlbiBJIGRvCj4gdGhhdCB0aGUgY2hhbmdlIGFib3ZlIGJyZWFrcyB0aGUgYnVpbGQuLi4K
Pgo+IDxzbmlwPgo+ID4+PiB0aS1rMy1yNS1sb2FkZXIgMjAyMi4xMCBJbnN0YWxsaW5nIHRvIGlt
YWdlcyBkaXJlY3RvcnkKPiBjcCAvaG9tZS9hMDc5NzA1OS9naXQvYnVpbGRyb290L291dHB1dC9i
dWlsZC90aS1rMy1yNS1sb2FkZXItMjAyMi4xMC9zcGwvdS1ib290LXNwbC5iaW4gL2hvbWUvYTA3
OTcwNTkvZ2l0L2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3I1LXUtYm9vdC1zcGwKPiAuYmluCj4g
Y3AgL2hvbWUvYTA3OTcwNTkvZ2l0L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvdGktazMtcjUtbG9h
ZGVyLTIwMjIuMTAvdGlib290My1hbTY0eC1ncC0qLmJpbiAvaG9tZS9hMDc5NzA1OS9naXQvYnVp
bGRyb290L291dHB1dC9pbWFnZXMvdGlib290My5iCj4gaW4KPiBjcDogY2Fubm90IHN0YXQgJy9o
b21lL2EwNzk3MDU5L2dpdC9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3RpLWszLXI1LWxvYWRlci0y
MDIyLjEwL3RpYm9vdDMtYW02NHgtZ3AtKi5iaW4nOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
Cj4gbWFrZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjM2NDogL2hvbWUvYTA3OTcw
NTkvZ2l0L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvdGktazMtcjUtbG9hZGVyLTIwMjIuMTAvLnN0
YW1wX2ltYWdlc19pbnN0YWxsZWRdIEVycm9yIDEKPiBtYWtlOiAqKiogW01ha2VmaWxlOjgyOiBf
YWxsXSBFcnJvciAyCj4gPHNuaXA+Cj4KPiBMb29rcyBsaWtlIHRoZSB0aWJvb3QzLmJpbiBmaWxl
IGlzIGFscmVhZHkgdGhlcmUsIGFuZCBub3RoaW5nIG5lZWRzIHRvCj4gYmUgY29waWVkIG9yIHJl
bmFtZWQuIE5vdCBzdXJlIHdoYXQgaXMgYmVzdCB3YXkgdG8gbWFuYWdlIHRoaXMKPiBkZXBlbmRl
bmN5IGFzIHRoaXMgaXMgdGhlIGJlaGF2aW9yIG9mIHRoZSBvbGRlciBVLUJvb3QuIEknZCBwcm9i
YWJseQo+IGp1c3QgbWlncmF0ZSB0aGUgYW02NHhfc2sgc3VwcG9ydCB0byBiaW5tYW4gdG9vIGFs
c28gdXNpbmcgdGhlCj4gc2FtZS9uZXdlciBVLUJvb3QgeW91IGFyZSBhbHJlYWR5IHVzaW5nIGZv
ciBBTTYyeCwgbWFraW5nIGV2ZXJ5dGhpbmcKPiBlcXVpdmFsZW50IG9mIHRoZSBhbTYyeF9zayBz
dXBwb3J0IHlvdSBhcmUgZm9jdXNlZCBvbiB3aXRoIHRoaXMgc2VyaWVzLgoKSSBhbSBtb2RpZnlp
bmcgdGhlIGNvbmZpZ3VyYXRpb24gdGlfYW02NHhfc2tfZGVmY29uZmlnIHNvIHRoYXQsCnNpbWls
YXJseSB0byB3aGF0IHdhcyBkb25lIGZvciB0aV9hbTYyeF9za19kZWZjb25maWcsCml0IHVzZXMg
YSBVLUJvb3QgMjAyNC4wMSB0aGF0IG1ha2VzIHVzZSBvZiBiaW5tYW46CgpodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjI0MjA1NjU0LjE1
NDY3NDQtMTctZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20vCgpUaGFua3MgYW5k
IHJlZ2FyZHMsCkRhcmlvCgo+Cj4gLS0KPiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhhcyBJbnN0
cnVtZW50cyBJbmMKPgo+Cj4KPgo+Cj4gPiAgZW5kZWYKPiA+Cj4gPiAgJChldmFsICQoa2NvbmZp
Zy1wYWNrYWdlKSkKPiA+IC0tCj4gPiAyLjQzLjAKPiA+CgoKCi0tIAoKRGFyaW8gQmluYWNjaGkK
ClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVs
YSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0
bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3
LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
