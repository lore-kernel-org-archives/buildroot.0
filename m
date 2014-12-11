From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 22:12:42 +0100
Subject: [Buildroot] [PATCH 3/4 v4] pkg-download: verify the hashes from
 the download wrapper
In-Reply-To: <20141211214209.6df5e210@free-electrons.com>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
 <d0dd46117de298b684c5fc90f5e4efe0d160d3b7.1418322200.git.yann.morin.1998@free.fr>
 <20141211214209.6df5e210@free-electrons.com>
Message-ID: <20141211211242.GM4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-11 21:42 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Thu, 11 Dec 2014 19:24:47 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/support/download/check-hash b/support/download/check-hash
> > index 13e361a..b41a87e 100755
> > --- a/support/download/check-hash
> > +++ b/support/download/check-hash
> > @@ -5,9 +5,11 @@ set -e
> >  # Call it with:
> >  #   $1: the path of the file containing all the the expected hashes
> >  #   $2: the full path to the file to check
> > +#   $3: the basename of the file to check
> >  
> >  h_file="${1}"
> >  file="${2}"
> > +base="${3}"
> 
> I was very confused here by $2 and $3. If you have "the full path to
> the file to check", why would you need "the basename of the file to
> check" as argument. I believe this should be clarified:
> 
>  $2: the full path to the temporary file that was downloaded, and that
>      should be checked
> 
>  $3: the name of the real file we are downloading. Used only for
>      messages, as we are in fact checking a temporary file, and waiting
>      for this temporary file to be fully downloaded and checked before
>      renaming it to the real file name.
> 
> Of course, feel free to reword this in a better way.

Ah yes, this is slightly tricky.

The problem is that the .hash files contain the name of the local
tarballs, while the file we check is a temnporary file with an arbitrary
name.

So we have to know both the name, with full path, of the actual file we
are checking; we get in in $(2). And we need to know what hash to check
it against, so we need the final name it will be saved as; we get it via
$(3).

But your wording is pretty much OK, except the part about "just mesages",
since we really need it, as you later saw...

> > -            if [ "${f}" = "${file##*/}" ]; then
> > +            if [ "${f}" = "${base}" ]; then
> 
> Hum, so it is not only used for display. So you need to reword the
> above.

Nope. Yup. ;-)

> >      # tmp_output is in the same directory as the final output, so we can
> >      # later move it atomically.
> >      tmp_output="$( mktemp "${output}.XXXXXX" )"
> > @@ -147,7 +159,7 @@ DESCRIPTION
> >              bzr     Bazaar
> >              cp      local files via simple copy
> >              cvs     Concurrent Versions System
> > -            git     git
> > +            git     Git
> 
> Should be part of a previous patch.

Yup, my mistake, I did not ammend the correct patch.

> >              hg      Mercurial
> >              scp     remote files via Secure copy
> 
> Maybe you want to capitalize "Local files..." and "Remote files..." as
> well, for consistency.

Well, I did capitalise the names as they appear on their respective
homepages.

Git is written "Git", cvs is "COncurrent Versions System" and so on...

I should rename "remote files via Secure copy" to "Secure copyt of
remote files", and so on...

I'll rework all that.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
