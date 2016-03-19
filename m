From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Mar 2016 19:51:08 +0100
Subject: [Buildroot] [PATCH 09/16 v5] core/apply-patches: store full
 path of applied patches
In-Reply-To: <20160319160346.50b52b19@free-electrons.com>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <4752967e7f254170efc08e77530029c90f663d85.1457718289.git.yann.morin.1998@free.fr>
 <20160319160346.50b52b19@free-electrons.com>
Message-ID: <20160319185108.GE3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 16:03 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 18:49:22 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> > index 201278d..20a1552 100755
> > --- a/support/scripts/apply-patches.sh
> > +++ b/support/scripts/apply-patches.sh
> > @@ -63,8 +63,12 @@ find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
> >      xargs -0 -r rm -f
> >  
> >  function apply_patch {
> > -    path=$1
> > -    patch=$2
> > +    path="${1%%/}"
> > +    patch="${2}"
> > +    case "${path}" in
> > +        /*) ;;
> > +        *)  path="$(pwd)/${path}";;
> > +    esac
> 
> This seems unrelated to the patch in question, and is not explained
> anywhere.

Ah, indeed it's not trivial. When we apply our bundled patches, only the
relative path to those patches are stored. So we make them canonical by
prepending the current path to that relative path.

Strictly speaking, I am not sure it is needed, but for consistency, all
paths are stored as full paths.

> However, I have some more global concern about this approach. I really
> dislike the idea that we rely on a helper script filling up a file,
> that we later read from a completely different place in the package
> infrastructure. It really feels like "let's dump my data there and
> fetch it from here".

I know that feeling, that makes one not comfortable and bothered.
Yet, I fail to see a problem in there; there are other cases where we
save stuff in a file, and re-use it later from another place, like the
graph-size stuff.

BTW, what did we so far save the list of patches for to begin with?

> So here are other proposals:
> 
>  * The package infra already knows which patches should be applied
>    (bundled patches, global patch dir, etc.), so it is technically able
>    to get the list of patches. Yes it's a bit annoying because the
>    logic to derive the list of patches is already inside the
>    apply-patches script. But maybe it's because too much smart stuff is
>    done in the apply-patch script without the package infrastructure
>    being aware.

Hmmm... I consider all our support/scripts/ stuff to *be* part of the
infra, like the mkusers script. apply-patches *is* part of the infra;
it's just written in a shel script rather than in make (which would
undoubtly be unreadable). Also, remember you suggested we offload all
out complex make code for handling external toolchains, into a (set of)
well scripts? It is similar to me.

>  * Alternatively, add an option to apply-patch.sh that will not apply
>    the patches, but show the list of patches that would be applied.
>    Like "apply-patch -l" for example. Then, when doing the legal-info,
>    you simply call "apply-patch -l" to retrieve the list of patches
>    that you need to copy.

What I don't like in this case, is that you decorelate applying the
patches from listing them. By storing the list of patches at the time
they are applied, we guarantee the list is consistent with the patches
that were applied. By postponing the listing later, we can no longer
offer that guarantee.

Yes, we can't guarantee that the patches we later copy are the ones that
were actually applied; true. That's why I believe that legal-info should
be part of the "standard" build.

Anyway, I won't fight that one; all that I care about is that patches
are actually saved, so I'll go for the -l option to apply-patches.

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
