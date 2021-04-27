From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 27 Apr 2021 15:43:56 +0200
Subject: [Buildroot] [PATCH] package/freescale-imx/imx-gpu-viv: force
 wayland backend for all i.MX8
In-Reply-To: <YIgQr8MhzXxMwg7Q@p1g2>
References: <20210427120438.1192346-1-gary.bisson@boundarydevices.com>
 <0fb11be5-801a-0125-1146-71746246038e@armadeus.com>
 <YIgQr8MhzXxMwg7Q@p1g2>
Message-ID: <YIgVHLf3zGP0Bgge@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 27, 2021 at 03:25:03PM +0200, Gary Bisson wrote:
> Hi,
> 
> On Tue, Apr 27, 2021 at 03:04:46PM +0200, S?bastien Szymanski wrote:
> > Hello Gary,
> > 
> > On 4/27/21 2:04 PM, Gary Bisson wrote:
> > > - As Vivante blobs only support Wayland for all i.MX 8
> > 
> > Are you sure about that ? The examples (vv_launcher, tiger and
> > cover_flow) are working fine on my i.MX8MM platform with the Framebuffer
> > output.
> 
> Well the thing is the package doesn't include a framebuffer backend, so
> you really use the libraries meant for Wayland.
> 
> > The libraries need libdrm, though. I will send a patch to fix the
> > missing dependency here.
> 
> Yes, the Wayland libraries can be used with with libgbm without a
> Wayland compositor (what Qt does), but the libraries are still for
> "Wayland" backend.
> 
> Please review the ARM32 package and compare with ARM64, you'll see the
> difference.

Actually I stand corrected, it was the case in the previous aarch64
packages but indeed at least the latest version seem to have new
backends:
$ readelf -d fb/libEGL.so| grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libGAL.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [ld-linux-aarch64.so.1]
$ readelf -d wayland/libEGL.so| grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libGAL.so]
 0x0000000000000001 (NEEDED)             Shared library: [libwayland-server.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libwayland-client.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libgbm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libgbm_viv.so]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [ld-linux-aarch64.so.1]
$ readelf -d x11/libEGL.so| grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libGAL.so]
 0x0000000000000001 (NEEDED)             Shared library: [libX11.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libXext.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [ld-linux-aarch64.so.1]

So let's discard this patch for now. NXP still only advertise Wayland
support. Also, the Qt use of Wayland libs via libgbm still applies, but
maybe we could restore other backends.

Thanks for your feedback.

Regards,
Gary
