From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 14:49:33 +0200
Subject: [Buildroot] [PATCH 2/3] support/maintainers: add support for
 autobuild results
In-Reply-To: <553B83E6.6020809@mailerd.de>
References: <cover.1427044305.git.yann.morin.1998@free.fr>
 <e256c9430c3a6d0005946031bcefcdcdebe48852.1427044305.git.yann.morin.1998@free.fr>
 <553B83E6.6020809@mailerd.de>
Message-ID: <20150425124933.GD4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2015-04-25 14:09 +0200, Andr? Erdmann spake thusly:
> 2015/4/24 Yann E. Morin <yann.morin.1998@free.fr>:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  support/scripts/check-maintainer | 38 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> > 
> > diff --git a/support/scripts/check-maintainer b/support/scripts/check-maintainer
> > index 0ca7136..1dae00b 100755
> > --- a/support/scripts/check-maintainer
> > +++ b/support/scripts/check-maintainer
> > @@ -1,20 +1,54 @@
> >  #!/usr/bin/env bash
> >  
> > +# Base URL for autobuild results
> > +ABO_BASE="http://autobuild.buildroot.org/results/"
> > +
> >  main() {
> >      local OPT OPTARGS
> >      local -a pkgs archs files rcpt
> > -    local pattern pkg arch file maintainer
> > +    local autobuild pattern pkg arch file maintainer
> > +    local pkg_url arch_url short_sha
> >  
> > -    while getopts :hp:a: OPT; do
> > +    while getopts :hp:a:b: OPT; do
> >          case "${OPT}" in
> >          h)  help; exit 0;;
> >          p)  pkgs+=( "${OPTARG}" );;
> >          a)  archs+=( "${OPTARG}" );;
> > +        b)  autobuild="${OPTARG}";;
> >          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> >          \?) error "unknown option '%s'\n" "${OPTARG}";;
> >          esac
> >      done
> >  
> > +    # Sanity check: can't have an autobuild url and either a package or an arch
> > +    if [ -n "${autobuild}" -a \( ${#pkgs[@]} -ne 0 -o ${#archs[@]} -ne 0 \) ]; then
> > +        error "Can not use an autobuild failure at the same time as a package or architcture\n"
> > +    fi
> > +
> > +    # For an autobuild failure, get the failing package and arch,
> > +    # and fake as if they were passed on the command line.
> > +    if [ -n "${autobuild}" ]; then
> > +        # If it starts with http:// then we consider this is an URL to
> > +        # an autobuild result directory, otherwise we consider it is the
> > +        # sha1 of a failed build.
> > +        if [[ "${autobuild}" =~ ^http:// ]]; then
> > +            pkg_url="${autobuild}/build-time.log"
> > +            arch_url="${autobuild}/config"
> > +        else
> > +            short_sha="${autobuild%${autobuild#???}}"
> 
> More readable:
> 
>    short_sha="${autobuild:0:3}"

Yes, but this is a bashism (i.e. not posix). And even though we're
explicitly using bash, I tend to avoid bashisms when it can be done with
POSIX constructs.

But since Thomas alrady raised a concern about that in another patch
(for the autobuilder code itself), I'll switch to using the bashsim.

> But behaves differently from your approach when $autobuild is not valid
> (<= 3 chars long).

I'll put guards in palce to catch this.

[--SNIP--]
> The help message for "-b" is missing.

ACK.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
