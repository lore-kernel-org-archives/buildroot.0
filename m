Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE5CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 17:09:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 625C260FDA
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 17:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 625C260FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 237D140476;
	Sat, 11 Sep 2021 17:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdTzKTpmnKD6; Sat, 11 Sep 2021 17:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F6B3401C3;
	Sat, 11 Sep 2021 17:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71F2E1BF2CA
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 17:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DFC0401C3
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 17:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuIGO5OxD65f for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 17:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 506AC40018
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 17:09:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ED2B3B0056A;
 Sat, 11 Sep 2021 19:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631380139;
 bh=UMGz+7sWScmkByHF+SBqQLobW1+SA+m4EuA1Fk0ePUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kM7h4zB3rMMsT+kvhjFVB4ViDxG4VEwYmWkLef9KeRxKvZbhXOIlEnztyg33GZln5
 DZtafoT8wnw5sRJPjdGYecYtzhZ0iejMFop7RLhwmkMcRkuBRZaq4xebTZnBjGAPTK
 9IQncxLRG8a0VUp80OLIu+HCwR9c2kKsn17Ijcpu3A4fUDfsDSU7NG081jKQFxwVey
 /exhPhLSDsBhvsH0o4+QP5oj6LbkD3u+2qaTkIIO0REmiDcDClLQfWKhTtFBRhq4c3
 vMA5n+Ipxk8UL84evGGWfouHXS9Iqw2gsPuNvwfPIRgnAGlay5ORkIGMKupr/8XPyU
 TWU0a4VrZER7A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 19:08:54 +0200
Date: Sat, 11 Sep 2021 19:08:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911170854.GT1053080@scaer>
References: <20210904223115.545819-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210904223115.545819-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: fix build with glibc
 >= 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOS0wNSAwMDozMSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGds
aWJjID49IDIuMzQ6Cj4gCj4gLi4vZ2xpYi9nc3Bhd24uYzogSW4gZnVuY3Rpb24gJ3NhZmVfY2xv
c2Vmcm9tJzoKPiAuLi9nbGliL2dzcGF3bi5jOjE0OTc6NzogZXJyb3I6IHRvbyBmZXcgYXJndW1l
bnRzIHRvIGZ1bmN0aW9uICdjbG9zZV9yYW5nZScKPiAgMTQ5NyB8ICAgaWYgKGNsb3NlX3Jhbmdl
IChsb3dmZCwgR19NQVhVSU5UKSAhPSAwICYmIGVycm5vID09IEVOT1NZUykKPiAgICAgICB8ICAg
ICAgIF5+fn5+fn5+fn5+Cj4gCj4gRml4ZXM6Cj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvY2JjMDkxM2ZhMmNjNDg2ZGViNjRiMDdiNWIxMzM0MWE1YTk3MDI1ZQo+
IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9S
SU4uCgo+IC0tLQo+ICAuLi50bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0
Y2ggfCAzMyArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmdsaWIyLzAwMDQtY29ycmVj
dGx5LXVzZS0zLXBhcmFtZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNoCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGliZ2xpYjIvMDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3It
Y2xvc2VfcmFuZ2UucGF0Y2ggYi9wYWNrYWdlL2xpYmdsaWIyLzAwMDQtY29ycmVjdGx5LXVzZS0z
LXBhcmFtZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi5iZmNhNGIxNGVmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2UvbGliZ2xpYjIvMDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2Vf
cmFuZ2UucGF0Y2gKPiBAQCAtMCwwICsxLDMzIEBACj4gK0Zyb20gYjcxMTE3ZDg5NDM0ZGI4M2Qz
NGJjMWI5ODFjYTAzZDRiZTI5OTU3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KPiArRGF0ZTogVGh1LCA4IEp1bCAyMDIxIDE3
OjI2OjQzIC0wNzAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gY29ycmVjdGx5IHVzZSAzIHBhcmFtZXRl
cnMgZm9yIGNsb3NlX3JhbmdlCj4gKwo+ICtsaWJjIGltcGxlbWVudGF0aW9uIGhhcyAzIHBhcmFt
ZXRlciBlLmcuCj4gK2h0dHBzOi8vd3d3LmZyZWVic2Qub3JnL2NnaS9tYW4uY2dpP3F1ZXJ5PWNs
b3NlX3JhbmdlJnNla3Rpb249MiZmb3JtYXQ9aHRtbAo+ICsKPiArU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KPiArCj4gK1tSZXRyaWV2ZWQgZnJvbToKPiAraHR0
cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9jb21taXQvYjcxMTE3ZDg5NDM0ZGI4
M2QzNGJjMWI5ODFjYTAzZDRiZTI5OTU3Nl0KPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gKy0tLQo+ICsgZ2xpYi9nc3Bhd24u
YyB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ICsKPiArZGlmZiAtLWdpdCBhL2dsaWIvZ3NwYXduLmMgYi9nbGliL2dzcGF3bi5jCj4gK2lu
ZGV4IDg5OTY0N2MyZi4uMzA3M2ExMGE0IDEwMDY0NAo+ICstLS0gYS9nbGliL2dzcGF3bi5jCj4g
KysrKyBiL2dsaWIvZ3NwYXduLmMKPiArQEAgLTE1MjAsNyArMTUyMCw3IEBAIHNhZmVfY2xvc2Vm
cm9tIChpbnQgbG93ZmQpCj4gKyAgICAqCj4gKyAgICAqIEhhbmRsZSBFTk9TWVMgaW4gY2FzZSBp
dOKAmXMgc3VwcG9ydGVkIGluIGxpYmMgYnV0IG5vdCB0aGUga2VybmVsOyBpZiBzbywKPiArICAg
ICogZmFsbCBiYWNrIHRvIHNhZmVfZmR3YWxrKCkuICovCj4gKy0gIGlmIChjbG9zZV9yYW5nZSAo
bG93ZmQsIEdfTUFYVUlOVCkgIT0gMCAmJiBlcnJubyA9PSBFTk9TWVMpCj4gKysgIGlmIChjbG9z
ZV9yYW5nZSAobG93ZmQsIEdfTUFYVUlOVCwgMCkgIT0gMCAmJiBlcnJubyA9PSBFTk9TWVMpCj4g
KyAjZW5kaWYgIC8qIEhBVkVfQ0xPU0VfUkFOR0UgKi8KPiArICAgKHZvaWQpIHNhZmVfZmR3YWxr
IChjbG9zZV9mdW5jLCBHSU5UX1RPX1BPSU5URVIgKGxvd2ZkKSk7Cj4gKyAjZW5kaWYKPiArLS0g
Cj4gK0dpdExhYgo+ICsKPiAtLSAKPiAyLjMzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
