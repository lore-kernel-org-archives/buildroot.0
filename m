From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:09:19 +0200
Subject: [Buildroot] [PATCH 01/51] lsof: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-2-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-2-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <6630ba9f-2993-8208-7100-ac378b15363c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/lsof/lsof.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index 312d834..e5cd4bc 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -47,7 +47,7 @@ define LSOF_CONFIGURE_CMDS
>  endef
>  
>  define LSOF_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)

 TARGET_CONFIGURE_OPTS is already there, so TARGET_MAKE_ENV shouldn't be needed
anymore, right? Well, no, wrong: variables passed as arguments to make are not
passed down to subprocesses, so we do want to explicitly set it in the
environment again.

 (Just to be clear: this patch is OK, I just note this in case anyone else is
looking at it.)

 Regards,
 Arnout

>  endef
>  
>  define LSOF_INSTALL_TARGET_CMDS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
