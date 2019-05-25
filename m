From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 May 2019 17:54:03 +0200
Subject: [Buildroot] Cannot cross-compile libopenssl on CentOS7
In-Reply-To: <3cd11507-8aa5-4fbe-c07a-54d4aacb8e74@ice.rwth-aachen.de>
References: <3cd11507-8aa5-4fbe-c07a-54d4aacb8e74@ice.rwth-aachen.de>
Message-ID: <fb7027e2-8897-2cee-65e0-4b8929779a6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/05/2019 20:19, Lukas J?nger wrote:
> Hi,
> 
> I tried building a rootfs with buildroot on CentOS 7 and I require libopenssl. I
> configured buildroot as seen in the attached .config.

 In the future, please post a defconfig instead of a full config. In this case:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_TOOLS=y


 Note that this is a configuration that gets tested by the autobuilders, and
unless I'm mistaken, Matt has a RHEL7 autobuilder (CentOS7 should be the same).
Thomas, do you know if we have other RHEL/CentOS 7 autobuilders?

 Anyway, there never was a build error with libopenssl on a RHEL7 machine...

> Sadly, the build fails with this error:
> 
> install libcrypto.a ->
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a
> 
> install libssl.a ->
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.a
> 
> link
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> ->
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so.1.1
> 
> install libcrypto.so ->
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> 
> install libcrypto.so.1.1 ->
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> 
> /scratch/juenger/tmp/buildroot/output/host/bin/aarch64-linux-gnu-ar:
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so:
> File format not recognized
> /scratch/juenger/tmp/buildroot/output/host/bin/aarch64-linux-gnu-ar:
> /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so.new:
> File format not recognized
> 
> It seems to be related to this issue:
> https://github.com/openssl/openssl/issues/6641

 Indeed looks similar. Can you execute the steps reported in that bug to verify
if it really is the same?

 My perl-fu is not enough to understand what commit 356d634 does exactly, but
AFAIU it should error out if the version is not high enough, no?


> I already tried upgrading the perl package with CPAN, but buildroot still fails.
> I also tried upgrading the package with SCL, but that did not help either. It
> might be because buildroot does not allow me to have PERL_MM_OPT defined, but

 What is PERL_MM_OPT supposed to do?

 Regards,
 Arnout

> I'm not sure. OpenSSL by itself without buildroot builds fine on the same system.
> 
> Do you have an idea on how to fix this?
> 
> Thanks,
> Lukas
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
