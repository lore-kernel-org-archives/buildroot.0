Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B198C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FB681B25;
	Wed,  3 Aug 2022 21:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23FB681B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDuWEGkLemeE; Wed,  3 Aug 2022 21:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5F781490;
	Wed,  3 Aug 2022 21:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5F781490
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A62CB1BF9B9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 440486079D
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 440486079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6hUvlI0I8oM for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:38:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B683605B0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B683605B0
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:38:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13A2B240005;
 Wed,  3 Aug 2022 21:38:56 +0000 (UTC)
Date: Wed, 3 Aug 2022 23:38:56 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220803233856.3d609d8c@windsurf>
In-Reply-To: <20220313171355.271345-1-james.hilliard1@gmail.com>
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659562737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PSm3aa+fdhMLHWaqB5iyt8eRkN00f+5X/8wF8gaWCs=;
 b=XvBk/CaAi4Q2bo07X4kqEu7bB2VEZL4lHH47rJxK+pe2Sze1uOgdBaxK8HPYtIontIqQ0e
 042Ccq6d1mB+vqgxR7mMb1GvOgKD8KIN4RCI6foN42Kv5ackhW/2fOf9lVQGurpZaWCpcC
 WPCw7arOK/5ThrtqnScOCYcwkeKwpz4ZNyYnIMYWPa35Xs3pO88vdsZvoClp82zaCLzzyt
 MFohyqD130LeXBBvnFOtjpLGPbk5BVXXbN7Ipv/cJqR6xhbLDCzrpA+tuW1HxGsOAlUxqH
 CdME0HdM3tywO6slo4O3KfAngv2BAkg+BnsxENR6mEIsRUZ2RyJEXLzc8R8WhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XvBk/CaA
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/scanpypi: ensure tmp_extract
 is cleaned up on exception
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Mar 2022 11:13:54 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> +            imp.load_module('__main__', s_file, s_path, s_desc)
> +            if self.metadata_name in self.setup_args:
> +                pass
> +            elif self.metadata_name.replace('_', '-') in self.setup_args:
> +                self.metadata_name = self.metadata_name.replace('_', '-')
> +            elif self.metadata_name.replace('-', '_') in self.setup_args:
> +                self.metadata_name = self.metadata_name.replace('-', '_')
> +            try:
> +                self.setup_metadata = self.setup_args[self.metadata_name]
> +            except KeyError:
> +                # This means setup was not called
> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> +                      .format(pkg=self.real_name))
> +                raise
> +        finally:
> +            os.chdir(current_dir)
> +            sys.path.remove(self.tmp_extract)
>  
>      def get_requirements(self, pkg_folder):
>          """

Are you sure this work correctly?

If I understand correctly self.tmp_extract is where the Python package
source code is extracted. So if you remove it at the end of
load_setup(), how will your new load_pyproject() added in PATCH 2/2 be
able to use the package source code?

Also, why is this removal needed, as anyway the full tmp_path gets
removed at the end of the main() function?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
