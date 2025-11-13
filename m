Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F17CD98D2
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 21:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 553DD82B5E;
	Thu, 13 Nov 2025 21:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44A1UVZnoqja; Thu, 13 Nov 2025 21:12:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E361830A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E361830A7;
	Thu, 13 Nov 2025 21:12:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54D6DD5
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 21:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AF6D60718
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 21:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mDAPaYri2cs for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 21:12:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1B6C60703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B6C60703
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1B6C60703
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 21:12:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47721743fd0so7665455e9.2
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 13:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763068369; x=1763673169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dU7zu1xVw/H2yfTQ5kbYi3V0bVQkdAeWMtE8ahMq7C4=;
 b=CjucSVOisC8mYdmq6L60aCID9wxeQ8pirfOIVWwpGucdX3m/CNsrKI3KHHlhtWbRRz
 Bvpbu0ThOyhuRBE+wtwgTDdqj9eC/3kMnOmXIa6nxerF3PdkVhl6N8zGIjSXGI/ypwZh
 No1rix0urlxz49Zxa/j4u5FdvNjJRhQT8bT0onE5irbVu6tjNFfUOeN+lrEZTtVrzsT6
 GdPrrcpmHTT+Irqw6fCextfEBIkiH1FmD4oPGfyX/wvxPG7Ur/oCP7TPCywSqRewqafK
 uH1WOVbfiJzDW6UW/4ui+rqewlYmomHhARowPV1wx9T4QSyyhR7TWkKKVHLmd+2xIsYj
 kwvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Y3/xQGAwgZWsaRzt6MTn0ucww7/XAqjWp+Fc4a5D53i1zcCnIk6rP8IddAMVd+0Vb99b1t09TTE=@buildroot.org
X-Gm-Message-State: AOJu0YwE+kOBpFJI2w3DwAHJC3YyE5LI92NRuvACboOPnHta4Re2UJxj
 YEgn6OV3yxmgoviEbIFjUcDgIm+itL2+d0K1VONyqyJYvkEybji/aIPc07zIoEYlvFAcaOf62a7
 GfFrk
X-Gm-Gg: ASbGnctTBKCVm7sEh53zehKMpOCO0BYVLzDx7uplRldAwf7nALpc4YiFX1tzHKCOpaf
 iFxZUx0SdRaoUNQD2TEwAeKoha/lejBxf+FiTrVuMXy1qlD5QluBmr0L3zpDMwVLafjHo4FX79U
 vLyuuMzIARmvuhi8HejZcsO9qlar2nBekEFPt7iqiIDgUJF9ZUMJ/OuSlOHJz8K0Je2kh4C6aCO
 wT+VWmm34hMrCUgRVls2YNRN0uhhNOOESiZgUpz87kfVUFJOLOQLLAVDp0YOhtr7SknaSZuSPu/
 zbFMS1+lEcRS1PuSdsPeEyI4irziTSKMcK/ADmpSgjw/nqGP7iw+zuAizrmGLVBLJbBqvqaQzO/
 kyde2MDXeXbHBPl0ULfy2Sa5J5ZTQRQIsb3UqMPKMoMk2AYeK03ztRLs1OOQaA37V0MOGIiHK33
 JgptTxALZFdPg6p0c4Wt+GpVy9bvRhKKGI/lvw
X-Google-Smtp-Source: AGHT+IG7cOm8nkHw0Za7VCDG5sttbLHZFeIY9H8UA9QwqnZRR+wWwys5wmFimyP1+jkYqpPInChl2g==
X-Received: by 2002:a05:600c:4f54:b0:477:776a:bfa1 with SMTP id
 5b1f17b1804b1-4778febba10mr6667155e9.38.1763068368890; 
 Thu, 13 Nov 2025 13:12:48 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778c897bb8sm51617635e9.12.2025.11.13.13.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 13:12:48 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Thu, 13 Nov 2025 22:12:47 +0100
