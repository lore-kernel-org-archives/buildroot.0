Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAA1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 22:18:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B476139E
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 22:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70B476139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0DBF400D8;
	Sun,  7 Nov 2021 22:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3COY08FLuG6z; Sun,  7 Nov 2021 22:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFF1D401F7;
	Sun,  7 Nov 2021 22:18:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90A3D1BF2E4
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 22:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E1A401F7
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 22:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIaeB8oRd3HN for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 22:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24A30400D8
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 22:18:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 133so11572058wme.0
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 14:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tjoUaMsY/8G72B5HTeG54IWZabIS0LeAcV/3UmAJuS8=;
 b=JMSxxX+163nJlKB6hy2HPy3l4bppB2hhOWOlAucgHuPDXqbnRvPkO3DB6TDRZbeB3n
 5Btvf/xKLX+HZ8HTEOew9zENOh8w1sU4F5Tf5L+OJaHmHuyTwbsKbbHGXuVwZ0hRXspv
 IYORNOo6MHdSA2NnNDKHdgePXeC/FeiZ1LSddmcoaCB5i7bhwI3z6IPIWHLf13Y8Axud
 t6Zm3HzgwE9muYtx82Z/H5jdgLFiJDd7nod5aT1tJVIVQTIiApmz8VCdhzpJkr7sWxse
 8y7kHxzSg2464fH9nCukbAhS199wsqdX5Nv8suMSv9ua0MiJjeBV8D7hlY3UCVaOyRam
 frfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tjoUaMsY/8G72B5HTeG54IWZabIS0LeAcV/3UmAJuS8=;
 b=qlN4YlQJ73mWxnHEcs/U2rNTcIhOykNRJoepu3LJjlDRxA3pht8jG3wIH0vTauWDlI
 m3mqttyczh0GZsL8LyzZDdN0/n7dPGQnCtTj+9YVM1Gs4gRIO//pnlSLnurujVpUHnCK
 z42EwSF7wAS2EB2otoIX8nYBr+GzYSmG+cZVfBK+e67MsGgOqBx0azVhqqx2TegbI8Eq
 cfgtFpucTugBkX+Q8EGxVq3vkH6UF9zS/Akl9EBrMkYi0NrIxHtQ0bwekdvXePEiQZom
 M1Jhj2Iwy7AKx7P3g5pWuhn2ihR56Yndrj7oqK67L6Uc5BSJ+ONj+0k0H4zUPK2FzmhF
 0SHA==
X-Gm-Message-State: AOAM530ck3zYB2CLC55Qkj+71gHxqN/7XUIInRz//z1KK2JhuNxDQV+P
 JleI0KGCPvwK9qRM8feYlDlqqQz/xQ4=
X-Google-Smtp-Source: ABdhPJyWA0jc79rVr6rcnGCCSuXd8gsxMVU1QYd2BJJNZ85vN/jrJ9y7Tozb+IoQGgwiLdBTH1kd7w==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr44555128wml.85.1636323507225; 
 Sun, 07 Nov 2021 14:18:27 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id a1sm17125004wri.89.2021.11.07.14.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 14:18:26 -0800 (PST)
Message-ID: <68856fe0-0e5d-59a3-679b-b49f6143fccc@gmail.com>
Date: Sun, 7 Nov 2021 23:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "D. Olsson" <hi@senzilla.io>
References: <20211107192930.370979-2-romain.naour@gmail.com>
 <D547813E-CD39-4BD6-A55E-0EF27D954E37@senzilla.io>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <D547813E-CD39-4BD6-A55E-0EF27D954E37@senzilla.io>
