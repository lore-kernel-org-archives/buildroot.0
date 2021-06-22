From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jun 2021 22:18:18 +0200
Subject: [Buildroot] [PATCH 03/15] package/pkg-generic.mk: Remove Info
 documents dir entry
In-Reply-To: <20210622113406.11234e26@windsurf>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-4-herve.codina@bootlin.com>
 <20210621225120.536cd758@windsurf>
 <20210622104343.0c5ea063@bootlin.com>
 <20210622113406.11234e26@windsurf>
Message-ID: <20210622201818.GI44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Herv?, All,

On 2021-06-22 11:34 +0200, Thomas Petazzoni spake thusly:
> On Tue, 22 Jun 2021 10:43:43 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> > > However, I'm not a huge fan of having this right in the middle of the
> > > infrastructure. It feels like a small detail that gets handled in the
> > > middle of super generic infrastructure code.
> > > 
> > > The issue is that I don't really have a good alternative proposal :-/  

I too am not too fond of this, but I don't have an obvious better
solution in mind...

> > Maybe using a macro defined closed to fixup-libtool-files and calling
> > this macro here instead of '$(Q)rm ...' will help.
> > Do you think it will be better ?
> 
> Either a macro, or a list of files that are removed, perhaps?

I think a list+macro would be a better solution.

Alternatively, we could append to post-install hooks, like we do for
pre-configure hooks in the autotools infra for autoreconf et al., for
example...

    # Outside generic-package-inner:

    # $1: base directory (target, staging, host)
    define remove-conflicting-useless-files
        $(Q)$(RM) -rf $(patsubst %, $(1)/%, $($(PKG)_DROP_FILES_OR_DIRS))
    endef
    define REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
        $(call remove-conflicting-useless-files,$(HOST_DIR))
    endef
    define REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
        $(call remove-conflicting-useless-files,$(STAGING_DIR))
    endef
    define REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
        $(call remove-conflicting-useless-files,$(TARGET_DIR))
    endef


    # In generic-package-inner:

    $(2)_DROP_FILES_OR_DIRS += /share/info/dir

    # For host packages:
    $(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST

    # For target packages:
    $(2)_POST_INSTALL_STAGING_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
    $(2)_POST_INSTALL_TARGET_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET

This way, it also paves the way to add other hooks to actually fix some
files instead of removing them...

For example, assume that packages (e.g. 'wonders') can register
themselves against another package (e.g. 'manager') by appending a
line to a text file, like so (over-simplified, of course):

    echo "name=wonders path=/usr/lib/wonders/v42" >>/usr/share/manager/registry

Then we could have a hook that detects that, extracts the delta
installed by the package, stash that somewhere in staging, and have a
target-finalise hook that aggregates all the packages in the end.

> > This add a little complexity in overwrite detection (filter out) and
> > I prefer having overwrite detection quite stupid. It checks for
> > overwrites without any exception.
> > Adding exception now in the detection mechanism is opening the door to
> > more and more exceptions.
> 
> Yes, I understand your argument. As I stated: I'm also not sure which
> solution to propose here. I was just not a big fan of this removal of
> one specific file, there, in the middle of a highly generic piece of
> infrastructure.

Yes, this bothered me too...

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
