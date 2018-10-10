From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Oct 2018 22:36:49 +0200
Subject: [Buildroot] [PATCH] manual: give QEMU quick demo on quick start
In-Reply-To: <20181010074228.26541-1-ciro.santilli@gmail.com>
References: <20181010074228.26541-1-ciro.santilli@gmail.com>
Message-ID: <19fd5963-bda2-0321-6ea3-2eee0ea708f0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ciro,

 Nice addition...

On 10/10/18 09:42, Ciro Santilli wrote:
> ---
>  docs/manual/quickstart.txt | 36 +++++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
> index 74158ae249..00afe09e6b 100644
> --- a/docs/manual/quickstart.txt
> +++ b/docs/manual/quickstart.txt
> @@ -8,12 +8,38 @@ is no need to be root to configure and use Buildroot. By running all
>  commands as a regular user, you protect your system against packages
>  behaving badly during compilation and installation.
>  
> -The first step when using Buildroot is to create a configuration.
> -Buildroot has a nice configuration tool similar to the one you can
> -find in the http://www.kernel.org/[Linux kernel] or in
> -http://www.busybox.net/[BusyBox].
> +=== Try it out with QEMU
>  
> -From the buildroot directory, run
> +If you just want to emulate a simple generic QEMU system to see
> +Buildroot at work immediately, run from the buildroot directory:

 I see where you're going with this, but still I think this section might fit
better at the end of this file instead of at the beginning. Yes, the idea is to
see something running immediately, but on the other hand, just running the
defconfig under qemu doesn't bring that much joy either...

> +
> +--------------------
> +make qemu_x86_64_defconfig
> +make BR2_JLEVEL="$(nproc)"

 The BR2_JLEVEL defaults to nproc + 1, I don't see a reason to use one less here...

> +qemu-system-x86_64 \
> +  -M pc \
> +  -kernel output/images/bzImage \
> +  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
> +  -append "root=/dev/vda" \
> +  -net nic,model=virtio \
> +  -net user
> +--------------------
> +
> +Once QEMU boots, login with +root+, and you are now left inside a minimal
> +BusyBox based Linux distribution.
> +
> +The initial build can take several minutes to a few hours since we download

 Several minutes? What kind of beast of a machine do you have that can build
even just the toolchain in a couple of minutes?

 A few hours is also exaggerated...

 But OK, the message is clear...

> +and compile GCC, the Linux kernel and other basic system components from
> +source.
> +
> +The QEMU command to use is also documented at: +board/qemu/x86/readme.txt+

 This last sentence could be extended a bit to refer to all architectures.

QEMU configurations exist and are tested for various architectures. The QEMU
command to use is documentated in the +readme.txt+ file in the architecture's
subdirectory in +board/qemu+.


 All in all, just nitpicking, so if you respin you can add my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +
> +=== Day-to-day workflow
> +
> +In your day-to-day workflow, the first step when using Buildroot is to
> +create a custom configuration. Buildroot has a nice configuration tool
> +similar to the one you can find in the http://www.kernel.org/[Linux kernel]
> +or in http://www.busybox.net/[BusyBox]:
>  
>  --------------------
>   $ make menuconfig
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
