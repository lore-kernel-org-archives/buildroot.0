Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E87C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54D561038;
	Wed,  3 Jul 2024 20:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e_-MEBslAAC; Wed,  3 Jul 2024 20:45:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A520C61039
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A520C61039;
	Wed,  3 Jul 2024 20:45:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 701EC1BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E3CD845B9
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSyIQz9PggRd for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 20:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0962782049
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0962782049
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0962782049
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 20:45:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so35683305e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 13:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720039541; x=1720644341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSjKez9MqgxYdafvNVHJP4c0P7PWyvDa8pIJGl+nZl8=;
 b=Aot2pC5VvHqrETite1IBZSCdHVFNDyeJmLTP6/gB4S/WwVQ/BdywQ2ya6HsuBrJf2s
 bjWPfn+SAOON/Yy72ET13iELYK7j8WyB0TGIQtW+CAXoiNUSIc1Ct0FF7cIyhuSk8Z/d
 OLHBopScyxS5J3R8okvx7xfFjhUpZwB/UAT0Kh+JJcI+LU9gaDe1nR6zNKNEQlz/PWD7
 ULrDPbfC9jGAtFHDBj6W+3+LYGtQ52J3NVzIR0OrJ69hcKmY51RmUaICyL/fztjO3/nR
 OBq7y59sw89qKAuTjzbr8G+BA5usLVZEAoORxpdG0MEhv1jj9YOC7iyhIYHIw7w/1bfB
 uVXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+qKqBLvIzaCo+WpNCeEcreEPkKrnBe6TF+XJKxnM/IiD9ohEfmnETmKwktvhUEJRLjCsARs82uJ8dgKoUlNb6XSH9DQeQOA==
X-Gm-Message-State: AOJu0YyapE3eHUAoQVsTn+wkv/WQuKZTZxXAcEP5UvNRS0Yp18X6mTBD
 kTfCcaEe/qhE5hrDxcQ9AxO9PrjAB1BQhQ+7Vo07FSu+6xii0o6GaYNNyJa56L9p93EJ9lsjzJR
 k
X-Google-Smtp-Source: AGHT+IEtuX/n5XN0CvxIH5USGtvcN041Y91NrlU25B6vKzMmxS2pp9JJXGYfvaDQbfYbY2vPzcW8oA==
X-Received: by 2002:adf:e906:0:b0:367:92e3:9171 with SMTP id
 ffacd0b85a97d-36792e39224mr2596372f8f.19.1720039540882; 
 Wed, 03 Jul 2024 13:45:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e1412sm16701985f8f.53.2024.07.03.13.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 13:45:40 -0700 (PDT)
Message-ID: <51d28144-c39b-4533-ada6-42c5544b388c@smile.fr>
Date: Wed, 3 Jul 2024 22:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240703135820.2739707-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr, en-US
In-Reply-To: <20240703135820.2739707-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720039541; x=1720644341; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oSjKez9MqgxYdafvNVHJP4c0P7PWyvDa8pIJGl+nZl8=;
 b=3ootcKvUCjWjJVCJQ/QUUf9C+WmI8ysTjmw9RddW2KQsYxBvXA/FAF6aem60kKBN+4
 s650T9pYg32UHDPB8yeSttmWX0iV1Yegw3iZL4wE37KnG6kPeAAuapy7i6dSqNwRQgOW
 ZWOTUkG3H8coUi3qLqIQVe3xV+l9nc+atI0sc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=3ootcKvU
Subject: Re: [Buildroot] [PATCH 1/1] package/libglfw: update the patches to
 be applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwMy8wNy8yMDI0IMOgIDE1OjU4LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIGxpYmdsZncgZmFpbHMgdG8g
YnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDItc3JjLUNNYWtlTGlzdHMu
dHh0LWFsbG93LW92ZXJyaWRlLW9mLXdheWxhbmQtcGtnZGF0YS5wYXRjaCB1c2luZyBwYXRjaDoK
PiAgICAgcGF0Y2hpbmcgZmlsZSBzcmMvQ01ha2VMaXN0cy50eHQKPiAgICAgSHVuayAjMSBGQUlM
RUQgYXQgNzUuCj4gICAgIDEgb3V0IG9mIDEgaHVuayBGQUlMRUQgLS0gc2F2aW5nIHJlamVjdHMg
dG8gZmlsZSBzcmMvQ01ha2VMaXN0cy50eHQucmVqCj4gCj4gVGhpcyBjb21taXQgcmVmcmVzaGVz
IHRoZSBwYWNrYWdlIHBhdGNoIG9uIHRoZSBjdXJyZW50IHBhY2thZ2UgdmVyc2lvbi4KClRoZSBm
aXJzdCBwYXRjaCBzdGlsbCBwcm9kdWNlIDIgSHVua3Mgd2hpbGUgYXBwbHlpbmc6CgpBcHBseWlu
ZyAwMDAxLVdheWxhbmQtUmVtb3ZlLWV4dHJhLWNtYWtlLW1vZHVsZXMtZGVwZW5kZW5jeS5wYXRj
aCB1c2luZyBwYXRjaDoKcGF0Y2hpbmcgZmlsZSBDTWFrZUxpc3RzLnR4dApIdW5rICMxIHN1Y2Nl
ZWRlZCBhdCAyNDkgKG9mZnNldCA1OCBsaW5lcykuCnBhdGNoaW5nIGZpbGUgc3JjL0NNYWtlTGlz
dHMudHh0Ckh1bmsgIzEgc3VjY2VlZGVkIGF0IDQwIChvZmZzZXQgLTUgbGluZXMpLgoKSSdtIG5v
dCBzdXJlIGhvdyB3ZSBjYW4gY2F0Y2ggdGhpcyBlYXNpbHkgc2luY2UgcGF0Y2ggcmV0dXJuIHdp
dGhvdXQgZXJyb3IgZXZlbgp3aXRoIGZ1enogMC4uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KPiAtLS0KPiAgLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgLQo+ICAuLi54dC1hbGxvdy1vdmVycmlkZS1vZi13YXlsYW5kLXBr
Z2RhdGEucGF0Y2ggfCAyMCArKysrKysrKysrLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhLy5jaGVj
a3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggY2E5NGZiNTZiMDky
Li5mZTI1NDVjMTNkYjIgMTAwNjQ0Cj4gLS0tIGEvLmNoZWNrcGFja2FnZWlnbm9yZQo+ICsrKyBi
Ly5jaGVja3BhY2thZ2VpZ25vcmUKPiBAQCAtODI1LDcgKzgyNSw2IEBAIHBhY2thZ2UvbGliZnVz
ZS8wMDAxLWZpeC1hYXJjaDY0LWJ1aWxkLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNr
YWdlL2xpYmZ1c2UvMDAwMi11dGlsLXVsb2NrbWdyX3NlcnZlci1jLWNvbmRpdGlvbmFsbHktZGVm
aW5lLWNsb3NlZnJvbS1maXgtZ2xpYmMtMi0zNC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAg
cGFja2FnZS9saWJnY3J5cHQvMDAwMS1jb25maWd1cmUuYWMtYWRkLWFuLW9wdGlvbi10by1kaXNh
YmxlLXRlc3RzLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL2xpYmdsZncvMDAw
MS1XYXlsYW5kLVJlbW92ZS1leHRyYS1jbWFrZS1tb2R1bGVzLWRlcGVuZGVuY3kucGF0Y2ggbGli
X3BhdGNoLlVwc3RyZWFtCj4gLXBhY2thZ2UvbGliZ2xmdy8wMDAyLXNyYy1DTWFrZUxpc3RzLnR4
dC1hbGxvdy1vdmVycmlkZS1vZi13YXlsYW5kLXBrZ2RhdGEucGF0Y2ggbGliX3BhdGNoLlVwc3Ry
ZWFtCj4gIHBhY2thZ2UvbGliZ3Bpb2QvMDAwMS1idWlsZC1hZGQtYS1jb25maWd1cmUtc3dpdGNo
LWZvci1idWlsZGluZy1leGFtcGxlcy5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2Fn
ZS9saWJnc20vMDAwMS1NaXNjLWZpeGVzLWZyb20tQXJjaGxpbnV4LnBhdGNoIGxpYl9wYXRjaC5V
cHN0cmVhbQo+ICBwYWNrYWdlL2xpYmd0azIvMDAwMS1yZWR1Y2UtZGVwZW5kZW5jaWVzLnBhdGNo
IGxpYl9wYXRjaC5VcHN0cmVhbQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdsZncvMDAwMi1z
cmMtQ01ha2VMaXN0cy50eHQtYWxsb3ctb3ZlcnJpZGUtb2Ytd2F5bGFuZC1wa2dkYXRhLnBhdGNo
IGIvcGFja2FnZS9saWJnbGZ3LzAwMDItc3JjLUNNYWtlTGlzdHMudHh0LWFsbG93LW92ZXJyaWRl
LW9mLXdheWxhbmQtcGtnZGF0YS5wYXRjaAo+IGluZGV4IDRiY2I1ZTRlYjcwNS4uMjY4YjEyNDg1
MThiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZ2xmdy8wMDAyLXNyYy1DTWFrZUxpc3RzLnR4
dC1hbGxvdy1vdmVycmlkZS1vZi13YXlsYW5kLXBrZ2RhdGEucGF0Y2gKPiArKysgYi9wYWNrYWdl
L2xpYmdsZncvMDAwMi1zcmMtQ01ha2VMaXN0cy50eHQtYWxsb3ctb3ZlcnJpZGUtb2Ytd2F5bGFu
ZC1wa2dkYXRhLnBhdGNoCj4gQEAgLTEsNCArMSw0IEBACj4gLUZyb20gNDZhYWYyYjJiNGQzZWMy
NDBiOWFhZDE3NWJiM2VkZGI2YWUxMWVhZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJv
bSBhMmM4ODk4OGI2Y2ZlNDAyM2ZlNzhmMTM1MTliNTZhOGFjOWY1NjhiIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+ICBGcm9tOiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KPiAgRGF0ZTogRnJpLCA0IE1hciAyMDIyIDE3OjU5OjE5ICswMTAwCj4gIFN1Ympl
Y3Q6IFtQQVRDSF0gc3JjL0NNYWtlTGlzdHMudHh0OiBhbGxvdyBvdmVycmlkZSBvZiB3YXlsYW5k
IHBrZ2RhdGFkaXIKPiBAQCAtNywxNyArNywxOSBAQCBBbGxvdyB0aGUgdXNlciB0byBvdmVycmlk
ZSBXQVlMQU5EX3tQUk9UT0NPTFNfQkFTRSxDTElFTlRfUEtHREFUQURJUn0KPiAgKG5lZWRlZCB3
aGVuIGNyb3NzLWNvbXBpbGluZykKPiAgCj4gIFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC1bVXBzdHJlYW0gc3RhdHVzOiBodHRw
czovL2dpdGh1Yi5jb20vZ2xmdy9nbGZ3L3B1bGwvMjA1M10KPiArVXBzdHJlYW06IGh0dHBzOi8v
Z2l0aHViLmNvbS9nbGZ3L2dsZncvcHVsbC8yMDUzCj4gK1tEYXJpbzogbWFrZSB0aGUgcGF0Y2gg
dG8gYmUgYXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCj4gK1NpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAgLS0tCj4g
LSBzcmMvQ01ha2VMaXN0cy50eHQgfCA4ICsrKysrKy0tCj4gLSAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsgc3JjL0NNYWtlTGlzdHMudHh0IHwgNCAr
KystCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
IAo+ICBkaWZmIC0tZ2l0IGEvc3JjL0NNYWtlTGlzdHMudHh0IGIvc3JjL0NNYWtlTGlzdHMudHh0
Cj4gLWluZGV4IDAxZjE5MWM5Li40NzVjZTg4MiAxMDA2NDQKPiAraW5kZXggMjliZTY1MTVhZTU4
Li4xNzY3YjNjOGFkOGYgMTAwNjQ0Cj4gIC0tLSBhL3NyYy9DTWFrZUxpc3RzLnR4dAo+ICArKysg
Yi9zcmMvQ01ha2VMaXN0cy50eHQKPiAtQEAgLTc1LDcgKzc1LDkgQEAgaWYgKEdMRldfQlVJTERf
V0FZTEFORCkKPiAtICAgICBpbmNsdWRlKEZpbmRQa2dDb25maWcpCj4gK0BAIC00Miw3ICs0Miw5
IEBAIGVsc2VpZiAoX0dMRldfV0FZTEFORCkKPiArIAo+ICAgICAgIGZpbmRfcHJvZ3JhbShXQVlM
QU5EX1NDQU5ORVJfRVhFQ1VUQUJMRSBOQU1FUyB3YXlsYW5kLXNjYW5uZXIpCj4gICAgICAgcGtn
X2NoZWNrX21vZHVsZXMoV0FZTEFORF9QUk9UT0NPTFMgUkVRVUlSRUQgd2F5bGFuZC1wcm90b2Nv
bHM+PTEuMTUpCj4gIC0gICAgcGtnX2dldF92YXJpYWJsZShXQVlMQU5EX1BST1RPQ09MU19CQVNF
IHdheWxhbmQtcHJvdG9jb2xzIHBrZ2RhdGFkaXIpCj4gQEAgLTI2LDcgKzI4LDcgQEAgaW5kZXgg
MDFmMTkxYzkuLjQ3NWNlODgyIDEwMDY0NAo+ICArICAgIGVuZGlmKCkKPiAgIAo+ICAgICAgIG1h
Y3JvKHdheWxhbmRfZ2VuZXJhdGUgcHJvdG9jb2xfZmlsZSBvdXRwdXRfZmlsZSkKPiAtICAgICAg
ICAgYWRkX2N1c3RvbV9jb21tYW5kKE9VVFBVVCAiJHtvdXRwdXRfZmlsZX0uaCIKPiArICAgICAg
ICAgICBhZGRfY3VzdG9tX2NvbW1hbmQoT1VUUFVUICR7b3V0cHV0X2ZpbGV9LmgKPiAgLS0gCj4g
LTIuMzQuMQo+ICsyLjQzLjAKPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
