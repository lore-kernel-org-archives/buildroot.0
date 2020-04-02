From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 2 Apr 2020 13:48:15 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add openssh runtime
 test
In-Reply-To: <20200331233206.632dcfce@windsurf.home>
References: <20200330162411.9678-1-romain.naour@smile.fr>
 <20200331233206.632dcfce@windsurf.home>
Message-ID: <cd51a10f-21ea-7395-91ec-093ae03f41d4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 31/03/2020 ? 23:32, Thomas Petazzoni a ?crit?:
> On Mon, 30 Mar 2020 18:24:10 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> +class TestOpenSshGlibc(TestOpensshBase):
>> +    config = \
>> +        TestOpensshBase.opensshconfig + \
>> +        """
>> +        BR2_x86_64=y
>> +        BR2_x86_core2=y
> 
> Why use an x86-64 system? It forces you to build your own kernel? For
> this glibc configuration, you could build your own toolchain, but
> probably stick to using a prebuilt kernel.

I reused the configuration for Docker, that's why I used x86_64.

But the testsuite basically test only with uClibc-ng with an old toolchain by
default. It would be interesting to allow to select a custom toolchain.

Also, I noticed that the build continue even if the defconfig provided contain
an option that is dropped by make olddefconfig.

For example, mesa3d:
https://git.buildroot.net/buildroot/commit/?id=faec5c583ec59e968fdb547aea93ab6ed001eb45

The symbol BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST was missing since only one
swrast driver can be enabled.

The test should stop is one of the provided symbol is missing (like
autobuild-run do).

> 
>> +        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> 
> What about using the ARM ARM toolchain, and boot using the pre-built
> vexpress kernel ? This will significantly speed-up the build of the
> system for this runtime test.

Because I made this test to trigger the openssh issue with glibc 2.31 (local
patch applied to do the version bump).

That's why It's important for the testsuite to allow testing with several
toolchain (I believe).

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
