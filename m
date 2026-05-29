Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E71CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B48C613E1;
	Fri, 29 May 2026 14:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6Us5J2Lh0do; Fri, 29 May 2026 14:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35C3D60E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780066009;
	bh=vTLx6TBLAyE+lNQExdAqkV4iknQaoRPhAVJuhDR3s+w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L0RjoaYBK7UoaGJO+1Qtf37rzKCkDdH684xciEldM7qbw2krmPBaE9MoCKm+RB6B3
	 y+FomYSgRVRZDEbejGNUbq2CCweFe6gkvuynhOUnl+eiM0M/XHtmKRmI/vr66+fyRm
	 0IttnQKN8a+Xs1h3viEixVnblxBOWLepTRvTbQeQw5ostC2GQMJYGsPQpN6h94cxra
	 X4/5Y9xOhSW/u67uSNqS5IuzS7AbGvJ5vv2mTlGNIyDbAiC2FL/wOparQ0qnmyPvF+
	 c/2Tn+9HFdRYfM02cY/iNWcq3fP9uI86Jq6uYbQ4HLxJk7Gm8Hp203oxJeh4BAaC/V
	 NoaAMbSoEOU3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C3D60E85;
	Fri, 29 May 2026 14:46:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 248A7D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06343613C4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7zuV-VFuU4r for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3180D61144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3180D61144
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3180D61144
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:46:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso50906445e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780066005; x=1780670805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6Oszl7XctKDl9ekRjogIMWose4XXx4q/HCLY6a2VAic=;
 b=DCgaeM7hnQYlk4GWvc4tiLyHmqnrcujQ96Z9tokN08MeOF0t8G/VxuOCHmSLVKCEXm
 m+JUacrYuEw80QIbz8wyy+tX0c99HjXu9R3b3tA/csX+dU4ADeX2ZTe3dpeJJJOl2h8A
 1wg++DEWdNLhD0baGHgRsn/irOhBqo50wwbxlRxKBXZHl2KMq9XuYLn6RvMQS1Qs+wNM
 rqSjQqYBVo2fQCSn7EStDlW/TmzfSwK0DWokROnk+/miR6GBzlVv3BrUcl60P6odC0PH
 hO3i9DgrTOP8mfCcWN1AY7k6imXvBIYcm8tng+KhvSkw56i03xks8AmkFPJFtxV0kH5o
 mhYQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4unXylzRlmDzjPcVir/+eJLy8W4irTaNOrgRWvQTn0LvMtjySYWunWnx1nL/93kTFMt7RkLvB46I=@buildroot.org
X-Gm-Message-State: AOJu0YyLINRPNkQlb1YK38f8tSDgRx0A2ARI/ZE/wsvMOtA/wOXWE+FO
 0Q0wE8RBZ0TXHOTEDrhS8BSzLS6HTMNLUPvVFQyAH4GeTthU3QTQ5V63LbMMrCjoG40=
X-Gm-Gg: Acq92OG7CoBRnvbeqnBWtYkPP7klgFdeq70zSNK3XrBntBXNFB9cRlNcVbepztZjuyc
 6KnNbQScc2UzS2/ycv6lW3s9UWgj0HFp1EeoFRm4Rc+P9UbA2s2e05TrgzwZ2BQ0iXZ6iydz+Sf
 KCpjEbehoRTMwFV1H6M313rAhp/CUgmSvLT3mambrGwCTGhIY2ECrXr4zi1ytNc2MpwxVVny0vS
 /Gvs43phKcNR95k+RDtNhvSjjvyJGiWgr14h03vhGydSo8RL5nDmlyj03UOovlq3UO4+68AyU0E
 POjHmmxEr6a9neTePGqdS0BmtPgf3xR2krZcPGqzmKxDjGwPLP3DPSV+VISUqBaSzxf5sndajKO
 1FZqFjKjRwheT+FFIK4RVUn3MWSuxybDfOfMKH1v4Y1aGQU8zc06gt2e9+rtnVM5vQC87AY/JSa
 C4f830yqG3P3dwxdubfv5hVdLf+jl+q+QKiZKLptlGR2H/xNXuD9Bc77y7/Q==
X-Received: by 2002:a7b:c358:0:b0:490:53b0:9e53 with SMTP id
 5b1f17b1804b1-4909c078feamr38822465e9.1.1780066004763; 
 Fri, 29 May 2026 07:46:44 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3595ef4sm3780361f8f.37.2026.05.29.07.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:46:44 -0700 (PDT)
To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Date: Fri, 29 May 2026 16:46:43 +0200
Message-ID: <20260529144643.435969-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87a4til3hv.fsf@tarshish>
References: <87a4til3hv.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780066005; x=1780670805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Oszl7XctKDl9ekRjogIMWose4XXx4q/HCLY6a2VAic=;
 b=Top159+nr3UYrk6QRv0XkTVJAmnUETpfyntg6g8hTaDX0hvQyRBRDP79rXzWOcO4fy
 QuhYEFjqSTHtnh9sP13gGF5HJOwTGJNibce388oLZUP1CYKQaA8YN3PWPWq5jUMYQAwZ
 v2PJhHHmWoPoohqFMm8cx0pUicX3SyyZIO3vMKHc2A7thHwEugePBEhDNBwmPCoAx3N1
 WZWwrhzRo1R5ZbEo5n/VqOmW7k3phNY834IriLfpgXB2wmz+N9Re/L1HOYQPh0vxn+Tv
 rLTVJxS55o2yHRacAeGcRWVHwVvWbuxFsbGl2RHKFFu29z8DRDZMr7pMgMFedMYzkj7A
 FJhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Top159+n
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to v17.10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> Not in 2025.02.x as of commit d2eda853cac ("{linux, linux-headers}: bump
> 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series").
> 
> baruch

Fixed, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
