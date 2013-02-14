From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 14 Feb 2013 17:53:47 +0100
Subject: [Buildroot] QUILT helper
In-Reply-To: <50FACBAA.7020602@mind.be>
References: <50F92F70.2070808@syscom-instruments.com>
 <50FACBAA.7020602@mind.be>
Message-ID: <7241967.ZJo92yCnzW@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anthony, hello Arnout,

On Saturday 19 January 2013 17:36:58 Arnout Vandecappelle wrote:
> On 18/01/13 12:18, Viallard Anthony wrote:
> > Hi,
> > 
> > It will be nice having a quilt helper like openwrt has.
> > 
> >   QUILT=1 make ofono
> > 
> > Et voil?, with this command, builroot use quilt to apply patches. So, if
> > you need to edit a patch, you just go in the build dir, use quilt pop,
> > quilt refresh, quilt push -a and use a new command to update the eddited
> > 
> > patch :
> >   make ofono-refresh
> > 
> > I known christmas was few days ago but if you include this idea, I will
> > be happy like when santa claus gave me a SEGA master system.

> 
>   I've been thinking about a feature to make it easier to create patches,
> but I was thinking in terms of git rather than quilt.
> 
>   None of the core buildroot developers uses quilt AFAIK, so don't expect
> your wish to be granted out of nowhere. But I for one am definitely open
> to consider patches that make it easier to create package patches!
[...]

A way to work with patches for a package is currently:
  make $PKG-dirclean
  make $PKG-extract
  cd build/$PKG-$PKG_VERSION
  git init
  git add .
  git rm --cached .stamp_*
  git commit -m 'initial tarball'
  git tag initial

After that, import all relevant patches using 
  git am $PATCH
or 
  git apply $PATCH 
  git commit -a -m "$PATCH"
depending of format of $PATCH

After that, you may create manually files .stamp_patched and 
.applied_patches_list

Use git rebase to edit each patch. Once you are satisfied, use 
  git format-patch initial

Copy your work in package/$PKG directory

IFAIK you may also use guilt on top of git. Guilt which have nearly same 
commands than quilt. Use "guilt push/pop/refresh" instead of rebase and "guilt 
export" instead of "git format-patch".

We could add an option to apply-patches.sh to automatically do first steps. We 
could do:
   make $PKG-dirclean
   make CREATE_GIT=1 $PKG-patch
   cd build/$PKG-$PKG_VERSION
   git rebase -i
   git format-patch initial

And with guilt:
   make $PKG-dirclean
   make CREATE_GIT=1 $PKG-patch
   cd build/$PKG-$PKG_VERSION
   guilt push/pop/refresh
   guilt export 

What do you think about it?

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
