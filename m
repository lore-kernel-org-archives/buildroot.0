From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 27 Oct 2014 09:55:35 +0000
Subject: [Buildroot] [PATCH v2] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <CABbD_XAv=+=zGo4mOkuCRCd9ay4TPyuuU0P_N8hLT0=UZL-PZQ@mail.gmail.com>
References: <1413132543-7148-1-git-send-email-abrodkin@synopsys.com>
 <CABbD_XBjo-UJf95vFi5innY4db=CzKDLeKqgXSsmEsf7eWw5yw@mail.gmail.com>
 <1413560410.19660.5.camel@abrodkin-8560l.internal.synopsys.com>
 <CABbD_XAv=+=zGo4mOkuCRCd9ay4TPyuuU0P_N8hLT0=UZL-PZQ@mail.gmail.com>
Message-ID: <1414403734.3666.18.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,

On Sat, 2014-10-25 at 16:28 +0200, K?roly Kasza wrote:

> Could you point me some examples, in which cases can these be computed
> too late?

The point is we cannot know for sure and moreover guarantee when
internal variables are calculated.

Remember we're dealing with "make" utility that does all calculations at
once on start. So it has nothing to do which real or virtual package
(like linux kernel) gets built first.

The only reliable values are BR2_xxx which are set in ".config" file on
exit from Buildroot configuration.

But we don't to put each and every tiny thing in ".config" that's why we
decided to do another round of calculation of kernel source path in
"linux-headers" based on values already available in ".config".
 
> 
>         So we need to do the same one calculations as we do in
>         "linux.mk" see:
>         linux/linux.mk: # Compute LINUX_SOURCE and LINUX_SITE from the
>         configuration
> Maybe add an extra target for computing the variables somewhere, and
> make both
> linux and linux-headers depend on it?

Well, frankly I don't quite understand how to do this kind of 2 stage
variables resolution with "make".

Probably another approach could be to eliminate "linux-headers" package
completely and modify "linux" virtual package so it could be only
downloaded, extracted and headers-installed if user doesn't want to
build kernel itself. I.e. move all functionality of "linux-headers" to
"linux".

But then we'll need to migrate kernel version (well headers version)
functionality as well so we still have properly resolved dependencies
for packages which require headers newer than XXX.

In other words scope of work here looks like pretty significant (if done
properly) but benefits are not that obvious.

Because IMHO the only reason you may want to use the same
sources/headers for tools and kernel if there is a ABI breakage which
for most of modern architectures not feasible.

Existing architectures seem to not suffer from it - their ABIs are
stable for quite a long time and new architectures are forced to use
UAPI so most of things will be unified.

Still if you do need this functionality nobody may stop you from trying
and I'll happily help you with details, reviews, tests etc.

-Alexey
