Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42C6C433FE
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 20:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F41C40236;
	Sun, 15 May 2022 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99fw3yeb6kGP; Sun, 15 May 2022 20:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19CD6401D8;
	Sun, 15 May 2022 20:23:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 425CA1BF419
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C18060F57
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBC55mGd7nMH for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 20:23:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73FDB605D5
 for <buildroot@buildroot.org>; Sun, 15 May 2022 20:23:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C1B3100004;
 Sun, 15 May 2022 20:23:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nqKlX-00Dzz6-Fv; Sun, 15 May 2022 22:22:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <28412_1652447867_627E5A7B_28412_29_1_cc0e3c8f4215e41cd4cd0742a94f777783beabfc.1652447836.git.yann.morin@orange.com>
Date: Sun, 15 May 2022 22:22:59 +0200
In-Reply-To: <28412_1652447867_627E5A7B_28412_29_1_cc0e3c8f4215e41cd4cd0742a94f777783beabfc.1652447836.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 13 May 2022 15:17:45 +0200")
Message-ID: <87ee0u5yvw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] fs/oci: entrypoint and command are
 space-separated lists
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > The prompt and variable name for the OCI "entrypoint arguments" are
 > somewhat incorrect. Indeed, they are in fact use to set the image
 > "command". Yet, using "command" would be confusing too, because the
 > interplay between entrypoint and command is tricky [0].

 > TL-DR; when both entrrypoint and command are set, command acts as
 > arguments passed to the entrypoint.

 > Additionally, we currently can only pass a single item as either
 > entrypoint or command. This precludes passing actual arguments to the
 > entrypoint, or passing multiple arguments as command.

 > For example:
 >     BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="/bin/tini -g -p SIGTERM --"
 >     BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="/usr/bin/env sh"

 > generates an images with (only relevant fileds are included below):

 >     {
 >         "config": {
 >             "Entrypoint": [ "/bin/tini -g -p SIGTERM --" ],
 >             "Cmd": [ "/usr/bin/env sh" ]
 >         }
 >     }

 > This is obviously incorrect, and not what one would expect:

 >     {
 >         "config": {
 >             "Entrypoint": [ "/bin/tini", "-g", "-p", "SIGTERM", "--" ],
 >             "Cmd": [ "/usr/bin/env", "sh" ]
 >         }
 >     }

 > However, some people do want to be able to pass an actual shell
 > scriptlet as a command, such as:

 >     {
 >         "config": {
 >             "Entrypoint": [ "/bin/sh", "-c" ],
 >             "Cmd": [ "my shell logic goes here" ]
 >         }
 >     }

 > Handling both is obviously conflicting: we can't both split-on-spaces
 > and not-split-on-spaces at the same time...

 > So, we fix that in tow ways:

 >   - make the current _OCI_ENTRYPOINT_ARGS a legacy option, and introduce
 >     the new _OCI_CMD option with different semantics (see below) and an
 >     appropriate prompt;

 >   - we interpret both _OCI_ENTRYPOINT and _OCI_CMD as shell strings,
 >     which we subject to the usual shell quoting [1] and token
 >     recognition [2];

 > Since _OCI_ENTRYPOINT_ARGS used to be interpreted as a single string, we
 > can't easily change its meaning to be a space-separated list, as that
 > would break existing setups, which is the reason we make it legacy and
 > introduce a new option.

 > Ideally, we would like to default the new option _OCI_CMD to be the
 > quoted value of the previous _OCI_ENTRYPOINT_ARGS, but this is not
 > possible in Kconfig. Still, users that had a _OCI_ENTRYPOINT_ARGS set
 > will now get an early build error, and can still detect they need to do
 > something about it.

 > As for _OCI_ENTRYPOINT, it does not make much sense to support both
 > cases. Indeed, withoput splitting on spaces, we'd end up with an
 > entrypoint that would hava single item:

 >     {
 >         "config": {
 >             "entrypoint: [ "some string with some spaces" ]
 >         }
 >     }

 > which in this case would try to execute the program which name is
 > actually "some string with some spaces", so we do not expect that
 > existing entrypoints are set with any space in them, and so the new
 > behaviour, unlike for _OCI_ENTRYPOINT_ARGS vs. _OCI_CMD, is compatible
 > with existing configurations, and so we do not need to make it a legacy
 > option and introduce a new one.

 > [0] https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
 > [1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_02
 > [2] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_03

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Sergio Prado <sergio.prado@e-labworks.com>
 > Cc: Matthew Weber <matthew.weber@collins.com>

 > ---
 > Changes v1 -> v2:
 >   - drop _OCI_ENTRYPOINT_ARGS and replace with _OCI_CMD
 >   - accept values that have shell escapes and quotes, and spaces

 > +# entrypoint and command
 > +# Special treatment: both the entrypoint and arguments (aka command) are
 > +# a double-quoted, space-separated, escaped-double-quoted string, like:
 > +#     "foo \"1 2   3 4\" '  a b c d  ' bar\ buz"
 > +# which should be interpreted as a 4-item list (using single quotes to
 > +# delimit them and see leading/trailing spaces):
 > +#     'foo'
 > +#     '1 2   3 4'
 > +#     '  a b c d  '
 > +#     'bar buz'
 > +#
 > +# We use some trickery to have the shell properly expand this into a list
 > +# where each item is single-quoted and prefixed with the appropriate
 > +# option string:
 > +OCI_SLOCI_IMAGE_OPTS += \
 > +	$(shell eval printf -- "--entrypoint\ \'%s\'\ " $(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT)) \
 > +	$(shell eval printf -- "--cmd\ \'%s\'\ " $(BR2_TARGET_ROOTFS_OCI_CMD))

Neat! Maybe we should add a test to ensure this doesn't break in the
future.

It still doesn't work for the case where the options contain references
to shell variables ($FOO) or shell commands ($(blih), `blah`), but it
didn't before either.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
