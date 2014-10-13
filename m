From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Mon, 13 Oct 2014 19:10:13 +0200
Subject: [Buildroot] using BR2 variables to find a specific header file
Message-ID: <543C0775.3090701@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear all

I'm trying to integrate a cmake based package wich is not very
cross-compiling friendly (MariaDB galera cluster). During normal
compile this package runs some tests in order to determine if stacks
grows downward or upward. During cross-compile these tests cannot be
run therefore the package expects -DSTACK_DIRECTION=+/-1 to be passed
to cmake. Of course you cannot do it in buildroot.

It seems to be possible to access this information in another way
since STACK_GROWS_DOWNWARD is defined in some headers. In my case they
are:

output/build/host-gcc-final-4.8.3/gcc/config/arm/arm.h
(option a)

or

output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/plugin/include/config/arm/arm.h
(option b)

or

output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/plugin/include/tm.h
which in turns includes config/arm/arm.h  but seems more generic
(option c)

using these files I could automatically determine the correct value
for STACK_DIRECTION (either searching them for STACK_GROWS_DOWNWARD or
calling C preprocessor on an ad-hoc source file that would include them).

The question is: how to determine inside buildroot which file to use?

I was thinking of using a combination of the following variables to
determine the position of these headers. I'll list them with the value
they have in my case. Do you think it's a good idea? Do you think it's
portable?

BR2_ARCH="arm"
BR2_GCC_VERSION=4.8.3
BR2_GCC_TARGET_MODE=arm
BR2_TOOLCHAIN=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_TOOLCHAIN_BUILDROOT_VENDOR=buildroot
BR_TOOLCHAIN_USES_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_ARM_EABI=y

Using these variables it seems I can find the correct file but I'm not
sure it's the correct way to do things. What do you think? Do you have
suggestions?

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIbBAEBAgAGBQJUPAd1AAoJEEkkwl4JtJ9yPNUP+Pz/MHto4uVjnxLnA6eXT0aG
DA1RT5np6a3CGdtA3Yf3oVABmGTgLBwDvDDq1cyBqs6qs1y1oLV7rvbt3GpvCcOo
YcmsDNg+cdkIqQgJb/FLgFcZaiCmttlET6bFsg5ltM25W+dMCIVacDegtMxCpUrw
0RnUHOOBmvutdxfAI+QO+GKQtoukssmHehfywLmfzCEwaLpUjsLOSllqKXw5VqPM
EHIZhHl4j+cW2WbSB3ZBuO2vCFViK7tQuJ0pp15bidP4IyDutyw12wT/n2oofh76
EyRrUqPzuQfqNBI2Waslwg5ycgL2bzLAOQck5CA6khcI4HUucfCslA+V3xGNQDN4
oVUwo1Ji7ylE5PaTISWlhYZIsDAAjM8f/kQuhzueo3VDolFg89MQzfd2ifaWEuBh
HHuKMuSOuEI2aqvh74XVK5xeAoB0d27LgJq0Mw8q1ZcExF9IaH3c+ggnOWjXfLdw
TX9DaFabzaXG87P75WmTRua6JKeADkxcpqfn2sqiT2a8xzhtiehK0MtTCBeHg0AW
/Mic6UQtEC/GRgRkloHK1edtfioIHucMY+0sFlqvvbL2GpsS5eEio+hybMmBRUyI
VksZsRqlc0mH77ALMlv4ksGgLqYvVQP7RkPd9+XORoNaJgMMvdeK7n9QiEU8B5Yd
A40g/rR9voOF4Frsazs=
=ydRq
-----END PGP SIGNATURE-----
