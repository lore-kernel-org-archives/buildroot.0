From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2013 23:26:34 +0100
Subject: [Buildroot] [PATCH] Makefile: include BR2_EXTERNAL before other
	packages
In-Reply-To: <87txedzmoq.fsf@dell.be.48ers.dk>
References: <1386870727-25575-1-git-send-email-yann.morin.1998@free.fr>
 <87txedzmoq.fsf@dell.be.48ers.dk>
Message-ID: <20131217222634.GB3352@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-12-13 00:14 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > BR2_EXTERNAL may contain packages that are "providers" of generic
>  > functionalities, such as EGL/GLES/...
> 
> Ehh, do we want to support that? With the way we have implemented the
> virtual jpeg/egl/.. whatever packages, the virtual package needs to know
> about all the packages providing that functionality, so it can add the
> implementation to it's dependencies (and complain if nothing is
> enabled) - So to do it from BR2_EXTERNAL those external packages have to
> mess with the variables of the virtual package (E.G. JPEG_DEPENDENCIES),
> which isn't really nice (and is an implementation detail).

As we discussed (yesterday, or was it Sunday?) on IRC:
  - yes, this is an implementation detail
  - people using BR2_EXTERNAL are encouraged to push their packagings
    upstream to us
  - if they don't (eg. proprietary, or local packages), they are
    responsible for keeping up with our API changes, not unlike external
    kernel modules have to keep up with the kernel API changes
  - even as it is now, BR2_EXTERNAL can mess up with our built-in packages
  - yes, I think we do want to provide the ability for BR2_EXTERNAL to
    include packages that provide an implementation for a virtual
    package

After all, BR2_EXTERNAL is there for companies to put their dirty little
secrets they don't want to share with the community, or with the
recipients of their Buildroot copy.

If we prevent them from using BR2_EXTERNAL to have implementations for
virtual packages, then I think we are striking quite a blow to the
usefulness of BR2_EXTERNAL.

> Is this position going to be the right place to include BR2_EXTERNAL for
> everyone? E.G. you cannot use it to implement custom filesystem types.

That's a different reason, but this patch does not change the current
situation: BR2_EXTERNAL can't provide fs rules, since fs/common.mk is
included afterBR2_EXTERNAL, so BR2_EXTERNAL can't use the ROOTFS_TARGET
macro.

But since we haven't been advocating BR2_EXTERNAL for this purpose, and
it does not even work currently we hardly break any promise. ;-)

Note that my other patch that postpones the generation of packages rules
until after all packages have been parsed would solve that issue, if we
would extend that solution to filesystems, too.

> If we put the include here, then it becomes very close to the
> BR2_PACKAGE_OVERRIDE_FILE functionality (which gets included just
> before) - Perhaps we should not have two features doing basically the
> same?

In fact, I think we should get rid of BR2_PACKAGE_OVERRIDE_FILE
altogether, since BR2_EXTERNAL allows for the same functionality, plus
it is more versatile (again, with the rules-generation-postponing-patch).
My 2 cents... :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
