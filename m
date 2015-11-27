From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:50:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/skeleton: parametrise the
 symlinks-or-mkdir macro
In-Reply-To: <5658D217.1020905@mind.be>
References: <cover.1448575841.git.yann.morin.1998@free.fr>
 <0c601430e0de47ba5a18c933ace701ccf1e0eca4.1448575841.git.yann.morin.1998@free.fr>
 <5658D217.1020905@mind.be>
Message-ID: <20151127225026.GC4144@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-27 22:58 +0100, Arnout Vandecappelle spake thusly:
> On 26-11-15 23:13, Yann E. MORIN wrote:
> > currently, we only make the merged symlinks or non-merged mkdirs in the
> > target directory. This is fine, as long as one does not run gdb.
> > 
> > However, as soon as one wants to run gdb (or gdbserver) on the target,
> > gdb will only search for libraries in /lib in the sysroot.
> > 
> > In preparation for a patch to fix that, make the symlink-or-mkdir macro
> > a function that takes as parameter the base directory where to create
> > symlinks or mkdir in.
> > 
> > Move the function declarations our of the custom/non-custom skeleton
> > conditional block, so they are always available.
> > 
> > Reported-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  But...
> 
> > ---
> >  package/skeleton/skeleton.mk | 31 ++++++++++++++++---------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> > 
> > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> > index 46e8cc4..b296cbd 100644
> > --- a/package/skeleton/skeleton.mk
> > +++ b/package/skeleton/skeleton.mk
> > @@ -57,27 +57,28 @@ else # ! custom skeleton
> >  
> >  SKELETON_PATH = system/skeleton
> >  
> > -ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> > -define SKELETON_USR_SYMLINKS_OR_DIRS
> > -	ln -snf usr/bin $(TARGET_DIR)/bin
> > -	ln -snf usr/sbin $(TARGET_DIR)/sbin
> > -	ln -snf usr/lib $(TARGET_DIR)/lib
> > -endef
> > -else
> > -define SKELETON_USR_SYMLINKS_OR_DIRS
> > -	$(INSTALL) -d -m 0755 $(TARGET_DIR)/bin
> > -	$(INSTALL) -d -m 0755 $(TARGET_DIR)/sbin
> > -	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib
> > -endef
> > -endif
> > -
> >  endif # ! custom skeleton
> >  
> > +# This function handles the merged or non-merged /usr cases
> > +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> > +define SKELETON_USR_SYMLINKS_OR_DIRS
> 
>  We usually make functions lowercase rather than uppercase, although there are
> notable exceptions like MESSAGE and UPPERCASE.

Well, one may argue that hooks are functions like any other, and we
write them in upper-case.

So yes, we usually write lower-case functions in the infras. But
(almost?) everything in packages is upper-case, so I think it is
best to not get diverge too much to what we do in other packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
