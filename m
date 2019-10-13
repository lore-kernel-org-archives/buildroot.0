From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Oct 2019 18:46:02 +0200
Subject: [Buildroot] [PATCH] board/wandboard/post-build.sh: create
 boot.scr at TARGET_DIR/boot
In-Reply-To: <20191012233041.29984-1-unixmania@gmail.com>
References: <20191012233041.29984-1-unixmania@gmail.com>
Message-ID: <3a5135c7-3a94-ba77-1bec-d43efdd8c37e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/10/2019 01:30, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> There is no reason to create boot.scr at board/wandboard and later
> install it at TARGET_DIR/boot, leaving a stale file behind.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  board/wandboard/post-build.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
> index 43e091c5d7..17aa9eefaf 100755
> --- a/board/wandboard/post-build.sh
> +++ b/board/wandboard/post-build.sh
> @@ -2,7 +2,9 @@
>  
>  BOARD_DIR="$(dirname $0)"
>  
> +install -d -m 755 $TARGET_DIR/boot
> +
>  $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
> --n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
> +-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
>  
> -install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
> +chmod 644 $TARGET_DIR/boot/boot.scr

 Is the chmod even needed? AFAIK mkimage doesn't create any special permissions,
so the umask should apply.

 Regards,
 Arnout
