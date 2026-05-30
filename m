Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F9ACD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4EF5405DF;
	Sat, 30 May 2026 09:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJwS3fbpIl7p; Sat, 30 May 2026 09:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBD0A405E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780132869;
	bh=Foq75o9/aYTOUNdAmc7/BJ8DApCjJyLTnT/QYGrX91g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i0UxlxJoFwa6kakzr1Ds6S8gbSlYd9MBYoqhtKuxNOyRewlqvw7ps+RlWt9VyR4/f
	 KI0pS1IvZMj7rrlidonsWs2KqU0VtHEbl4Kaq1S+JqBXlpKOnpCVudevWwGyrAz8vB
	 JbGBPy1SXFZSp80RGQQz2tFnBmVqF7Hg4DkJxsQS1rce6G09rwHKcL2ZEQohcw3+hA
	 z1maT1KL+h+wynTC07/4unngHUCnkuM/odsZZHDwLxmVFVNshbA4rmLX3M3FxhvPnd
	 z36TPDvL416o9W71gnbLKNpiYapAh6fhbohM14O8sEuOM7oFBjbIIBTJUDR9+p7zee
	 Lxi2NKyW7Rhzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD0A405E0;
	Sat, 30 May 2026 09:21:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DAB112F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E8FC848B2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iLnPwM6jI2k for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 584DC84887
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 584DC84887
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 584DC84887
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ef76f0d06so120103f8f.2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 02:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780132864; x=1780737664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4RgrLx3xXXtRQku+bV09mWIk9Zm5LPzyEvxWUCJapOs=;
 b=PjOTHlGw4SSVSPHMLlG3NNwRcYuIZ/lEtkeTeY/M12+IhDOrgGl1bTfUbrEVvrwD2h
 pCM6oQApNBM+59cB2X2oAxNznilXv8+bdSw6GloqJRTbT0FuNEzcx0WU8SgapHBBxVuQ
 BDz+qUSJmJ7NKSLaenipNeB8DMvy7Wx6AwMO73IXcigf5W69S54hZbQdOQXUI7EvTNqe
 yQIKqMOio5Smu3+tp7fm6O2P7Iyl2rUNcq8cIiTh8QniUy20oGJuucHSalv0xgWMYakJ
 1pS1J2nXYpBB/ORmUsO9jditK5l5I/WK9L+wEDctnilbIBhogGL3LD3mdVYjGu2Pg56T
 gN0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+BKBEeY4QCjwPxjausvt/i/8vMmUyxyHb7PevotC/tDBSMNYeAHiYSRnzvVbkfRpq2U4uhoUfj+hc=@buildroot.org
X-Gm-Message-State: AOJu0Yy16J3m4d+/HP34+KEB+k1ooosOfQEr1sPjhsDbs0HGsraVVfAK
 3VhAuAp+hE5MuZ73pxBHTVKBQQosDEQ3JQdX46UfuZBP9Z3YCgVx8tr5XzLIJsXC3q0=
X-Gm-Gg: Acq92OF3L39a3qwOFkAnRZzURt+bf6mcSbnOHKOW46J5PNuHsmwQ6loSx0vdmLdeefa
 d5Pc9zhsiUMB6SXybzXoZhKLX4F7e9Ngiikv3gwnyo9iVHoHvqLebFBPdn0zkazCo5/mop4FiF8
 Oy51J3cHO/L9LzUItvdfhy6Si78DzPPaISt4U2VLl+p3QqMq/0xMH8KtqqScrLM5GK+lczDt0Ke
 OxyA2r8FSz2q5HG/ATQvCUrXiCJ+U1bLF5xF1cESleXIqPLJeR7xT7pELUGTVXocq/l34hhzleu
 9AJeWPsH+b0w+QsrCeeDAtgSJ0QYZRnvPLzQ4S7lsmw3ustOpf49xiu7Prox2HIwdqhWsWSM2US
 DBtx1pxYR1zhTsFKPqfNF5x18lrnjpoxfgNYT1DcO1sGY5TavAgFKahNIuw4Qo2e/EBo+y7Cytk
 AB9rzxITutMjCoCGVhQdhX8J+hSjcGplneXihX63JNWSUPTD3CbQy7+/dP3A==
