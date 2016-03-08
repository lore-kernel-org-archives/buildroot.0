From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 21:54:55 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
Message-ID: <56DF3C1F.30205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/15 15:37, J?r?me Pouiller wrote:
> It is handy to use local.mk or external.mk to add specific targets
> for current project. However, until now, it not possible to add help
> message these targets.
> This patch add LOCAL_HELP variable. This variable is aimed to be assigned
> from any .mk files. Its content is displayed with 'make help'.
>
> For exemple:
>    LOCAL_HELP += "flash                  - Flash target"
>    LOCAL_HELP += "chroot                 - Chroot into target/"
>    LOCAL_HELP += "qemu                   - Run image with qemu"
>    LOCAL_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
>    LOCAL_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
>    LOCAL_HELP += "Please contact support at company.com in case of problem."
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

  Looks good to me, except that I don't like the name 'LOCAL'. I'd prefer e.g. 
ADDITIONAL.

> ---
>   Makefile | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 80c264f..4322da9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -901,6 +901,11 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
>   	@echo '  barebox-menuconfig     - Run barebox menuconfig'
>   	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
>   endif
> +ifneq ($(LOCAL_HELP),)
> +	@echo
> +	@echo 'Local targets:'

  And this bit is not needed for me (neither the empty line).

  But with that:

  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> +	@for i in $(LOCAL_HELP); do echo "  $$i"; done
> +endif
>   	@echo
>   	@echo 'Documentation:'
>   	@echo '  manual                 - build manual in all formats'
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
