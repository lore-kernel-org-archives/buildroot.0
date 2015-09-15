From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 16 Sep 2015 00:52:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: disable use of stack
 protector when not available
In-Reply-To: <CA+BsyQ4UcfDLxGK5+_AbdVcngzUM_fn=ab6fxHOLFp3pepDi7Q@mail.gmail.com>
References: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
 <20150915233014.27cc4a34@free-electrons.com>
 <CA+BsyQ7-YdWiOQ9E0X_+vppuB0hNdVPNV7kai9UW+1Kz5G8s3w@mail.gmail.com>
 <20150915234417.4658d78e@free-electrons.com>
 <CA+BsyQ4UcfDLxGK5+_AbdVcngzUM_fn=ab6fxHOLFp3pepDi7Q@mail.gmail.com>
Message-ID: <CA+BsyQ66bdvxv1b11NNFAbenC4snpdoB2BajsM5COQB5uCQ75A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Yes you were right, there's something fishy going on with internal
toolchains and it's probably not arch-specific.

I checked it out in the x86 case and tried to set up a buildroot
toolchain closely matching the non-buildroot toolchain.

This defconfig fails (ie doesn't correctly detect stack protection):

BR2_x86_pentium4=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_SUDO=y

This defconfig works :

BR2_x86_pentium4=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.08-rc1-38-gad0f85e.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_SUDO=y

I'll try to find out what's going on tomorrow.

regards

Brendan

On 15 September 2015 at 22:54, Brendan Heading <brendanheading@gmail.com> wrote:
>> I have nothing against your patch in principle, it can only be good to
>> explicitly disable stack protector usage when the necessary support is
>> not there. I'm just curious to understand why the detection does work
>> in certain cases and not in others.
>
> Understood Thomas. I'll have a closer look and see what's going on.
>
> Brendan
