From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2019 17:54:03 +0100
Subject: [Buildroot] [TO-BE-TESTED] support/download/hg: implement
 repository cache
In-Reply-To: <5f0e55d2-99e2-bc68-4017-334dbafa35a9@mind.be>
References: <20190205202433.25292-1-patrickdepinguin@gmail.com>
 <5f0e55d2-99e2-bc68-4017-334dbafa35a9@mind.be>
Message-ID: <20190208165403.GA3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-02-07 22:33 +0100, Arnout Vandecappelle spake thusly:
> On 05/02/2019 21:24, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > 
> > Similar to the git download helper, implement a repository cache for
> > Mercurial repositories.
> > 
> > The code is mostly guided by the implementation for git, with certain parts
> > copied almost verbatim.
> > 
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> > index efb515fca5..bb5cc87969 100755
> > --- a/support/download/hg
> > +++ b/support/download/hg
> > @@ -1,7 +1,7 @@
> >  #!/usr/bin/env bash
> >  
> >  # We want to catch any unexpected failure, and exit immediately
> > -set -e
> > +set -E
> 
>  If you do this, the comment above is no longer valid...
>       -e  Exit immediately if a command exits with a non-zero status.
>       -E  If set, the ERR trap is inherited by shell functions.
> are not the same thing!
> 
>  However, since AFAICS the only function in this file is the trap handler
> itself, this seems to be a mistake, no?
> 
>  Ow, this really is inherited from git, introduced by commit b7efb43e86da96.
> Yann, care to explain?

Yes, I care to explain. Even though I do write some crap most of the
time, there are in fact two functions in the git backend.

Like all backends, the actual tool is wrapped into a _git() function,
which was introduced more than three years ago, by commit 3f2bdd070
(support/download: protect from custom commands with spaces in args), as
a way to actually fix a bug actually reported by Thomas DS.

Yes, this makes it that the set -E is needed, after all.

> >  # Download helper for hg, to be called from the download wrapper script
> >  #
> > @@ -10,11 +10,39 @@ set -e
> >  #   -o FILE     Generate archive in FILE.
> >  #   -u URI      Clone from repository at URI.
> >  #   -c CSET     Use changeset (or revision) CSET.
> > +#   -d DLDIR    Download directory path.
>  Hm, looks like this is missing in the git helper :-) Yann?

As I said above: I do write a lot of crap. However, in this case, I'm
not the culprit; see commit 6d938bcb (download: git: introduce cache
feature).

But yeah, the comment-help is not accurate.

> >  #   -n NAME     Use basename NAME.
> >  #
> [snip]
> > +	Do *not* work in that directory; your changes will eventually get
> > +	lost. Do *not* even use it as a remote, or as the source for new
> 
>  This bit is actually rubbish: it's perfectly fine to clone it, as long as you
> don't push to it. Oh well.

Indeed, it is technically possible to clone from it. However, that means
that the 'origin' would point to that, and people would be very easily
tempted to push to it. As a consequence, they could loose their work.

And this is really a cache for use by Buildroot, and we really want
users not to rely on it.

Hence, we really suggest they do not use it at all, not even as their
'origin'.

[--SNIP--]
> > +# Make sure that there is no working directory. This will clear any user
> > +# temptation to work in this directory.
>  Good plan :-)

Hmm.. I think someone once said there was not problem leaving cruft in
BR2_DL_DIR, because it does not matter what's inside as it is a location
private to Buildroot... (not directly in those words, but the message
was subtly similar.)

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +_hg update --repository "'${hg_cache}'" null >/dev/null 2>&1
> >  
> > -_hg archive ${verbose} --repository "'${basename}'" --type tgz \
> > +_hg archive ${verbose} --repository "'${hg_cache}'" --type tgz \
> >              --prefix "'${basename}'" --rev "'${cset}'" \
> >              - >"${output}"
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
