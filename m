From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sun, 10 Sep 2017 09:10:33 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-bad: fix build against
 openjpeg 2.2
In-Reply-To: <20170909224828.616416e3@windsurf.lan>
References: <20170908133156.10357-1-ps.report@gmx.net>
 <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
 <20170909224828.616416e3@windsurf.lan>
Message-ID: <CAAP7ucJB_jXRV-keji7ANZ=9e0n+SOTXLULPa6dQ5J2m-cR6dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Re-running gettextize just to make autoreconf work is a bit overkill;
>> gettextize is something that the package maintainer runs to get the
>> i18n setup ready and among other things it may update gnulib imported
>> files in unexpected ways. I'd bet that letting just autopoint work as
>> expected (as a step part of autoreconf) would be way more than enough
>> here (i.e. no _GETTEXTIZE needed), but that step is currently disabled
>> in buildroot by default since some years ago.
>>
>> See for reference this patch I sent last month, that makes autopoint
>> work again during autoreconf:
>> http://lists.busybox.net/pipermail/buildroot/2017-August/200941.html
>
> The problem with your patch is that nothing guarantees that
> host-gettext is available when <pkg>_AUTORECONF = YES. Indeed
> <pkg>_AUTORECONF = YES only pulls in host-autoconf, host-automake and
> host-libtool, but not host-gettext.
>
> And we of course don't want to have <pkg>_AUTORECONF = YES pull
> host-gettext, as it is a fairly heavy dependency.
>

If host-gettext isn't available, $(AUTOPOINT) would just be an empty
variable and autoreconf just ignores the autopoint step all together,
equivalent to setting it to /bin/true (that seemed the case in my
tests anyway). For my usecase I had the package that was requiring
this autoreconf just pull host-gettext, and that made everything work
(ModemManager building from git):

MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-gettext libglib2 libgudev
MODEM_MANAGER_AUTORECONF = YES

I'm assuming that other packages would also have autopoint enabled in
that case, but probably didn't affect them much as the ones requiring
some kind of i18n update were running gettextize anyway, and the ones
not needing i18n wouldn't be affected.

> To be honest, I don't really understand this gettextize vs. autopoint
> thing. Since you seem to understand what's the point of this, could you
> give some background?
>

I'm totally not an expert on this, allI just happened to be fighting
with all this some weeks ago... :)

gettextize prepares the package to have i18n support, so it usually is
something done by the maintainer of the package. This process will
import and update gnulib files required during the setup, and even
modify the top-level Makefile.am and configure.ac (!). A couple of
weeks ago I was playing with all this trying to setup buildroot
ModemManager git builds, and _GETTEXTIZE actually made my builds fail
as gettextize touched too much (the configure.ac changes it did in
particular).

autopoint is meant to be run during autoreconf, it checks whether i18n
support is enabled in the package, and updates the i18n support with
the currently available one in the system. This is a step required
when autoreconf-ing a package that has i18n support. No configure.ac
or Makefile.am is updated in this case, the i18n support is already
available in the package, autopoint just updates it.

> If autopoint is indeed sufficient to replace the gettextize invocation,
> then we could change <pkg>_GETTEXTIZE to simply pull-in host-gettext
> and pass AUTOPOINT=/correct/path/to/autopoint during autoreconf. Of
> course, all existing packages that use GETTEXTIZE = YES would have to
> be verified.
>

That's an option I guess. Although it would be much much easier to
just have _AUTORECONF=yes pull host-gettext, truth be told. It's a
fairly heavy dep, but it's a host-dep anyway. This could maybe even
allow removing a lot of (all?) the explicit _GETTEXTIZE=yes
requirements from the different packages.

-- 
Aleksander
https://aleksander.es
