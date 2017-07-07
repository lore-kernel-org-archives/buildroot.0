From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Fri, 7 Jul 2017 12:12:40 +0100
Subject: [Buildroot] [PATCH] toolchain-wrapper: fix breakage after
 host/usr removal
In-Reply-To: <20170707074330.27294-1-arnout@mind.be>
References: <20170707092406.722b80f4@windsurf.lan>
 <20170707074330.27294-1-arnout@mind.be>
Message-ID: <3c521cd2-7079-9aef-cd85-df9e14581d65@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/17 08:43, Arnout Vandecappelle (Essensium/Mind) wrote:
> The toolchain wrapper, when called through PATH, strips the last three
> levels of /proc/self/exe to find HOST_DIR. However, after the host/usr
> removal, this should be just two levels.
> 
> The toolchain wrapper has different logic for when it is called with a
> full path (i.e. $HOST_DIR/usr/bin/arm-linux-gcc) then when it is called
> through the PATH (i.e. just arm-linux-gcc). The latter is never used
> internally in Buildroot, that's why this wasn't discovered through
> testing.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Mark Jackson <mpfj-list@newflow.co.uk>

Tested-by: Mark Jackson <mpfj-list@newflow.co.uk>

Works fine now.  Cheers.

> ---
> Sorry for the breakage :-)
> 
> Note to self: add a test for calling the toolchain through PATH.
> 
> To fix an existing toolchain without rebuilding:
> make host-gcc-final-rebuild
> (or make host-toolchain-external-custom-rebuild if that's what you're
> using).
> ---
>   toolchain/toolchain-wrapper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 3a4455ff82..a73e6d6f94 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -192,7 +192,7 @@ int main(int argc, char **argv)
>   		for (i = ret; i > 0; i--) {
>   			if (absbasedir[i] == '/') {
>   				absbasedir[i] = '\0';
> -				if (++count == 3)
> +				if (++count == 2)
>   					break;
>   			}
>   		}
>
