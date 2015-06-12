From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jun 2015 19:55:10 +0200
Subject: [Buildroot] [PATCH 09/11 v2] package/owl-linux: use
 kernel-module helper
In-Reply-To: <557A1606.1030402@mind.be>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <e63af963671131bf2d33fd2ab2eaa351bcc51150.1433964001.git.yann.morin.1998@free.fr>
 <557A1606.1030402@mind.be>
Message-ID: <20150612175510.GC3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-12 01:13 +0200, Arnout Vandecappelle spake thusly:
> On 06/10/15 21:22, Yann E. MORIN wrote:
> > Git rid of first patch, no longer needed; rename remaining patch.

s/Git/Get/  Damn... :-]

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> [snip]
> > diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
> > index 371cc02..844b11e 100644
> > --- a/package/owl-linux/owl-linux.mk
> > +++ b/package/owl-linux/owl-linux.mk
> > @@ -10,14 +10,11 @@ OWL_LINUX_LICENSE = PROPRIETARY
> >  OWL_LINUX_LICENSE_FILES = LICENSE
> >  OWL_LINUX_REDISTRIBUTE = NO
> >  
> > -OWL_LINUX_DEPENDENCIES = linux
> > -
> > -define OWL_LINUX_BUILD_CMDS
> > -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
> > -endef
> > -
> > -define OWL_LINUX_INSTALL_TARGET_CMDS
> > -	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)" modules_install
> > -endef
> > +# owl-linux wants to use $(PWD) to find its includes, however $(PWD) is not
> > +# the top of the package's source tree, but the top of Buildroot source tree
> 
>  Unless I'm very much mistaken, PWD will be $(LINUX_DIR) when the Makefile is
> included.

I think you are very much mistaken, indeed! ;-)

What happens is that all commands we run are run from Buildroot's
$(TOPDIR). So $(PWD) is set to that location.

So, this command, which we run from our Makefile:

    make -C $(LINUX_DIR) M=$(@D) foo-bar

would get its $(PWD) make-variable set from whatever value it had in the
shell that called make, which happens to itself be called by Buildroot's
Makefile, which runs from $(TOPDIR), always (even for out-of-tree builds).

Then, the Linux buildsystem does *not* chdir() when it builds modules,
it just includes $(M)/Kbuild (or if it does not exist, $(M)/Makefile ),
so $(PWD) as used in those will still be Buildroot's $(TOPDIR).

>  With that small thing fixed:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Still valid with that small thing *not* fixed? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
