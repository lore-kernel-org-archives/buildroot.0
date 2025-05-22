Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5F3C54756
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 06:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 232C241914;
	Thu, 22 May 2025 06:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Xuf6UnI9pkN; Thu, 22 May 2025 06:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5062A417C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5062A417C1;
	Thu, 22 May 2025 06:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07ED969
 for <buildroot@buildroot.org>; Thu, 22 May 2025 06:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E247A83CAD
 for <buildroot@buildroot.org>; Thu, 22 May 2025 06:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0dX1o8gmvtv for <buildroot@buildroot.org>;
 Thu, 22 May 2025 06:03:19 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=49.65.101.82;
 helo=server1.qsdfc.cn; envelope-from=sales@qsdfc.cn; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3823F83CAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3823F83CAA
Received: from server1.qsdfc.cn (unknown [49.65.101.82])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3823F83CAA
 for <buildroot@busybox.net>; Thu, 22 May 2025 06:03:18 +0000 (UTC)
Received: from woa (113.118.210.238) by server1.qsdfc.cn id h5qv2e0e97ch for
 <buildroot@busybox.net>;
 Thu, 22 May 2025 14:02:16 +0800 (envelope-from <sales@qsdfc.cn>)
Date: Thu, 22 May 2025 14:02:05 +0800
From: "Lora" <buildroot@busybox.net>
To: <buildroot@busybox.net>
Message-ID: <20250522140216523226@qsdfc.cn>
X-Priority: 1 (Highest)
X-mailer: Foxmail 6, 13, 102, 15 [cn]
Mime-Version: 1.0
X-Mailman-Original-DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=mail;
 d=busybox.net; 
 b=a4cfQWrwYDuN9l2ZMOcZvna8D+GaFMCV78By0EzpBGKj6w4MdBfXH5+5mYAOaaaoUPCDW1eNUFxY
 Dk7hF8xTZ7ZJz441TkbJVg0acEpd1N1E7pqn8W9Kgch/t3JSKoQ1+G6o1Pef8Ydz4FgjDhpo4Sm6
 DC0HvRsXDvlvdqCfxvT1FFTSsVka5yxEJdC7RHPy6XGEkx0rN7qSpB/fi8WtIET5SyxvT1+OSzan
 r+LJ5qshhs80BHrv4Z5cNNnRQ6pVqiv/GUDwMgxOModO/Y5OCNfpKmwxR/23Vke289+FMgwlaUu2
 ynBjyvRF6lWnSm5RXFmi2u4o6B0O7DvGeg27pg==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=mail;
 d=busybox.net; 
 h=Reply-To:Date:From:To:Subject:Message-ID:Mime-Version:Content-Type:Content-Transfer-Encoding;
 i=buildroot@busybox.net; 
 bh=ZZS/1d/UWQijj3i4yOocdeC6/iA=;
 b=ieuRm9ZYifj6jZG93pffDpIY5H+xEbYyiwMvh8DFaTBtKUpLkLaV7vaT+IiYw1QXyCMPHftYg9hy
 MUCp5z9KjjR/nLiGONnGSYrj1S8a3oxqw77MF8ouE0rcqKo5vigWHsWKSR2MOAAqumBsVUyCkmZM
 1HWNzOgy5N7Fgx8aVZpKBNiGg6WmZfF8SxvysmENRX+PCF7xdvp2oP2G4PA+xvmQURCou2GickBU
 xHzld2shrVv5cvLd+sA41T+PjqKjCsflNZy8DmJtX+Pl+AmxLLjRZA4eXwOEuHCNr2fJk8nZlVBo
 z+Jie1K7WMKgRwnyZ/6zu5vnGDAUkyCgkkF5dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Solar-Powered GPS Tracker- High-Capacity Battery,
 Direct Solar Charging & IP67 Durability
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
Reply-To: info@vsafetrack.com
Content-Type: multipart/mixed; boundary="===============1521638226974362163=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1521638226974362163==
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxNRVRBIG5hbWU9R0VORVJBVE9SIGNvbnRl
bnQ9Ik1TSFRNTCAxMS4wMC4xMDU3MC4xMDAxIj48L0hFQUQ+DQo8Qk9EWT4NCjxQPjxGT05UIGZh
Y2U9Q2FsaWJyaT5IaTwvRk9OVD48L1A+DQo8UD48Rk9OVCBmYWNlPUNhbGlicmk+V2UgaG9wZSB0
aGlzIGVtYWlsIGZpbmRzIHlvdSB3ZWxsITwvRk9OVD48L1A+DQo8UD48Rk9OVCBmYWNlPUNhbGli
cmk+V2Ugc3BlY2lhbGl6ZSBpbiBkZXNpZ25pbmcgYW5kIG1hbnVmYWN0dXJpbmcgaW5ub3ZhdGl2
ZSANCnNvbGFyIHBvd2VyZWQgc29sdXRpb25zIHRhaWxvcmVkIGZvciBnbG9iYWwgbWFya2V0cy4g
QXMgYSBmYWN0b3J5IHdpdGggaW4taG91c2UgDQpSJmFtcDtEIGV4cGVydGlzZSwgd2UncmUgZXhj
aXRlZCB0byBpbnRyb2R1Y2Ugb3VyIGxhdGVzdCBicmVha3Rocm91Z2g6IHRoZSANClNvbGFyLVBv
d2VyZWQgR1BTIFRyYWNrZXItZW5naW5lZXJlZCBmb3IgcmVsaWFiaWxpdHksIHN1c3RhaW5hYmls
aXR5LCBhbmQgDQp1bm1hdGNoZWQgcGVyZm9ybWFuY2UuPC9GT05UPjwvUD4NCjxQPjxGT05UIGZh
Y2U9Q2FsaWJyaT48U1RST05HPkhpZ2gtQ2FwYWNpdHkgQmF0dGVyeSAmYW1wOyBTb2xhciANCkNo
YXJnaW5nOjwvU1RST05HPjxCUj4yMCwwMDBtQWggQnVpbHQtaW4gQmF0dGVyeTogRW5zdXJlcyB1
bmludGVycnVwdGVkIA0Kb3BlcmF0aW9uIGV2ZW4gaW4gbG93LWxpZ2h0IGNvbmRpdGlvbnMuPEJS
PkRpcmVjdCBTb2xhciBDaGFyZ2luZzogRWxpbWluYXRlcyANCmZyZXF1ZW50IGJhdHRlcnkgcmVw
bGFjZW1lbnRzIG9yIG1hbnVhbCBjaGFyZ2luZy4gSWRlYWwgZm9yIHJlbW90ZSBvciBvZmYtZ3Jp
ZCANCmFwcGxpY2F0aW9ucy48QlI+RW5lcmd5LUVmZmljaWVudCBEZXNpZ246IEF1dG8tc2xlZXAg
bW9kZSBleHRlbmRzIGJhdHRlcnkgbGlmZSANCndpdGhvdXQgY2hhcmdpbmcgbmVlZC48QlI+Jm5i
c3A7PEJSPjxTVFJPTkc+V2lkZS1SYW5naW5nIA0KQXBwbGljYXRpb25zOjxCUj48L1NUUk9ORz5B
c3NldCAmYW1wOyBWZWhpY2xlIFRyYWNraW5nOiBNb25pdG9yIGZsZWV0cywgDQp0cmFpbGVycywg
b3IgY29uc3RydWN0aW9uIGVxdWlwbWVudC48QlI+V2lsZGxpZmUgJmFtcDsgRW52aXJvbm1lbnRh
bCBNb25pdG9yaW5nOiANClBlcmZlY3QgZm9yIHJlc2VhcmNoIGluIHJlbW90ZSBhcmVhcy48QlI+
T3V0ZG9vciBTZWN1cml0eTogVHJhY2sgYm9hdHMsIHNvbGFyIA0KZmFybXMsIG9yIGFncmljdWx0
dXJhbCBtYWNoaW5lcnkuPEJSPlBlcnNvbmFsIFNhZmV0eTogVXNlIGZvciBoaWtpbmcsIGNhbXBp
bmcsIA0Kb3IgZW1lcmdlbmN5IHNjZW5hcmlvcy48L0ZPTlQ+PC9QPg0KPFA+PEZPTlQgZmFjZT1D
YWxpYnJpPjxTVFJPTkc+QnVpbHQgdG8gTGFzdDo8L1NUUk9ORz48QlI+SVA2NyBXYXRlcnByb29m
ICZhbXA7IA0KRHVzdHByb29mOiBXaXRoc3RhbmRzIGhhcnNoIHdlYXRoZXIsIGh1bWlkaXR5LCBh
bmQgZXh0cmVtZSB0ZW1wZXJhdHVyZXMgKC0yMMKwQyANCnRvIDYwwrBDKS48QlI+U2hvY2stUmVz
aXN0YW50IFNoZWxsOiBSZWluZm9yY2VkIEFCUytQQyBtYXRlcmlhbCBmb3IgcnVnZ2VkIA0KZW52
aXJvbm1lbnRzLjxCUj5HbG9iYWwgR1BTIENvdmVyYWdlOiBTdXBwb3J0cyBHUFMvR0xPTkFTUy9C
RFMgZm9yIHBpbnBvaW50IA0KYWNjdXJhY3kuPC9GT05UPjwvUD4NCjxQPjxGT05UIGZhY2U9Q2Fs
aWJyaT48U1RST05HPkZhY3RvcnkgDQpBZHZhbnRhZ2VzOjwvU1RST05HPjxCUj4mbmJzcDtDdXN0
b21pemF0aW9uIE9wdGlvbnM6IFRhaWxvciBmZWF0dXJlcyBsaWtlIA0KZ2VvZmVuY2luZywgU09T
IGFsZXJ0cywgb3IgZGF0YSByZXBvcnRpbmcgaW50ZXJ2YWxzLjxCUj4mbmJzcDtDZXJ0aWZpZWQg
UXVhbGl0eTogDQpDRSwgUm9IUywgYW5kIEZDQyBjb21wbGlhbnQuPEJSPiZuYnNwO0NvbXBldGl0
aXZlIFByaWNpbmc6IERpcmVjdCBmYWN0b3J5IHJhdGVzIA0Kd2l0aCBNT1EgZmxleGliaWxpdHku
PEJSPiZuYnNwO0Zhc3QgTGVhZCBUaW1lczogQnVsayBvcmRlcnMgc2hpcHBlZCB3aXRoaW4gMTDi
gJMxNSANCmRheXMuPC9GT05UPjwvUD4NCjxQPjxGT05UIGZhY2U9Q2FsaWJyaT5Zb3UgY2FuIHJl
cGx5IHVzIHRoaXMgZW1haWwgZGlyZWN0bHkgZm9yIG1vcmUgaW5mbyx0aGFuayANCnlvdTxCUj5C
ZXN0IHJlZ2FyZHMgV29uZyBpbmZvQHZzYWZldHJhY2suY29tPC9GT05UPjwvUD48L0JPRFk+PC9I
VE1MPg0K



--===============1521638226974362163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1521638226974362163==--
