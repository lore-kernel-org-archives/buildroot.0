Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9469C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 13:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8162381FB1;
	Tue, 30 Apr 2024 13:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXxq7I_6I5EF; Tue, 30 Apr 2024 13:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 971EB81FBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 971EB81FBE;
	Tue, 30 Apr 2024 13:42:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8AA01BF348
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 13:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55E481FBE
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 13:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOQDiipsmPrJ for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 13:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBD5C81FB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD5C81FB8
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBD5C81FB8
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 13:42:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso7398619a12.3
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 06:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714484527; x=1715089327;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3cw/lkqPEVsRw6JCMOEgsWq3w+yurUMsxBf0qJi+CJI=;
 b=vDlGTBkKCsHnvCSHy3jA1NzeL1tIoikuFixNcxkgCNbar+uq6fLEMZMxvw3DF1R3cs
 PNNylk9Vfcec86X/exEk3Kzb91jToIw5cR/9Sc2J1fXsXhr5VtggJ+ANOad9jBfp3ZRD
 XkgkCC30JKqpFLBUEDYZzLz6FeHNJRexM5Oc2oFwLQ1ElYp0A2YdqMKjsGrEEAZI/6mw
 4u3AsNcPbXViTijOZ02JgUSx8XbRzHJjLkqlS78ydlWK2NyZ+dcWzRvDWVULiWaZGHC6
 C5fG+NWdDSFkNbQJbs47nlfXa6n0WVIQP3A7VQjeAH1RXc5mNCrx8RqGBAxv16kxjPz+
 /nNw==
X-Gm-Message-State: AOJu0YyZYFplU18QdywKiBNpuTdvNsgeMlZWbaWLuKtz0kk6ByWRNiVa
 EcAMongvyQvg2KOhnAwN68PJGMj2vOtDiEVNUNJ6LxLZeNtANekP9v8SHcQG9/BbVFtUFgJ4+ps
 RFUVurAff8WBfyVzAl8oRcn3kSAwTuTt4e430NrdGcQZv+oObKr+USsZu6n79Bq2c8jx5RbUgbC
 6TT4Ptf1ZhETJPMAQbwOwLQ3bcogrT4+0eSSyPlVzPwtgMO34iulbWD5OYW6M=
X-Google-Smtp-Source: AGHT+IGtnj30DDF2EyTaTWANhxiXEntCdRcfv/FQQKIz6gIkOvgBlvay55yS+3Ci7dLtAyXLmpQ/IA==
X-Received: by 2002:a50:cc95:0:b0:56e:2daf:1ee6 with SMTP id
 q21-20020a50cc95000000b0056e2daf1ee6mr5799883edi.16.1714484526657; 
 Tue, 30 Apr 2024 06:42:06 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:831c:6fac:95a9:d72e])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05640243c600b005725d859e4esm4526957edc.73.2024.04.30.06.42.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 06:42:06 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:42:05 +0200
To: buildroot@buildroot.org
Message-ID: <20240430134205.GA1288658@theia>
Mail-Followup-To: buildroot@buildroot.org
References: <20230907003002.474334-1-patrick.oppenlander@gmail.com>
 <20240430133754.1288162-1-gero.schwaericke@grandcentrix.net>
MIME-Version: 1.0
In-Reply-To: <20240430133754.1288162-1-gero.schwaericke@grandcentrix.net>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1714484527; x=1715089327; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3cw/lkqPEVsRw6JCMOEgsWq3w+yurUMsxBf0qJi+CJI=;
 b=62no8BcD3RY0h/CVCmo5nVQw+B/gWh+e6gAvcaaLuw0J3KbUwJWCN1fjb69mnaglM2
 YQtNkQodBKcyiLNkWKotV3LwgLXq0a1DE4KPeGv+/Hn7cbhrY0YpS4LzRqYLzl5VYPPS
 NNEPGtp1ATBKwY7SHicJG5PZhOUvgOnP1NABeutPyRza7+gXdyrX/qTY3eV4lpGRbuMo
 tp2wMz+9CCIczw+tPqiLMLduTG2AxBpGYiC9e0vB49AOQU/ekyLjvBXMuXfMAwhhLQzZ
 nHuGNVTD+70chaW8Z9SLKyEegLSEfA2cTngpEHu4tXOe21eHWwjg7g+aCQb/kCB1RZj1
 tlQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=62no8BcD
Subject: Re: [Buildroot] [PATCH v2] ti-k3-r5-loader: support devicetree
 customization
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note: This is v2 for

  [PATCH] ti-k3-r5-loader: support devicetree customisation

  https://patchwork.ozlabs.org/project/buildroot/patch/20230905003412.67305=
-2-patrick.oppenlander@gmail.com/

I think patchwork didn't catch that because I spelled the subject line
differently.

Best,
Gero

-- =




---


grandcentrix GmbH | A Vodafone Company =B7 Holzmarkt 1 =B7 50676 =

*Cologne* | Phoenixseestrasse 18 =B7 44263 *Dortmund* =B7 Germany
| in =

<https://www.linkedin.com/company/grandcentrix> | phone: +49-221-677-860-0 =

| email: hello@grandcentrix.net <mailto:hello@grandcentrix.net>


grandcentrix cares about privacy =

<https://grandcentrix.net/de/pages/privacymail/>

Amtsgericht K=F6ln | HRB  =

70119 | Gesch=E4ftsf=FChrer: M. Kr=F6mer,  R. H=E4nel | USt.-IdNr.: DE26633=
3969

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
