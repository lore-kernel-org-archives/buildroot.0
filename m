From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 11 Mar 2019 01:05:32 +0200
Subject: [Buildroot] [PATCH v3 0/2] Add gettext-tiny package
In-Reply-To: <20190310101852.GB25009@scaer>
References: <20190212215520.7422-1-vadim4j@gmail.com>
 <20190309233742.3095c546@windsurf>
 <20190310002005.jglt6ptlgctyz6eb@vkochan-ThinkPad-T470p>
 <20190310101126.3d738624@windsurf> <20190310101852.GB25009@scaer>
Message-ID: <20190310230532.4dhczaa4sygw75ie@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, All

On Sun, Mar 10, 2019 at 11:18:52AM +0100, Yann E. MORIN wrote:
> Vadim, All,
> 
> On 2019-03-10 10:11 +0100, Thomas Petazzoni spake thusly:
> > On Sun, 10 Mar 2019 02:20:05 +0200
> > Vadim Kochan <vadim4j@gmail.com> wrote:
> > 
> > > Many thanks for your feedback! Using the gnu gettext's tar is really better
> > > idea! Regarding ecryptfs-utils - yes, I think the patch might be really easy,
> > > something like this:
> > > 
> > > ...
> > > function trans {
> > >     if command -v gettext &> /dev/null; then
> 
> 'command' is not a POSIX builtin; it's a bashism, so there is no
> guarantee it is available:
> 
>     http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
> 
> So, maybe:
> 
>     if which gettext >/dev/null; then
>         gettext "${@}"
>     else
>         echo "${@}"
>     fi
> 
> Alternatively, I believe it would be relatively trivial to provide a
> fake gettext rwapper:
> 
>     #!/bin/sh
> 
>     while [ ${#} -ne 0 ]; do
>         case "${1}" in
>           (-h)              echo "no help"; exit 0;;
>           (-V)              echo "0.0.0"; exit 0;;
>           (-d|--domain)     shift 2;;
>           (-d*|--domain=*)  shift 1;;
>           (-e|-E|-n)        shift 1;;
>           (-s)              shift 1;;  # Ignore?
>           (*)               break;;
>         esac
>     done
>     case ${#} in
>       (0)   ;;
>       (1)   echo "${1}";;           # No TEXTDOMAIN?
>       (*)   shift; echo "${@}";;    # Ignore TEXTDOMAIN?
>     esac
> 
> Regards,
> Yann E. MORIN.

Yann, thanks for this!

> 
> > >         gettext @
> > >     else
> > >         echo @
> > >     fi
> > > }
> > > ...
> > > 
> > > and replace gettext -> trans in scripts.
> > 
> > Sounds good! Will you work on this ?
> > 
> > So, we agree that for the target gettext, only gettext-gnu will be a
> > provider when BR2_SYSTEM_ENABLE_NLS=y. When BR2_SYSTEM_ENABLE_NLS is
> > disabled, we don't have any target gettext package. Correct ? If so,
> > then I'll rework my branch to take this into account.
> > 
> > Thanks,
> > 
> > Thomas

But, it looks like that there should be no problem if NLS is disabled
(host-gettext is provided by gettext-tiny) and gettext (target)
(provided by gettext-gnu) are enabled in the same time (of course 1
small fix is required in latest gettext-tiny series v3):

in file package/gettext/Config.in

> config BR2_PACKAGE_GETTEXT
>          bool "gettext"
>          select BR2_PACKAGE_HAS_GETTEXT
*remove -> depends on BR2_SYSTEM_ENABLE_NLS
		    
remove dependens on NLS to select gettext-gnu for the target.

So, both host-gettext-tiny and gettext-gnu should coexist as they
provides different instances, right ?

If this is ok, then of course ecryptfs-utils needs support the gettext-less
version, but it might be done later out of this scope ?

Regards,
Vadim Kochan