Subject: Re: [Buildroot] [PATCH 2/2] configs/qemu_aarch64_sbsa_defconfig:
 add gitlab runtime testing tag
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGljaywKCkxlIDA3LzExLzIwMjEgw6AgMjI6MzEsIEQuIE9sc3NvbiBhIMOpY3JpdMKgOgo+
IEhpIFJvbWFpbiwKPiAKPj4gT24gNyBOb3YgMjAyMSwgYXQgMjA6MjksIFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IO+7v0VuYWJsZSB0aGUgcnVudGlt
ZSB0ZXN0aW5nIGJ5IGFkZGluZyB0aGUgdGFnIGluIHRoZSByZWFkbWUudHh0Cj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4gQ2M6IERp
Y2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KPj4gLS0tCj4+IFRoZSBnaXRsYWIgam9iIG5lZWRz
IG1vcmUgdGhhdCAzaCB0byBidWlsZCBhbmQgZXhlY3V0ZSB0aGUgdGVzdDoKPj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE3NTU4OTkxNTQKPj4gVGVzdGVkIGxv
Y2FsbHkgdXNpbmcgdGhlIEJ1aWxkcm9vdCBkb2NrZXIgaW1hZ2UuCj4+Cj4+IEknbSBub3Qgc3Vy
ZSBhYm91dCB0aGUgY29tbWVudCBhYm91dCBTZWFCSU9TIHBhY2thZ2UsIHRoZSB0ZXN0IHdvcmtz
Cj4+IGZpbmUgd2l0aCB0aGUgY3VycmVudCBob3N0LXFlbXUgKDYuMS4wKS4KPiAKPiBSaWdodCwg
aG9zdC1xZW11IHdvcmtzIGdyZWF0ISBNeSBDSSBzZXR1cCBoYXMgdG8gcmVseSBvbiBxZW11IHBh
Y2tlZCBieSBEZWJpYW4sIGhvd2V2ZXIuIEFuZCBpZiBJIHJlY2FsbCBjb3JyZWN0bHkgSSByYW4g
aW50byBzb21lIGRpc3BsYXkgb3IgVkdBIHJlbGF0ZWQgaXNzdWVzIHdpdGggcWVtdSBmcm9tIERl
YmlhbiBmb3IgdGhlIHNic2EgbWFjaGluZS4gSXQgd2FzIHJlc29sdmVkIGJ5IGluc3RhbGxpbmcg
c2VhYmlvcyBiZWNhdXNlIGl0IGFkZHMgc29tZSBkcml2ZXJzIHRvIHFlbXUuCgpJbmRlZWQsIHRo
ZSBob3N0LXFlbXUgaXMgbWlzc2luZyBzb21lIGltcG9ydGFudCBmZWF0dXJlcyAobGlrZSB0aGUg
Z3JhcGhpYwpzdXBwb3J0KSBiZWNhdXNlIGl0IHdvdWxkIHJlcXVpcmUgdG8gZW5hYmxlIGhvc3Qg
dmFyaWFudCBmb3Igc29tZSBwYWNrYWdlcyAobGlrZQpzZGwyKS4KCj4gCj4gSXQncyBwcm9iYWJs
eSBhIGdvb2QgaWRlYSB0byBsZWF2ZSB0aGUgY29tbWVudCB0aGVyZSBmb3Igb3RoZXJzIHdobyBt
aWdodCBydW4gaW50byB0aGUgc2FtZSBpc3N1ZS4KT2sgdG8gbGVhdmUgdGhlIGNvbW1lbnQgYXMg
aXMuCgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4+
IC0tLQo+PiBib2FyZC9xZW11L2FhcmNoNjQtc2JzYS9yZWFkbWUudHh0ICB8IDIgKy0KPj4gY29u
Zmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcgfCA0ICsrLS0KPj4gMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9i
b2FyZC9xZW11L2FhcmNoNjQtc2JzYS9yZWFkbWUudHh0IGIvYm9hcmQvcWVtdS9hYXJjaDY0LXNi
c2EvcmVhZG1lLnR4dAo+PiBpbmRleCBiNjI5NDdmNTVmLi5jZjVmNjZkNGQ2IDEwMDY0NAo+PiAt
LS0gYS9ib2FyZC9xZW11L2FhcmNoNjQtc2JzYS9yZWFkbWUudHh0Cj4+ICsrKyBiL2JvYXJkL3Fl
bXUvYWFyY2g2NC1zYnNhL3JlYWRtZS50eHQKPj4gQEAgLTIzLDcgKzIzLDcgQEAgUnVuIHRoZSBl
bXVsYXRpb24gd2l0aDoKPj4gICAgIC1ub2dyYXBoaWMgXAo+PiAgICAgLXBmbGFzaCBvdXRwdXQv
aW1hZ2VzL1NCU0FfRkxBU0gwLmZkIFwKPj4gICAgIC1wZmxhc2ggb3V0cHV0L2ltYWdlcy9TQlNB
X0ZMQVNIMS5mZCBcCj4+IC0gICAgLWhkYSBvdXRwdXQvaW1hZ2VzL2Rpc2suaW1nCj4+ICsgICAg
LWhkYSBvdXRwdXQvaW1hZ2VzL2Rpc2suaW1nICMgcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmln
Cj4+Cj4+IE5vdGUgdGhhdCBpZiB5b3Ugd2FudCB0byBydW4gc2JzYS1yZWYgZW11bGF0aW9uIHdp
dGggUUVNVSBwcm92aWRlZCBieQo+PiB5b3VyIGRpc3RybyAoaS5lLiwgbm90IGhvc3QtcWVtdSBi
eSBCdWlsZHJvb3QpIHRoZW4geW91IG1heSBuZWVkIHRvCj4+IGRpZmYgLS1naXQgYS9jb25maWdz
L3FlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2Ff
ZGVmY29uZmlnCj4+IGluZGV4IGQxZTBhZGFkZDEuLmU3ZDNiZDAzY2EgMTAwNjQ0Cj4+IC0tLSBh
L2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3MvcWVt
dV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnCj4+IEBAIC0xNiw4ICsxNiw4IEBAIEJSMl9UQVJHRVRf
Uk9PVEZTX0VYVDJfND15Cj4+IEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTI4TSIKPj4K
Pj4gIyBJbWFnZQo+PiAtQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcWVtdS9h
YXJjaDY0LXNic2EvYXNzZW1ibGUtZmxhc2gtaW1hZ2VzIHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFn
ZS5zaCIKPj4gLUJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvcWVtdS9hYXJj
aDY0LXNic2EvZ2VuaW1hZ2UuY2ZnIgo+PiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0i
Ym9hcmQvcWVtdS9wb3N0LWltYWdlLnNoIGJvYXJkL3FlbXUvYWFyY2g2NC1zYnNhL2Fzc2VtYmxl
LWZsYXNoLWltYWdlcyBzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4+ICtCUjJfUk9PVEZT
X1BPU1RfU0NSSVBUX0FSR1M9IiQoQlIyX0RFRkNPTkZJRykgLWMgYm9hcmQvcWVtdS9hYXJjaDY0
LXNic2EvZ2VuaW1hZ2UuY2ZnIgo+Pgo+PiAjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwK
Pj4gQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKPj4gLS0gCj4+
IDIuMzEuMQo+IAo+IExvb2tzIGdvb2QhCj4gCj4gUmV2aWV3ZWQtYnk6IERpY2sgT2xzc29uIDxo
aUBzZW56aWxsYS5pbz4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
