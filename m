From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 19:53:45 +0100
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
In-Reply-To: <20190204165557.2160-1-peter@korsgaard.com>
References: <20190204165557.2160-1-peter@korsgaard.com>
Message-ID: <20190204195345.6494760a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 17:55:57 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Build for x86-64 as public containers in general are only available for
> x86-64.  Docker needs a number of kernel options enabled, so use a custom
> kernel config based on the qemu one.

Do you need to duplicate the kernel config entirely, or can you use
board/qemu/x86_64/linux.config + a fragment ?

> Docker needs entropy at startup, so enable the virtio-rng-pci device to
> expose entropy to the guest.  The default RAM amount (128M) is not enough to
> run docker / docker-compose, so bump to 512MB.

Wow. Go is efficient :)

> diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
> new file mode 100644
> index 0000000000..49ff2677da
> --- /dev/null
> +++ b/support/testing/conf/docker-compose.yml
> @@ -0,0 +1,4 @@
> +version: '3'
> +services:
> +  busybox:
> +    image: "busybox:latest"

Is conf/ really the right place for this ? Don't we have some other
place to store the per-tests artifacts that go on the target ? I don't
think we have a good organization for this at the moment, so this will
do for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
