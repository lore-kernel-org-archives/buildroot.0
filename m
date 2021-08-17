Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CA5C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:29:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C285260F58
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 10:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C285260F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89050402EC;
	Tue, 17 Aug 2021 10:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUWyXC3VMu_I; Tue, 17 Aug 2021 10:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 645BA40D8D;
	Tue, 17 Aug 2021 10:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 458681BF271
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECCAA80CD6
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 10:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ioxwptdTyFkY for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 10:29:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDF5780FF8
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 10:29:12 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id w5so37633222ejq.2
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=d2n7PxWMWVhuLjLUpxBty9t/CVN0FqGQWxZxuBLCHMc=;
 b=YPRIGlH0wWNzjXgM7cQLPoG9dlmNNUVQf6R77xBIAJhxo8k9XIEt9s78m7ya/3R8P8
 UUC507QafSTrl+hH7EViZ0lp4xIF8fc8dpdm4p8tLDSrMock/JIjL+yVYB/8ydDsyZpp
 vfsyYaDAmPj+moR8rMq8AyObp43aI7/dcFkPOHXb/jhwS4BQI/I6x+oK8OZn716MxBrt
 Cf6Lcr0pqqphERUQ7or0E4Pwxuvwrb3aQLGvSfig0lArZvgrFRwWot4Tco81lLCFQtgN
 WcckNNx0U6Ufxy/MnUio7rgX9baZWbbmLpCjqk86FbSq/MOlZvy2JhV4zprLKc0vhtjq
 p17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=d2n7PxWMWVhuLjLUpxBty9t/CVN0FqGQWxZxuBLCHMc=;
 b=rY8SapouzyA0nLPqEWTXBt9UDNcjC+mYWGNdjGOMHvWLYggvgwE7aRs+iwWzURSaK4
 5NYH1zhk2Ns1a/bhNr+dvkr6RH0GzJZLgg4Dd6ZvHBQ7xq3ElKyHUhPCcM87/EVMgtq9
 IJ53MIQHz5tPeaVDlBXbSR36kFSzwl7e6dA2h9Ud58mnFwWPz1cvGIT+Vh375vIMCQXO
 RERbMeejyd6UjuxnzPz2goU6R6xVGkjF6OzObzZTUpYcjxf2bnbbH6lHpqQnP4iD1gdz
 Uc2XFXYxmmuFe9p+EhFXDpaapZxKSDjFIg4fiN0Mdz9HMPKXgaO2reNSvnr+9U5C03Bt
 k2iA==
X-Gm-Message-State: AOAM531nsQF3uZLD6devV/hr5DXVnl9H+zuhzcXg/Brj6+Lit0osMWEJ
 sW3hmL/FlmkNwoElTSW97Jw=
X-Google-Smtp-Source: ABdhPJwzOjWrmsMvg2CUZI3cvQIR/KRpaHDohBCqo4XAMtpGq5/PJaqyUpv3FT3j5AMUOslL+CsN/g==
X-Received: by 2002:a17:906:404:: with SMTP id
 d4mr3217004eja.449.1629196150869; 
 Tue, 17 Aug 2021 03:29:10 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 um4sm574533ejb.92.2021.08.17.03.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:29:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFwLE-0007Tk-Us; Tue, 17 Aug 2021 12:29:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?546L55Cm?= <wangwangqi2011@gmail.com>
References: <CA+xQKEh-FAkcV2w4quUo7kJbs_SvP=ae_912kF=Ao_ZQyijavg@mail.gmail.com>
Date: Tue, 17 Aug 2021 12:29:08 +0200
In-Reply-To: <CA+xQKEh-FAkcV2w4quUo7kJbs_SvP=ae_912kF=Ao_ZQyijavg@mail.gmail.com>
 (=?utf-8?B?IueOi+eQpiIncw==?= message of "Mon, 16 Aug 2021 03:43:03 +0000")
