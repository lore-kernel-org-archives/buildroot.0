From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 14 Mar 2019 03:10:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: Add support
 without gettext
In-Reply-To: <20190313212806.GK25009@scaer>
References: <20190312222035.16834-1-vadim4j@gmail.com>
 <20190313185350.GJ25009@scaer>
 <20190313191512.GA30819@lwo1-lhp-f71841>
 <20190313212806.GK25009@scaer>
Message-ID: <20190314011058.izny7iaall7dnyve@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All

On Wed, Mar 13, 2019 at 10:28:06PM +0100, Yann E. MORIN wrote:
> Vadim, All,
> 
> On 2019-03-13 21:15 +0200, Vadym Kochan spake thusly:
> > On Wed, Mar 13, 2019 at 07:53:50PM +0100, Yann E. MORIN wrote:
> > > On 2019-03-13 00:20 +0200, Vadim Kochan spake thusly:
> [--SNIP--]
> > > > +gettext() {
> > > > +	if [ -z "${GETTEXT_PROG}" ]; then
> > > > +		GETTEXT_PROG=$(which gettext)
> > > > +		if [ $? != 0 ]; then
> > > 
> > > != is a string comparison. For numbers, you will want to use -ne (or
> > > -eq), see below.
> > > 
> > > > +			GETTEXT_PROG=gettext_echo
> > > > +		fi
> > > > +	fi
> > > > +
> > > > +	${GETTEXT_PROG} "$@"
> > > > +}
> > > 
> > > This means that a script that calls gettext more than once will actually
> > > try to resolve it each time. This is not optimum.
> > 
> > But I check the GETTEXT_PROG variable on the start, if it is not empty then just:
> > 	${GETTEXT_PROG} "$@"
> 
> Hmm... Right, and the resolution is indeed done only once. My bad.
> 
> > > Instead, I think ecryptfs-common should basically look something like:
> > > 
> > >     if ! which gettext >/dev/null 2>&1; then
> > >         gettext() {
> > >             if [ -n "${GETTEXT}" ]; then
> > >                 # Weird construct so that script that are 'set -e'
> > >                 # fail at the call site of gettext and not here.
> > >                 "${GETTEXT}" "${@}" || return $?
> > >                 return 0
> > >             fi
> > >             while [ ${#} -ne 0 ]; do
> > >                 case "${1}" in
> > >                   (-h)              printf "no help\n"; return 0;;
> > >                   (-V)              printf "0.0.0\n"; return 0;;
> > >                   (-d|--domain)     shift 2;;
> > >                   (-d*|--domain=*)  shift 1;;
> > >                   (-e|-E|-n)        shift 1;;
> > >                   (-s)              shift 1;;  # Ignore?
> > >                   (-*)              printf "invalid option '%s'\n" "${1}" >&2; return 1;;
> > >                   (*)               break;;
> > >                 esac
> > >             done
> > >             case ${#} in
> > >               (0)   printf "missing arguments\n" >&2; return 1;;
> > >               (1)   printf "%s" "${1}";;
> > >               (2)   shift; printf "%s" "${2}";;
> > >               (*)   printf "too many arguments\n" >&2; return 1;;
> > >             esac
> > >         }
> > >     fi
> > > 
> > > I.e. if there is no gettext program, you define a function named
> > > gettext.
> 
> The difference then between your code and mine, is that yours is doing a
> lazy resolution (i.e. resolving at first call) while mine is doing an
> early resolution (i.e. resolving when parsing).
> 
> Additionally, since your code is using a two-level function call
> (gettext -> gettext_echo), it's a bit more complex to handle scritps
> that are 'set -e' and ensure they get the error at the call site rather
> than in internal details of the emulating function.
> 
> But my suggestion would be that we just provide a gettext wrapper script
> (not function) when gettext is not installed. This is much simpler
> because there is thus no need to patch upstream.
> 
Right, that would be much better solution than fixing ecryptfs-utils, but
this wrapper should be installed by something like gettext-tiny (this
is still the option if the ecryptfs-utils's solution will fail) for the
target.

> > Thanks for your comments, anyway conceptually this patch is wrong. I
> > tried to do it in the right way - install ecryptfs-common from
> > ecryptfs-utils in src/utils/Makefile.am, but faced with autoreconf issue
> > (autoreconf is required because src/utils/Makefile.am is changed by
> > patch which adds installation of ecryptfs-common), but autoreconf fails
> > to regenerate needed files because it removes aclocal.m4 which has
> > definition of AM_GLIB_GNU_GETTEXT macro (which is not defined by host-gettext
> 
> Dang, indeed it is a big hammer to add a dependency onto host-libglib2
> just for this oe macro, which by the way is deprecated, and that
> upstream suggests to remove in favour of the official gettext one:
> 
>     https://gitlab.gnome.org/GNOME/glib/blob/master/m4macros/glib-gettext.m4#L356
> .to:
>     https://gitlab.gnome.org/GNOME/glib/blob/master/m4macros/glib-gettext.m4#L437
> 
> That's a shame, as ecrypt-utils does noit even have a dependency on
> libglib2 at all, except for this one macro. :-(
> 
> So, that could probably be a hint to fix that upstream in a more
> reasonable fashion anyway?
> 
I am trying to re-do the patch to use AM_GNU_GETTEXT instead of
AM_GLIB_GNU_GETTEXT.

Regards,
Vadim Kochan
