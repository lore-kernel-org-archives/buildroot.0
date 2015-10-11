From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Oct 2015 22:07:52 +0200
Subject: [Buildroot] Issues with the toolchain wrapper applied to the
 internal toolchain
In-Reply-To: <20151011120859.7e786a73@free-electrons.com>
References: <20151011120859.7e786a73@free-electrons.com>
Message-ID: <561AC198.9070206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-10-15 12:08, Thomas Petazzoni wrote:
> Hello,
> 
> Since the toolchain wrapper support for the internal toolchain has been
> merged, using pre-built Buildroot toolchains as external toolchains no
> longer work since the path logic in the wrapper doesn't cope with a
> toolchain installed in host/opt/ext-toolchain/. 


 Hm, I tested the existing buildroot toolchains, but I didn't think of testing
the new internal toolchain as an external toolchain...


> When executing the
> cross-compiler:
> 
> thomas at skate:~/projets/buildroot3 (master)$ ./output/host/opt/ext-toolchain/bin/arm-linux-gcc 
> /home/thomas/projets/buildroot3/output/host/opt/usr/bin/arm-linux-gcc.real: No such file or directory
> 
> As you can see, it looks for the "real" compiler in the wrong location.
> I believe it should instead re-use some of the logic of
> BR_CROSS_PATH_REL.

 Actually I don't see how this could happen, but I'm too tired now to study it
in detail.

> 
> You can reproduce this issue by using the following defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.08-532-ga237b40.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> 
> Also, another concern I have is what going to happen with the double
> wrapper? A Buildroot toolchain has a wrapper, and then when it's
> re-used as an external toolchain, another wrapper is created. Will this
> work OK, especially in terms of ccache behavior?

 Good point. Also if we add something like that galileo-specific option to the
toolchain wrapper, we probably don't want it (or repeat it) when used as an
external toolchain.

 One solution for both issues would be to deal with buildroot-built toolchains
explicitly in the toolchain wrapper, i.e. detect the existence of .real and exec
that one directly. Would that be an acceptable solution?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
