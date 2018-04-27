From: John Keeping <john@metanate.com>
Date: Fri, 27 Apr 2018 11:17:34 +0100
Subject: [Buildroot] [RFC/PATCH] download/git: support Git LFS
In-Reply-To: <20180426202440.GC2471@scaer>
References: <20180426173653.12660-1-john@metanate.com>
 <20180426202440.GC2471@scaer>
Message-ID: <20180427111734.3e94fed1.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Apr 2018 22:24:40 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2018-04-26 18:36 +0100, John Keeping spake thusly:
> > Git Large File Storage replaces large files with text pointers in
> > the Git repository while storing the contents on a remote server.
> > If a repository is using this extension, then git-lfs must be used
> > to checkout the large files before the source archive is generated.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---
> > Currently this relies on git-lfs being installed on the host system
> > and I'm not sure if that's considered acceptable or not.  
> 
> I think that would be acceptable, but would require a dependency
> check, basically, something like
> 
>   - support/depenencies/check-host-git.mk :
> 
>         ifeq (,$(call suitable-host-package,git,$(GIT) $(if
> $(BR2_GIT_NEEDS_LFS).lfs))) $(error You need a git that supports
> git-lfs) endif
> 
>   - support/depenencies/check-host-git.sh
> 
>         #!/bin/sh
> 
>         GIT="${1}"
>         LFS="${2}"
> 
>         # If LFS not required, any git is OK
>         if [ -z "${LFS}" ]; then
>             echo "${GIT}"
>             exit 0
>         fi
> 
>         # Test LFS
>         if ${GIT} help lfs >/dev/null 2>&1; then
>             # Works!
>             echo "${GIT}"
>             exit 0
>         fi
> 
>         exit 1
> 
> Now, all you have, is to find a way to synthetise
> BR2_GIT_NEEDS_LFS. ;-)

This makes sense, I'll add this check for v2.

> > Unfortunately, building it as a host package opens a can of worms
> > because it is written in Go and pkg-golang only supports target
> > packages at the moment.  
> 
> Yup, but with the check above, that would be fine for me.
> 
> >  docs/manual/adding-packages-generic.txt | 4 ++++
> >  package/pkg-download.mk                 | 1 +
> >  support/download/dl-wrapper             | 9 +++++----
> >  support/download/git                    | 9 +++++++++
> >  4 files changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/docs/manual/adding-packages-generic.txt
> > b/docs/manual/adding-packages-generic.txt index
> > 62906d92bb..63b5bf70c9 100644 ---
> > a/docs/manual/adding-packages-generic.txt +++
> > b/docs/manual/adding-packages-generic.txt @@ -327,6 +327,10 @@
> > information is (assuming the package name is +libfoo+) : submodules
> > when they contain bundled libraries, in which case we prefer to use
> > those libraries from their own package. 
> > +* +LIBFOO_GIT_LFS+ should be set to +YES+ if the Git repository
> > uses
> > +  Git LFS to store large files out of band.  This is only
> > available for
> > +  packages downloaded with git (i.e. when
> > +LIBFOO_SITE_METHOD=git+).  
> 
> I'm a bit reluctant at adding yet another download-related option that
> applies to a single site method...
> 
> Can't we consider that LFS is some kind of recusrion, like submodules
> are?
> 
> And then, if FOO_GIT_SUBMODULES is YES, we do both: submodule and lfs.
[snip]
> TBH, I would be very much happier if we would go that way... :-)

I'm not so happy with that idea though...  At the moment, I think
submodules are a lot more common than repositories using LFS and for
repositories that are primarily source code that's going to remain true.

Since git-submodule ships with Git, there is no additional dependency on
the host system for using submodules, but with LFS we are imposing an
additional requirement on the host system and if we combine both
requirements behind a single flag we risk annoying people who use
submodules but not LFS.

If the annoyance is threading method-specific flags through dl-wrapper,
I wonder if we should consider something analagous to the compiler's
-Wl,... option which passes an argument through to the download helper.

We could consider changing the SUBMODULE and LFS options so it looks
more like:

	LIBFOO_SITE_FEATURES = git-submodule git-lfs

and it is up to the download helper to reject features which are not
supported by that backend.

> Otherwise, you may have seen that we have had quite some grief with
> the download rework lately, and there are still a lot of patches
> pending to fix various issues:
> 
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=40204
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=40301
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=40975
> 
> So, I'm a bit reluctant at applying this support for git-lfs so close
> to rc1 (due next week) when we still have serious download-related
> issues to fix...

I don't think Git LFS support is urgent, so there's no need to rush it
into this release.


Regards,
John
