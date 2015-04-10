From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 19:30:22 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-generic: support patching local
 source code
In-Reply-To: <CAB7JjA_EKRS9uEX9MhgUVpovh4VKoUF2vx1wE2Q+a9baZTRyCQ@mail.gmail.com>
References: <1428539284-5957-1-git-send-email-nic.dade@mistsys.com>
 <20150409221228.GC4192@free.fr>
 <CAB7JjA_Xc3ZCpT8RME2_nPjAGiDmp_k+yYOyvih7Bq9BSuShDA@mail.gmail.com>
 <20150409224049.GD4192@free.fr>
 <CAB7JjA_EKRS9uEX9MhgUVpovh4VKoUF2vx1wE2Q+a9baZTRyCQ@mail.gmail.com>
Message-ID: <20150410173022.GC4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2015-04-09 17:35 -0700, Nicolas Dade spake thusly:
[--SNIP--]
> > why not used the [packages in buildroot]
> 
> I do for those which are in buildroot. What I'm building in the SDK are the
> vendor's utilities which talk to their hardware part. Those aren't packages
> in [regular] buildroot, but I've added packages to my buildroot to build
> these vendor utilities.

OK, I misread what you wrote. The way you do it makes sense, of course.

> > [documentation]
> 
> Ah, I see why I didn't find this in the docs. I'm not using the
> <pkg>_OVERRIDE_SRCDIR feature. I'm setting <pkg>_SITE to the subdir of the
> SDK I want, and <pkt>_SITE_METHOD to "local". That is described in section
> "17.5.2 generic-package reference", and doesn't mention patches or lack
> there-of.

Aha! But inder the hood, the 'local' site method hijacks the
_OVERRIDE_SRCDIR infra. Hence the same behaviour.

> This way buildroot rsyncs from the SDK subdir I want to build to
> output/<pkg>-<ver>/, applies my patches, and builds it there, and the SDK
> source tree is left untouched. My understanding of _OVERRIDE_SRCDIR is that
> it overrides what would normally be output/<pkg>-<ver>/, and if I set it to
> point to the SDK I'd end up patching the pristine SDK source.
> 
> Maybe the right thing is to patch if _SITE and SITE_METHOD=local is used,
> and not if _OVERRIDE_SRCDIR is used.

Well, doing so is surely not the solution, because we'd be trying to
revert a decision made previously. The best solution would be to teach
the download infra to handle the 'local' site method by itself and not
rely on OVERRIDE_SRCDIR to begin with.

However, as a workaround to your issue, I'd suggest you do somwething
like the following (using two packages 'foo' and 'bar' as example):


foo.mk:
    FOO_SOURCE = filename-of-SDK.tar.gz
    FOO_SITE = file:///path/to/SDK

    define FOO_BUILD_CMDS
        cd $(@D)/relative/path/to/package/foo; \
        make whatever
    endef

    # And similar for install and other _CMDS

bar.mk:
    BAR_SOURCE = filename-of-SDK.tar.gz
    BAR_SITE = file:///path/to/SDK

    define BAR_BUILD_CMDS
        cd $(@D)/relative/path/to/package/bar; \
        make whatever-else
    endef

    # And similar for install and other _CMDS

And then you can have whatever patch you want to apply to those packages
(but the patches should be relative to the top-dir of the SDK, not the
packages' dirs).

Yes, this would mean having many packages using the same source file,
but that's pretty much OK; it works even though we're not doing it for
any package in Buildroot.

Let's continue discussing a proper solution for that. In the meantime,
I'm marking your patch as "Rejected" in our Patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
