From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Apr 2020 21:52:21 +0200
Subject: [Buildroot] [PATCH v3 0/8] Bump of SElinux related libs/tools
 to 3.0
In-Reply-To: <1427fb1c-7f5b-1a83-a735-107745b842ef@mind.be>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
 <20200414182303.250cc38d@windsurf.home>
 <CANQCQpYUoZX=L7LMJ_Mkhvak0y_48RZuYaaHzx5MFAvwhQtArQ@mail.gmail.com>
 <20200415074355.4f382f62@windsurf.home>
 <1427fb1c-7f5b-1a83-a735-107745b842ef@mind.be>
Message-ID: <20200415195221.GH5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On 2020-04-15 09:40 +0200, Arnout Vandecappelle spake thusly:
> On 15/04/2020 07:43, Thomas Petazzoni wrote:
> > On Tue, 14 Apr 2020 12:20:40 -0500
> > I never remember what are the rules to share a package <pkg>_VERSION
> > variable with other packages. 
>  You can only do that if it's included from a place that guarantees the
> ordering, like e.g. for qt5: package/qt5/qt5.mk sets the version and *then*
> include's package/qt5/qt5base/qt5base.mk.
>  In any other case, it should be duplicated.

Yep.

> > For example for mesa3d/mesa3d-headers, we
> > do not share the version information, we duplicate it:
> > 
> > # Not possible to directly refer to mesa3d variables, because of
> > # first/second expansion trickery...
> > MESA3D_HEADERS_VERSION = 20.0.4
> > 
> > But in protobuf/python-protobuf:
> > 
> > # When bumping this package, make sure to also verify if the
> > # python-protobuf package still works, as they share the same
> > # version/site variables.
> > PROTOBUF_VERSION = 3.11.4
> > 
> > PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
> 
>  This *accidentally* works because we sort the included files in the top-level
> Makefile and protobuf < python-protobuf. It's a pretty dangerous thing to do though.

Agreed. This should be fixed so that the version is duplicated, like is
done for mesa3d.

[--SNIP--]
> > Overall, I'll mark your series as Changes Requested. I would suggest to
> > bump to 3.0, without sharing the version for now, so that we can get
> > the 3.0 version bump merged soon.
>  Ack, no sharing of versions please.

Agreed.

>  Note that I have a vague idea of how we may be able to share versions (+ some
> other features). It is currently not possible because the _VERSION is used
> (indirectly) in some rules and conditions in the expansion of
> inner-generic-package. So my idea was to delay expansion of
> inner-generic-package until after all the packages have been included. This
> would also make it possible, for instance, to override a package version in a
> br2_external, and indeed modify any package variable in the external. And it
> would also make it possible to limit the expansion to just what is specified in
> PACKAGES, which would speed up the `make` invocation significantly (I estimate a
> factor of two).

When I had implemeted that years ago as a proof-of-concept, the speedup
was not that noticeable in the end. The issue is that you can't easily
just expand enabled packages, because then you'd miss on some variables
that are defined by the target variant, but used by the host variant.
Allowing for that would require carefully choosing what variables get
defined early, and which would get postponed. And typically, for
VERSION, you want it to be evaluated late, so it can be overriden in a
br2-external. And since the hsopt vairant inherits its version from the
taget variant, you still have to evaluate the target variant first.

So basically, no speedup...

But maybe I missed something...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
