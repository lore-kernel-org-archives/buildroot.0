From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Jul 2014 23:53:50 +0200
Subject: [Buildroot] [PATCH 4/5] support/download: only create final
 temp file when needed
In-Reply-To: <53BAC5FA.50004@mind.be>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <399c6d6d31d5b3dbe337ce97bb18c3e19f224422.1404681878.git.yann.morin.1998@free.fr>
 <53BAC5FA.50004@mind.be>
Message-ID: <20140707215350.GD3806@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-07-07 18:08 +0200, Arnout Vandecappelle spake thusly:
> On 06/07/14 23:27, Yann E. MORIN wrote:
> > Create the temp file in the final location only when it is needed.
> > 
> > This avoids the nasty experience of seeing lots of temp files in
> > BR2_DL_DIR, that would linger around in case the downloads fails.
> 
>  It would also help to add a
> 
> trap "rm -f ${tmp_dl}" EXIT HUP INT QUIT TERM
> 
> which also removes the need of doing the rm at the end. Of course, that trap is
> still racy (interrupt between mktemp and trap).
> 
>  But with the two temporary variables, adding a trap becomes even more
> difficult. Unless that part is refactored into a separate helper script of
> course :-)

Yep, added to the list of TODO. ;-)

> > Add a comment on why we don;t clean-up after git.
> 
>  Typo in don;t

Yep, already fixed.

[--SNIP--]
> > diff --git a/support/download/git b/support/download/git
> > index b0031e5..d3fcdaf 100755
> > --- a/support/download/git
> > +++ b/support/download/git
> > @@ -19,8 +19,6 @@ basename="${3}"
> >  output="${4}"
> >  
> >  repodir="${basename}.tmp-git-checkout"
> 
>  (not related to this patch) It's actually not a checkout, it's a bare clone.

And it's being renamed in a later patch.

> > -tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
> > -tmp_output="$( mktemp "${output}.XXXXXX" )"
> >  
> >  # Play tic-tac-toe with temp files
> >  # - first, we download to a trashable location (the build-dir)
> > @@ -33,6 +31,8 @@ cd "${BUILD_DIR}"
> >  # Remove leftovers from a previous failed run
> >  rm -rf "${repodir}"
> >  
> > +# Upon failure, git cleans behind itself, so no need to catch failures here.
> > +# The only case when git would not clean up, is if it gets killed with SIGKILL.
> 
>  I think the SIGKILL is reason enough to do the rm explicitly in the script. Of
> course, this is only valid if you use the trap, otherwise you never reach the rm

Well, SIGKILL is not catchable. That's the main selling point of SIGKILL.
;-)

> (due to 'set -e').

Well, 'set -e' only kicks in for the final 'mv', since all other
commands and conditions in an if statement.

Also, I'm not a big fan of traps, although I can be abusing them from
time to time.

But OK, I'll add this to the TODO...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
