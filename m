From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:39:43 +0200
Subject: [Buildroot] [PATCH v3 1/1] linux: Add support for FIT image
In-Reply-To: <1438023003-19533-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438023003-19533-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150727223943.5e01f94c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 27 Jul 2015 20:50:03 +0200, J?rg Krause wrote:
> The FIT (Flattened Image Tree) image format is a much more advanced and
> flexible format compared to regular uImage, let alone zImage.
> 
> The FIT image format allows for storing multiple kernel images, multiple
> device tree blobs and even multiple configurations for their combinations
> in a single image.
> 
> Furthermore, it enhances integrity protection of images with sha1, sha256
> and md5 checksums as well as signature verification against a public key.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

We already had some submissions to implement FIT image. And our
conclusion is that it is not easy to do something that is generic
enough to be useful.

Your case is that you just want a FIT image that combines the kernel
image and possibly one or several Device Tree.

But some people also want to add to their FIT image an initramfs image,
in which case the FIT image cannot be created as part of the linux.mk
Makefile, but should be created after the root filesystem images are
generated.

But some other people may want to have a FIT image with just kernel +
DTB, and have the FIT image *inside* the root filesystem in /boot. In
this case, it should be created *before* the root filesystem image is
generated.

Those different use cases for FIT images are a bit unsolvable. And in
fact, creating a FIT image is just about doing *one* call to mkimage,
so it's pretty trivial to do in a post-build or post-image script.

So, for now, our position has been to reject FIT image support.

Of course, if you have some ideas to handle the above use cases in a
sane way, we can reconsider.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
