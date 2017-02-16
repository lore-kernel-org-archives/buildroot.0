From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 22:19:07 +0100
Subject: [Buildroot] [PATCH 1/2] wavpack: needs wchar support
In-Reply-To: <20170216204116.2212-1-joerg.krause@embedded.rocks>
References: <20170216204116.2212-1-joerg.krause@embedded.rocks>
Message-ID: <20170216221907.57ac4b8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Feb 2017 21:41:15 +0100, J?rg Krause wrote:
> Building wavpack using a toolchain without wchar support fails:
> 
> ```
> import_id3.c:37:34: error: unknown type name 'wchar_t'
> ```
> 
> Fixes:
> http://autobuild.buildroot.net/results/9a6/9a693f5b798571917f36cfb7661e2f2638aac550/
> http://autobuild.buildroot.net/results/44c/44c8227043045baf4f043da44b8129e43dfff687/
> http://autobuild.buildroot.net/results/a80/a80221dcc0860046ebdf0bbf454e056b1e20df83/
> .. and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

This dependency is only needed for one specific tool in wavpack added
by the recent bump to 5.1.0. So I've reported this issue upstream:

  https://github.com/dbry/WavPack/issues/19

But OK, I agree we don't really care if wavpack needs wchar support, so
we certainly don't need to wait for the answer to this upstream bug
report.

> diff --git a/package/wavpack/Config.in b/package/wavpack/Config.in
> index 1ef3e420d..5a27b2e15 100644
> --- a/package/wavpack/Config.in
> +++ b/package/wavpack/Config.in
> @@ -1,8 +1,12 @@
>  config BR2_PACKAGE_WAVPACK
>  	bool "wavpack"
> +	depends on BR2_USE_WCHAR

None of the places that select wavpack need to be fixed for the wchar
dependency?

package/gstreamer/gst-plugins-good/Config.in:   select BR2_PACKAGE_WAVPACK
package/gstreamer1/gst1-plugins-good/Config.in: select BR2_PACKAGE_WAVPACK
package/mpd/Config.in:  select BR2_PACKAGE_WAVPACK

From a quick look, it seems to be OK, but it would have been to
indicate it in the commit log (and maybe update the comments in those
packages to explain why we have the wchar dependency).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
