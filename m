From: Vadym Kochan <vadim4j@gmail.com>
Date: Wed, 13 Mar 2019 21:15:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: Add support
 without gettext
In-Reply-To: <20190313185350.GJ25009@scaer>
References: <20190312222035.16834-1-vadim4j@gmail.com>
 <20190313185350.GJ25009@scaer>
Message-ID: <20190313191512.GA30819@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Mar 13, 2019 at 07:53:50PM +0100, Yann E. MORIN wrote:
> Vadim, All,
> 
> On 2019-03-13 00:20 +0200, Vadim Kochan spake thusly:
> > Add custom ecryptfs-common script which provides gettext wrapper as
> > function which checks at runtime if there is gettext tool, if no - the
> > "echo" will be used instead. Each script which uses gettext is
> > patched with including this ecryptfs-common script.
> > 
> > The patch for ecryptfs-utils only inserts hard-coded (w/o using
> > @prefix@/lib/@PACKAGE@ variables) path to the ecryptfs-common, it is
> > very small and trivial, it allows to easy support new bumped version.
> > 
> > gettext package is now selected automatically only if NLS is enabled.
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

[cut]

> > +GETTEXT_PROG=""
> > +
> > +# Thanks to "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +# for this gettext replacement function
> > +gettext_echo() {
> > +	while [ ${#} -ne 0 ]; do
> > +		case "${1}" in
> > +			(-h)              echo "no help"; exit 0;;
> > +			(-V)              echo "0.0.0"; exit 0;;
> 
> Since this is a function, you probably want to return rather than exit.
> 
> Also, we usually use leading spaces in shell scripts, not TABs.
> 
> > +			(-d|--domain)     shift 2;;
> > +			(-d*|--domain=*)  shift 1;;
> > +			(-e|-E|-n)        shift 1;;
> > +			(-s)              shift 1;;  # Ignore?
> > +			(*)               break;;
> > +		esac
> > +	done
> > +	case ${#} in
> > +		(0)   ;;
> > +		(1)   echo "${1}";;           # No TEXTDOMAIN?
> > +		(*)   shift; echo "${@}";;    # Ignore TEXTDOMAIN?
> > +	esac
> > +}
> > +
> > +gettext() {
> > +	if [ -z "${GETTEXT_PROG}" ]; then
> > +		GETTEXT_PROG=$(which gettext)
> > +		if [ $? != 0 ]; then
> 
> != is a string comparison. For numbers, you will want to use -ne (or
> -eq), see below.
> 
> > +			GETTEXT_PROG=gettext_echo
> > +		fi
> > +	fi
> > +
> > +	${GETTEXT_PROG} "$@"
> > +}
> 
> This means that a script that calls gettext more than once will actually
> try to resolve it each time. This is not optimum.

But I check the GETTEXT_PROG variable on the start, if it is not empty then just:

	${GETTEXT_PROG} "$@"

> 
> Instead, I think ecryptfs-common should basically look something like:
> 
>     if ! which gettext >/dev/null 2>&1; then
>         gettext() {
>             if [ -n "${GETTEXT}" ]; then
>                 # Weird construct so that script that are 'set -e'
>                 # fail at the call site of gettext and not here.
>                 "${GETTEXT}" "${@}" || return $?
>                 return 0
>             fi
>             while [ ${#} -ne 0 ]; do
>                 case "${1}" in
>                   (-h)              printf "no help\n"; return 0;;
>                   (-V)              printf "0.0.0\n"; return 0;;
>                   (-d|--domain)     shift 2;;
>                   (-d*|--domain=*)  shift 1;;
>                   (-e|-E|-n)        shift 1;;
>                   (-s)              shift 1;;  # Ignore?
>                   (-*)              printf "invalid option '%s'\n" "${1}" >&2; return 1;;
>                   (*)               break;;
>                 esac
>             done
>             case ${#} in
>               (0)   printf "missing arguments\n" >&2; return 1;;
>               (1)   printf "%s" "${1}";;
>               (2)   shift; printf "%s" "${2}";;
>               (*)   printf "too many arguments\n" >&2; return 1;;
>             esac
>         }
>     fi
> 
> I.e. if there is no gettext program, you define a function named
> gettext.
> 
> Regards,
> Yann E. MORIN.
> 
> > diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
> > index eb3194b6d0..bf630882c2 100644
> > --- a/package/ecryptfs-utils/ecryptfs-utils.mk
> > +++ b/package/ecryptfs-utils/ecryptfs-utils.mk
> > @@ -25,4 +25,10 @@ else
> >  ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
> >  endif
> >  
> > +define ECRYPTFS_UTILS_INSTALL_COMMON_SCRIPT
> > +	$(INSTALL) -D -m 0755 $(ECRYPTFS_UTILS_PKGDIR)/ecryptfs-common \
> > +		$(TARGET_DIR)/usr/lib/ecryptfs-utils/ecryptfs-common
> > +endef
> > +ECRYPTFS_UTILS_POST_INSTALL_TARGET_HOOKS += ECRYPTFS_UTILS_INSTALL_COMMON_SCRIPT
> > +
> >  $(eval $(autotools-package))
> > -- 
> > 2.14.1
> > 
> 

Thanks for your comments, anyway conceptually this patch is wrong. I
tried to do it in the right way - install ecryptfs-common from
ecryptfs-utils in src/utils/Makefile.am, but faced with autoreconf issue
(autoreconf is required because src/utils/Makefile.am is changed by
patch which adds installation of ecryptfs-common), but autoreconf fails
to regenerate needed files because it removes aclocal.m4 which has
definition of AM_GLIB_GNU_GETTEXT macro (which is not defined by host-gettext
nowhere in output/host) but this macro is required by configure.ac. So,
I am not sure I can provide conceptually better patch for now (but Yann's comments),
may be it is possible to regenerate only src/utils/Makefile.in (from
*.am file) instead of calling autoreconf for all *.am, *.ac files.

Regards,
Vadim Kochan
