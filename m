From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Apr 2017 18:02:15 +0200
Subject: [Buildroot] [PATCH 1/1] mke2img: Sanity check block size and
 fail if zero or missing.
In-Reply-To: <1493477884-121871-1-git-send-email-g4@novadsp.com>
References: <1493477884-121871-1-git-send-email-g4@novadsp.com>
Message-ID: <20170429160215.GA19584@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J, All,

On 2017-04-29 15:58 +0100, J Evans spake thusly:
> Signed-off-by: J Evans <g4@novadsp.com>
> ---
>  package/mke2img/mke2img | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
> index b773aa9..0a3ed6c 100755
> --- a/package/mke2img/mke2img
> +++ b/package/mke2img/mke2img
> @@ -39,10 +39,16 @@ main() {
>  
>      # Sanity checks
>      if [ -z "${root_dir}" ]; then
> -        error "you must specify a root directory with '-d'\n"
> +        error "Error: you must specify a root directory with '-d'\n"
>      fi
>      if [ -z "${image}" ]; then
> -        error "you must specify an output image file with '-o'\n"
> +        error "Error: you must specify an output image file with '-o'\n"

Is that really necessary?

> +    fi
> +    if [ -z "${nb_blocks}" ]; then
> +        error "Error: you must specify a file system block count with '-b'. This cannot be zero, e.g. 61440 == 60MB\n"
> +    fi
> +    if [ "${nb_blocks}" -eq 0]; then

There is an obvious error here: there is a missing space between '0' and
the closing bracket ']'.

However, I wonder why we should check for a zero size. The filesystem
will be non-creatable (is that a word?) because the requested size is
too low, similar to what a user would get by settign the nb_blocks to
(e.g.) 1024 (i.e. 1MiB) but have a target/ that is 2MiB: that won't fit.

So, I would just keep the check to being set, whatever the value (but I
would not oppose the check against 0 either.)

Regards,
Yann E. MORIN.

> +        error "Error: The file system block count size cannot be zero. e.g. 61440 == 60MB \n"
>      fi
>      case "${gen}:${rev}" in
>      2:0|2:1|3:1|4:1)
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
