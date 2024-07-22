Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C933EC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A4D400D2;
	Mon, 22 Jul 2024 12:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHhnRF-_pWVC; Mon, 22 Jul 2024 12:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4286040177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4286040177;
	Mon, 22 Jul 2024 12:53:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98E5E1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93B36605A9
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77I35rHyQFRq for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A82760594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A82760594
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A82760594
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:53:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A4D420004;
 Mon, 22 Jul 2024 12:53:52 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:53:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240722145351.17616fb0@windsurf>
In-Reply-To: <20240109071343.4025060-1-james.hilliard1@gmail.com>
References: <20240109071343.4025060-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721652832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ans9+7oTzPcpNdUXVPymUmKoFSmkFTsE1gEjgNklMYY=;
 b=AOcm9A9O3M71C8ipmtIxEKrSgxO+zsM1LQQ1yhwRpwgx4bBF8QfJ04oqBuTkhW4Lsj3zk/
 LjRb5LpDVwntHlBc1orpXAnvOIIuEZ3M0CHjl0YhaNQ0e4MfTqR1FczOBusEl3gYZhLs4w
 7PXut33CTm5rByFvBQx9rPsiA1PjTnVPoc+Sd+qTM+V7D/9kkggxJ7AVV5HgD7ja4GyjJK
 qvRtQ21URu5Vxh7TmDqYcWsAD0Jyt/gipcmnu+0AT/4Z16uGi5kCi7D1OXTq36jcF7BXRK
 zLzLr0i4yOwp8yxMqPW1hUVRipOcLN+hR7mQdzRFjPDMqhtaYbFn+PQnhP1EsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AOcm9A9O
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to
 version 2023.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue,  9 Jan 2024 00:13:43 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-dtschema/python-dtschema.hash | 4 ++--
>  package/python-dtschema/python-dtschema.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Not sure if it's related to this version bump, or the switch of Python
to 3.12, or something else, but our python-dtschema test case is
failing:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793121

Traceback (most recent call last):
  File "/root/sample_python_dtschema.py", line 1, in <module>
    import dtschema
  File "/usr/lib/python3.12/site-packages/dtschema/__init__.py", line 23, in <module>
  File "/usr/lib/python3.12/site-packages/dtschema/schema.py", line 10, in <module>
  File "/usr/lib/python3.12/site-packages/jsonschema/__init__.py", line 16, in <module>
  File "/usr/lib/python3.12/site-packages/jsonschema/validators.py", line 19, in <module>
ModuleNotFoundError: No module named 'jsonschema_specifications'

Could you have a look perhaps?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
