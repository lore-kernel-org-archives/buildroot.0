From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jan 2019 16:23:43 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-cmake: add CMAKE_SYSTEM_VERSION to
 toolchainfile.cmake
In-Reply-To: <20190112160629.5a85748b@windsurf.home>
References: <20190110230529.29852-1-arnout@mind.be>
 <20190111211626.GD2428@scaer>
 <20190112160629.5a85748b@windsurf.home>
Message-ID: <20190112152343.GG2428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2019-01-12 16:06 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Jan 2019 22:16:26 +0100, Yann E. MORIN wrote:
> 
> > > the
> > > value of BR2_TOOLCHAIN_HEADERS_AT_LEAST contains the (minimum) version
> > > of the kernel it will run on,  
> > 
> > That is not true.
> > 
> > glibc for example will by default carry fallback mechanisms to emulate
> > some features when it is running on a kernel older than the headers it
> > was compiled against. In Buildroot we explictly disable that feature by
> > passing --enable-kernel=$(BR2_TOOLCHAIN_HEADERS_AT_LEAST).
> > 
> > But for external toolchains, we don't know (and can't know) iw they did
> > pass that option or not, and if they did, what version they requested,
> > and if they did not, what version glibc uses.
> > 
> > This backward compatibility of glibc can extend quite a bit in the past,
> > so kernels we would consider pretty old might still be usable with such
> > toolchains. For example, on glibc-2.24, the minimum required headers
> > were 3.2, but the runtime could be 2.6.32 on x86_64.
> > 
> > So, we could very well end up building a Buildroot system that runs on a
> > kernel older than the headers of the toolchain.
> 
> While this is true, what can we do in practice ? We have no way to know
> what will be the version of the kernel running on the target when we're
> not building it, and still we have to provide this CMAKE_SYSTEM_VERSION
> value. I am not really sure what packages are doing with
> CMAKE_SYSTEM_VERSION. For example, azure-iot-sdk was simply testing
> whether it was empty or not.
> 
> So for the time being, it seems like using the kernel headers version
> is a good enough solution, even if not perfect.

Well, random lookups on the internet for CMAKE_SYSTEM_VERSION mostly
tuen up windows- or mac-related questions, so irrelevant to us. The
only seemingly-relevant ones are dealing with android.

There are various pieces of crap here and there that just set the thing
to 1., or some variants of 1, like 1.0 or 1.0.0.

Even the official cmake wiki [0] states:

    CMAKE_SYSTEM_VERSION : optional, version of your target system, not
    used very much.

    [...]

    * CMAKE_TOOLCHAIN_FILE : absolute or relative path to a cmake script
    which sets up all the toolchain related variables mentioned above

    For instance for crosscompiling from Linux to Embedded Linux on
    PowerPC this file could look like this:

        # this one is important
        SET(CMAKE_SYSTEM_NAME Linux)
        #this one not so much
        SET(CMAKE_SYSTEM_VERSION 1)
        [...]

So my opinion would be that we do exactly what is done in the wiki: set
it to 1 (and add a pointer to the wiki) and be done with it.

Then, if/when there are issues we can re-assess the situation.

[0] https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/CrossCompiling

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
