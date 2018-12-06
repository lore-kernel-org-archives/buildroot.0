From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Dec 2018 09:32:45 +0100
Subject: [Buildroot] Submodule granularity instead of LIB_GIT_SUBMODULES
In-Reply-To: <8f33142c-71ad-24c6-bad4-deea26f05ce6@mind.be>
References: <ea-mime-5bfeb41d-7336-2fa4e677@www-6.netcourrier.com>
 <8f33142c-71ad-24c6-bad4-deea26f05ce6@mind.be>
Message-ID: <20181206083245.GC2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-12-03 17:40 +0100, Arnout Vandecappelle spake thusly:
> On 28/11/2018 16:28, lpdev at cordier.org wrote:
> > I have a repository that have few submodules:
> > - myLib
> > ? -> submodule1 (~10MB)
> > ? -> submodule2 (8GB)
> > 
> > Actually I don't need to initialize submodule2 because myLib does not request it
> > while compiling for my buildroot distro.
> > 
> > The option xxx_GIT_SUBMODULES is doing a recursive init on all submodules of the
> > project. As I am using Buildroot 2018.02, there is no support for the latest git
> > patches that improve the overall space overhead and avoid compressing the repo.
> > 
> > Each time I am updating the git hash of my package, buildroot is cloning the
> > repo, getting the subodules (from scratch), compress tar it, and then start the
> > compilation. I was wondering if there is a way to specify _GIT_SUBMODULES to no,
> > but still get the submodule1, without breaking buildroot's download philosophy.
> 
>  No, there's no simple way to do that. And adding the infrastructure to do that
> would lead us way too far.

Actually, it would be rather easy, as 'git submodule init' accepts a
list of paths to initialise (it has accepted that since submodules were
introduced in 2007).

See (totally untested):
    https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/git-submodules&id=6a4f7c504e04dfe8dd6d5f8540a6cbc81e3758ae

Arnout, like you, I am not sure we would want such a feature. However,
I don't have a strong opinion against it either, as it's pretty easy to
do...

If you really believe we should not have it, then I'll drop my patch.
Otherwise, if you think it's worth pursuing, I'll refine it before
properly submitting it.

Regards,
Yann E. MORIN.

>  However, what you can do is to leave _GIT_SUBMODULES to NO, add submodule1 as
> <PKG>_EXTRA_DOWNLOADS and extract it in a <PKG>_POST_EXTRACT_HOOK.  This does
> mean you have to manually
> 
>  Unfortunately, I'm not sure if it is possible to use the git download method
> for extra downloads. You can add git+ in front of the URL, but I don't think
> there's a way to specify the ref to check out... So perhaps you'll instead have
> to define a post-download hook that calls dl-wrapper directly...
> 
>  Regards,
>  Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
