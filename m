From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 25 Jul 2012 11:04:17 +0200
Subject: [Buildroot] [git commit] pkg-*targets.mk: factorize and fix
 $(PKG)_SRCDIR and $(PKG)_BUILDDIR declaration
In-Reply-To: <500F2C7F.4080103@mind.be>
References: <20120722182025.E29919692E@busybox.osuosl.org>
 <500F2C7F.4080103@mind.be>
Message-ID: <CAHXCMMJHCoE8un176ojz56pwm5iuvBWUGF4kunUG-_3=ztGsQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

2012/7/25 Arnout Vandecappelle <arnout@mind.be>:
> On 07/22/12 19:28, Thomas Petazzoni wrote:
>>
>> +ifndef $(3)_SUBDIR
>> + ifdef $(2)_SUBDIR
>> +  $(3)_SUBDIR = $$($(2)_SUBDIR)
>> + else
>> +  $(3)_SUBDIR ?=
>> + endif
>> +endif
>
>
>  Actually, I think this should be
>
> $(2)_SUBDIR ?= $$($(3)_SUBDIR))
>
>  There definitely shouldn't be an assignment to $(3)_SUBDIR here,
> and also the whole ifdef construct is unnecessary.
Yep, I messed-up inner-generic-package argument order :/, Thomas fixed it:
http://git.buildroot.net/buildroot/commit/?id=8e26abecd00f4899fb122c3eeb03fbdf20cda32e

>
>
>> +
>> +$(2)_SRCDIR                   = $$($(2)_DIR)/$$($(2)_SUBDIR)
>> +$(2)_BUILDDIR                 ?= $$($(2)_SRCDIR)
>
>
>  This looks like a missed refactoring opportunity:
>
> _SRCDIR is still assigned to in pkg-cmake.mk
>
> I don't see why anybody would want to override _BUILDDIR, so the ?= is
> redundant.  And since it's always equal to _SRCDIR, why not just use
> _SRCDIR?
Recently, I played with eigen an tryied to integrate it in BR.
Though it's a header only package using cmake as buid-system, it does
not support in-source-tree build.

So, here I use ?=, in the case someday we implement out-of-source-tree
build; it's easy with cmake, not so easy with autotools, and I have to
think about this for the rest.


Cheers,

-- 
Sam
