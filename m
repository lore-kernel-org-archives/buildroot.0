Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDA7CD4F25
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D854260DA6;
	Tue, 12 May 2026 14:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sE8_DUHCuhig; Tue, 12 May 2026 14:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B89E60DA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778594628;
	bh=eaYz2Mh8mej60m9ks70E2r1oR373P81x6gOBnrJ3u/8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UtYG4X6Xu3JbKn1RonNhSNV2tkllSfW9fqEWaaaC3kZXIqdR+JbxNgAgJ5rpAjtJJ
	 tZOW7XJ6j3GLBxO+E/TbByEJQrQJz0s8g42i4juAJ3Mw2SxSlIVo9O58McwPeEOpHk
	 ZrfkV3T1yHKsShED3MaV5Xdhdsdz5v1ZEYzyNHeaSNH1k/6Fx+OT35q/JjSWqiuZCW
	 DcdROLgCkPPocL6Mk+lETNPHIRqKEupClZmqylhRdImrjHhD78uIYAey9EBqAn/G6t
	 Pv38/9y+qrVmvrSW4G3zcReRivddjxR8TKZAFVbZhDCMmtALbVUUBLEXWARGQv2JvD
	 uM/2jI+nzn4JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B89E60DA7;
	Tue, 12 May 2026 14:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5614E15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3477960DA7
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9tOSB_gnguo for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1A8E60DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A8E60DA6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1A8E60DA6
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:03:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1258312860
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 12 May 2026 14:03:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMni1-0000000A60s-0T2Q
 for buildroot@buildroot.org; Tue, 12 May 2026 16:03:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 16:03:41 +0200
Message-ID: <87v7csohc2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AN5o32WplPTbi7/Yz3FXmphXtNCxsw6KbDqpoQ9ebnX8MKL0kgV9Tv3zBqJBDms9HVSPta9veJOAFilioLfdO4oEXq8ABuZfIiZ7rDT8nLWEyeltjIGlXQHTtZeSd7d83CtvZkx7bqdy7XVI+ZBpmO6H07qAs2f9CM9o8p/d5jc3kVqsqcjnAZEjAvGiOTUBpHbadqYUMgT+S8QENcIdNj3wwm4UUw/fM5HDuOQL9iSlxL92GEgZB+ZeV5jm0lf0hMFmQFjMZHCAPq2nrYtF9wXT0n72oWfYx3IS94rrbgpiacwlw536jqiMzbKoNQQS0UvDiwm6NHOSklbYJdpCQg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=J3liCuuZyjZutomXp/LilifGf+cQIS/i2O18rH1SeiM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=AN5o32Wp
Subject: [Buildroot] Buildroot 2026.05-rc1 released
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

