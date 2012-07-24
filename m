From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jul 2012 01:15:11 +0200
Subject: [Buildroot] [git commit] pkg-*targets.mk: factorize and fix
 $(PKG)_SRCDIR and $(PKG)_BUILDDIR declaration
In-Reply-To: <20120722182025.E29919692E@busybox.osuosl.org>
References: <20120722182025.E29919692E@busybox.osuosl.org>
Message-ID: <500F2C7F.4080103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/22/12 19:28, Thomas Petazzoni wrote:
> +ifndef $(3)_SUBDIR
> + ifdef $(2)_SUBDIR
> +  $(3)_SUBDIR = $$($(2)_SUBDIR)
> + else
> +  $(3)_SUBDIR ?=
> + endif
> +endif

  Actually, I think this should be

$(2)_SUBDIR ?= $$($(3)_SUBDIR))

  There definitely shouldn't be an assignment to $(3)_SUBDIR here,
and also the whole ifdef construct is unnecessary.

> +
> +$(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
> +$(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)

  This looks like a missed refactoring opportunity:

_SRCDIR is still assigned to in pkg-cmake.mk

I don't see why anybody would want to override _BUILDDIR, so the ?= is
redundant.  And since it's always equal to _SRCDIR, why not just use
_SRCDIR?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
