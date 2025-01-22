Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A27CC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4F2605EE;
	Wed, 22 Jan 2025 15:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfM8exIQqNQV; Wed, 22 Jan 2025 15:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F8CF61093
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F8CF61093;
	Wed, 22 Jan 2025 15:51:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B7A959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121AD606C7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VopqEh2H06_1 for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28EC460799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EC460799
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28EC460799
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:51:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A47C840006;
 Wed, 22 Jan 2025 15:51:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tad0O-008vs7-2q;
 Wed, 22 Jan 2025 16:51:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org,  Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250116161115.1798900-1-james.hilliard1@gmail.com>
Date: Wed, 22 Jan 2025 16:51:00 +0100
In-Reply-To: <20250116161115.1798900-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 16 Jan 2025 09:11:15 -0700")
Message-ID: <874j1qn8yj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: fix segfault with
 python-lxml
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Backport a patch fixing a segfault first introduced by
 > ca63c4409b3c811e8c4ee19c2860c53af35c4ce1 in buildroot.

 > Fixes:
 > ==4792== Invalid read of size 8
 > ==4792==    at 0x4FE7661: __gconv_close (gconv_close.c:33)
 > ==4792==    by 0x4FE70EE: iconv_close (iconv_close.c:34)
 > ==4792==    by 0x5AED422: xmlCharEncCloseFunc (encoding.c:2678)
 > ==4792==    by 0x587A78C: __pyx_f_4lxml_5etree__find_PyUCS4EncodingName (etree.c:126676)
 > ==4792==    by 0x5888666: __pyx_pymod_exec_etree (etree.c:289773)
 > ==4792==    by 0x4A06345: PyModule_ExecDef (moduleobject.c:440)
 > ==4792==    by 0x4AE23A8: _imp_exec_dynamic_impl (import.c:3801)
 > ==4792==    by 0x4AE23A8: _imp_exec_dynamic (import.c.h:534)
 > ==4792==    by 0x4A046A3: cfunction_vectorcall_O (methodobject.c:509)
 > ==4792==    by 0x4AAA203: _PyEval_EvalFrameDefault (bytecodes.c:3263)
 > ==4792==    by 0x49B9D2B: _PyObject_VectorcallTstate (pycore_call.h:92)
 > ==4792==    by 0x49B9D2B: object_vacall (call.c:850)
 > ==4792==    by 0x49B9F44: PyObject_CallMethodObjArgs (call.c:911)
 > ==4792==    by 0x4AE648A: import_find_and_load (import.c:2781)
 > ==4792==    by 0x4AE648A: PyImport_ImportModuleLevelObject (import.c:2864)
 > ==4792==  Address 0x8 is not stack'd, malloc'd or (recently) free'd

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
