Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0434C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 00:11:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEB45610A2
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 00:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEB45610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B529640691;
	Wed, 20 Oct 2021 00:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzFqZmzNQyY4; Wed, 20 Oct 2021 00:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109A3405F7;
	Wed, 20 Oct 2021 00:11:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E33DC1BF285
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 00:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEC384010A
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 00:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjhjwEXrSvFH for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 00:11:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA89F400F1
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 00:11:24 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id czBkmS0KuXRKtczCWm4rnK; Wed, 20 Oct 2021 02:11:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634688684; bh=sZXHgvgpMuRIDlGBuyTAJ6VDxI/yJLHNAn3nrWnuYQw=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=RHjEOSLJn/D8Mgb+De16f8RjqKT7a04aCexcmfEdRhXESCFzhvucFkbwGwkf+q5Vi
 Fw6vUrc6UqqMTO1GL7P4EQG2Vx2lN05c++ra/LRF6VmZPAL+PVqrlQRpQOWkDxwl26
 7m8AdZcLd+G9Kh2gjsEznLMcWyP7lhxTFHfqQkg4LHAD2XzNOxkQpnd0Z058yMkwLO
 8YWsGlMeNnY2a7vaN1KM16mQX9GZPljriZaqzIbDUfp+PUPni6IlkoJJBBIsBSlFWc
 PPQK72s02zf8I7X50RaWK4oOoUSiZu52255dSuiz7fBnH8TFWvPCmxkCIwq2HT2UrQ
 J3A8GCTR8zLmQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 20 Oct 2021 02:11:24 +0200
Message-Id: <09658CF6-9EBF-487E-8FC3-EC67305CFFD1@benettiengineering.com>
References: <20211013191838.1560429-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20211013191838.1560429-1-giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfLCEt7AUeTcbAGOPOy6K13sLTMnwSas+QhnxWbDZhhv6BEPJ2uOoObbjZIxsNHFtLYMS4QnODtUlJUNCCvU2jw/ohwwwczJ14D8ZDdS6naduYiNS5YAm
 qnDRBT9zjEjFlKMfDuONmLU23sjYQUEi4YOplkZK+CkVWQOs+xC0sWS9v+Lt36gbFGeFKLf4vv0CP1Y60lCK/azH2QV46sqQnfWvTQ6zWnbHPnNq7jcdNQVb
 LExecnG34ZAM9dUZUg0faw==
Subject: Re: [Buildroot] [PATCH] configs/asus_tinker_rk3288: bump to Linux
 kernel 5.14 and u-boot 2021.10
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDEzIG90dCAyMDIxLCBhbGxlIG9yZSAyMToxOCwgR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhhIHNjcml0dG86Cj4gCj4g
77u/VGhpcyBidW1wcyB0byBsaW51eC9saW51eC1oZWFkZXJzIDUuMTQgYW5kIHUtYm9vdCB2ZXJz
aW9uIDIwMjEuMTAuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gY29uZmlncy9hc3VzX3Rpbmtl
cl9yazMyODhfZGVmY29uZmlnIHwgOCArKysrLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXN1c190
aW5rZXJfcmszMjg4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXN1c190aW5rZXJfcmszMjg4X2RlZmNv
bmZpZwo+IGluZGV4IGU5NWExOWE3NTcuLjlmNGE5NTlhMDYgMTAwNjQ0Cj4gLS0tIGEvY29uZmln
cy9hc3VzX3Rpbmtlcl9yazMyODhfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9hc3VzX3Rpbmtl
cl9yazMyODhfZGVmY29uZmlnCj4gQEAgLTMsMTQgKzMsMTQgQEAgQlIyX2FybT15Cj4gQlIyX2Nv
cnRleF9hMTc9eQo+IEJSMl9BUk1fRlBVX05FT05fVkZQVjQ9eQo+IAo+IC0jIExpbnV4IGhlYWRl
cnMgc2FtZSBhcyBrZXJuZWwsIGEgNS4wIHNlcmllcwo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVY
X0hFQURFUlNfQ1VTVE9NXzVfMD15Cj4gKyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwg
YSA1LjE0IHNlcmllcwo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVf
MTQ9eQo+IAo+ICMgQm9vdGxvYWRlcgo+IEJSMl9UQVJHRVRfVUJPT1Q9eQo+IEJSMl9UQVJHRVRf
VUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQo+IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZF
UlNJT049eQo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDE5LjAx
Igo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIxLjEwIgo+IEJS
Ml9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJ0aW5rZXItcmszMjg4Igo+IEJSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfRFRDPXkKPiBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQo+
IEBAIC0yMiw3ICsyMiw3IEBAIEJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InNwbC91LWJvb3Qt
c3BsLWR0Yi5iaW4iCj4gIyBLZXJuZWwKPiBCUjJfTElOVVhfS0VSTkVMPXkKPiBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0iNS4wIgo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1
LjE0IgoKU2FtZSBhcyBWeWFzYToKCkhlcmUgXl5eIEkgbmVlZCB0byBwYXNzIGxhdGVzdCBzdGFi
bGUgNS4xNC4xMyBub3Qgb25seSA1LjE0CgpTbyBJ4oCZbSBnb2luZyB0byBzZW5kIGEgdjIgcGF0
Y2hzZXQKCj4gQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9Im11bHRpX3Y3Igo+IEJSMl9MSU5V
WF9LRVJORUxfVUlNQUdFPXkKPiBCUjJfTElOVVhfS0VSTkVMX1VJTUFHRV9MT0FEQUREUj0iMHgw
MjAwMDAwMCIKPiAtLSAKPiAyLjI1LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
