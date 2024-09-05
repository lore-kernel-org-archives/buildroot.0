Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62740CE7A9D
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26AEF4051D;
	Thu,  5 Sep 2024 20:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7aPoyagKDyi; Thu,  5 Sep 2024 20:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC41D40DE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC41D40DE5;
	Thu,  5 Sep 2024 20:45:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C62F1BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07474606BB
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhpyeLmLymTR for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4D92606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D92606B1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4D92606B1
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:45:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BA7E20004;
 Thu,  5 Sep 2024 20:45:42 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:45:41 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240905224541.4b62638c@windsurf>
In-Reply-To: <20240831113626.105125-2-thomas@devoogdt.com>
References: <20240831113626.105125-1-thomas@devoogdt.com>
 <20240831113626.105125-2-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725569144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVJm3ncSUiOz/J3KpGLOKU84bGESnFM03b67RSEuKkQ=;
 b=Cl+tUWwb+DeSozmyqwRmKcERCTojeZYt8F70i7wAOMHe1FHMOhWnwsAFdZHOUv8xtREfsw
 Zy9T6dEH1uVjK8y39Uzdfp0oxIkqAj15SiQX+cubJvhYaI8qVTrlDJcC7VycrhksG7hBZ6
 HfkB3pc2880BCbO+1K/am9m1Ft/SpcYDaXJlHZvlLCaednwAecc7Z9jfFXPTFbPjPN0B//
 aYpcJajrJQgewQ4XbArgdM+44YaiZjfW5ObTf9G5LHp1jvUuLoqkJCB0Mh2q4ZiqeUBG/k
 Gs/58yi1jHPZSBed5KaIzamjRVjw5NXooHRvN8M0Feyy2sHSlWjYlO9rz8hCWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cl+tUWwb
Subject: Re: [Buildroot] [PATCH v1] package/libgtk4: fix execinfo compile
 error
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 31 Aug 2024 13:36:26 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> ../testsuite/reftests/gtk-reftest.c:28:10: fatal error: execinfo.h: No such file or directory
> 
> We don't need the test suite, so disable it.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  package/libgtk4/libgtk4.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
