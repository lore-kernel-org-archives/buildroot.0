From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jun 2018 19:26:51 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <1148643526.1795245.1528413126545.JavaMail.zimbra@datacom.com.br>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer>
 <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <1148643526.1795245.1528413126545.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180608172651.GD2090@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-06-07 20:12 -0300, Carlos Santos spake thusly:
> > From: "Arnout Vandecappelle" <arnout@mind.be>
> > To: "Yann Morin" <yann.morin.1998@free.fr>, "DATACOM" <casantos@datacom.com.br>
> > Cc: "Thomas De Schampheleire" <thomas.de_schampheleire@nokia.com>, "buildroot" <buildroot@buildroot.org>
> > Sent: Thursday, June 7, 2018 6:03:48 PM
> > Subject: Re: [Buildroot] [PATCH] fs: allow extra arguments to common tarball extraction
> 
> > On 06-06-18 20:51, Yann E. MORIN wrote:
> >> But my position has always been consistent on this topic: the images
> >> that Buildroot generates only ever covers just "basic" situations, using
> >> a single-filesystem layout. Anything that needs to do a multi-filesystem
> >> layout should be done as a new filesystem. Doing it in a new filesystem
> >> is much more flexible than whatever kconfig option we may ever add. And
> >> since we already have this wonderful flexibility, I don't think it makes
> >> sense to add a new option that duplicates only a very limited subset of
> >> that flexibility. That duplication is not good, IMNSHO...
> > 
> > There is (in my even less humble opinion) one way that we can solve this
> > generically: by adding a genimage filesystem. genimage is able to create
> > separate filesystem images for subtrees. so it can cover many use cases in a
> > generic way.
> 
> I'm already working on a patch to convert inner-rootfs into a generic
> inner-filesystem macro. I will submit it for comments soon.

Why do you need to do so? You can use the 'rootfs' macro, as I already
explained, and for which I have already sent a patch to add it to the
manual:

    https://patchwork.ozlabs.org/patch/926425/

> BTW, it took me some time to understand the dual personality of TARGET_DIR
> in fs/common.mk and the role of BASE_TARGET_DIR. Then I found the line in
> the top Makefile with
> 
>   TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> 
> I understand that this trick avoids changing fs/*/*.mk replacing each
> reference to TARGET_DIR by a ROOTFS_<FOO>_TARGET_DIR but it reduces
> the readability a lot. I'm compelled to restore it to how it was prior
> to commit 7e9870ce32d.

But if you revert that, then TARGET_DIR points to the original target/
directory, which does *not* contain the completely-finalised content.

Please see the commits around that one for the full picture:

    git log --oneline 14d43aea0a..543107d390

And see the cover-letter that explains the motivations behind all those
changes:

    http://lists.busybox.net/pipermail/buildroot/2018-March/215450.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
