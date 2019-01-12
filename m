From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 16:06:29 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-cmake: add CMAKE_SYSTEM_VERSION to
 toolchainfile.cmake
In-Reply-To: <20190111211626.GD2428@scaer>
References: <20190110230529.29852-1-arnout@mind.be>
 <20190111211626.GD2428@scaer>
Message-ID: <20190112160629.5a85748b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 22:16:26 +0100, Yann E. MORIN wrote:

> > the
> > value of BR2_TOOLCHAIN_HEADERS_AT_LEAST contains the (minimum) version
> > of the kernel it will run on,  
> 
> That is not true.
> 
> glibc for example will by default carry fallback mechanisms to emulate
> some features when it is running on a kernel older than the headers it
> was compiled against. In Buildroot we explictly disable that feature by
> passing --enable-kernel=$(BR2_TOOLCHAIN_HEADERS_AT_LEAST).
> 
> But for external toolchains, we don't know (and can't know) iw they did
> pass that option or not, and if they did, what version they requested,
> and if they did not, what version glibc uses.
> 
> This backward compatibility of glibc can extend quite a bit in the past,
> so kernels we would consider pretty old might still be usable with such
> toolchains. For example, on glibc-2.24, the minimum required headers
> were 3.2, but the runtime could be 2.6.32 on x86_64.
> 
> So, we could very well end up building a Buildroot system that runs on a
> kernel older than the headers of the toolchain.

While this is true, what can we do in practice ? We have no way to know
what will be the version of the kernel running on the target when we're
not building it, and still we have to provide this CMAKE_SYSTEM_VERSION
value. I am not really sure what packages are doing with
CMAKE_SYSTEM_VERSION. For example, azure-iot-sdk was simply testing
whether it was empty or not.

So for the time being, it seems like using the kernel headers version
is a good enough solution, even if not perfect.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
