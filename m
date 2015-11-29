From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Nov 2015 21:26:50 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
Message-ID: <20151129202650.GI3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-11-18 15:37 +0100, J?r?me Pouiller spake thusly:
> It is handy to use local.mk or external.mk to add specific targets
> for current project. However, until now, it not possible to add help
> message these targets.
> This patch add LOCAL_HELP variable. This variable is aimed to be assigned
> from any .mk files. Its content is displayed with 'make help'.
> 
> For exemple:
>   LOCAL_HELP += "flash                  - Flash target"
>   LOCAL_HELP += "chroot                 - Chroot into target/"
>   LOCAL_HELP += "qemu                   - Run image with qemu"
>   LOCAL_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
>   LOCAL_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
>   LOCAL_HELP += "Please contact support at company.com in case of problem."
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 80c264f..4322da9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -901,6 +901,11 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
>  	@echo '  barebox-menuconfig     - Run barebox menuconfig'
>  	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
>  endif
> +ifneq ($(LOCAL_HELP),)
> +	@echo
> +	@echo 'Local targets:'
> +	@for i in $(LOCAL_HELP); do echo "  $$i"; done
> +endif

Well, for help from extenal.mk (or local.mk, but I'd arue that would be
a bad idea, given that local.mk is supposedly short-lived), there is in
my opinion a much better solution.

Change the 'help' rule to a double-colon make rule, like so:

    help::
        echo Current Buildroot help

Then you can add as many such rules in as many places you want,
especially in external.mk, and the will be appended one after the
others.

We just have to ensure that our help comes before the external ones, so
maybe you'll have to move our help block before inclusion of
external.mk...

Regards,
Yann E. MORIN.

>  	@echo
>  	@echo 'Documentation:'
>  	@echo '  manual                 - build manual in all formats'
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
