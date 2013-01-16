From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jan 2013 21:03:43 +0100
Subject: [Buildroot] [PATCH 1/5] Add a post-image script mechanism
In-Reply-To: <1358363393-29977-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201301162103.43793.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 16 January 2013 Thomas Petazzoni wrote:
> Just like we have a post-build script mechanism that gets executed
> after the build of all packages but before the creation of the
> filesystem images, let's introduce a post-image script mechanism, that
> gets executed once all filesystem images have been generated.
[--SNIP--]
> diff --git a/Makefile b/Makefile
> index 6f8ed0e..88b5a85 100644
> --- a/Makefile
> +++ b/Makefile
[--SNIP--]
> @@ -548,6 +550,13 @@ target-generatelocales: host-localedef
>  	done
>  endif
>  
> +target-post-image:
> +ifneq ($(BR2_ROOTFS_POST_IMAGE_SCRIPT),)
> +	@$(call MESSAGE,"Executing post-image script\(s\)")
> +	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
> +		$(s) $(BINARIES_DIR)$(sep))

No need to pass $(BINARIES_DIR) as it now is in the environment.

Would it make sense to run this under fakeroot?

Also, I wonder if we could instead call these scripts for each image we
generate, so it will already be run under fakeroot.

Not sure how to pass the image type to the script, though.
Maybe, something like:
  post-image.sh <image-file> <image-type> <compression>

with image-type ? {tar,ext2,squashfs...}
and  compression ? {none,gz,bz2,lzma,xz...}

And the script would typically contain:

  #!/bin/sh
  img_type="${1}"
  img_file="${2}"
  img_comp="${3}"
  case "${img_type}" in
    tar)
      handle_tar "${img_file}" "#{img_comp}"
      ;;
    squashfs)
      handle_squash "${img_file}"
      ;;
    *)
      # Ignore other types
     ;;
  esac

At least, I find it more interesting.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
