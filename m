From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 22:41:59 +0100
Subject: [Buildroot] [PATCH 1/5] Add a post-image script mechanism
In-Reply-To: <201301162103.43793.yann.morin.1998@free.fr>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <201301162103.43793.yann.morin.1998@free.fr>
Message-ID: <20130116224159.774f3f70@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 16 Jan 2013 21:03:43 +0100, Yann E. MORIN wrote:

> No need to pass $(BINARIES_DIR) as it now is in the environment.

I'd prefer to pass $(BINARIES_DIR) as argument, in order to keep a
symmetry with what we do for the post-build script.

> Would it make sense to run this under fakeroot?

Why?

> Also, I wonder if we could instead call these scripts for each image
> we generate, so it will already be run under fakeroot.

No, I don't think it's a good idea. For example, in my use-case, it was
used to create a firmware image that bundles multiple images generated
by Buildroot. So getting called on a per-image basis doesn't make sense.

> Not sure how to pass the image type to the script, though.
> Maybe, something like:
>   post-image.sh <image-file> <image-type> <compression>
> 
> with image-type ? {tar,ext2,squashfs...}
> and  compression ? {none,gz,bz2,lzma,xz...}
> 
> And the script would typically contain:
> 
>   #!/bin/sh
>   img_type="${1}"
>   img_file="${2}"
>   img_comp="${3}"
>   case "${img_type}" in
>     tar)
>       handle_tar "${img_file}" "#{img_comp}"
>       ;;
>     squashfs)
>       handle_squash "${img_file}"
>       ;;
>     *)
>       # Ignore other types
>      ;;
>   esac
> 
> At least, I find it more interesting.

Unfortunately, not me. Calling a script once all images are generated
is *simple*, the script is free to do whatever it wants. Iterate over
all images, iterate over certain images only, etc. There is really no
need to over-engineer this thing.

I really don't see the point of putting more complexity into this.
Let's have something nicely symmetric between the post-build script
feature and the post-image script feature.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
