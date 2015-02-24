From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Feb 2015 23:24:02 +0100
Subject: [Buildroot] [PATCH] gettext: add dependency on host-libxml2 for
 host-gettext.
In-Reply-To: <20150223191721.573fdb19@free-electrons.com>
References: <20150220222933.5B92D817C4@busybox.osuosl.org>
 <1424696593-21361-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20150223191721.573fdb19@free-electrons.com>
Message-ID: <20150224222402.GD4783@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Nicolas, All,

On 2015-02-23 19:17 +0100, Thomas Petazzoni spake thusly:
> On Mon, 23 Feb 2015 14:03:13 +0100, Nicolas Cavallari wrote:
> > From: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> > 
> > Otherwise, the locally-installed libxml2 will be used, which may
> > depend on a locally-installed liblzma which may create conflict
> > if host-liblzma is compiled.
> > 
> > Fixes https://bugs.busybox.net/show_bug.cgi?id=7886
> > 
> > Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> > [nicolas: added extended commit message]
> > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> > ---
> > Ignacy is unavailable this week, but he commited this change to our
> > local tree before leaving.
> > 
> > diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
> > index c2419c1..a554517 100644
> > --- a/package/gettext/gettext.mk
> > +++ b/package/gettext/gettext.mk
> > @@ -12,7 +12,7 @@ GETTEXT_LICENSE = GPLv2+
> >  GETTEXT_LICENSE_FILES = COPYING
> >  
> >  GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> > -HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
> > +HOST_GETTEXT_DEPENDENCIES = host-libxml2 # we don't want the libiconv dependency
> 
> I agree that we normally prefer to rely on external libraries, rather
> than built-in copies. However, in this case, I am wondering if we
> shouldn't rather rely on the built-in copy, which is more lightweight
> that building host-libxml2.
> 
> From the DEPENDENCIES file of gettext:
> 
> * libxml2
>   + Optional.
>     Needed for the --color option of the various programs.
>     If not present, a subset of libxml2 (included in this package) will be
>     compiled into libgettextlib.
>   + Homepage:
>     http://xmlsoft.org/
>   + Download:
>     ftp://xmlsoft.org/libxml2/
>   + If it is installed in a nonstandard directory, pass the option
>     --with-libxml2-prefix=DIR to 'configure'.
> 
> So instead of building an external libxml2, we can pass
> --with-included-libxml to the gettext-tools configure script to force
> it to use the built-in libxml2 subset.
> 
> Note that there are several other libraries in the same situation:
> glib2, libcroco and libunistring.
> 
> What is the opinion of other BR developers about this?

On my machine, host-libxml2 takes about 0m53.693s while host-gettext
takes about 2m34.112s. So the overhead (~20%-pf-gettext)) is not
negligible...

I am compeltely undecided on that... Do we consider a ~20%-of-gettext
overhead for a full build to be important or not?

> And all that just for a --color command line option that we really
> don't care about. Why the heck isn't this thing optional in the first place?

Eh... Upstream... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
