From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2020 12:23:13 +0100
Subject: [Buildroot] [PATCH] package/go: enable ARMv7 optimizations for
 ARMv8 target
In-Reply-To: <X3HdjcFKH15Mqu_8q7IQiKQqLChMVl-uUSRXfHc1VvjSCI24ZVvsEOGrvR913T_RgeGoFMNBUla3_y_4H6syUMNdPpubATsMeeRqP4fHSkY=@baudi.no>
References: <X3HdjcFKH15Mqu_8q7IQiKQqLChMVl-uUSRXfHc1VvjSCI24ZVvsEOGrvR913T_RgeGoFMNBUla3_y_4H6syUMNdPpubATsMeeRqP4fHSkY=@baudi.no>
Message-ID: <20201219112313.GH3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-12-18 10:00 +0000, Michael Baudino spake thusly:
> Go doesn't support ARMv8 optimizations yet (see this GitHub
> issue: https://github.com/golang/go/issues/29373) but can still
> benefit from ARMv7 optimizations.
> 
> A comment is left in `go.mk` to mention this and avoid any
> confusion when reading "ifeq ARMv8 ? GOARM = 7".
> 
> Signed-off-by: Michael Baudino <michael@baudi.no>

Applied to master, with a few tweaks:

  - move the comment to its own line, expand and reword it a bit
  - reword the commit log

Also, see below...

> ---
>  package/go/go.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git package/go/go.mk package/go/go.mk
> index d9f4905..55964cb 100644
> --- package/go/go.mk
> +++ package/go/go.mk
> @@ -39,6 +39,8 @@ else ifeq ($(BR2_ARM_CPU_ARMV6),y)
>  GO_GOARM = 6
>  else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
>  GO_GOARM = 7
> +else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +GO_GOARM = 7 # Go doesn't support GOARM=8 yet (see https://github.com/golang/go/issues/29373)

Adding a comment at the end of a variable assignment can cause quite
some surprising behaviours:

    $ cat Makefile
    FOO = 1 # Bleah...
    $(info "$(FOO)")
    all:
        @printf '"%s"\n' "$(FOO)"

    $ make
    "1 "
    "1 "

So I moved the comment to its own line...

Regards,
Yann E. MORIN.

>  endif
>  else ifeq ($(BR2_aarch64),y)
>  GO_GOARCH = arm64
> --
> 2.7.4
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
