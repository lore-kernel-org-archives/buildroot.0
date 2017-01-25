From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 25 Jan 2017 21:20:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 10.0
References: <20170122141637.18048-1-bernd.kuhls@t-online.de>
 <20170124182624.1313b78b@free-electrons.com>
Message-ID: <XnsA708D90E23565ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20170124182624.1313b78b at free-electrons.com:

> Hello,
> 
> On Sun, 22 Jan 2017 15:16:37 +0100, Bernd Kuhls wrote:
> 
>> Dependency to json-c was dropped, updated reverse dependencies as well.
>> Added optional dependency to libatomic_ops.
> 
> If libatomic_ops is an optional dependency, why are you selecting it
> from the Config.in file?

Most likely because I do not fully understand the handling of atomic 
operations in buildroot ;)

Pulseaudio has optional support for libatomic_ops, first it checks whether 
the toolchain itself supports __sync_bool_compare_and_swap

https://cgit.freedesktop.org/pulseaudio/pulseaudio/tree/configure.ac#n253

to prefer this toolchain support if available:
https://cgit.freedesktop.org/pulseaudio/pulseaudio/tree/configure.ac#n263

Otherwise it needs libatomic_ops
https://cgit.freedesktop.org/pulseaudio/pulseaudio/tree/configure.ac#n251

I tried to code this configure logic by Pulseaudio into the buildroot 
package...

> Which is exactly why I'm asking above why you are selecting
> libatomic_ops if it's really an optional dependency.

On platforms lacking BR2_TOOLCHAIN_HAS_SYNC_4 libatomic_ops is therefore a 
hard dependency, all others do not need libatomic_ops because Pulseaudio 
will use the toolchain code.

Please note that you wrote a similar

    	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_TOOLCHAIN_HAS_SYNC_4

for libdrm: https://git.buildroot.net/buildroot/commit/package/libdrm?
id=e4d55d33737485d8055c2fe3453e29fee51a05d7

Regards, Bernd
