Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2978BEE14BB
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 17:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E5784155C;
	Wed,  6 Sep 2023 17:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E5784155C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYlrUWvoay59; Wed,  6 Sep 2023 17:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDE0040A7F;
	Wed,  6 Sep 2023 17:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDE0040A7F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3E4A1BF2F5
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 17:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DB64414DA
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 17:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DB64414DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b8Mi_1X26BTd for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 17:20:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59EA740A41
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 17:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59EA740A41
Received: by mail.gandi.net (Postfix) with ESMTPSA id 079F6FF804;
 Wed,  6 Sep 2023 17:20:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qdwCi-005Bou-UT; Wed, 06 Sep 2023 19:20:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Norbert Lange <nolange79@gmail.com>
References: <20230904124334.94615-1-nolange79@gmail.com>
Date: Wed, 06 Sep 2023 19:20:36 +0200
In-Reply-To: <20230904124334.94615-1-nolange79@gmail.com> (Norbert Lange's
 message of "Mon, 4 Sep 2023 14:43:33 +0200")
Message-ID: <87a5tzi5gb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix detection of ncurses
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > the configure script seems to use the NCURSES6_CONFIG variable,
 > however it will still check for a system ncurses6-config and prefer
 > this script if available.

Where do you see that? Looking at configure I see the normal
ac_cv_prog_FOO / check FOO / fallback to program:


if test ${ac_cv_prog_NCURSESW6_CONFIG+y}
then :
  printf %s "(cached) " >&6
else $as_nop
  if test -n "$NCURSESW6_CONFIG"; then
  ac_cv_prog_NCURSESW6_CONFIG="$NCURSESW6_CONFIG" # Let the user override the test.
else
as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
for as_dir in $PATH
do
  IFS=$as_save_IFS
  case $as_dir in #(((
    '') as_dir=./ ;;
    */) ;;
    *) as_dir=$as_dir/ ;;
  esac
    for ac_exec_ext in '' $ac_executable_extensions; do
  if as_fn_executable_p "$as_dir$ac_word$ac_exec_ext"; then
    ac_cv_prog_NCURSESW6_CONFIG="${ac_tool_prefix}ncursesw6-config"
    printf "%s\n" "$as_me:${as_lineno-$LINENO}: found $as_dir$ac_word$ac_exec_ext" >&5
    break 2
  fi
done

What is the error you are seeing exactly?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