Message-ID: <20251113211248.6645-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111212632.51340-1-thomas.perale@mind.be>
References: <20251111212632.51340-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763068369; x=1763673169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dU7zu1xVw/H2yfTQ5kbYi3V0bVQkdAeWMtE8ahMq7C4=;
 b=OuuOVwbpgg9o93zlarod5Q/Xzw3v30C744Jy/25N2VqZ2zBHFR8FDVOkx5HnngLrDN
 BYDN8+3JpvOThvCUOczdxclFPE4uAsev/qE8JudVTenpanKjUDP1LTAx+pKByAyZ0cdj
 oNuSpgoNy+FXRWwv0PuedMbpspUzWk65imYNP4uBOoRonJxvsJ+EdaTmk+uo0gc5LSQu
 JPEa1872TrwKPAUwe28QgS44zeHEViHl0LPGMRKKeTeFOc21rfo1vM4sCqeFGL4liaOT
 WyEoidfZoYaQY+rjsCXKDDqwtPtkvT5oFY/4jaLt8aH3I4qp5eDcYM6h/r7ErdJBLrxB
 afwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OuuOVwbp
Subject: Re: [Buildroot] [PATCH v4 0/2] Add external tree information to
 CycloneDX SBOM
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

SGksCgpJIGNyZWF0ZWQgdGhpcyB0aWNrZXQgaHR0cHM6Ly9naXRodWIuY29tL0N5Y2xvbmVEWC9z
cGVjaWZpY2F0aW9uL2Rpc2N1c3Npb25zLzcyMAoKTGV0IG1lIGtub3cgaWYgSSBzaG91bGQgYWRk
IGFueXRoaW5nLgoKUEVSQUxFIFRob21hcwoKSW4gcmVwbHkgb2Y6Cj4gSGksCj4gCj4gSW4gcmVw
bHkgb2Y6Cj4gPiBIaSBUaG9tYXMhCj4gPiAKPiA+IEFtIDA1LjExLjI1IHVtIDIyOjEyIHNjaHJp
ZWIgVGhvbWFzIFBlcmFsZToKPiA+ID4gSGkgRmlvbmEsCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUg
cGluZy4KPiA+ID4gPiBJIGFncmVlIHdpdGggdGhlIHBsYWNlIHRvIGRlZmluZSB0aGUgZXh0ZXJu
YWwsIGlmIEkgcmVhZCB0aGUgPiBzcGVjaWZpY2F0aW9uIChodHRwczovL2N5Y2xvbmVkeC5vcmcv
ZG9jcy8xLjYvanNvbi8gPiAjbWV0YWRhdGFfY29tcG9uZW50X2NvbXBvbmVudHMpLgo+ID4gPiA+
PiBBIGxpc3Qgb2Ygc29mdHdhcmUgYW5kIGhhcmR3YXJlIGNvbXBvbmVudHMgaW5jbHVkZWQgaW4g
dGhlIHBhcmVudCA+PiBjb21wb25lbnQuIFRoaXMgaXMgbm90IGEgZGVwZW5kZW5jeSB0cmVlLiBJ
dCBwcm92aWRlcyBhIHdheSB0byBzcGVjaWZ5ID4+IGEgaGllcmFyY2hpY2FsIHJlcHJlc2VudGF0
aW9uIG9mIGNvbXBvbmVudCBhc3NlbWJsaWVzLCBzaW1pbGFyIHRvID4+IHN5c3RlbSDihpIgc3Vi
c3lzdGVtIOKGkiBwYXJ0cyBhc3NlbWJseSBpbiBwaHlzaWNhbCBzdXBwbHkgY2hhaW5zLgo+ID4g
Pj4KPiA+ID4gSXQgc2VlbXMgdG8gZml0IHRoZSBleHRlcm5hbC4KPiA+ID4gPiBJJ20gd29uZGVy
aW5nIGlmIHRoZSByaWdodCBwbGFjZSB0byByZWZlcmVuY2UgdGhlIGV4dGVybmFsIGlzbid0IHRo
ZSA+ICdzdXBwbGllcicgPyBBY2NvcmRpbmcgdG8gdGhlIHNwZWMgKGh0dHBzOi8vY3ljbG9uZWR4
Lm9yZy9kb2NzLzEuNi9qc29uLyA+ICNjb21wb25lbnRzX2l0ZW1zX3N1cHBsaWVyKQo+ID4gPiA+
PiBUaGUgb3JnYW5pemF0aW9uIHRoYXQgc3VwcGxpZWQgdGhlIGNvbXBvbmVudC4gVGhlIHN1cHBs
aWVyIG1heSBvZnRlbiA+PiBiZSB0aGUgbWFudWZhY3R1cmVyLCBidXQgbWF5IGFsc28gYmUgYSBk
aXN0cmlidXRvciBvciByZXBhY2thZ2VyLgo+ID4gPj4KPiA+ID4gVGhlICdyZXBhY2thZ2VyJyBw
YXJ0IGlzIHdoYXQgbWFrZXMgbWUgdGhpbmsgaXQgbWlnaHQgYmUgdGhlIHBsYWNlLiBBbmQgPiB5
b3UganVzdCBsaW5rIHRvIHRoZSAnZXh0ZXJuYWwgY29tcG9uZW50JyByZWZlcmVuY2UgaW4gdGhl
ICdib20tcmVmJyA+IHByb3BlcnR5Lgo+ID4gCj4gPiBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVh
biBoZXJlLCB3b3VsZCB5b3Ugd2FudCB0byB1c2UgInN1cHBsaWVyIiBmb3IgcGFja2FnZXMgaW4g
dGhlICJjb21wb25lbnRzIiBsaXN0IHRvIG1hcmsgdGhlIGV4dGVybmFsIHRyZWUgdGhleSdyZSBm
cm9tLCBpbnN0ZWFkIG9mIGFkZGluZyB0aGUgQlJfRVhURVJOQUxfVFJFRSBwcm9wZXJ0eT8KPiAK
PiBZZXMgZXhhY3RseSwgc29ycnkgSSBkaWRuJ3QgaW50cm9kdWNlIG15IHBvaW50Lgo+IAo+ID4g
Cj4gPiBUaGF0IGRvZXNuJ3Qgc2VlbSBmaXR0aW5nIHRvIG1lIGJlY2F1c2UgYWNjb3JkaW5nIHRv
IHRoZSBzcGVjaWZpY2F0aW9uIHRoZSBzdXBwbGllciBpcyBzdXBwb3NlZCB0byBiZSBhbiBvcmdh
bml6YXRpb24sIHdoaWNoIHRoZSBleHRlcm5hbCB0cmVlIGlzbid0LiBPZiBjb3Vyc2UgYW4gZXh0
ZXJuYWwgdHJlZSBpcyBsaWtlbHkgc3VwcGxpZWQgYnkgYW4gb3JnYW5pemF0aW9uIChvciBpbmRp
dmlkdWFsKSwgYnV0IHdlIGRvbid0IGhhdmUgdGhhdCBpbmZvcm1hdGlvbi4gSWYgd2UgaGFkIGl0
LCB3ZSBjb3VsZCBwdXQgaXQgaW50byB0aGUgInN1cHBsaWVyIiBmaWVsZCBvZiB0aGUgZXh0ZXJu
YWwgdHJlZSwgYW5kIHJlZmVyZW5jZSB0aGF0IGFzIHRoZSBwYWNrYWdlIHN1cHBsaWVyLiBCdXQg
dGhhdCB3b3VsZG4ndCBuZWNlc3NhcmlseSBiZSBhIG9uZS10by1vbmUgbWFwcGluZywgYmVjYXVz
ZSBvbmUgc3VwcGxpZXIgbWlnaHQgcHJvdmlkZSBtdWx0aXBsZSBleHRlcm5hbCB0cmVlcy4KPiAK
PiA+IAo+ID4gSSB0aGluayBpdCBjb3VsZCBiZSB1c2VmdWwgdG8gZXhwYW5kIHRoZSBjb250ZW50
IG9mIGV4dGVybmFsLmRlc2MgZmlsZXMgb3IgYWRkIGFub3RoZXIgbWV0YWRhdGEgZmlsZSB0byAo
b3B0aW9uYWxseSkgcHJvdmlkZSB0aGF0IGluZm9ybWF0aW9uLCBidXQgdGhhdCBzaG91bGQgcHJv
YmFibHkgYmUgYSBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMgaWYgd2Ugd2FudCB0byBkbyBpdC4KPiA+
IAo+ID4gSSBkb24ndCByZWFsbHkgc2VlIGFueXRoaW5nIGluIHRoZSBjb21wb25lbnQgYXR0cmli
dXRlcyB0aGF0IHNlZW1zIHRvIGZpdCB0aGUgcm9sZSBvZiBhbiBleHRlcm5hbCB0cmVlLCB0aGF0
J3Mgd2h5IEkgd2VudCB3aXRoIHRoZSBjdXN0b20gcHJvcGVydHkgKGFuZCB0aGUgcXVlc3Rpb24g
d2hldGhlciB0byByZWdpc3RlciBhIG5hbWVzcGFjZSBmb3IgQnVpbGRyb290IHByb3BlcnRpZXMg
d2l0aCBDeWNsb25lRFgpLgo+IAo+IE5vLCBJIHdvdWxkIHByZWZlciB0byBhdm9pZCBhcyBtdWNo
IGFzIHBvc3NpYmxlIGFkZGluZyBzdHVmZiB0byB0aGUgcHJvcGVydGllcwo+IGFuZCBpZiB0aGVy
ZSBhcmUgbm8gc3VpdGVkIHBsYWNlcyBtYXliZSB0cnkgdG8gYWRkIGl0IHRvIHRoZSBuZXh0IHNw
ZWMgcmVsZWFzZQo+ID8KPiAKPiA+IAo+ID4gPiBUaGlzIGlzIGFuIG9wZW4gcXVlc3Rpb24sIGJl
Y2F1c2UgSSdtIGZhY2luZyBzaW1pbGFyIGlzc3VlIHRvIGV4cHJlc3MgPiB0aGUgY29uY2VwdCBv
ZiBleHRlcm5hbCAob3IgeW9jdG8gbGF5ZXIsIG9yIG9wZW53cnQgZmVlZHMpIGluIEN5Y2xvbmVE
WC4gPiBJIHRoaW5rIHdlIGNvdWxkIGNvbnRhY3QgZGlyZWN0bHkgdGhlIHBlb3BsZSBiZWhpbmQg
Q3ljbG9uZURYIHRvIGFzayB0aGUgPiBxdWVzdGlvbi4gV2hhdCBkbyB5b3UgdGhpbmsgPwo+ID4g
Cj4gPiBUaGF0IHNlZW1zIHJlYXNvbmFibGUsIGVzcGVjaWFsbHkgd2l0aCB0aGUgcXVlc3Rpb24g
YXBwbHlpbmcgdG8gc2ltaWxhciBjb250ZXh0cyBlbHNld2hlcmUuIEl0IHByb2JhYmx5IGFsc28g
YXBwbGllcyB0byBzeXN0ZW1zIGJ1aWx0IGUuZy4gdXNpbmcgImNsYXNzaWMiIExpbnV4IGRpc3Ry
aWJ1dGlvbnMsIGlmIGV4dHJhIHBhY2thZ2UgcmVwb3NpdG9yaWVzIGFyZSBpbnZvbHZlZC4gSSdt
IG5vdCBzdXJlIHdoYXQncyB0aGUgcmlnaHQgcGxhY2UgdGhvdWdoLCBtYXliZSBhbiBpc3N1ZSBp
biB0aGUgc3BlY2lmaWNhdGlvbiByZXBvc2l0b3J5IChodHRwczovL2dpdGh1Yi5jb20vQ3ljbG9u
ZURYL3NwZWNpZmljYXRpb24pPwo+IAo+IEkndmUgc2VlbiBhIG51bWJlciBvZiBxdWVzdGlvbnMg
YXJvdW5kIHRoZSBzcGVjIGluIHRoaXMgcmVwby4gU2hvdWxkIEkgb3BlbiBvbmUKPiBvciB5b3Ug
b3BlbiBpdCA/Cj4gCj4gPiAKPiA+ID4gT3RoZXIgdGhhbiB0aGF0IHRvIG1lIHRoaXMgaXMgb2sg
dG8gYmUgbWVyZ2VkLgo+ID4gCj4gPiBUaGFuayB5b3UhIDotKQo+ID4gCj4gPiBCZXN0IHJlZ2Fy
ZHMsCj4gPiBGaW9uYQo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
