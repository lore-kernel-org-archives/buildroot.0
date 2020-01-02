From: John Keeping <john@metanate.com>
Date: Thu, 2 Jan 2020 17:57:49 +0000
Subject: [Buildroot] [PATCH v2 2/2] download/git: ban branch references
In-Reply-To: <20191229221208.GH26395@scaer>
References: <20190624123027.485c128f@donbot>
 <20190624113224.22685-1-john@metanate.com>
 <20190624113224.22685-2-john@metanate.com>
 <20191229221208.GH26395@scaer>
Message-ID: <20200102175749.54f4ee42.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, 29 Dec 2019 23:12:08 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2019-06-24 12:32 +0100, John Keeping spake thusly:
> > As described in the manual, using a branch name as a version is not
> > supported.  However, nothing enforces this so it is easy to specify a
> > branch name either accidentally or because new developers have not read
> > through the manual.
> > 
> > For Git it is reasonably easy to catch most violations of this rule and
> > fail the fetch phase.  We now only accept tags or raw commit hashes;
> > it's possible that there are other special refs which are known to be
> > stable and this can be extended to support those in the future if
> > required.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---
> >  support/download/git | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/support/download/git b/support/download/git
> > index 02bf01bb95..5b5be92d15 100755
> > --- a/support/download/git
> > +++ b/support/download/git
> > @@ -133,6 +133,20 @@ if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
> >      exit 1
> >  fi
> >  
> > +# Check that the specified version is not a branch. We expect a tag or
> > +# raw commit hash, and accept some special refs as above. Using a branch
> > +# is forbidden because these are mutable references.
> > +case "$(_git rev-parse --symbolic-full-name "${cset}" 2>/dev/null)" in
> > +    refs/tags/*)
> > +        : ok
> > +        ;;
> > +    refs/*)
> > +        printf >&2 "Refusing to use Git branch '%s'.\n" "${cset}"
> > +        exit 1  
> 
> Sorry, but as I previously explained, this breaks on _existing_ git
> cached repositories. I'll repeat my previous example:
> 
> For example, I have a local git clone of linux-firmware, which has:
> 
>     $ git branch
>     * 1baa34868b2c0a004dc595b20678145e3fff83e7
>       44d4fca9922a252a0bd81f6307bcc072a78da54a
>       d87753369b82c5f362250c197d04a1e1ef5bf698
> 
>     $ git rev-parse --symbolic-full-name 1baa34868b2c0a004dc595b20678145e3fff83e7
>     warning: refname '1baa34868b2c0a004dc595b20678145e3fff83e7' is ambiguous.
>     Git normally never creates a ref that ends with 40 hex characters
>     because it will be ignored when you just specify 40-hex. These refs
>     may be created by mistake. For example,
> 
>       git checkout -b $br $(git rev-parse ...)
> 
>     where "$br" is somehow empty and a 40-hex ref is created. Please
>     examine these refs and maybe delete them. Turn this message off by
>     running "git config advice.objectNameWarning false"
>     refs/heads/1baa34868b2c0a004dc595b20678145e3fff83e7
> 
>     $ git rev-parse --symbolic-full-name 1baa34868b2c0a004dc595b20678145e3fff83e7 2>/dev/null
>     refs/heads/1baa34868b2c0a004dc595b20678145e3fff83e7
> 
> So if we were oto use 1baa34868b2c0a004dc595b20678145e3fff83e7 (which we
> did in the past), that would match the error path, which is not good.

This is solved by the "--prune" in patch 1, which removes all of those
refs so we end up with only a mirror of the remote.

If we can't prune the local repository completely and need to worry
about keeping all refs when switching remotes, then this case is a
problem.  The other side of that, is that some repositories have lots of
short-lived branches and if we don't prune those, then the local repo
may end up much bigger than necessary.


John
