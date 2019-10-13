From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Oct 2019 19:51:06 +0200
Subject: [Buildroot] [PATCH v4 2/2] support/dependencies: set cmake
 version min to 3.10
In-Reply-To: <d23800f9-ef9b-6dc1-a83a-67ca9a5c0394@mind.be>
References: <20191012152643.67744-1-james.hilliard1@gmail.com>
 <20191012152643.67744-2-james.hilliard1@gmail.com>
 <20191012165207.GA14656@scaer>
 <CADvTj4r-Z3U6cru8wy3APa=qdxFOxnkU979FM2GtV73r0FxoCQ@mail.gmail.com>
 <20191012181643.GB14656@scaer>
 <CADvTj4ovF-z_ZMe-1m_ek2WhWMq_HsdgftdqYW6rVe3aGXnJaQ@mail.gmail.com>
 <20191013070048.GC14656@scaer> <d23800f9-ef9b-6dc1-a83a-67ca9a5c0394@mind.be>
Message-ID: <CADvTj4prc4s=reT4JavBvCHMPwboKT7273ZScBAFa_01c9TXEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 13, 2019 at 7:45 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi all,
>
>  [Adding Peter to Cc list since we'll need a BDFL call on this one I think.]
>
> On 13/10/2019 09:00, Yann E. MORIN wrote:
> > James, All,
> >
> > On 2019-10-12 21:15 +0200, James Hilliard spake thusly:
> >> On Sat, Oct 12, 2019 at 8:16 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>> On 2019-10-12 19:18 +0200, James Hilliard spake thusly:
> >>>>>> +ifeq ($(BR2_HOST_GCC_AT_LEAST_4_8),y)
> >>>>>> +BR2_CMAKE_VERSION_MIN = 3.10
> >>>>>> +else
> >>>>>>  BR2_CMAKE_VERSION_MIN = 3.8
> >>>>>> +endif
>
>  Let me start with saying that I agree with Yann that something like this is a
> bit too ugly.
Yeah, changed this in my v5 to be explicitly set by packages that require 3.10.
>
>  On the other hand, we can't stay at cmake 3.8 forever. Further delaying things
> is not going to make it easier to solve...
>
>  So let's look at the more pragmatic solution: requiring host gcc 4.8+. Note
> that that is a rather big change. It requires:
>
> - update of documentation;
> - update of dependencies.sh;
> - removing BR2_HOST_GCC_AT_LEAST_4_{5,6,7,8}
> - probably a bunch of cleanups here and there as well.
>
>  But before going there, what will it cost us? In other words, which distros use
> GCC < 4.8?
>
> * RedHat
>
> RHEL5 has gcc 4.1, RHEL6 has gcc 4.4, RHEL7 has GCC 4.8. But actually, RHEL is
> not really a problem, at least when it comes to GCC version. RHEL has the "Red
> Hat Developer Toolset" with GCC versions up to 8. AFAIU, this is even available
> for RHEL5.
>
> * CentOS
>
> This developer toolset is only available to subscribers, but CERN (Scientific
> Linux) has made a copy of the GCC 4.8, at least for CentOS/ScientificLinux 6.
> Scientific Linux is dead now so we won't see updates for that, but it should be
> sufficient to tie us over for a while. And anyway, CentOS 6 has already only
> received "crucial security updates" since 2017 and goes entirely EOL a year from
> now.
>
> * Debian
>
> jessie (oldoldstable) has GCC 4.9, so we're good.
>
> * Ubuntu
>
> 12.04 has gcc 4.6, 14.04 has gcc 4.8. 12.04 has left ESM in April, so I don't
> think we need to support it.
>
>
>  In conclusion, I think we're OK to take 4.8 as a minimum host version. We could
> even make a YMMV statement and allow for e.g. an environment variable to
> override the check (because in reality, most things *will* work with gcc 4.4).
I think the compat fallback method in my v5 is probably clean enough that we can
hold off on bumping the minimum gcc requirements for a little while as
it isolates
the legacy cmake to a separate package that is only used as a fallback.
>
>  The only problem to solve then is what to do with our CentOS 6 autobuilders.
> Install gcc 4.8 on it? Or just retire them?
>
> [snip]
> >>> So, no, history has taught us that major version bumps are not simple,
> >>> and especially here, sine we'd got from 3.8 to 3.15, which is not a bump,
> >>> not even a leap, but a really long jump...
> >> Well my assumption is mostly since we only build cmake in buildroot if
> >> it's older
> >> than 3.8 this already should be tested due to many cmake versions on the
> >> build system right?
> >
> > Sorry, I did not understand what you meant here...
>
>  What James means is: since a lot of autobuilders already use a more recent
> version of cmake (they use system cmake instead of our host-cmake), any failures
> in packages would already have been detected by now.
>
>  I think that's largely correct. The issues that Yann referred to were mostly
> issues with building host-cmake itself.
>
>  Regards,
>  Arnout
>
