Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6D0CA0EF8
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 08:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44DF184190;
	Thu, 21 Aug 2025 08:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcZbmk5Oi82I; Thu, 21 Aug 2025 08:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA2F8417E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CA2F8417E;
	Thu, 21 Aug 2025 08:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C430CEC3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 08:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B689884180
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 08:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uj9oIGdPSKUq for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 08:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47A638417E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A638417E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47A638417E
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 08:17:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -151668984
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 Aug 2025 08:17:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1up0Ud-00FUBJ-1s
 for buildroot@buildroot.org; Thu, 21 Aug 2025 10:17:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:17:55 +0200
Message-ID: <87tt21ks0c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=HjnQjsp8a2OtnKD04A0Vt/WJYe19j7WNn9UX1h/vT0HGfa2kbViMs4DfRmqu/mi7CAm8a0AqZg5NQoDWdNEpsKp63nV9P1PQoUCi2ElELSEc94p6Ln0yxfoZA7g97CnnNpUlv7GdKbCsRTdd05q37QVzy+uHFCPMMQUwJzCs5ODv2NG+6dwiwiIchtre/ZhGEHxXoytuXyb0WO6QutzXa9ab5gR8zyOU05vgWYdaCrGllZ+9wLUcdHxoSool79b4nNGgPpnT68pNsteiKtuHkJNMs/hRbfbVv9mWvpFYlCPR6xqlzhm7JnmR5e2IZmLcqMD76TpM3MlRG+tA+qK/OA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=cDlcnjx3IwSo4qNlXqK8H9414qgXffx5PCDZ3kJ71iI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=HjnQjsp8
Subject: [Buildroot] Buildroot 2025.08-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyNS4wOC1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDgtcmMy
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjUuMDgtcmMyLnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNS4wOC1yYzIgdGFnKQoKQW5vdGhlciB3
ZWVrLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLiBGb3IgZGV0YWlscywgc2VlIHRoZSBDSEFO
R0VTCmZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9i
bG9iLzIwMjUuMDgtcmMyL0NIQU5HRVMKClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0
IGFueSBwcm9ibGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRo
YW5rcyB0byB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hv
cnRsb2cgLXNuIDIwMjUuMDgtcmMxLi4KCiAgICAxNiAgUGV0ZXIgS29yc2dhYXJkCiAgICAgOCAg
VGhvbWFzIFBldGF6em9uaQogICAgIDggIFRpdG91YW4gQ2hyaXN0b3BoZQogICAgIDYgIEp1bGll
biBPbGl2YWluCiAgICAgNSAgVGhvbWFzIFBlcmFsZQogICAgIDQgIEZsb3JpYW4gTGFyeXNjaAog
ICAgIDQgIFF1ZW50aW4gU2NodWx6CiAgICAgMyAgQWtoaWxlc2ggTmVtYQogICAgIDMgIEdpdWxp
byBCZW5ldHRpCiAgICAgMiAgQXJub3V0IFZhbmRlY2FwcGVsbGUKICAgICAyICBZYW5uIEUuIE1P
UklOCiAgICAgMSAgQW5nZWxvIENvbXBhZ251Y2NpCiAgICAgMSAgUm9tYWluIE5hb3VyCiAgICAg
MSAgU8OpYmFzdGllbiBTenltYW5za2kKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
