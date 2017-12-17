From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Dec 2017 18:39:11 +0100
Subject: [Buildroot] [PATCH] package/cmake: bump version to 3.10.0 and
 add license hash
In-Reply-To: <20171216133439.58247290@windsurf>
References: <20171210233349.24682-1-mlang@blind.guru>
 <20171212070736.04953cff@windsurf.png.is.keysight.com>
 <20171212123040.35400bc4@windsurf> <877etnj677.fsf@home.blind.guru>
 <20171216133439.58247290@windsurf>
Message-ID: <20171217173911.GA7491@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Mario, All,

On 2017-12-16 13:34 +0100, Thomas Petazzoni spake thusly:
> On Sat, 16 Dec 2017 11:52:12 +0100, Mario Lang wrote:
> > To move to C++11 was apparently intentional, and not an oversight.
[--SNIP--]
> > Yes, actually, I am.  However, I am a bit to rooky to Buildroot to
> > understand enough about how you handle backwards compatibility in
> > general.  My gut feeling as a C++11 fan would be to just accept the fact
> > that C++11 is going to be required by projects in the future.  However,
> > I gather Buildroot has official minimal compiler requirements which are
> > likely dictated by toolchains provided by other vendors?
> 
> We can already have dependencies on gcc versions, both for the host
> compiler and the target compiler, see BR2_HOST_GCC_AT_LEAST_ for the
> host compiler version dependencies and BR2_TOOLCHAIN_GCC_AT_LEAST_ for
> the target compiler version dependencies.
> 
> However, the problem is that we would have to propagate this dependency
> to all packages using cmake, and all their reverse dependencies. It's
> definitely not impossible, but it's going to be quite a few packages.
> 
> Also, it is complicated by the fact that we should not add this
> dependency if cmake is already installed system-wide, as we only build
> host-cmake if we can't find a suitable cmake version.
> 
> Basically, it all boils down to have a Config.in option that tells us
> whether we need to build host-cmake or not, and whether we *can* build
> it, and add this dependency to all cmake packages and their reverse
> dependencies.

Alternatively, we could also consider bumping our own requirements now,
requiring a newer base system.

Yes, that would mean leaving out in the cold people stuck on *very
ancient* enterprise-class distros (which IMHO would be a bit sad). But I
would prefer that rather than springling a dependency in all packages...

Unless we also build our own host toolchain? ;-] Well, probably a host
C/C++ compiler would be enough to build is needed, until we also need to
build binutils and a C library and whatnot... This should be avoided if
at all possible.

emplace_hint() has been added in gcc-4.7 (listed as a defect in 4.6).
However, some of the build failures are on a machine with gcc-4.7.2;

    http://autobuild.buildroot.org/results/ae8/ae88e2addefab8c7ccefa853c87313034ea241bc/build-end.log
    [--SNIP--]
    -- The C compiler identification is GNU 4.7.2
    -- The CXX compiler identification is GNU 4.7.2
    [--SNIP--]
    cmGlobalNinjaGenerator.cxx:1077:40: error: 'class std::map<const
    cmGeneratorTarget*, std::set<std::basic_string<char> > >' has no member
    named 'emplace_hint'

But all the failures occur on gcc-20...

I looke at my autobuilder, and it uses gcc-4.8.2, and cmake builds fine
with that...

gcc-4.8 was released in March 2013, which will be almost 5 years ago
when we tag LTS 2018.02. So maybe we can keep using cmake-3.9 up until
2018.02, then update our requirements to require a host gcc >= 4.8m
which will allow us to bump cmake to 3.10.

I agree that, with time passing, more and more packages will require
C++11, so it will make sense to require proper C++11 support for the
host compiler.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
