From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Mar 2016 23:37:46 +0100
Subject: [Buildroot] [PATCH 09/16 v5] core/apply-patches: store full
 path of applied patches
In-Reply-To: <20160319185108.GE3426@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <4752967e7f254170efc08e77530029c90f663d85.1457718289.git.yann.morin.1998@free.fr>
 <20160319160346.50b52b19@free-electrons.com>
 <20160319185108.GE3426@free.fr>
Message-ID: <20160319223746.GG3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 19:51 +0100, Yann E. MORIN spake thusly:
> On 2016-03-19 16:03 +0100, Thomas Petazzoni spake thusly:
> > On Fri, 11 Mar 2016 18:49:22 +0100, Yann E. MORIN wrote:
> > 
> > > diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> > > index 201278d..20a1552 100755
> > > --- a/support/scripts/apply-patches.sh
> > > +++ b/support/scripts/apply-patches.sh
> > > @@ -63,8 +63,12 @@ find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
> > >      xargs -0 -r rm -f
> > >  
> > >  function apply_patch {
> > > -    path=$1
> > > -    patch=$2
> > > +    path="${1%%/}"
> > > +    patch="${2}"
> > > +    case "${path}" in
> > > +        /*) ;;
> > > +        *)  path="$(pwd)/${path}";;
> > > +    esac
[--SNIP--]
> > So here are other proposals:
> > 
> >  * The package infra already knows which patches should be applied
> >    (bundled patches, global patch dir, etc.), so it is technically able
> >    to get the list of patches. Yes it's a bit annoying because the
> >    logic to derive the list of patches is already inside the
> >    apply-patches script. But maybe it's because too much smart stuff is
> >    done in the apply-patch script without the package infrastructure
> >    being aware.

e-reading this, I don;t see a proposal in there. Did I miss something,
or did you forget to add something? ;-)

> >  * Alternatively, add an option to apply-patch.sh that will not apply
> >    the patches, but show the list of patches that would be applied.
> >    Like "apply-patch -l" for example. Then, when doing the legal-info,
> >    you simply call "apply-patch -l" to retrieve the list of patches
> >    that you need to copy.

Well, it is in fact a bit more complex than just running apply-patches
to get the list of patches.

First, some package do call apply-patches manually; there are 15 such
packages, some cal.ling apply-patches more than once (gcc, linux, linux
headers, uboot).

Second, in that case, some patches are applied conditionally. We do not
want to duplicate that logic for legal-info.

So, I stand that the best solution is my proposal, to store the list of
applied patches at the tiem they are applied, and use that later on for
the legal-info output.

If there is a better proposal, or a simple way to fix yours, I'm all
ears.

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
