From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 22:03:01 +0100
Subject: [Buildroot] [PATCH 1/4 v4] suppot/download: add option parsing
 to the download wrapper
In-Reply-To: <20141211213749.637df4c2@free-electrons.com>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
 <204467c4c3722faed45db924c489ad768ed1ae33.1418322200.git.yann.morin.1998@free.fr>
 <20141211213749.637df4c2@free-electrons.com>
Message-ID: <20141211210301.GL4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-12-11 21:37 +0100, Thomas Petazzoni spake thusly:
> Typo in title: suppot -> support

Suppot de Satan! :-)

> On Thu, 11 Dec 2014 19:24:45 +0100, Yann E. MORIN wrote:
> > Instead of relying on argument ordering, use actual options in the
> > download wrapper.
> > 
> > Download backends (bzr, cp, hg...) are left as-is, because it does not
> > make sense to complexifies them, since they are almost very trivial
> 
> complexifies -> complexify.

Da.

> > shell scripts, and adding option parsing would be really overkill.
> 
> You could have mentioned that the commit also renames the script. I
> thought it was the case in earlier versions of this patch series.

So did I. Will add it on the next respin...

> > diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> > new file mode 100755
> > index 0000000..b1b9158
> > --- /dev/null
> > +++ b/support/download/dl-wrapper
> > @@ -0,0 +1,166 @@
> > +#!/usr/bin/env bash
> > +
> > +# This script is a wrapper to the other download backends.
> > +# Its role is to ensure atomicity when saving downloaded files
> > +# back to BR2_DL_DIR, and not clutter BR2_DL_DIR with partial,
> > +# failed downloads.
> > +#
> > +# Call it with:
> > +#   -b BACKEND  name of the backend (eg. cvs, git, cp...)
> > +#   -o FILE     full path to the file in which to save the download
> > +#   --          everything after '--' are options for the backend
> > +# Environment:
> > +#   BUILD_DIR: the path to Buildroot's build dir
> 
> With this in place, do we still need the -h option and the fake man
> page?

Are get rid of it and keep the help text? ;-)

[--SNIP--]
> > +main() {
> > +    local OPT OPTARG
> > +    local backend output
> > +
> > +    # Parse our options; anythong after '--' is for the backend
> 
> anything

Ack.

> > +    # Sop we only care to -b (backend) and -o (output file)
> 
> Sop?

s/p//

> Maybe:
> 
>        # We only care about -b, -h and -o

Or just remove it, it's a carry-over from the previous script...

[--SNIP--]
> > +    tmpd="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
> 
> No space after ( and before ).

Ack for it and the following ones.

[--SNIP--]
> > +    if ! "${OLDPWD}/support/download/${backend}" "${tmpf}" "${@}"; then
> > +        rm -rf "${tmpd}"
> 
> How is it possible to remove ${tmpd} here, since we are cd'ed into this
> directory?

Well, nothing prevents the removal of a directory that still has an open
fd to it, no more than anything prevents the removal of a file that
still has an open fd to it. It is marked "deleted" in the VFS so nothing
can access it anymore, nor create new entries in it...

    mkdir -p ~/foo/bar
    cd ~/foo/bar
    rm -rf ~/foo/bar
    echo buz >baz

And see what happens! ;-)

[--SNIP--]
> > +help() {
> > +    cat <<_EOF_
> > +NAME
> > +    ${my_name} - downlaod wrapper for Buildroot
> 
> download

Ack.

> > +
> > +SYNOPSIS
> > +    ${my_name} [OPTION]... -- [BACKEND OPTION]...
> > +
> > +DESCRIPTION
> > +    Wrapper script around different download mechanisms. Ensure that
> 
> Ensures

Ack.

Thanks for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
