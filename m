From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Nov 2013 22:55:58 +0100
Subject: [Buildroot] [PATCHv3 1/5] core: introduce the BR2_EXTERNAL
 variable
In-Reply-To: <20131128215003.GD3337@free.fr>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131128215003.GD3337@free.fr>
Message-ID: <20131128215557.GE3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-28 22:50 +0100, Yann E. MORIN spake thusly:
> On 2013-11-27 23:31 +0100, Thomas Petazzoni spake thusly:
> > This commit introduces the BR2_EXTERNAL environment variable, which
> > will allow to keep Buildroot customization (board-specific
> > configuration files or root filesystem overlays, package Config.in and
> > makefiles, as well as defconfigs) outside of the Buildroot tree.
> > 
> > This commit only introduces the variable itself, and ensures that it
> > is available within Config.in options, so that string options used to
> > specify paths to directories or files can use $BR2_EXTERNAL as a
> > reference. For example, one can use
> > $BR2_EXTERNAL/board/<someboard>/kernel.config as the
> > BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE value.
> [--SNIP--]
> 
> With only this commit applied, and a clean tree, I get:
> 
>     $ make menuconfig
>     Makefile:136: *** "The specified BR2_EXTERNAL '' location doesn't
>     exist".  Stop.
> 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [--SNIP--]
> > diff --git a/Makefile b/Makefile
> > index b5368a3..a46418e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -99,6 +99,45 @@ export CDPATH:=
> [--SNIP--]
> > +BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
> > +
> > +ifeq ($(origin BR2_EXTERNAL),command line)
> > +ifeq ($(BR2_EXTERNAL),) # Case 1
> > +override BR2_EXTERNAL := $(TOPDIR)/support/dummy-external/
> > +$(shell rm -f $(BR2_EXTERNAL_FILE))
> > +else # Case 2
> > +ifeq ($(wildcard $(BR2_EXTERNAL)),)
> > +$(error "The specified BR2_EXTERNAL '$(BR2_EXTERNAL)' location doesn't exist")
> > +endif
> > +override BR2_EXTERNAL := $(realpath $(BR2_EXTERNAL))
> > +BR2_EXTERNAL_USED = y
> > +$(shell echo $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
> > +endif
> > +else # Case 3
> > +override BR2_EXTERNAL := $(shell test -f $(BR2_EXTERNAL_FILE) && cat $(BR2_EXTERNAL_FILE))
> > +ifeq ($(wildcard $(BR2_EXTERNAL)),)
> > +$(error "The specified BR2_EXTERNAL '$(BR2_EXTERNAL)' location doesn't exist")
> 
> The error occurs here.
> 
> That's becasue you test if BR2_EXTERNAL is comming from the command
> line, but that last case should also test if BR2_EXTERNAL_FILE exists
> before scanning it.

Doh, I forgot to paste the patch:

diff --git a/Makefile b/Makefile
index 83a5c06..038294b 100644
--- a/Makefile
+++ b/Makefile
@@ -131,12 +131,14 @@ BR2_EXTERNAL_USED = y
 $(shell echo $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 endif
 else # Case 3
+ifneq ($(wildcard $(BR2_EXTERNAL_FILE)),)
 override BR2_EXTERNAL := $(shell test -f $(BR2_EXTERNAL_FILE) && cat
$(BR2_EXTERNAL_FILE))
 ifeq ($(wildcard $(BR2_EXTERNAL)),)
 $(error "The specified BR2_EXTERNAL '$(BR2_EXTERNAL)' location doesn't
exist")
 endif
 BR2_EXTERNAL_USED = y
 endif
+endif
 
 BUILD_DIR:=$(BASE_DIR)/build
 STAMP_DIR:=$(BASE_DIR)/stamps

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
