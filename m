From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 14:25:54 +0100
Subject: [Buildroot] [PATCH next v5 7/9] core: implement per-package SDK
 and target
In-Reply-To: <af66d76c-06c6-3e01-257c-9e263d724639@mind.be>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-8-thomas.petazzoni@bootlin.com>
 <20181120213612.GL2601@scaer>
 <af66d76c-06c6-3e01-257c-9e263d724639@mind.be>
Message-ID: <20181123142554.3b42fb0a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Thanks for the review!

On Wed, 21 Nov 2018 00:32:11 +0100, Arnout Vandecappelle wrote:

> >>   output/per-package/busybox/target
> >>   output/per-package/busybox/host
> >>   output/per-package/host-fakeroot/target
> >>   output/per-package/host-fakeroot/host  
> > 
> > I'm not fond of the naming here...  
> 
>  Yay bikeshedding!

 :-)

> > In the end, can we expect to have a layout that would look like:
> > 
> >     output/build/busybox/host/
> >     output/build/busybox/target/
> >     output/build/busybox/busybox-1.2.3/     # Source tree, and
> >                                             # currently, build dir  
> 
>  If we're changing the world anyway, what about:
> 
> output/work/busybox-1.2.3/source
> output/work/busybox-1.2.3/host
> output/work/busybox-1.2.3/target
> output/work/busybox-1.2.3/build

You need two build folders: one for the target variant and one for the
host variant.

>  Or maybe even:
> 
> output/work/busybox-1.2.3/source
> output/work/busybox-1.2.3/dependencies/host
> output/work/busybox-1.2.3/dependencies/staging -> host/tuple/sysroot
> output/work/busybox-1.2.3/dependencies/target
> output/work/busybox-1.2.3/build

Also, I don't really like the word "work", that's what is used in OE
and I find it very fuzzy.

> >> +# $1: deps
> >> +ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
> >> +define prepare-per-package-folder  
> 
>  While we're bikeshedding: we have about 1000 occurences of "directory" and less
> than 30 of "folder".

I renamed to use "directory", both the macro, but also
BR2_PER_PACKAGE_FOLDERS is now BR2_PER_PACKAGE_DIRECTORIES.

> > The location where you define this macro, in the instrumentation hooks,
> > is not optimum I think. You even did not provide a help-comment for it.  
> 
>  At some point we started collecting this kind of thing in pkg-utils.mk. But I'm
> not sure if we're still doing that...

I moved the macro to pkg-utils.mk. It makes sense, because the macro is
also used in pkg-kconfig.mk (in a follow-up commit).

> > Why do you need two 'foreach' calls? Can't the following work?
> > 
> >     $(foreach pkg,$(1),\
> >         rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> >             $(PER_PACKAGE_DIR)/$(pkg)/host/ \
> >             $(HOST_DIR)$(sep) \
> >         rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> >             $(PER_PACKAGE_DIR)/$(pkg)/target/ \
> >             $(TARGET_DIR)$(sep))  
> 
>  I kind of like how we first build up all of host, and then all of target. But
> really, it doesn't make much of a difference.

Agreed, I also like the two loops.

>  More importantly, however: should we also sync the target directory for host
> packages? We *are* syncing the staging directory, of course...

Does it really matter ? A host package will only have other host
packages as its dependencies, so its per-package target directory will
always be empty. I did a test build, and all
output/per-package/host-*/target/ folders were empty.

So I am not sure it is really worth adding more conditionals in the
code just to avoid those empty target directories. But if you really
want that, I'll do it.

> >> +            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return  
>  The commit message doesn't explain why this is needed, and it took me some time
> to understand...

I updated the commit log with an explanation about this. It's obviously
not trivial, so it definitely deserves an explanation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
