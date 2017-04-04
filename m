From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 11:46:16 +0200
Subject: [Buildroot] [PATCH] gst-ffmpeg: work-around bogus configure
 logic on SPARC
In-Reply-To: <1490223896-6063-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490223896-6063-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170404114616.4f763f91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 00:04:56 +0100, Thomas Petazzoni wrote:
> The libav version built into the gst-ffmpeg code produces a bogus
> binary on SPARC, which causes the following error of the
> check-bin-arch script:
> 
>   ERROR: architecture for ./usr/lib/gstreamer-0.10/libgstffmpeg.so is Sparc v8+, should be Sparc
>   ERROR: architecture for ./usr/lib/gstreamer-0.10/libgstpostproc.so is Sparc v8+, should be Sparc
>   ERROR: architecture for ./usr/lib/gstreamer-0.10/libgstffmpegscale.so is Sparc v8+, should be Sparc
> 
> The problem is the following bit of code in
> gst-lib/ext/libav/configure:
> 
> elif enabled sparc; then
> 
>     enabled vis && check_asm vis '"pdist %f0, %f0, %f0"' -mcpu=ultrasparc &&
>         add_cflags -mcpu=ultrasparc -mtune=ultrasparc
> 
> I.e, it checks if the architecture supports the pdist
> instruction... but forces -mcpu to ultrasparc while doing so. So it's
> like "let's see if this Ultrasparc instruction exists when I force the
> compiler to think I'm using Ultrasparc", which is non-sensical. This
> has been fixed later on in libav upstream:
> 
>   https://git.libav.org/?p=libav.git;a=commit;h=6aa93689abe8c095cec9fa828c2dee3131008995
> 
> However, this commit cannot be backported as-is since the shell
> function check_inline_asm did not exist in the old libav version
> bundled in gst-ffmpeg.
> 
> Therefore, we take the simpler route of disabling the VIS
> optimizations on SPARCv8 and Leon3.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e82d179c3d4f92ad7423693a4b1d42379a3f5411/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
