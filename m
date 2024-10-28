Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B62D13588
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 08:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79AC6080B;
	Mon, 28 Oct 2024 08:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYrjtTJizQyc; Mon, 28 Oct 2024 08:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33037607B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33037607B5;
	Mon, 28 Oct 2024 08:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80455AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E16840620
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIU0VPeg4zRE for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 08:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org;
 envelope-from=hypnotoad@lindra.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FDB04062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FDB04062E
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FDB04062E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:05:49 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XcQtb6l4Pz9sst;
 Mon, 28 Oct 2024 09:05:43 +0100 (CET)
Message-ID: <c6cf5656-dbc3-417d-a503-c1075eba0899@lindra.de>
Date: Mon, 28 Oct 2024 09:05:42 +0100
MIME-Version: 1.0
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241026172741.451347-1-ju.o@free.fr>
 <20241026220546.2bc2fb22@windsurf>
Content-Language: en-US, de-DE
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20241026220546.2bc2fb22@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1730102744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvsHxsLsfQ3mD5NlY+HGmbAWpfBxqLypTAVkcXw9pPs=;
 b=FUe4UEwRIZupML2rJEYZgWwz2kEm4jVrETqHrhhEz6KbPf9KAJHg1h7SeVb+Yj1fQoBuoD
 BrWgRyB5AL93R+5XmFwDdbyiOvEaAW7Zklvsot8UgCo5YeFyo7LOujXcVHlzef8seOzQ9M
 q9k8tPC/4gfocZ7ox94IuQzJI/c1AJwfSBOPhdbj6TbOnEJAY2gRjwqKpixo0IN85Y2/5j
 euDv7NwN1IFfeR+Wo0gQQLQFS3tkYQsFG2+EDFxA9lJGwn3Njp/0KvewY8rmeXurqBq9aW
 8p2XVY9uPM41fCPcG0OilFoIxrxe7t16ZEp5S56iIRWh/jKtiLof01uXO/Q2bQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=FUe4UEwR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyqt5-sip: bump version
 to 12.15.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thank you for the cleanups and clarifications!
Ralf

Am 26.10.24 um 22:05 schrieb Thomas Petazzoni:
> On Sat, 26 Oct 2024 19:27:41 +0200
> Julien Olivain <ju.o@free.fr> wrote:
>
>> The versioning scheme of this package is not trivial: the PyQt5-sip
>> version number does not corresponds to the actual version tag name in
>> its Python-SIP source repository. For that reason, this commit adds a
>> comment explaining this peculiar mapping. This comment will help, in
>> future maintenance tasks.
>>
>> To better understand the upstream changes in this package explained in
>> this commit log, it is worth mentioning that:
>> - PyQt5-sip 12.13.0 was generated with Python-SIP 6.7.12, and
>> - PyQt5-sip 12.15.0 was generated with Python-SIP 6.8.6.
>>
>> The package license has changed to BSD-2-Clause, in upstream commits:
>> https://github.com/Python-SIP/sip/commit/0ba3b233ec8ed7f22f2f2f950b64f61b50ddfc00
>> https://github.com/Python-SIP/sip/commit/4dde1491f7b8ace15833cffb86bee82d60683968
>> https://github.com/Python-SIP/sip/commit/f32039b07c47280039dcdcd0f8a2b1323fda912e
>>
>> This commit updates the _LICENSE and _LICENSE_FILES macro
>> accordingly. The license hash file is also updated. While at it, this
>> commit also adds the MD5 hash published upstream.
>>
>> This commit also introduces minor improvements to better follow
>> Buildroot package conventions:
>> - the .mk file header is changed to lower case,
>> - hash file comments are updated,
>> - the locally calculated license file hash is changed from MD5 to
>>    SHA256.
>>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>   .../python-pyqt5-sip/python-pyqt5-sip.hash    | 11 +++++-----
>>   package/python-pyqt5-sip/python-pyqt5-sip.mk  | 20 ++++++++++++++-----
>>   2 files changed, 20 insertions(+), 11 deletions(-)
> Applied to master, thanks.
>
> Thomas


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