X-Received: by 2002:a5d:6b0c:0:b0:45e:ea3a:47e8 with SMTP id
 ffacd0b85a97d-45ef6b6d67dmr4286064f8f.24.1780132864272; 
 Sat, 30 May 2026 02:21:04 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354b7edsm9358100f8f.22.2026.05.30.02.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 02:21:04 -0700 (PDT)
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Quentin Schulz <quentin.schulz@cherry.de>, buildroot@buildroot.org
Date: Sat, 30 May 2026 11:21:03 +0200
Message-ID: <20260530092103.8219-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>
References: <176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780132864; x=1780737664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RgrLx3xXXtRQku+bV09mWIk9Zm5LPzyEvxWUCJapOs=;
 b=PVlZFrv7eegjOF9tcEUHGZUn1+bH7pn0+8I1pqPJI3VRbYOyZMpBE7SbxXaKoYaH/I
 8Bs5rG+e5Ej0qPQNQPN1gSwlfbwxN7TqUPiqhnbpfq8C/UgfMx3k1pLVmFLl0Zu5icZo
 KxokpDVI4bd6p0xTg5jvWXYGp31v5vU7uRjpHL5KqlLIC4K8Y87EZES9eQGNXuPXCbBo
 e5w2TOj1Y3F0TNG+dTnWjhzAxdJcSmFhnyU8ArWcNbSppkuGN7xqKzI9eoG9L3NldD93
 aIp4G/fEIlxryOLnG5iievmoxyS8qKPoxb7bAbC8/CToNX6Kpa76t77QDWq7aNxlkU+n
 lriA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PVlZFrv7
Subject: Re: [Buildroot] [PATCH v5 6/8] utils/generate-cyclonedx: mark host
 packages as external
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

Morning Arnout, Quentin,

In reply of:
> > isn't required per-se for now. That may change though. (we also duplicate > components for which we know there are multiple CPEs, since CycloneDX has > decided to not support that and there are multiple instances of packages having > multiple CPEs (arm-trusted-firmware, optee-os to name only those).
> 
>  Yeah that's a wholly different can of worms that I was just discussing with Thomas on #buildroot-lts. The whole CPE concept is just broken by design.

The problem I have with having duplicated component per multiple CPE is more in
the design of things as it will be represented by multiple entries in probably
most of the software that consume the CDX.

Example with the following component:

```
{
  "type": "library",
  "bom-ref": "foo-1",
  "name": "foo",
  "cpe": "cpe2.3:a:foo-1:foo:...",
},
{
  "type": "library",
  "bom-ref": "foo-2",
  "name": "foo",
  "cpe": "cpe2.3:a:foo-2:foo:...",
}
```

If we have a vulnerability CVE-1234-1234 that target `cpe2.3:a:foo-2:foo:...`
if will be represented like this:

```
{
  "id": "CVE-1234-1234",
  "analysis": { "state": "exploitable" },
  "affects": [{ "ref": "foo-2" }]
}
```

It references only `foo-2` while `foo-1` and `foo-2` are exactly the same ... I
just find it odd from a design perspective.

Of course it's because I'm thinking how to properly design this for
security.buildroot.org and I just think it won't work properly unless we make a
lot of assumption.

An alternative I could see would be the following:

```
{
  "bom-ref": "foo",
  "name": "foo",
  "components": [
    {
      "cpe": "cpe2.3:a:foo-1:foo:...",
    }, {
      "cpe": "cpe2.3:a:foo-2:foo:...",
    }
  ]
},
```

You have a better view of the alternative CPE in a hierarchical view and you
clearly see that they are coming from the same "parent" component.
You don't assign a 'bom-ref' to the children so in theory you could use the
parent reference.
But now the problem is that I doubt the all software that perform the scans
would support such hierarchy ...

So as you said CPE are just broken ...

>  No, it's actually the reverse: the "deployment environment" is what is already present in the target before you add the Buildroot artefacts from it. For example, if you have a bootloader already in EEPROM and you don't build it as part of Buildroot, but you still need to refer to it for some reason in your SBoM, than that would match this description.

It's also a way to represant if your device interact with an external API
or something I think.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
