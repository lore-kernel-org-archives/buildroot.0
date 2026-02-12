Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6631EB48F8
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 10:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE1060B1F;
	Thu, 12 Feb 2026 10:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_Hp_EKhDwZ8; Thu, 12 Feb 2026 10:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 068E46071F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770892485;
	bh=wTGRY4SYVxxCSGCpX5p0iSGEWEOMnW9cJ2Z3XobSxSo=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Ct3AizHK9PULs7dB24/jFaiZUuLTGHjB/JHnp81a1XMYTf+9Yqg68N8QFJ+xI29Iq
	 WBVDa4FOZh/iKMnEGG/BZIzNw/SWRxSA1fj8XIl67e2jBEFb/mSbRBlqgFqK5yWSKX
	 AAjpsw6oL+974r1pJnMRed9K04niRQvqAzrHkvJAORFydULiY9RfI8d0rhxKNkKS/2
	 DcegWIySsFfHoMq2nRJM1FfgmgjsiwNqCpL2CZPs3EGQVXQTza2+fmfU7mxs94X7jo
	 urvJMym8Ace0HsENDt98GCZ8MrV3caKa/XZktIhaYfn5lpMWnlPBP4VXeMCQfwFd06
	 7MaXwpmyia0ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 068E46071F;
	Thu, 12 Feb 2026 10:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0000BE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A160A6071F
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1daOx8BZ_0C for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 10:34:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BABF6067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BABF6067D
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BABF6067D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:34:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-59e4a04f059so6363898e87.2
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 02:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770892479; cv=none;
 d=google.com; s=arc-20240605;
 b=Z/4lTQlqbW8kG/tF1wE7p2GwmUOPdAYTJHvif0SSTUsFG5NK5LTr/y0UaeLwVb6mqx
 Hdj1VMJdO7l+fDBmpwBq4zx8drww7it+6ylpwoYtA9B7dLwmcwZ4cSxhlpI0ojSrX0k2
 1vVi29P6IrLveoAVhNPDx5nO74W+rG0ui+tNXY0NTb1OjzSHAcoQPJqlBUDUdrcHKFyf
 nrSfrEht7FEVdl9TGauv8eAJmVTJfjw15eQY4NtYX2xNAb4nC3nb3Jvop6yKm97D6iuL
 95vvkwidxE5zMuO6XZJ/aWs8fd09K0JhQCe3REeVuGei13yD51mY7AUEIuDzCm5FWTsC
 kj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lrdHaIP3rs6X7sIXXYE/FW3nGzUKIG73V5oKzNtpRhk=;
 fh=cuRARePFhM2LoDYruCXckBW/YuO7W8mfZIN1Ih17ZmE=;
 b=hKBXlWB1N9NrJPMdIVw7UnGcJnIxm+UADbV0HisLAaHXyq7mKBAdMkPKBA7eaHJu9E
 KSJnPE35aVzE6D5mY7TwHOpL6qbEFUEpHn8MNkT+mk337HAm5hCL3lxT9Gf5BGvvB24G
 DDpCwqHKpYl15oIf6S1UPVseXJPNYlfe6yLvVHiT5gdnaLWKe6p2qakqXhVwWJ4QEsUw
 nasgwplckWyrVWpThTsdeBqOQ+AmthfSyC4FZ3BjRGSg1l8LcTkXfdXQ6wficQ2O8+gg
 cvMQ3ybpYMYBYemtD3AVcqYwZd19n0Sl+ZyEBW4swhweD+q4XLEDHq1q2K9eoaPzsXho
 pjRg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770892479; x=1771497279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lrdHaIP3rs6X7sIXXYE/FW3nGzUKIG73V5oKzNtpRhk=;
 b=foRi9r7KE0+J1QAHppUE1cBYRhsAcXRU5OYDyI3gNDPMasL7FPbSzB6GiOfUkCBp0h
 9cGyyA2r5KSvGIXxmdVyN3KsvlbQPfAZmj3V3zQpCk9iD8/r2KrtLg8hD9vDQqUr2ehY
 K9/Jq00xukdr++w0ReO1ME3dYpOpPbjRNJDiigLKwAsu7VkbD2oPFmD2rhTmmnaUfPCF
 AaYIdJOzdrrUkxldVzavSk67byMqVzWY5dF1bOn36Kd2Z54qg1YQ4jLdBw22oZ7bQ+CS
 tQb0w4f04OGHgRr3AsEeuShFM6nlUr+3AndwhP+eV2MtD11yuh/OQVxLzWzW5qaEpqK4
 u6Jw==
X-Gm-Message-State: AOJu0YzsdiEH8ukEyHMVv4SLKwoGvyq1S9tXR5iQfaPKg/PBY1Eil/93
 8ULwXAAcPh4FO57SgTRqcTAdBUASzKqAIzpZW5yRXR9rrXc/vmWGlNlPj+USt7WKtdOMYE3Q2/2
 dM9tWGIL5jkj8XiEarfTLKhFIHYsWuy7W8A==
