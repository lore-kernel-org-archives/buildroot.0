From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Oct 2013 07:10:20 +0200
Subject: [Buildroot] Reproducing Autobuild errors
In-Reply-To: <CA+XvPyxPpKp5-hOZ-aObsVvn6XD6nJhsdBQXkAXweNw4Ftu7Tg@mail.gmail.com>
References: <CA+XvPyxsJ==djC78T2VeP=eFPHSLLfoXxbNerAYSj2i0SPaaKg@mail.gmail.com>
 <CAAXf6LX=3wjYrQvYuCNX4m7hkkR2-bQPO-bThMLRGDyRE8gJ9g@mail.gmail.com>
 <CA+XvPyyZkmrbXLW_nAn+0zw9g+oNfPg8ewoqGvf=HZ-uxX2Z2Q@mail.gmail.com>
 <d7ea8853-2bca-4781-9bd7-055cbbd87696@email.android.com>
 <CA+XvPyxPpKp5-hOZ-aObsVvn6XD6nJhsdBQXkAXweNw4Ftu7Tg@mail.gmail.com>
Message-ID: <372d7693-822b-49aa-ad3e-507656b5f235@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anirudha Bose <ani07nov@gmail.com> wrote:
>On Mon, Oct 21, 2013 at 11:03 PM, Thomas De Schampheleire <
>patrickdepinguin at gmail.com> wrote:
>
>
>You are right. The toolchain was built on a 64-bit machine and my OS was
>32-bit. Anyway, I was able to use the toolchain by switching to a 64-bit OS.
>When I executed this
>    ./br-powerpc-603e-basic-cpp-2013.05-1/bin/powerpc-linux-gcc -dumpmachine
>I got the following output which shows that the toolchain is now usable:
>    powerpc-buildroot-linux-uclibc
>
>I run make and was presented with errors instructing me to disable the
>BR2_LARGEFILE, BR2_INET_IPV6, BR2_USE_WCHAR, and
>BR2_TOOLCHAIN_HAS_NATIVE_RPC since these features "do not work with the C
>compiler" (why?).

Buildroot compares what you configured there with the actual capabilities of the toolchain, and detects any inconsistencies.
The fact that you are getting these errors starting from a working defconfig means that the toolchain you're using is not the one that was used in the autobuild.
Looking at the .config file you need a toolchain with wchar, ipv6, largefile, rpc, threads but without c++, while the basic toolchain you're currently using does not have wchar etc. and does have c++.

It's unclear to me which is the toolchain used for this particular autobuild, I can't find it either.
Peter, can you clarify?

Anirudha, in the mean time you could try building your own toolchain according to the options mentioned and based on uclibc, or look at another autobuild problem. Hopefully you have less problems there.

Best regards,
Thomas
