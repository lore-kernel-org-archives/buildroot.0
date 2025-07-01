Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD3C8302F
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 07:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C8C614E1;
	Tue,  1 Jul 2025 07:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0txIN1mSbhc; Tue,  1 Jul 2025 07:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA042607FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA042607FF;
	Tue,  1 Jul 2025 07:31:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F707197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15D01607FF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYYjGKJpu7Uw for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 07:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4AB260774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4AB260774
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4AB260774
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:31:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B6E5B970068; Tue,  1 Jul 2025 09:31:09 +0200 (CEST)
Message-ID: <c0d16962-62b2-4512-9f12-a61edb2aae1b@rnout.be>
Date: Tue, 1 Jul 2025 09:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Ludwig <philipp.ludwig@passerro.de>, buildroot@buildroot.org
References: <4946d64f-534f-4034-a2c6-f82bb0a32748@passerro.de>
Content-Language: en-GB, fr-BE
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
In-Reply-To: <4946d64f-534f-4034-a2c6-f82bb0a32748@passerro.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] Upgrading a postgres database in buildroot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/06/2025 15:22, Philipp Ludwig wrote:
> Hello list,
> 
> How do you upgrade a postgres database in buildroot?
> This just hit me, because I upgraded a buildroot image, which now contains PG 
> 17.5, so I can't read the data that was created with PG 16.
> 
> Now there is the pg_upgrade command, but it requires the binaries of the old 16 
> version - which I don't have anymore, since I upgraded my filesystem image.

  Ugh this is super horrendous! How do other distros deal with that? Manual 
upgrade only? Or a hacky combination of post-remove and pre-install scripts to 
do the migration?

  Or perhaps there's an option to build the required bits for pg_upgrade in the 
PG 17 version?

  If this is really the case, then I think we have to add a big red warning to 
the PG package saying that it is not usable in practice. We cannot keep 
maintaining PG 16 forever like Bernd proposes - if you use this is an actual 
(embedded) system, you have to be able to keep updating that system for 15-20 
years, and you can't keep using PG 16 for that long. So there _has_ to be a 
migration path.

> So what is the recommended strategy? Is it possible to install both postgres 
> versions? I did not find such an option in the menuconfig.

  This is just a temporary solution of course, because at some point we'll want 
to remove that PG16 package, and then it will no longer be possible to upgrade 
from an image before-17 to the image after-16-removal. But OK, if we keep PG16 
for something like 3 years, that's still somewhat acceptable.

  So then the solution would be:
- introduce a postgresql16 package that builds/installs _only_ the things needed 
for 16-17 migration.
- postgresql16 should depend on postgresql (because it's only for migration).
- add a migration note to the manual (in the 2025.02 section, because that's 
where PG17 was introduced) that explains this need for migrating the database.


  Ugh ugh horrible.

  Regards,
  Arnout

> 
> Or do I need downgrade my buildroot image, copy the binaries, upgrade again, and 
> then run pg_upgrade?
> 
> Best regards
> Philipp Ludwig
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