Message-ID: <875yw44b63.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Bug report
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Pj4+Pj4gIueOi+eQpiIgPT0g546L55CmICA8d2FuZ3dhbmdxaTIwMTFAZ21haWwuY29tPiB3cml0
ZXM6CgogPiAqU3VtbWFyeSo6IHVkaGNwYy5zY3JpcHQgZmlsZSBjYW5ub3QgYXNzaWduIGEgcmln
aHQgYWN0aW9uIHRvIGhvb2sgZmlsZXMKID4gKkRlc2NyaXB0aW9uKjoKID4gV2hlbiBwYXNzaW5n
IGBib3VuZGAgb3IgYHJlbmV3YCBwYXJhbWV0ZXIgdG8gdWRoY3BjLnNjcmlwdCwgdGhlc2UKID4g
cGFyYW1ldGVycyBhcmUgd2lwZWQgb3V0IGJlZm9yZSBob29raW5nIGZpbGVzIHdpdGggdGhlbS4g
U28gYW4gZW1wdHkgc3RyaW5nCiA+IHBhc3NlZCB0byB0aGVzZSBob29rZWQgZmlsZXMsIHdoaWNo
IGZhaWxlZCB0byBjb25maWd1cmUgc29tZSBuZWNlc3NhcnkKID4gcGFyYW1ldGVycy4KCiA+IEZv
bGxvd2luZyBhcmUgc29tZSBkZXRhaWxlZCBpbmZvOgoKID4gVmVyc2lvbiBvZiBCdWlsZHJvb3Q6
IDIwMjEuMDIuMgogPiBWZXJzaW9uIG9mIEJ1c3lib3g6IDEuMzMuMAoKID4gRmlsZSBMb2NhdGlv
bjogcGFja2FnZS9idXN5Ym94L3VkaGNwYy5zY3JpcHQKCiA+IERlc2NyaXB0aW9uOiBUaGUgREhD
UCBhY3Rpb24gaXMgZW1wdHkgYWZ0ZXIgdGhlICdkZWNvbmZpZycuIEFjdHVhbGx5LCBpdAogPiBz
aG91bGQgYmUgJ2JvdW5kJyhvciAncmVuZXcnKS4gQXMgYSByZXN1bHQsIHRoZSBob29rIG9wZXJh
dGlvbiBhdCB0aGUgZW5kCiA+IG9mIHRoaXMgc2NyaXB0IHdpbGwgbm90IHBhc3MgdGhlIHJpZ2h0
IHBhcmFtZXRlcnMgdG8gdGhlIHJlbGV2YW50IGZpbGVzLgoKID4gQ2F1c2U6IFdoZW4gdGhlIGNv
bmRpdGlvbiBvZiBMaW5lLjY3IGlzIHRydWUsIHRoZW4gTGluZS43NSB3aWxsIGNoYW5nZQogPiAn
JEAnLCBhZnRlciB0aGUgTGluZS43OCBzaGlmdHMgYWxsIHRoZSBwYXJhbWV0ZXJzLCB0aGUgJyRA
JyBiZWNvbWVzIGVtcHR5LgogPiBBdCBsYXN0LCBhbiBlbXB0eSAnJEAnIGlzIHBhc3NlZCB0byB0
aGUgaG9vayBvcGVyYXRpb24sIHdoaWNoIHdpbGwgY2F1c2UKID4gcHJvYmxlbXMuCgogPiBGaXg6
IEF0IGZpcnN0LCBzdG9yZSB0aGUgJyRAJyB0byBhIHZhcmlhYmxlIGFuZCBhdCBsYXN0LCB1c2Ug
dGhlIHZhcmlhYmxlCiA+IGluc3RlYWQgb2YgJyRAJyB0byBnZXQgdGhlIGFjdGlvbiBwYXJhbWV0
ZXIuCgogPiBTZXJpYWwgTG9ncyBmcm9tIEdDUDoKID4gU3RhcnRpbmcgbmV0d29yazogdWRoY3Bj
OiBzdGFydGVkLCB2MS4zMy4wCiA+IERIQ1AgYWN0aW9uPSJkZWNvbmZpZyIgd2l0aCB2YXJpYWJs
ZXMKID4gdWRoY3BjOiBzZW5kaW5nIGRpc2NvdmVyCiA+IHVkaGNwYzogc2VuZGluZyBzZWxlY3Qg
Zm9yICoqLioqLioqLioqCiA+IHVkaGNwYzogbGVhc2Ugb2YgKiouKiouKiouKiogb2J0YWluZWQs
IGxlYXNlIHRpbWUgKioqKioKID4gZGVsZXRpbmcgcm91dGVycwogPiByb3V0ZTogU0lPQ0FERFJU
OiBJbnZhbGlkIGFyZ3VtZW50CiA+IGFkZGluZyBkbnMgKiouKiouKiouKioKID4gREhDUCBhY3Rp
b249IiIgd2l0aCB2YXJpYWJsZXMKID4gT0sKCiA+IEZyb20gdGhlIGFib3ZlIGxvZywgd2UgY2Fu
IHNlZSBvYnZpb3VzbHkgdGhhdCB0aGUgREhDUCBhY3Rpb24gaXMgYW4gZW1wdHkKID4gc3RyaW5n
LCB3aGljaCBzaG91bGQgYmUgJ2JvdW5kJyBvciAncmVuZXcnLgoKQWhoLCBnb29kIGNhdGNoIC0g
Rml4ZWQgaW4gZ2l0OgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQv
P2lkPTk0YzQxZWVmNjE1YmIzM2FkMjZmZmY3MWQzNDFmNjZlMzUyODZmNWQKCkkgd2lsbCBhbHNv
IGJhY2twb3J0IGl0IHRvIHRoZSBzdGFibGUvTFRTIGJyYW5jaGVzLgoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
