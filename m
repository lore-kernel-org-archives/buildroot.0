From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 19:28:16 +0200
Subject: [Buildroot] [PATCH 2/2 v3] support/download: fix the git helper
 output file format
In-Reply-To: <87ppg11xdg.fsf@dell.be.48ers.dk>
References: <cover.1407343550.git.yann.morin.1998@free.fr>
 <2205cccc9b1580208e604067224448da94599151.1407343550.git.yann.morin.1998@free.fr>
 <87ppg11xdg.fsf@dell.be.48ers.dk>
Message-ID: <20140815172816.GA22918@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-08-15 19:22 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > The git helper uses gzip to compress the intermediate tarball. But gzip
>  > removes the source file, and create a new file named by appending .gz to
>  > the original file name.
> 
>  > Thus, we end up with output.gz, while the download wrapper expects jsut
>  > output, and thus believes the downlaod failed.
> 
>  > Fix that by storing the tar from git to a temporary file, then pipe this
>  > file to gzip's stdin, and redirect gzip's stdout to the output file.
> 
>  > Reported-by: Graham Newton <gnewton@peavey-eu.com>
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Peter Seiderer <ps.report@gmx.net>
>  > ---
>  >  support/download/git | 4 ++--
>  >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
>  > diff --git a/support/download/git b/support/download/git
>  > index d451530..ff6b5c3 100755
>  > --- a/support/download/git
>  > +++ b/support/download/git
>  > @@ -34,6 +34,6 @@ if [ ${git_done} -eq 0 ]; then
>  >  fi
>  
>  >  GIT_DIR="${basename}" \
>  > -${GIT} archive --prefix="${basename}/" -o "${output}" --format=tar "${cset}"
>  > +${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
>  
>  > -gzip "${output}"
>  > +gzip <"${output}.tmp" >"${output}"
> 
> Don't we then end up with a bunch of foo.tmp files?

Nope, because the wrapper scripts first 'cd' into a temp dir, that ets
removed at the end of the wrapper.

See:
    http://git.buildroot.org/buildroot/tree/support/download/wrapper#n42
and:
    http://git.buildroot.org/buildroot/tree/support/download/wrapper#n91

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
