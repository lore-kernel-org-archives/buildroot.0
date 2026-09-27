Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29807C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 09:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9CC8101D;
	Sun, 27 Sep 2026 09:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FS3QHEbUIyFi; Sun, 27 Sep 2026 09:17:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4EC2580F62
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790500665;
	b=qUiv6VE/kTn79PuJIDQNTg3lrFuRlH4mNxKXKzimDCwEJ77nYqpk8FZztSrh9LZAd2Sr
	 BFCnl4Ov4VCSItZ2VcNBC8ickVeygNVZvI7tJBQhuKdDMhtHelFjvZMwAp0h5p8GDyV5b
	 yraVrSvGInbNdWhNGI14QhatuNVV9C8ML75OKPZyhM9LJfkY29BEn+4codiDmc0MaB2gE
	 99fpQBUsi7TzTm/M/CAKoFACCEPSNBq8bBVH0hhMM8MPg3WTOmhzAX4QE91OUzqyn4IPl
	 UyqPxD6UTOzMzFpNtg2+rYsCqFOlltrpejIr8ZapYY0QiZrBWxUwoEkuIxgeS517Esg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790500665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/BfhA//DQAzEn5/UwHkkAUMFcdI0kbVNMOwREeCfhnE=;
	b=bhXvh9VI0P8MEMG8qcgzJaIPShJ7quvxABPFMwL5D6w2pJmOqDF0pDIja894xLkgHz87
	 pNV6HLaWxNxruGWU4bqdwbOqFM8W5JZwbwSrWy5FjJhILXWuF3MwH9W+aGSHUvhrqcrG0
	 i0/HZ/DI7JFoGYk2QMij/j3+mwi3syXSdJtlcLu2lS6qsQHuHviAanatAEt/owlFeMhVy
	 uCVk0Qen/r8Y1lYYubGuLFeGO3JrvrJt1xVVHVBdu3g7/ENS2s1zCiHFG+embAS84150u
	 hpjjp5tMCpsNnWZKtVIpuhGd0cO4u2hnbGn6tiafAhSzalDy/hN4sDuC1lW+Zvp+fVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790500665;
	bh=/BfhA//DQAzEn5/UwHkkAUMFcdI0kbVNMOwREeCfhnE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PI1lBmcAx89ONY9oSKmx4bVrfaJUwdQJhdDNXq7wf0PM8KmalimXe2d+6gKEVPCcY
	 9tH5jPPOVlOmzOZYU0QVSDTsGy1h5+W3hcZe6n3bHIlGonojoG1b6tAzFsVFZm+j+d
	 XuC2w68SH/7kJBymHDlyBjrJ4joBWe+wzJgaYqqNyAzYbr23+LFWqsQtIVTfuoxwNE
	 SRJt6bkyR9JtXikDtvWJ2ZnRL3F9rejG66d3IDWhPbv+BfB50Yg0W1B8xr4OoeZlgH
	 yeApJ+0AIY7ElYvafciA5DgWxBwpgW8FeTuDMG7BKKAAVxXQEXxOkaAVDCCYhC0He0
	 TjGEGNoy6K54w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC2580F62;
	Sun, 27 Sep 2026 09:17:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1760335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 09:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C760D404D0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 09:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLhdHneyewPl for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 09:17:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 22736404EC
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790500662;
 b=Tf2DlDCCUcyc1OLorN03tf73LN19QH3PtxMZ4qpGhzm9F5qJOYl56uNuN5dc9UKwzIuW
 Vh677FW5aMiD/g6GVj4MPckAwOClD/SJnz32f2/fOuru8aAquUZhiVMo6W4kDDXuIPBEy
 2dHKwOHjiiG98ZUE+Rh9KePIjO8gg9SI0MR7CO3rlYVm7bIoRXd0fqmgWIHh33RyW27/w
 3qyzipshfJQT6kmHY3WoAt6Q1RvPNMnx2sUYkv90P5k8+VOyIjMwdtXEwzzh9pThlvaw5
 yuRC7OMC07AI8J/toOig3voqVaT32CB2Tqm4hhP53ymVgkweqaUkWwRh+9EVVvpXZSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790500662;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=z0Hw5O3sCXwOw276aIg2pAH4UArhWy4SzwDhmNDRLXI=;
 b=EksTZGH0Zencb8EQxwqG7CwLI/eNPvslwpegp4oZYoM2BGcVxiLX4vveZusEjlz8A4Sr
 BI0pU0LHWvs0NsWT2pkvV/oKuf+TFSHBbcuz/L9ptpwG3R53kXg44CNDgdd0GbGD2gPtu
 R7D4YK6u0qSK2A1e+cyD6FbCLSKYOGTVkE6dKtavTU+anaaLFnlaoqZI/FVTQvBIZD6HC
 At14OPREejDkXU0K+1Xn1t9QqY2F5w1X5HAdqq93cu8KtuW415uCLeKYtpEH7uItjzwgG
 Rs4SD4r8UpC4otM51VuSrh92QLABgatVrgC073xztd0T7OfZWA0wiisOqIwr7br0oRg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=FZja3BHa; 
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FZja3BHa
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22736404EC
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 09:17:39 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Al0px1UlpxUh5Al0qxECfE; Sun, 27 Sep 2026 11:17:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790500656; bh=E98+6iM7NAV3X/8xPW8uZCremyL7e41frYgoezXiROQ=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=FZja3BHaPu3INEp6Qku9FnQo1e5Hp/j1+DIoUm4MZJfejx2nx5x//+AHFDUMHqFYs
 irx6a3y4uM+WOWwx6c+jGo4tNQq0NQ/2F8p0WZ3jCQvcKO8u/1Rfwz1WgMIAkg1BVD
 nK4fhIt8whIF2cnQIOtvKnojKwAwyL5CexOaixUOBIzhptDKlveOxeAdPzXKC5x8Xk
 Xw9jt9Qi1egbkV53zJmfTycD/VkYqNad/zcuxJFMDJXMUamo/6hOaQsJSYjpXsLMUQ
 VBYJmTLOG40lNoTKLxmMIslG6KMXiRotp4myI9CB3WqyUsB/9rf+klfNPULALtwRMm
 3KLWzV48WiT8g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 27 Sep 2026 10:53:08 +0200
