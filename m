From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 09:01:37 +0200
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <519C636D.9010805@mind.be>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
 <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
 <20130520192543.3b61d666@skate> <519C636D.9010805@mind.be>
Message-ID: <20130522090137.721cbaac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 22 May 2013 08:19:25 +0200, Arnout Vandecappelle wrote:
> On 20/05/13 19:25, Thomas Petazzoni wrote:
> >> >Also, regarding the static library, the output of the package is always a
> >> >shared object since it needs to be loaded dynamically by Lua scripts. The
> >> >default target of the package is a test so I need to specifically specify
> >> >the target.
> > Ok. Then maybe your package needs to depend on !BR2_PREFER_STATIC_LIB.
> > Or maybe more of the Lua stuff, if it requires shared libraries.
> 
>   We currently probably have many packages that generate .so files even 
> if PREFER_STATIC_LIB is true

Correct, but...

> - that's why it is "prefer", right?
> 
>   That said, I'm certainly in favour of making the STATIC stuff more strict.

... I dislike this idea of "prefer". I would like the
BR2_PREFER_STATIC_LIB option be turned into something like "Fully
static system", because this is also what is needed for non-MMU
platforms that have no shared library support. I don't really see the
point of having something that will "prefer static libraries" for some
packages and not for some other, without control on which ones. Of
course, if we could control on a per-package basis which library should
be built static and which should be built shared, this would make some
sense. But without such control, it really doesn't make any sense to me
to have a random selection of packages being built shared, and the rest
being built static, when you enable BR2_PREFER_STATIC_LIB=y.

So, to me, while this option is still named BR2_PREFER_STATIC_LIB, we
should think of it as BR2_USE_ONLY_STATIC_LIB. Maybe someday we'll
rename it? :-)

Of course, that raises the question of whether we should disable all
libraries/applications that use dlopen() libraries when this option is
enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
