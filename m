From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Nov 2010 15:48:22 +0100
Subject: [Buildroot] CTRL+C in menuconfig deletes .config
In-Reply-To: <201011160923.42622.vapier@gentoo.org>
References: <201011160923.42622.vapier@gentoo.org>
Message-ID: <20101116154822.56bea50f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Nov 2010 09:23:42 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> i dont know why the menuconfig target has this logic:
>     @if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
>         test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
>     fi
> 
> but it causes severely undesirable behavior.  if i do:
> 	make menuconfig
> 	<change some things & save>
> 	make menuconfig
> 	<change some things but change my mind and hit CTRL+C>
> 
> the build system deletes the .config file.

After a quick dig in Buildroot git history, I found the commit that
introduced this:

commit 153b1beaeb02e1d4780428c0387b7003644e402b
Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date:   Fri Jul 27 12:37:30 2007 +0000

    - fix building mconf with curses flags
    - make sure to rm .config when the first 'make menuconfig' was
      interrupted and thus no .config.cmd was created.

The test "test -f $(CONFIG_DIR)/.config.cmd" is supposed to prevent the
behaviour you're seeing, but the thing is that this file no longer
seems to be generated. I haven't had the time to understand why.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101116/a024cf3b/attachment.pgp>