SGksCgpCdWlsZHJvb3QgMjAyNi4wNS1yYzEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjYuMDUtcmMx
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjYuMDUtcmMxLnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNi4wNS1yYzEgdGFnKQoKUGxlYXNlIGdp
dmUgaXQgYSBzcGluIGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBtYWlsaW5nIGxpc3Qg
b3IKYnVnIHRyYWNrZXIuCgpBIGxpdHRsZSBsZXNzIGFjdGl2aXR5IHRoaXMgY3ljbGUsIGJ1dCBz
dGlsbCBhbG1vc2d0IDkwMCBjaGFuZ2VzIGZyb20gNzIKdW5pcXVlIGNvbnRyaWJ1dG9ycyEKCk9m
IG5vdGV3b3J0aHkgbmV3IGZlYXR1cmVzL2NoYW5nZXMgd2UgaGF2ZToKCi0gQXJjaGl0ZWN0dXJl
OiBBUk0gTmVvdmVyc2UtVjEvVjIvVjMvVjNBRSBjb3JlcyBhZGRlZCwgZGVmYXVsdCB4ODYgQ1BV
CiAgdmFyaWFudCBpcyBub3cgaTY4NiAoZnJvbSBpNTg2KQoKLSBUb29sY2hhaW46IFN1cHBvcnQg
Zm9yIExpbnV4IDcuMC54IGhlYWRlcnMsIEFSTSBleHRlcm5hbCB0b29sY2hhaW5zCiAgYnVtcGVk
IHRvIDE1LjIucmVsMQoKLSBGaWxlc3lzdGVtOiBTdXBwb3J0IGZvciBYRlMgcm9vdGZzIGdlbmVy
YXRpb24uCgotIE1pc2M6IGdlbmVyYXRlLWN5Y2xvbmVkeCBub3cgYWRkcyBzb3VyY2UgYXR0cmli
dXRlIHRvIGtub3duIENWRXMgZm9yCiAgYmV0dGVyIGNvbXBhdGliaWxpdHkgd2l0aCBEZXBlbmRl
bmN5LVRyYWNrLgoKLSBOZXcgZGVmY29uZmlnczogQU1EIFZlcnNhbCBWUEsxMjAsIFRJIGo3MjFl
IHN0YXJ0ZXIga2l0IChUREE0Vk0tU0spCgotIE5ldyBwYWNrYWdlczogY3h4b3B0cywgZHJtLWlu
Zm8sIGZ0eHVpLCBnby1ib290c3RyYXAtc3RhZ2U1LAogIGluaXBhcnNlciwgbGlibnNzLWF0bywg
bGliemlwcHAsIG5kY3RsLCBvcGVuZG9hcywgcHl0aG9uLWNsb3VkcGlja2xlLAogIHB5dGhvbi1k
ZXByZWNhdGlvbiwgcHl0aG9uLWZhcmFtYS1ub3RpZmljYXRpb25zLCBweXRob24tZ3ltbmFzaXVt
LAogIHB5dGhvbi1odW1hbmZyaWVuZGx5LCBweXRob24taXNvZGF0ZSwgcHl0aG9uLXRyYW5zaXRp
b25zLCBzYmN0bCwKICB1Z2V0dHksIHppeAoKLSBSZW1vdmVkIHBhY2thZ2VzOiBjZWd1aSwgb3Bl
bnN3YW4sIHBjcmUsIHJ1Yml4LCBzbm9ydCwgc3BpbnhiYXNlCgpBbmQgdGhlIHVzdWFsIHBhY2th
Z2UgdmVyc2lvbiB1cGRhdGVzIGFuZCBidWcgZml4ZXMuIFNlZSB0aGUgQ0hBTkdFUwpmaWxlIGZv
ciBkZXRhaWxzOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
YmxvYi8yMDI2LjA1LXJjMS9DSEFOR0VTCgpNYW55IHRoYW5rcyB0byB0aGUgcGVvcGxlIGNvbnRy
aWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXMgLW4gMjAyNi4wMi4uCgog
ICA0OTAJQmVybmQgS3VobHMKICAgIDQyCUp1bGllbiBPbGl2YWluCiAgICAzNwlHaXVsaW8gQmVu
ZXR0aQogICAgMjQJRmlvbmEgS2x1dGUKICAgIDIwCWRvd2FuIGd1bGxpZW50CiAgICAxOAlTaHVi
aGFtIENoYWtyYWJvcnR5CiAgICAxNglEYXJpbyBCaW5hY2NoaQogICAgMTYJTWFyY3VzIEhvZmZt
YW5uCiAgICAxNglQZXRlciBLb3JzZ2FhcmQKICAgIDE2CVlhbm4gRS4gTU9SSU4KICAgIDE1CUZy
YW5jb2lzIFBlcnJhZAogICAgMTUJVGhvbWFzIFBlcmFsZQogICAgMTEJVGl0b3VhbiBDaHJpc3Rv
cGhlCiAgICAxMAlNYW51ZWwgRGllbmVyCiAgICAxMAlOZWFsIEZyYWdlcgogICAgIDgJQWRyaWFu
IFBlcmV6IGRlIENhc3RybwogICAgIDgJSmFtZXMgSGlsbGlhcmQKICAgICA4CU1pY2hhZWwgTm9z
dGhvZmYKICAgICA4CVJvbWFpbiBOYW91cgogICAgIDYJRG93YW4gR3VsbGllbnQKICAgICA2CVh1
a2FpIFdhbmcKICAgICA1CUFsZXhhbmRlciBTaGlyb2tvdgogICAgIDUJQXJub3V0IFZhbmRlY2Fw
cGVsbGUKICAgICA1CVdhbGRlbWFyIEJyb2Rrb3JiCiAgICAgNAlDaGVuIFBlaQogICAgIDQJTWF0
dGlhcyBXYWxzdHLDtm0KICAgICA0CVZpbmNlbnQgQ3J1egogICAgIDQJVmluY2VudCBTdGVobMOp
CiAgICAgMwlBbmRyZWFzIFppZWdsZXIKICAgICAzCUpvc2VwaCBLb2d1dAogICAgIDMJTWljaGFl
bCBXYWxsZQogICAgIDIJQWxleGFuZHJlIE9uZGV0CiAgICAgMglBbGV4aXMgTG90aG9yw6kKICAg
ICAyCUNocmlzdGlhbiBTdGV3YXJ0CiAgICAgMglEb25nIFdhbmcKICAgICAyCUZhYmllbiBMZWhv
dXNzZWwKICAgICAyCUZsYXZpdSBOaXN0b3IKICAgICAyCUZsb3JpYW4gTGFyeXNjaAogICAgIDIJ
RnJhbmNpc3playBTdGFjaHVyYQogICAgIDIJR2FyeSBCaXNzb24KICAgICAyCVBldHIgVm9yZWwK
ICAgICAyCVJhcGhhZWwgUGF2bGlkaXMKICAgICAyCVNvZmlhbmUgSEFNQU0KICAgICAyCVRob21h
cyBEZXZvb2dkdAogICAgIDIJWWVnb3IgWWVmcmVtb3YKICAgICAxCUFuZHJlYSBSaWNjaGkKICAg
ICAxCURhbmllbCBCcsOhdAogICAgIDEJRGFuaWVsIENyb3dlCiAgICAgMQlEYW5pZWwgSG91Y2sK
ICAgICAxCUVkZ2FyIEJvbmV0CiAgICAgMQlFdWdlbiBIcmlzdGV2CiAgICAgMQlGcmFuw6dvaXMg
UGVycmFkCiAgICAgMQlHaWxsZXMgVGFsaXMKICAgICAxCUd3ZW5oYWVsIEdvYXZlYy1NZXJvdQog
ICAgIDEJSGVuZHJpayBEZSBWbG9lZAogICAgIDEJSmFuIMSMZXJtw6FrCiAgICAgMQlKYXZhZCBS
YWhpbWlwZXRyb3VkaQogICAgIDEJSm9uIEhlbnJpayBCasO4cm5zdGFkCiAgICAgMQlKb3PDqSBM
dWlzIFNhbHZhZG9yIFJ1Zm8KICAgICAxCUtvcnkgTWFpbmNlbnQKICAgICAxCUx1Y2EgQ2VyZXNv
bGkKICAgICAxCU1hcml1c3ogQmlhbG9uY3p5awogICAgIDEJTWFydGluIEtlcHBsaW5nZXItTm92
YWtvdmnEhwogICAgIDEJTWF0w6lvIFBvdXJyaWVyCiAgICAgMQlNYXhpbiBKb2huCiAgICAgMQlN
aWthIFdlc3RlcmJlcmcKICAgICAxCU5pY29sYSBEaSBMaWV0bwogICAgIDEJTmljb2xhcyBTZXJh
ZmluaQogICAgIDEJUGVkcm8gQWd1aWxhcgogICAgIDEJUm9iZXJ0byBNZWRpbmEKICAgICAxCVNj
b3R0IEZhbgogICAgIDEJVGhvbWFzIFJpY2hhcmQKCmdpdCBsb2cgLS1uby1tZXJnZXMgLS1ncmVw
ICcoUmV2aWV3ZWR8QWNrZWQpLWJ5OicgLUUgLWkgXAogIC0tZm9ybWF0PSIlKHRyYWlsZXJzOnZh
bHVlb25seT10cnVlLGtleT1SZXZpZXdlZC1ieSxrZXk9QWNrZWQtYnkpJS1DKCkiIFwKICAyMDI2
LjAyLi4gfCBzb3J0IHwgdW5pcSAtYyB8IHNvcnQgLW5yCgogICAgICA0IFBldHIgVm9yZWwgPHBl
dHIudm9yZWxAZ21haWwuY29tPgogICAgICA0IE1heGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5i
b3gucnU+CiAgICAgIDMgTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4K
ICAgICAgMyBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KICAgICAg
MiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+CiAgICAgIDIgQmFydWNoIFNp
YWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KICAgICAgMSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KICAgICAgMSBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4KICAgICAgMSBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRl
PgogICAgICAxIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+CiAgICAg
IDEgQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCldlIHdpbGwg
bm93IGNyZWF0ZSBhIG5leHQgYnJhbmNoIGFuZCBzdGFydCBtZXJnaW5nIG5ldyBmZWF0dXJlcyBm
b3IKMjAyNi4wOCBhbHJlYWR5IGluIHBhcmFsbGVsIHdpdGggdGhlIDIwMjYuMDUgc3RhYmlsaXph
dGlvbi4KCkV4cGVjdCB0aGUgZmluYWwgMjAyNi4wNSByZWxlYXNlIGFyb3VuZCB0aGUgZW5kIG9m
IHRoZSBtb250aCAvIGJlZ2lubmluZwpvZiBKdW5lLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
