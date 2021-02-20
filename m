From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 22:49:45 +0100
Subject: [Buildroot] [PATCH] support/scripts/boot-qemu-image.py: pexpect
 must throw an exception when a timeout occurs
In-Reply-To: <20210220165604.11929-1-romain.naour@gmail.com>
References: <20210220165604.11929-1-romain.naour@gmail.com>
Message-ID: <20210220214945.GS2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

romain, All,

On 2021-02-20 17:56 +0100, Romain Naour spake thusly:
> As reported on IRC by sephthir, the gitlab test of the defconfig
> qemu_sparc_ss10_defconfig doesn't error out while the system
> is not working properly.
> 
> This is due to pexpect doesn't throw an exception when a
> timout occurs and continue to the next command.
> 
> Remove "pexpect.TIMEOUT" to get the expected behaviour.

The commit log up to that point was a bit fuzzy about why that was the
case, and the commit title was not very clear either, so I reworded it.

> The qemu_sparc_ss10_defconfig is already fixed by
> 4d16e6f5324f0285f51bfbb5a3503584f3b3ad12.
> 
> This was reported to gcc upstream:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784

This reference does not belong to this commit (it is about the failing
defconfig itself,m not about the failure of our infra), so I dropped it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  support/scripts/boot-qemu-image.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
> index 4066788c88..0d4ad825fc 100755
> --- a/support/scripts/boot-qemu-image.py
> +++ b/support/scripts/boot-qemu-image.py
> @@ -36,7 +36,7 @@ def main():
>      time.sleep(1)
>  
>      try:
> -        child.expect(["buildroot login:", pexpect.TIMEOUT], timeout=60)
> +        child.expect(["buildroot login:"], timeout=60)
>      except pexpect.EOF as e:
>          # Some emulations require a fork of qemu-system, which may be
>          # missing on the system, and is not provided by Buildroot.
> @@ -58,7 +58,7 @@ def main():
>      child.sendline("root\r")
>  
>      try:
> -        child.expect(["# ", pexpect.TIMEOUT], timeout=60)
> +        child.expect(["# "], timeout=60)
>      except pexpect.EOF:
>          print("Cannot connect to shell")
>          sys.exit(1)
> @@ -69,7 +69,7 @@ def main():
>      child.sendline("poweroff\r")
>  
>      try:
> -        child.expect(["System halted", pexpect.TIMEOUT], timeout=60)
> +        child.expect(["System halted"], timeout=60)
>          child.expect(pexpect.EOF)
>      except pexpect.EOF:
>          pass
> -- 
> 2.29.2
> 
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
