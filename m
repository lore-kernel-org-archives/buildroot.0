Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C4DC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 17:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1716E407C9;
	Thu, 27 Aug 2026 17:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKMMhOYNP-DW; Thu, 27 Aug 2026 17:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787852014;
	bh=FBFsM6cjmbRbByiBNXJAgfNRRQuuRVlztRHfLWdVKrI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xp1aj0KnXO1dwaWogN+ouQgbbPqvCXvzUTqn4Ydhz6QGC6MWEUTxpLQghjr3urYAM
	 2fvcAr1SCP49Y79cRhQQiQMuWPZ1F6o0YWBHYlTGMBIRHWemFv721+9H5tln+H6s1V
	 dTScgURkOedIIDaRWrJHHHKYcx0gYoAw6gT8gTsmAVk/lFQ5Ycv7e9wdUdlwdKuJEN
	 0GIfTgEKlK1V0nJyz2E+m+ZHm2sL/3/e4esF0ZgBKvCQUSsPyYWZ6p70ZITmIA14UD
	 zBvrYrHgETOHB82pA4y0z42GVPcV4YBR9KGsMmJZnKjDK77G7txPhePe9JWCCuUDDn
	 sY+MjMnkT2Z7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60CBA4076D;
	Thu, 27 Aug 2026 17:33:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C31B465
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DD43607B3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 17:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WjP8T5LhltE for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 17:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50792607AE
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 17:33:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso8645005e9.0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 10:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787852009; x=1788456809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7dkMo8v0XaPejm6Y72nNj50zIdm4x84guYkPU00M1Sw=;
 b=KmN8rxhz53DGjNim0wZk4IenYksu58hUYr8jgjy5ynOS4+7c+hcpo4OgWMQ5q9AaiQ
 lgIzxjFBII3lsAS66wEJw7eJ7WaaIEyCaw/77GemzaN5+uFeiiJTDvAXXbKPlIaZh5bI
 qUfsJXkOvNph+buOck2GSvZmiqmNi6uDoyPsSHqwoHGCxYo5oBH+87cE5jc8ZQRuY87D
 4ruaQ+5qXv2HStl0uR8KYGtkmoucuI1ZC8TY+4C6t5riuJzlxxyLgdW4+V+yOFmvwJEQ
 /wC5zA10OlaEICwaN+jIspgaIIvDjt0lfA96BEJzrj8yQlAjkpJ4yvRKtzOlVJ+0LgyQ
 f9ig==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRTn+00EyL+Iep5UAMUVj2V6FYt31UBq/Y3+b3tguE6dSr9ZaDMYl22mYTGE0CRq0i2LWe7kmquFc=@buildroot.org
X-Gm-Message-State: AFuF++m7xnoHlQibj/Ugax0h0OWh9aJbe37wnqL/x1fkQgQhHCOA1Qgf
 M53paIYZVDtfZR8zlVE1Y0EpVvmByMCO+AvmtEQhJwb+87mmzCZrUweuTmlW8sIp8T8=
X-Gm-Gg: AR+sD11cU++XX3IEXHi54ZUjLIBfCn8VxqfMYdzZoO0ywjqRuZawYk/kg+0Js+2kHZJ
 U2JtzuRjWKceVSON52Z4p56uWHX0dvc+01TNKP62JdeZxJPljWJbxjJLyoq6VLPR0KvrWj3lD1e
 r7Go0re4h57C+QiyWxRu+azMo6d6Nab35IHmqqeVZxaGn+irnWV2Xv5Hs+VAD7mWA8XGUOHuyIr
 9yF117bwAQFklHodvq7WyLHqz+/IJXsGltZ4PEvYFEVm6IBxomzhjK6Rm9qcGnsDagIJrZjULf2
 ZIIO8SgGHr6mZKV/CTb9r3Y11dFCR9dYyxgn2r46FysdDxq95YI1qi6zCb0AXM1LJYUnrtrGRAl
 vKZKhA/SQNfveRlDtSQtk21JcDQBG9hEUg0FNkCJtNnWBc8SmxUO06hFPd9QqWVDAzvDvEOM2cn
 5vqwHDki9HORIE71Ab9zk+XVDkoCL9Nuhl6EMfcvRiYeBqDI6L/C1Pvg==
X-Received: by 2002:a05:600c:1e24:b0:499:5f80:83ac with SMTP id
 5b1f17b1804b1-49b91a6d41emr11641125e9.7.1787852008905; 
 Thu, 27 Aug 2026 10:33:28 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b468009f8sm64477135e9.0.2026.08.27.10.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 10:33:28 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 27 Aug 2026 19:33:28 +0200
Message-ID: <20260827173328.8765-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apBarq7is6OL_UQu@windsurf>
References: <apBarq7is6OL_UQu@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: always use
 BR2_BACKUP_SITE in the autobuilders
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

In reply of:
> > How and how often are the 'source.buildroot.net' backups generated right now ?
> 
> Pretty much constantly:
> 
> 3 */2 * * * flock -n /home/brmirror/br-mirror.lock /home/brmirror/bin/update-br-mirror.sh >/dev/null 2>&1 || true

Is the update-br-mirror.sh script available somewhere ?

> > By reading this paragraph I'm thinking the upstream location check could be
> > coupled to the generation of the backups instead.
> 
> I'm not sure to understand what you mean. The "upstream location
> check" is done by the build machines, which are completely distinct
> from the machine hosting sources.b.o and doing the mirroring.

Yes that's what I meant. Since doing this verification by the autobuilders is
an issue you could move the verification and publishing of the stale entries
from the machine hosting the sources. 

Since it already has the responsability to download all the entries, it seems
like a perfect candidate to detect stale locations.
Unless 'update-br-mirror' script only trigger a the download if a new location
is detected ?

What I'm afraid of with the HTTP header solution proposed is that it's gonna be
burried in logs that would be quickly forgotten about. The current solution
while generating a lot of false positive manage to catch some real stale
locations publicly.

PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