Message-ID: <20260927085308.2871714-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIGEDD/MwxHe34a/1O4ThArIo1Tj28lz4SSlaTD7hw8RX+xyADuhKCwaZumcVbrzclMllj/UB75DE9pWC3e1ieocM0l1r9y2Ew/ncpGpFjJ7+y6JD6nR
 M+y0pHKyCdSaOslwJjyblcAfJ2U5YrX1udr3JM/ytcGm/8+2Ms0UAVDASACx8YzY+m82b5iMvsmRD+bUF4vWDsE+OMzMevJw04GjHH818+qYv+llxb9eX5FB
 Z6cvpwX8fuNCuHW40nOvHejFF4ClpBQPRt9M2bVT0cc=
Subject: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.19
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6CgotIHducGEtc2VjLTIwMjYtOTMg
wrcgU0NUUCBwcm90b2NvbCBkaXNzZWN0b3IgY3Jhc2guCiAgaHR0cHM6Ly93d3cud2lyZXNoYXJr
Lm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTkzCiAgQ1ZFLTIwMjYtOTUzODkuCgotIHducGEt
c2VjLTIwMjYtOTYgwrcgSUVFRSBDMzcuMTE4IFN5bmNocm9waGFzb3IgcHJvdG9jb2wgZGlzc2Vj
dG9yCiAgbWVtb3J5IGxlYWsuCiAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93
bnBhLXNlYy0yMDI2LTk2CiAgQ1ZFLTIwMjYtOTUzOTUuCgotIHducGEtc2VjLTIwMjYtOTcgwrcg
U1BEWSBwcm90b2NvbCBkaXNzZWN0b3IgY3Jhc2guCiAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9y
Zy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTk3CiAgQ1ZFLTIwMjYtOTUzODcuCgotIHducGEtc2Vj
LTIwMjYtOTggwrcgTWljcm9zb2Z0IE5ldHdvcmsgTW9uaXRvciBmaWxlIHBhcnNlciBsYXJnZSBs
b29wLgogIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi05
OAogIENWRS0yMDI2LTk1Mzk0LgoKLSB3bnBhLXNlYy0yMDI2LTk5IMK3IENTTi4xIHByb3RvY29s
IGRpc3NlY3RvciBjcmFzaC4KICBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3du
cGEtc2VjLTIwMjYtOTkKICBDVkUtMjAyNi05NTM5My4KCi0gd25wYS1zZWMtMjAyNi0xMDAgwrcg
TUJJTSBwcm90b2NvbCBkaXNzZWN0b3IgY3Jhc2guIHdzYnVnbGluazoyMTU0OSwKICBodHRwczov
L3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3ducGEtc2VjLTIwMjYtMTAwCiAgQ1ZFLTIwMjYt
OTUzOTIuCgotIHducGEtc2VjLTIwMjYtMTAxIMK3IFNoYXJrZCB1dGlsaXR5IGNyYXNoLgogIGh0
dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDEKICBDVkUt
MjAyNi05NTM4OC4KCi0gd25wYS1zZWMtMjAyNi0xMDIgwrcgRnJhbWUgcHJvdG9jb2wgbWV0YWRp
c3NlY3RvciBjcmFzaC4KICBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3ducGEt
c2VjLTIwMjYtMTAyCiAgQ1ZFLTIwMjYtOTY0MjIuCgotIHducGEtc2VjLTIwMjYtMTAzIMK3IFVT
QiBISUQgcHJvdG9jb2wgZGlzc2VjdG9yIGluZmluaXRlIGxvb3AgYW5kCiAgbWVtb3J5IGxlYWsu
CiAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTEwMwog
IENWRS0yMDI2LTk2NDIxLgoKLSB3bnBhLXNlYy0yMDI2LTEwNCDCtyBSRjRDRSBwcm90b2NvbCBk
aXNzZWN0b3IgY3Jhc2guCiAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBh
LXNlYy0yMDI2LTEwNAogIENWRS0yMDI2LTk2NDE3LgoKLSB3bnBhLXNlYy0yMDI2LTEwNSDCtyBU
b3NoaWJhIGZpbGUgcGFyc2VyIGNyYXNoLgogIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2Vj
dXJpdHkvd25wYS1zZWMtMjAyNi0xMDUKICBDVkUtMjAyNi14eHguCgotIHducGEtc2VjLTIwMjYt
MTA2IMK3IFByb2ZpbGUgaW1wb3J0IGNyYXNoIGFuZCBwb3NzaWJsZSBjb2RlIGV4ZWN1dGlvbi4K
ICBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3ducGEtc2VjLTIwMjYtMTA2CiAg
Q1ZFLTIwMjYtOTY0MTkuCgotIHducGEtc2VjLTIwMjYtMTA3IMK3IFRJRkYgcHJvdG9jb2wgZGlz
c2VjdG9yIGluZmluaXRlIGxvb3AuCiAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0
eS93bnBhLXNlYy0yMDI2LTEwNwogIENWRS0yMDI2LTk2NDE4LgoKLSB3bnBhLXNlYy0yMDI2LTEw
OCDCtyBYMTEgcHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLgogIGh0dHBzOi8vd3d3LndpcmVzaGFy
ay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDgKICBDVkUtMjAyNi05NjQyMy4KCi0gd25w
YS1zZWMtMjAyNi0xMDkgwrcgSUVFRSA4MDIuMTEgcHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLgog
IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDkKICBD
VkUtMjAyNi05NjQxNi4KCi0gd25wYS1zZWMtMjAyNi0xMTAgwrcgQ2F0YXB1bHQgRENUMjAwMCBw
cm90b2NvbCBkaXNzZWN0b3IgY3Jhc2guCiAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1
cml0eS93bnBhLXNlYy0yMDI2LTExMAogIENWRS0yMDI2LTk2NDE1LgoKRm9yIG1vcmUgaW5mb3Jt
YXRpb24gb24gdGhlIHZlcnNpb24gYnVtcCwgc2VlOgogIC0gaHR0cHM6Ly93d3cud2lyZXNoYXJr
Lm9yZy9kb2NzL3JlbG5vdGVzL3dpcmVzaGFyay00LjQuMTkuaHRtbAoKU2lnbmVkLW9mZi1ieTog
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Ci0t
LQogcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLmhhc2ggfCA2ICsrKy0tLQogcGFja2FnZS93
aXJlc2hhcmsvd2lyZXNoYXJrLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3dpcmVzaGFyay93
aXJlc2hhcmsuaGFzaCBiL3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5oYXNoCmluZGV4IDNk
OGZkYjYxMzEuLmIxN2Y0YmNmMTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVz
aGFyay5oYXNoCisrKyBiL3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5oYXNoCkBAIC0xLDYg
KzEsNiBAQAotIyBGcm9tIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvZG93bmxvYWQvc3JjL2Fs
bC12ZXJzaW9ucy9TSUdOQVRVUkVTLTQuNC4xOC50eHQKLXNoYTEgIDQ4MmZlY2JlMjFhODc2ZjUz
YTI2YmY1YmVhYTViMGVlMGFkMTZlNTAgIHdpcmVzaGFyay00LjQuMTgudGFyLnh6Ci1zaGEyNTYg
IGY3N2E3OTM5OTgzNzU4MzgzNzk3ZmVkMGEzNGE0OTFmNzg1ZTU0MWNjYTM5N2E3YTQ0ZTljZGQ3
YzZmODQ3YzYgIHdpcmVzaGFyay00LjQuMTgudGFyLnh6CisjIEZyb20gaHR0cHM6Ly93d3cud2ly
ZXNoYXJrLm9yZy9kb3dubG9hZC9zcmMvYWxsLXZlcnNpb25zL1NJR05BVFVSRVMtNC40LjE5LnR4
dAorc2hhMSAgNDZjMjgwNTQwNzE5NzA0OGQ5MGRjN2VhYzlmMGE0YTE5ZDEzODE1YSAgd2lyZXNo
YXJrLTQuNC4xOS50YXIueHoKK3NoYTI1NiAgMDQ5OWRkZGMwYWVlYTUwMGJjNjUxOTY3MTRlMWUw
MTA5Nzc0MmVmYmM0NzlhMmQ2N2E5YThiNWRkNTdkNmQwNCAgd2lyZXNoYXJrLTQuNC4xOS50YXIu
eHoKIAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgZWRhZWY2MzJjYmI2NDNlNGU3YTIy
MTcxN2E2YzQ0MWE0YzFhN2M5MThlNmU0ZDU2ZGViYzNkODczOWIyMzNmNiAgQ09QWUlORwpkaWZm
IC0tZ2l0IGEvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLm1rIGIvcGFja2FnZS93aXJlc2hh
cmsvd2lyZXNoYXJrLm1rCmluZGV4IGM1MDBhNDkzMzYuLmE2N2I5MTViNWIgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5taworKysgYi9wYWNrYWdlL3dpcmVzaGFyay93
aXJlc2hhcmsubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwog
Ci1XSVJFU0hBUktfVkVSU0lPTiA9IDQuNC4xOAorV0lSRVNIQVJLX1ZFUlNJT04gPSA0LjQuMTkK
IFdJUkVTSEFSS19TT1VSQ0UgPSB3aXJlc2hhcmstJChXSVJFU0hBUktfVkVSU0lPTikudGFyLnh6
CiBXSVJFU0hBUktfU0lURSA9IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvZG93bmxvYWQvc3Jj
L2FsbC12ZXJzaW9ucwogV0lSRVNIQVJLX0xJQ0VOU0UgPSB3aXJlc2hhcmsgbGljZW5zZQotLSAK
Mi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
