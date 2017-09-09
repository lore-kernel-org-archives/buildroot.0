From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:48:28 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-bad: fix build against
 openjpeg 2.2
In-Reply-To: <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
References: <20170908133156.10357-1-ps.report@gmx.net>
 <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
Message-ID: <20170909224828.616416e3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 Sep 2017 22:26:19 +0200, Aleksander Morgado wrote:

> Re-running gettextize just to make autoreconf work is a bit overkill;
> gettextize is something that the package maintainer runs to get the
> i18n setup ready and among other things it may update gnulib imported
> files in unexpected ways. I'd bet that letting just autopoint work as
> expected (as a step part of autoreconf) would be way more than enough
> here (i.e. no _GETTEXTIZE needed), but that step is currently disabled
> in buildroot by default since some years ago.
> 
> See for reference this patch I sent last month, that makes autopoint
> work again during autoreconf:
> http://lists.busybox.net/pipermail/buildroot/2017-August/200941.html

The problem with your patch is that nothing guarantees that
host-gettext is available when <pkg>_AUTORECONF = YES. Indeed
<pkg>_AUTORECONF = YES only pulls in host-autoconf, host-automake and
host-libtool, but not host-gettext.

And we of course don't want to have <pkg>_AUTORECONF = YES pull
host-gettext, as it is a fairly heavy dependency.

To be honest, I don't really understand this gettextize vs. autopoint
thing. Since you seem to understand what's the point of this, could you
give some background?

If autopoint is indeed sufficient to replace the gettextize invocation,
then we could change <pkg>_GETTEXTIZE to simply pull-in host-gettext
and pass AUTOPOINT=/correct/path/to/autopoint during autoreconf. Of
course, all existing packages that use GETTEXTIZE = YES would have to
be verified.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
