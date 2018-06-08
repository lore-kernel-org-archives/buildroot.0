From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jun 2018 19:34:28 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <5675dcb9-67cc-d09e-6c5b-de0522996a20@mind.be>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer>
 <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <1148643526.1795245.1528413126545.JavaMail.zimbra@datacom.com.br>
 <5675dcb9-67cc-d09e-6c5b-de0522996a20@mind.be>
Message-ID: <20180608173428.GE2090@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-06-08 09:48 +0200, Arnout Vandecappelle spake thusly:
> On 08-06-18 01:12, Carlos Santos wrote:
[--SNIP--]
> > BTW, it took me some time to understand the dual personality of TARGET_DIR
> > in fs/common.mk and the role of BASE_TARGET_DIR. Then I found the line in
> > the top Makefile with
> > 
> >   TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> > 
> > I understand that this trick avoids changing fs/*/*.mk replacing each
> > reference to TARGET_DIR by a ROOTFS_<FOO>_TARGET_DIR but it reduces
> > the readability a lot. I'm compelled to restore it to how it was prior
> > to commit 7e9870ce32d.
> 
>  The same (or a similar) trick will be applied to the normal packages for
> per-package host/staging/target (which is ultimately needed for top-level
> parallel build). If we want to avoid it there, we would have to change 785
> package.mk files, and also many package definitions in BR2_EXTERNALs that we
> don't control...
> 
>  That said, I would also prefer to use explicit $(FOO)_TARGET_DIR variables. But
> doing so *will* require legacy handling.
> 
>  Maybe we should indeed use explicit ROOTFS_$(ROOTFS)_TARGET_DIR in our rootfs
> definitions, document that that is the one to use, and wait a year or two before
> deprecating TARGET_DIR entirely.
> 
>  Yann?

Well, It is really cumbersome to have to prefix that directory with the
package name or the rootfs name... TARGET_DIR is just plainly easy to
use.

Especially since we would break a long-established variable name.

And it is not the only variable that changes its content based on the
current package: $(@D) and $(@) et al. Yes, they are make special
variables, but so?

In the end, I still fail to see the problem. But I am usual pretty
stubborn, so... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
