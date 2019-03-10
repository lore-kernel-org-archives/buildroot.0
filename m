From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Mar 2019 11:18:52 +0100
Subject: [Buildroot] [PATCH v3 0/2] Add gettext-tiny package
In-Reply-To: <20190310101126.3d738624@windsurf>
References: <20190212215520.7422-1-vadim4j@gmail.com>
 <20190309233742.3095c546@windsurf>
 <20190310002005.jglt6ptlgctyz6eb@vkochan-ThinkPad-T470p>
 <20190310101126.3d738624@windsurf>
Message-ID: <20190310101852.GB25009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2019-03-10 10:11 +0100, Thomas Petazzoni spake thusly:
> On Sun, 10 Mar 2019 02:20:05 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > Many thanks for your feedback! Using the gnu gettext's tar is really better
> > idea! Regarding ecryptfs-utils - yes, I think the patch might be really easy,
> > something like this:
> > 
> > ...
> > function trans {
> >     if command -v gettext &> /dev/null; then

'command' is not a POSIX builtin; it's a bashism, so there is no
guarantee it is available:

    http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html

So, maybe:

    if which gettext >/dev/null; then
        gettext "${@}"
    else
        echo "${@}"
    fi

Alternatively, I believe it would be relatively trivial to provide a
fake gettext rwapper:

    #!/bin/sh

    while [ ${#} -ne 0 ]; do
        case "${1}" in
          (-h)              echo "no help"; exit 0;;
          (-V)              echo "0.0.0"; exit 0;;
          (-d|--domain)     shift 2;;
          (-d*|--domain=*)  shift 1;;
          (-e|-E|-n)        shift 1;;
          (-s)              shift 1;;  # Ignore?
          (*)               break;;
        esac
    done
    case ${#} in
      (0)   ;;
      (1)   echo "${1}";;           # No TEXTDOMAIN?
      (*)   shift; echo "${@}";;    # Ignore TEXTDOMAIN?
    esac

Regards,
Yann E. MORIN.

> >         gettext @
> >     else
> >         echo @
> >     fi
> > }
> > ...
> > 
> > and replace gettext -> trans in scripts.
> 
> Sounds good! Will you work on this ?
> 
> So, we agree that for the target gettext, only gettext-gnu will be a
> provider when BR2_SYSTEM_ENABLE_NLS=y. When BR2_SYSTEM_ENABLE_NLS is
> disabled, we don't have any target gettext package. Correct ? If so,
> then I'll rework my branch to take this into account.
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
