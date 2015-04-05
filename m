From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 11:16:56 +0200
Subject: [Buildroot] [PATCH 1/5 v2] package infra: add patch-dependencies
In-Reply-To: <20150404154705.4be3e45d@free-electrons.com>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
 <20150404154705.4be3e45d@free-electrons.com>
Message-ID: <20150405091656.GC4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-04 15:47 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sat, 14 Mar 2015 15:25:17 +0100, Yann E. MORIN wrote:
> 
> > -$(1)-show-depends:
> > +$(1)-show-build-depends:
> >  			@echo $$($(2)_FINAL_DEPENDENCIES)
> > +$(1)-show-patch-depends:
> > +			@echo $$($(2)_FINAL_PATCH_DEPENDENCIES)
> > +$(1)-show-depends:
> > +			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
> 
> I think this will break graph-depends. The python script will do "make
> <foo>-show-depends" for each package. Now this will return things such
> as "xenomai-patch"

No, I don't think so, because _PATCH_DEPENDENCIES contain package names,
not or internal make targets. And I can prove it:

    $ make linux-show-depends
    fbtft host-kmod host-lzop toolchain

where fbtft is a kernel extension.

Have you even tried it?  ;-p

> Also, I'm not sure about the usefulness of having separate
> show-build-depends and show-patch-depends. It could have been useful if
> show-depends would simply depend on them, but it doesn't work because
> we want all dependencies space-separated on one line.
> 
> So, what about replacing this part with just:
> 
> $(1)-show-depends:
> 	@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$(patsubst %-patch,%,$$($(2)_FINAL_PATCH_DEPENDENCIES)))

Well, I don;t mind getting rid of the separate show-{build,patch}-depends
rules. But your proposal is wrong, since we do not have to get rid of
the trailing -patch, because it's not in there...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
