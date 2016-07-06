From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Jul 2016 22:56:27 +0200
Subject: [Buildroot] [PATCH v3 2/6] Add documentation for merged
 defconfigs
In-Reply-To: <d0c8b8db-0810-7b4a-5c54-fe01cf06988b@gmail.com>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
 <fb148ddadbc12c9a9437192761ba342237a27325.1467176798.git.sam.bobroff@au1.ibm.com>
 <489e6359-291e-5920-87d6-da23fe8c5d0a@smile.fr>
 <20160705193212.GB20922@asimov.austin.ibm.com>
 <1467756823.4917.1.camel@mendozajonas.com>
 <20160705224104.GD20922@asimov.austin.ibm.com>
 <d0c8b8db-0810-7b4a-5c54-fe01cf06988b@gmail.com>
Message-ID: <20160706205627.GE3763@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Samuel, Patrick, All,

On 2016-07-06 21:08 +0200, Romain Naour spake thusly:
> Le 06/07/2016 ? 00:41, Patrick Williams a ?crit :
> > On Wed, Jul 06, 2016 at 08:13:43AM +1000, Samuel Mendoza-Jonas wrote:
> >> On Tue, 2016-07-05 at 14:32 -0500, Patrick Williams wrote:
> >>> On Fri, Jul 01, 2016 at 03:18:58PM +0200, Romain Naour wrote:
> >>>> Hi Sam,
> >>>>
> >>>> This series has been discussed with other developers and we concluded that this
> >>>> feature is not the responsibility of Buildroot to generate a defconfig from
> >>>> partial configuration files.
> >>>>
> >>>> Instead we recommend to use merge_config.sh from outside of Buildroot to
> >>>> generate the merged defconfig before calling make. Maybe we should add some
> >>>> documentation in the manual to explain how to use it.
> >>>>
> >>>> Best regards,
> >>>> Romain
> >>>>
> >>>
> >>> Earlier we had two independent patch sets that we were asked to merge.
> >>>
> >>>    1) Merged defconfigs (now this patch set).
> >>>    2) Subdirs for defconfigs.
> >>>
> >>> If #1 has been rejected as undesireable, should we now prepare an
> >>> indepenent patch set for #2 or is that also not wanted now?
> >>>
> >>> There is currently no way for us to manage this behavior in a
> >>> BR2_EXTERNAL layer alone because there is no Makefile from the
> >>> BR2_EXTERNAL path sourced in the defconfig case.  Is there any issue
> >>> with a patch that will source a file like $(BR2_EXTERNAL)/external-defconfig.mk?

I can understand the frustration. I am sorry that we came to that
conclusion and that you feel disapointed.

We did reject this because, as Romain explained, we believe it is much
more flexible to handle such a case outside of Buildroot, as Romain
explained.

> >> Actually there might be - Sam was telling me yesterday that the main
> >> Makefile includes $(BR2_EXTERNAL)/external.mk, which is something we may
> >> use to get mergeconfigs in op-build. That might work for nested configs
> >> as well.
> >>
> > 
> > I've already been down this route.  The 'include
> > $(BR2_EXTERNAL)/external.mk' is inside a big 'ifeq
> > ($(BR2_HAVE_DOT_CONFIG),y)' on line 336.  That effectively means if you
> > don't already have a .config (which comes about from running a
> > 'defconfig' recipe) then you don't get a source to external.mk.  That is
> > why I'm asking about a new 'external-defconfig.mk'.
> 
> Patrick, you're right. It's currently no way to include an external makefile
> when BR2_HAVE_DOT_CONFIG is not set. Neither from local.mk or external.mk.
> 
> Indeed, adding $(BR2_EXTERNAL)/external-defconfig.mk should work in this case.
> 
> I tried with this patch [1] and used Samuel's patch [2] applied to
> external-defconfig.mk instead of the Buildroot Makefile.
[--SNIP--]
> [1] https://github.com/RomainNaour/buildroot/commit/396744b032567b0d7fcc6e3d56c37143efde368e

No, we already rejected a similar proposal (by me!) to source custom
help from br2-external:
    http://lists.busybox.net/pipermail/buildroot/2016-March/thread.html#156705
    http://lists.busybox.net/pipermail/buildroot/2016-April/thread.html#158710

The correct solution would be that we source external.mk unconditionally.
The patch is actually trivial (I had it locally some time ago, when
working on the aforementioned custom help).

For this, we should ensure it is safe to do so, but in my (very little)
epxerimentation, it seemed OK to do so. However, we must be really
carefull in doing so.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
