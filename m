Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251A1C30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B68404AA;
	Fri,  5 Jul 2024 09:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJ9CdUJIurXF; Fri,  5 Jul 2024 09:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81A95404D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A95404D1;
	Fri,  5 Jul 2024 09:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABE381BF2A1
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98A6760669
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6YCt8rScNC2 for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:18:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F7AE60668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F7AE60668
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F7AE60668
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:18:46 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-36740e64749so808704f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 02:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720171124; x=1720775924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fYScR/cgqCSow9Pju4LDT1cbb00576L1lRyqFetN06U=;
 b=NqcgywYjzwYFmaO86BzIQH9tw6LOa3drkqmEk6wYHI+4/PW0/ZaqEv5IIocyWMKeVS
 WomrCp+x0XAmDggml44lT/0muo520gkXvTkbhLrPaN2U1Kn3F9HSuyVlD1um2nMWS5K+
 kVdW+aA+4cuL9wvJSTbM85Cqx652BcJH4QUaLvN5nwQ8YsLihSkrxOYZ7xo2wHWtbKuD
 0mPEyXx91mEdluD34rdapdyu2jQYSudx9gsI9R6c/AUfXUD0rCSy4YdPzuZ9dwtOeU7Z
 FbSbPZdgJAGGhCU9OEDbUOJ7tTWhrrGMzce1Ef7VhA/nwgh/nPkE297STie8NHVFgOJb
 Gvgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7sySeNA+V4K7mD/Ct+Kw7uMhMI7KSRYhpdxkxm9kZEAt00NuoylKb7wfXgtHJ9ELk5qKqjiawz/xe8xgMiqSHA2NIL2JZKw==
X-Gm-Message-State: AOJu0YwCVmStNASk1bTMw3iMKLD/j6ZSplyQzok4JhzRoRQlloalCzt1
 g0qMcmPWY3+gNJOSiYowrHVOc45w3yFPMq+TxYtB5hRZa0vx4ohLBzsl5ZNzDCx4Z/FjWaePu5B
 IKbU=
X-Google-Smtp-Source: AGHT+IEyUx8LaHTfr9Om0ZmA6sPPHZT8dDKmeAy5IgDom28d5FMOA5h0cs3NQctkDLmNJrzDCn/ELA==
X-Received: by 2002:adf:f006:0:b0:367:940c:6a3c with SMTP id
 ffacd0b85a97d-3679dd3500emr2506908f8f.41.1720171124083; 
 Fri, 05 Jul 2024 02:18:44 -0700 (PDT)
Received: from [192.168.178.20] (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679983882csm4149569f8f.78.2024.07.05.02.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 02:18:43 -0700 (PDT)
Message-ID: <3d543976-89d6-421c-a1ef-d7cbc5de6502@mind.be>
Date: Fri, 5 Jul 2024 11:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
 <0d010957-bd83-4136-bc11-398d53eed477@smile.fr>
Content-Language: en-US
In-Reply-To: <0d010957-bd83-4136-bc11-398d53eed477@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720171124; x=1720775924; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fYScR/cgqCSow9Pju4LDT1cbb00576L1lRyqFetN06U=;
 b=AXXGoEKl2i1XYGw3fhOS0ne6A9LydQXqKa7RcCywBw8zir+vZBXI97jSVvFOTHD6di
 W+eCrxHrM2keQ49zQ0mNbYPrDbxh5lJf5uzv4Y/H/O035pVwUHoXK2o8v3Bqdjn1phTQ
 ughxfUVw1mg/wGn35nXGJpZHU5ljtxj1fqEOUVe173Dcp4ka9yOxK7XdUpREqE77wAM4
 /iFeWzFDm2LjKhUVtoHgx3DXwqvyvBx0c4RxTEFXzuyMio4qxgNanB4fUOh9V0OGulr7
 9r1HFmjwySr+vWrdKr5bag5vCk48B6gxaXchtByKmeThwVjzDxqLiro7aMSLL1dmoiIJ
 DWPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AXXGoEKl
Subject: Re: [Buildroot] [PATCH 1/4] package/python-sdbus: new package
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLCBhbGwsCgpPbiA3LzMvMjQgMjM6MzIsIFJvbWFpbiBOYW91ciB3cm90ZToK
Wy4uLl0KPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+ICsKPj4gK1BZVEhPTl9TREJVU19W
RVJTSU9OID0gMC4xMi4wCj4+ICtQWVRIT05fU0RCVVNfU09VUkNFID0gc2RidXMtJChQWVRIT05f
U0RCVVNfVkVSU0lPTikudGFyLmd6Cj4+ICtQWVRIT05fU0RCVVNfU0lURSA9IGh0dHBzOi8vZmls
ZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy84ZS8zOS8zZDQ5ZjBkMThkY2JhMzM0NGFmNzU2
ZjMxZTQ0MDhlN2RlNTBiM2RmODZmYTNmM2VhNmY2MDQ0MDJmMTYKPj4gK1BZVEhPTl9TREJVU19T
RVRVUF9UWVBFID0gc2V0dXB0b29scwo+PiArUFlUSE9OX1NEQlVTX0xJQ0VOU0UgPSBHTlUgTGVz
c2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdjIgb3IgbGF0ZXIgKExHUEx2MispCj4gCj4gVXNl
IFNQRFggbGljZW5zZSBmb3JtYXQ6IExHUEwtMi4wKwoKSW5kZWVkLCBJIG1pc3NlZCB0aGUgd2Fy
bmluZyBhYm91dCBzcGR4X2xvb2t1cCBub3QgYmVpbmcgaW5zdGFsbGVkIHdoZW4gSSB1c2VkIHNj
YW5weXBpLi4KCkFjdHVhbGx5LCBpdCBsb29rcyBsaWtlIGluIHRoaXMgY2FzZSwgZXZlbiB3aXRo
IHNwZHhfbG9va3VwLCBzY2FucHlwaSBkZXRlY3RzIGl0IGluY29ycmVjdGx5IChpdCBkZXRlY3Rz
IEdQTC0yLjAgYnV0IGl0J3MgYWN0dWFsbHkgTEdQTC0yLjErIGZvciBib3RoIG9mIHRoZW0pLgoK
VGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKSSBzZW50IGEgdjI6IGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA3MDUwOTE0MDkuMzM3MDI3Mi0x
LXJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlLwoKCktpbmQgcmVnYXJkcywKClJhcGhhw6tsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
