From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 20:51:51 +0200
Subject: [Buildroot] [PATCH 09/15 v4] fs: introduce per-rootfs
 TARGET_DIR variable
In-Reply-To: <eb507e0a-581e-d037-4a10-a151356fbc80@mind.be>
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <98f2dfa3b5a89f108b51cc567c41665628a01bc3.1522487149.git.yann.morin.1998@free.fr>
 <eb507e0a-581e-d037-4a10-a151356fbc80@mind.be>
Message-ID: <20180331185151.GO25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-03-31 20:30 +0200, Arnout Vandecappelle spake thusly:
> On 31-03-18 11:05, Yann E. MORIN wrote:
> > ... which for now still points to the base target directory, but this is
> > a step forward.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  Makefile     | 4 +++-
> >  fs/common.mk | 1 +
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index e17675be9b..9fba7a3ed8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -215,8 +215,10 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
> >  
> >  BUILD_DIR := $(BASE_DIR)/build
> >  BINARIES_DIR := $(BASE_DIR)/images
> > +# The target directory is common to all packages,
> > +# but there is one that is specific to each filesystem.
> >  BASE_TARGET_DIR := $(BASE_DIR)/target
> > -TARGET_DIR = $(BASE_TARGET_DIR)
> > +TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> 
>  OK for now, but I think when PPS happens we should s/ROOTFS/PKG/ and simply use
> $($(PKG)_TARGET_DIR) here.

Why so? After PPS, each rootfs will still get their own private copy of
target, which is what we will want them to use...

So, with PPS, this would evetually be something like:

    TARGET_DIR = \
        $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),\
            $(if $(PKG),$($(PKG)_TARGET_DIR),\
                $(BASE_TARGET_DIR)))

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >  # initial definition so that 'make clean' works for most users, even without
> >  # .config. HOST_DIR will be overwritten later when .config is included.
> >  HOST_DIR := $(BASE_DIR)/host
> > diff --git a/fs/common.mk b/fs/common.mk
> > index cd132cdbc7..363798bb20 100644
> > --- a/fs/common.mk
> > +++ b/fs/common.mk
> > @@ -40,6 +40,7 @@ define inner-rootfs
> >  
> >  ROOTFS_$(2)_NAME = $(1)
> >  ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
> > +ROOTFS_$(2)_TARGET_DIR = $$(BASE_TARGET_DIR)
> >  
> >  # extra deps
> >  ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
