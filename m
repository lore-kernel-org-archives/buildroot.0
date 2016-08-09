From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 9 Aug 2016 21:54:12 +0200
Subject: [Buildroot] [PATCH 0/9] Introducing service
 supervision/management with s6
In-Reply-To: <20160809041444.GQ22524@waldemar-brodkorb.de>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20160809041444.GQ22524@waldemar-brodkorb.de>
Message-ID: <20160809215412.7a766bf1@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Tue, 9 Aug 2016 06:14:44 +0200,
Waldemar Brodkorb <wbx@openadk.org> a ?crit :

> > This series provides all the packages for programs and libraries to
> > build an embedded system with service supervision and management
> > using s6 from http://skarnet.org.
> > 
> > Note that these packages only provide the mechanism for
> > supervising/managing services using s6, not the policy. Packages to
> > provide a policy suitable for Buildroot-based embedded systems,
> > using s6 as init (instead of SysV or systemd), will be provided
> > later. An example is available in the buildroot-s6 demo project
> > [1].  
> 
> Is there a reason s6 series depends on glibc or musl?

The problem with uclibc-ng is twofold:

1. a compilation issue.
2. a runtime lock-up.

I've finally found time to tackle these issues ;-).

When configuring skalibs, a runtime test is created to check if
posix_spawnp() is present. For whichever reason, when using uclib-ng. 
this function is provided by librt. So by default the test fails and
instead of using posix_spawnp(), the function child_spawn0() from
skalibs falls back to a fork/execve homegrown version. This fallback
function is buggy but this has been fixed [0], but this is not
available in skalibs 2.3.10.0.

Anyway, the ./configure script from skalibs can be patched to check 
for posix_spawnp() in librt. But then, for each package skarnet
program/library, this extra library should be passed to the build
process (e.g. execline):

```
ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
EXECLINE_MAKE_OPTS = EXTRA_LIBS="-lrt"
endif
```

Unfortunately, posix_spawnp() is buggy, which results in the `if`
command from execline going into an infinite loop. This due to a
incorrect pointer update in __spawni(). I sent a patch upstream to 
fix this [2].

So the limitation can now be removed, provided I add one patch for
skalibs and one for uclibc-ng. I'll check with the skalibs maintainer
to see if there is a cleaner way to handle the uclibc-ng librt issue,
because I'd prefer to avoid using the EXTRA_LIBS variable trick in all
the skarnet packages.

Or I can also backport [1] as a temporary workaround.

> I once played with s6, but was scared about pre-configring for all
> architectures. Do you think your patch to skalibs has any chance to
> be upstreamed?

The patch for detecting the endianness was previously discussed [3]. As
Thomas P. suggested some improvements for type size checks, I'll bump
the topic once this part has been reworked.

[1]
http://git.skarnet.org/cgi-bin/cgit.cgi/skalibs/commit/?id=2dc76616b2b0884f0203cf36b58f94c5656c0c81
[2]
http://mailman.uclibc-ng.org/pipermail/devel/2016-August/001126.html
[3]
http://www.mail-archive.com/supervision at list.skarnet.org/msg01034.html

Best regards,
-- 
ELB
