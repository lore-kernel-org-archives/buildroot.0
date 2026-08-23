Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93021C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 21:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0529980D39;
	Sun, 23 Aug 2026 21:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONsYRygNgT0i; Sun, 23 Aug 2026 21:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787519678;
	bh=zSsyWZ1i3uK6T9idbHGr/nVdGMc7t+mu7IC9YWhcqBs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kcyhieIRiy1lVS94NQUDJZbZBW4oZ5uajWfwHyqMH26LRWk4/fYaZrDY+WUbKPtLs
	 MoZo09o+U5WJSElcFqhSBzHAgapWccjOlmaNrcaxOXRnhFSmJ4Q3JJMtCXfjVuNdgx
	 H37l/TpcCG3gURUQkSB9RwV76wAle+nmuB8Ra3y2pUm7sB5qyeQAmC7VDa4S6Y+9KE
	 jq9bfq3ghf7cJWaj9Pq/PTzG11YvY6FBnTCddh/EIHKt3vUujQT6HGYTMT0c9+hAPl
	 zNdw0hhfwyByINwgOloZS3/ZCHisB4M1pDSOdMuiasx4phpKNnGzqevq+qt6FGMlj1
	 8pNtcfGFxEMiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B0B80D13;
	Sun, 23 Aug 2026 21:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B55C3DA
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71227605FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOUzcAo_fuC8 for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 21:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=H+xbjLDx
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22236605DB
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:14:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=H+xbjLDx8u30zKWlAQ5fiXyuMbuSTwiWjC7UTOdw8MY4okO4TRVqDqyJMeXfbfBKWcZStS5y38qJ5wbA8BBx+yngN9w6AGslbtvhyauZi6HaJMjuJvYDzrFfM/YfmnLElWlWV8ypnMfBEDV+n4MSnv5+1qEs5SzV6xLt4hKFfPqYWHBoVapQpw08UHWe1CXCKb1FrVaydGkmcDzlkur41E3xdaKLteMGAGCSuXMbKmLf9INXKKvWb6ckiDT4uKhD5B2iuYIDHCVcfjR9hkeBjgRIXI137yJ0s7nwszndFk5wNQBvVytkfvzMZh6KlhXEN4iGS13gINQqOvjQcZG8Lw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=FAqZXYCUamRQfzhryPmbMpC8p221HDZ0svnL770O7fs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 950679801
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 21:14:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyFWS-0000000ASc3-1M77
 for buildroot@buildroot.org; Sun, 23 Aug 2026 23:14:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 23:14:32 +0200
Message-ID: <87v790a69z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2026.08-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyNi4wOC1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjYuMDgtcmMy
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjYuMDgtcmMyLnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNi4wOC1yYzIgdGFnKQoKQW5vdGhlciB3
ZWVrLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLiBGb3IgZGV0YWlscywgc2VlIHRoZSBDSEFO
R0VTCmZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9i
bG9iLzIwMjYuMDgtcmMyL0NIQU5HRVMKClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0
IGFueSBwcm9ibGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRo
YW5rcyB0byB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hv
cnRsb2cgLXNuIDIwMjYuMDgtcmMxLi4KCiAgICAgOCAgU3RlZmFuIE3DvGxsZXIKICAgICA2ICBC
ZXJuZCBLdWhscwogICAgIDQgIEFybm91dCBWYW5kZWNhcHBlbGxlCiAgICAgNCAgSnVsaWVuIE9s
aXZhaW4KICAgICAzICBHaXVsaW8gQmVuZXR0aQogICAgIDIgIEZpb25hIEtsdXRlCiAgICAgMiAg
Um9tYWluIE5hb3VyCiAgICAgMiAgVGhvbWFzIFBldGF6em9uaQogICAgIDIgIFlhbm4gRS4gTU9S
SU4KICAgICAxICBBbGV4aXMgTG90aG9yw6kKICAgICAxICBCZW5qYW1pbiBEZUNhbXAKICAgICAx
ICBDaHJpc3RvcGhlciBPYmJhcmQKICAgICAxICBEYXJpbyBCaW5hY2NoaQogICAgIDEgIEVkZ2Fy
IEJvbmV0CiAgICAgMSAgRmVuZ3dlaSBUYW4KICAgICAxICBGaW9uYSBLbHV0ZSAoT3RoZXJtbyBH
bWJIKQogICAgIDEgIEx1Y2EgQ2VyZXNvbGkKICAgICAxICBOZWFsIEZyYWdlcgogICAgIDEgIFBl
dGVyIEtvcnNnYWFyZAogICAgIDEgIFBoaWxpcHBlIE1PTlRDSE8KICAgICAxICBUaG9tYXMgRGV2
b29nZHQKICAgICAxICBUaG9tYXMgUGVyYWxlCiAgICAgMSAgV2FsZGVtYXIgQnJvZGtvcmIKCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
