Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A005C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE07D60B21;
	Sun, 16 Feb 2025 12:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvfrl2ZrusFf; Sun, 16 Feb 2025 12:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D8D660B5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D8D660B5A;
	Sun, 16 Feb 2025 12:42:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2424A72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D2460B21
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9-5oz8EbYRW for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B02FC60BE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B02FC60BE7
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B02FC60BE7
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:41:54 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 634BB35207C7; Sun, 16 Feb 2025 13:41:51 +0100 (CET)
Date: Sun, 16 Feb 2025 13:41:51 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z7HdD63RHkaM8X8t@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739709711; bh=5XFGsRDgD1POpThL+hDtwuCd+lp4yml6FlslN17jAX0=;
 h=Date:From:To:Subject:From;
 b=hggCqNFxXlfsVwQ2KW1N3gotteEobLNElTCIHOpYxJthwVo0lHrB0yTvjsUNtUuvN
 opbHd2fsRgS3Iw/icl0bnOJW2/8XJaZP8+yGoOg7OvDERmIT1ZlXuLqjdHlS4kizbb
 Rdm/woSgS/t0pEKKlfG00TOK25XxWOHj+y8sw+imqiAcgAT7fprfqc7op33NW/0+Zm
 5SkmR5v08ImHW1cLrmgahVIZs3OTgPyIF1qDsEJ8bHzumgOJrUXenUVg95YpWR7Bqe
 O0j8fpoA2iIdMP/gPu34O4HD0JAzzkQhTrneEveilVYz6wkltDDohb+3xvEkaO27xg
 4pc7G6bP9hOUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=hggCqNFx
Subject: [Buildroot] postgresql issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I am using Buildroot master. I try to use Postgresql Server.
I have locales enabled and building for a raspberry pi5.

wbx@neon:~/buildroot$ grep LOCALE .config
BR2_NEEDS_HOST_UTF8_LOCALE=y
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_GENERATE_LOCALE="en_US"
# BR2_PACKAGE_SYSTEMD_LOCALED is not set

Journalctl reports:
Oct 08 15:42:34 buildroot systemd[1]: Starting PostgreSQL database server...
Oct 08 15:42:35 buildroot postgres[268]: The files belonging to this database system will be owned by user "postgres".
Oct 08 15:42:35 buildroot postgres[268]: This user must also own the server process.
Oct 08 15:42:35 buildroot postgres[268]: initdb: error: invalid locale settings; check LANG and LC_* environment variables
Oct 08 15:42:35 buildroot postgres[261]: pg_ctl: database system initialization failed
Oct 08 15:42:35 buildroot systemd[1]: postgresql.service: Control process exited, code=exited, status=1/FAILURE
Oct 08 15:42:35 buildroot systemd[1]: :5:185m:5:185mpostgresql.service: Failed with result 'exit-code'.
Oct 08 15:42:35 buildroot systemd[1]: Failed to start PostgreSQL database server.

Any idea? I have set the environment variable LANG to en_US.UTF-8.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