X-Gm-Gg: AZuq6aKk4PFsT/AJlYkVqUXw3tfJcEB5/MKWv5PI2+VMBAm7mv7iUyePDFB8jKTtU0F
 9pb+1BVNS+OswkXhu15ezZe2xflBTj0LKyoRmXbMtSzj2Mj79zsudqskP+9L++jnqgkJwGcW5ug
 m4lIfKAhDSiA0DL2O9OTp3/Mv3qy9Huc7oc18MOk0rpD0DmS2QF8yTwhJO5Gjvl2aIDnRGEd1YV
 WaokrYfXcxsyMaoia8i+AVIGfyZFxCEylxZBPeokGdew8WZwtsCeGFFoNSrmlC9oWndoNHxXdFs
 wcO0pbwJ
X-Received: by 2002:a05:6512:a8e:b0:59e:459d:cc31 with SMTP id
 2adb3069b0e04-59e64018373mr811351e87.17.1770892479328; Thu, 12 Feb 2026
 02:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20250829110455.2608767-1-yegorslists@googlemail.com>
In-Reply-To: <20250829110455.2608767-1-yegorslists@googlemail.com>
Date: Thu, 12 Feb 2026 11:35:15 +0100
X-Gm-Features: AZwV_QgTl7SRXdtKwkQSNgUFO8OPk3Wm1uILvbMMZzcyIAiMVmO04umr13QGwOQ
Message-ID: <CAGm1_kurd8N1Or6vhts-5QGgXg9ALo3NA2e_dZCVz19bNnVbmA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1770892479; x=1771497279; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrdHaIP3rs6X7sIXXYE/FW3nGzUKIG73V5oKzNtpRhk=;
 b=gqkgYMyHxfZp0/oMTFlxHry6trQOezjsbP3dzygZ6/gT/cWmqqZmcq/FTXNNAuw7af
 5dfsVR0UeSoqOL4lE5C7ZC0akHmJ7J+SK1pDqDMHr46fYg99tYrOBNhv9iblAjEL/HlO
 E4rL7T7r3yt6+GMWbAG3y5XNi6BjAfiZPbwl4tJIGGe1zNIDh2SkBrWUNHDPb3ffxDk3
 ktgQRa7mY9WbAQo7n64V+FNWXuVlgwc285kDqqGWq/9mleVgTNq2uIzDILtms2pHAUHN
 +4LtAh++IRaJZ16U8Rt0nCTRFXc2Oc3agFUNtMgmZcxWl6ciskUxz3xTlyPvrvqtbGze
 NO8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gqkgYMyH
Subject: Re: [Buildroot] [PATCH] package/libftdi1: enable static only build
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gRnJpLCBBdWcgMjksIDIwMjUgYXQgMTowNeKAr1BNIDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+Cj4KPiBsaWJmZHRpMSBwcm92aWRlcyBjb25maWd1cmF0aW9uIG9w
dGlvbnMgU0hBUkVETElCUyBhbmQgU1RBVElDTElCUwo+IHRoYXQgYWxsb3cgYW55IGNvbWJpbmF0
aW9uIG9mIHN0YXRpYy9zaGFyZWQgbGlicmFyaWVzLgo+Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2Q3YjlhNDVjY2ZmYzFjOWUzZmQ3OTZjM2U0NmVl
Mzk2YjdkODgyNzIvCj4KPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbGliZnRkaTEvbGliZnRkaTEubWsg
fCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYmZ0ZGkxL2xpYmZ0ZGkxLm1rIGIvcGFja2FnZS9saWJmdGRpMS9s
aWJmdGRpMS5tawo+IGluZGV4IDMxZmZhMWFjYTMuLjA1OTVjY2Y5NjMgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9saWJmdGRpMS9saWJmdGRpMS5tawo+ICsrKyBiL3BhY2thZ2UvbGliZnRkaTEvbGli
ZnRkaTEubWsKPiBAQCAtMTMsNiArMTMsMTQgQEAgTElCRlRESTFfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UgQ09QWUlORy5MSUIKPiAgTElCRlRESTFfQ09ORklHX1NDUklQVFMgPSBsaWJmdGRpMS1j
b25maWcKPiAgTElCRlRESTFfQ09ORl9PUFRTID0gLURET0NVTUVOVEFUSU9OPU9GRiAtREVYQU1Q
TEVTPU9GRgo+Cj4gK2lmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ICtMSUJGVERJMV9DT05G
X09QVFMgKz0gLURTVEFUSUNMSUJTPU9OIC1EU0hBUkVETElCUz1PRkYKPiArZWxzZSBpZmVxICgk
KEJSMl9TSEFSRURfTElCUykseSkKPiArTElCRlRESTFfQ09ORl9PUFRTICs9IC1EU1RBVElDTElC
Uz1PRkYgLURTSEFSRURMSUJTPU9OCj4gK2Vsc2UKPiArTElCRlRESTFfQ09ORl9PUFRTICs9IC1E
U1RBVElDTElCUz1PTiAtRFNIQVJFRExJQlM9T04KPiArZW5kaWYKPiArCj4gIGlmZXEgKCQoQlIy
X1BBQ0tBR0VfTElCRlRESTFfTElCRlRESVBQMSkseSkKPiAgTElCRlRESTFfTElDRU5TRSArPSAs
IEdQTC0yLjAgd2l0aCBleGNlcHRpb24gKGxpYmZ0ZGlwcDEpCj4gIExJQkZUREkxX0xJQ0VOU0Vf
RklMRVMgKz0gQ09QWUlORy5HUEwKCkdlbnRsZSBwaW5nLgoKVGhhbmtzLgoKQ2hlZXJzLApZZWdv
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
