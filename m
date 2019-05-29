From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 29 May 2019 10:58:09 -0500
Subject: [Buildroot] [External] Re: Cannot cross-compile libopenssl on
 CentOS7
In-Reply-To: <fb7027e2-8897-2cee-65e0-4b8929779a6c@mind.be>
References: <3cd11507-8aa5-4fbe-c07a-54d4aacb8e74@ice.rwth-aachen.de>
 <fb7027e2-8897-2cee-65e0-4b8929779a6c@mind.be>
Message-ID: <CANQCQpZ5NMp5K1UR+o_OGB6anXZ+t_Erf52qo2QgBJo0Mxtu7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sat, May 25, 2019 at 10:54 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 21/05/2019 20:19, Lukas J?nger wrote:
> > Hi,
> >
> > I tried building a rootfs with buildroot on CentOS 7 and I require libopenssl. I
> > configured buildroot as seen in the attached .config.
>
>  In the future, please post a defconfig instead of a full config. In this case:
>
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_TOOLS=y
>
>
>  Note that this is a configuration that gets tested by the autobuilders, and
> unless I'm mistaken, Matt has a RHEL7 autobuilder (CentOS7 should be the same).

Correct, I've got a RHEL7.4 builder running.  I've also just tested
the above defconfig without any problems.

> Thomas, do you know if we have other RHEL/CentOS 7 autobuilders?
>
>  Anyway, there never was a build error with libopenssl on a RHEL7 machine...
>
> > Sadly, the build fails with this error:
> >
> > install libcrypto.a ->
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a
> >
> > install libssl.a ->
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.a
> >
> > link
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> > ->
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so.1.1
> >
> > install libcrypto.so ->
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> >
> > install libcrypto.so.1.1 ->
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> >
> > /scratch/juenger/tmp/buildroot/output/host/bin/aarch64-linux-gnu-ar:
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so:
> > File format not recognized
> > /scratch/juenger/tmp/buildroot/output/host/bin/aarch64-linux-gnu-ar:
> > /scratch/juenger/tmp/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so.new:
> > File format not recognized
> >
> > It seems to be related to this issue:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openssl_openssl_issues_6641&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=5H6BWknkyVnfm0N08GNowwODLs39QqUq7cGT-Ju0_sc&s=RMnPDCEVBOu94Zyi4fmm3y7thjFeTY67GFVhIi21Za8&e=
>
>  Indeed looks similar. Can you execute the steps reported in that bug to verify
> if it really is the same?
>
>  My perl-fu is not enough to understand what commit 356d634 does exactly, but
> AFAIU it should error out if the version is not high enough, no?
>
>
> > I already tried upgrading the perl package with CPAN, but buildroot still fails.
> > I also tried upgrading the package with SCL, but that did not help either. It
> > might be because buildroot does not allow me to have PERL_MM_OPT defined, but
>
>  What is PERL_MM_OPT supposed to do?
>
>  Regards,
>  Arnout
>
> > I'm not sure. OpenSSL by itself without buildroot builds fine on the same system.
> >
> > Do you have an idea on how to fix this?
> >
> > Thanks,
> > Lukas
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.net_mailman_listinfo_buildroot&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=5H6BWknkyVnfm0N08GNowwODLs39QqUq7cGT-Ju0_sc&s=8nhFGgQtE3nTqMbUS_nwvHR-ulO8oQSxOejiBk6fFJA&e=
> >
