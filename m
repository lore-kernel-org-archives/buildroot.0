From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Jan 2015 22:38:12 +0100
Subject: [Buildroot] [PATCH 2/2] linux/linux.mk: fixed downloading
 kernel patches
In-Reply-To: <1421080646-26230-2-git-send-email-ivo.slanina@gmail.com>
References: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
 <1421080646-26230-2-git-send-email-ivo.slanina@gmail.com>
Message-ID: <20150112213812.GB9000@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivo, All,
On 2015-01-12 17:37 +0100, Ivo Slanina spake thusly:
> Patches located at ftp or http(s) URLs were downloaded using DOWNLOAD
> macro. For example, if linux source was located at external git
> repository, DOWNLOAD macro uses git scheme as well and buildroot
> tried to downlod a path using DOWNLOAD_GIT macro. As a result, nothing
> was downloaded and build siletly passes.

I had a hard time understanding how that would be possible. So I'll
write it here so we're sure we're speaking about the same thing. If you
set your options to:

    BR2_LINUX_KERNEL_CUSTOM_GIT=y
    BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://foo/bar/buz.git"
    BR2_LINUX_KERNEL_PATCH="http://foo/bar/buz.patch"

Then this is translated in the code as:

    [linux/linux.mk]
    else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
    LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
    LINUX_SITE_METHOD = git
    else [...]

which means _SITE_METHOD is set to git, and thus our DOWNLOAD_INNER
macro relies on this to decide how to do the download:

    [package/pkg-download]
        if test -z "$($(PKG)_SITE_METHOD)" ; then \
            scheme="$(call geturischeme,$(1))" ; \
        else \
            scheme="$($(PKG)_SITE_METHOD)" ; \
        fi ; \

So, this sounds legit, indeed.

However, I'm not too fond that we directly use the internal download
macros. But I guess since we ecplicitly filter on schemes wget
understands, that's pretty OK.

Which still prompts a question: what if the user has patches he want to
download via scp? We do not handle this case for now, right. Should we?

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Patches located at mentioned URLs is now downloaded directly with
> DOWNLOAD_WGET macro.
> 
> Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
> ---
>  linux/linux.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index d02b02b..29f59e8 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -148,7 +148,7 @@ define LINUX_DOWNLOAD_PATCHES
>  	$(if $(LINUX_PATCHES),
>  		@$(call MESSAGE,"Download additional patches"))
>  	$(foreach patch,$(filter ftp://% http://% https://%,$(LINUX_PATCHES)),\
> -		$(call DOWNLOAD,$(patch))$(sep))
> +		$(call DOWNLOAD_WGET,$(patch),$(notdir $(patch)))$(sep))
>  endef
>  
>  LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
> -- 
> 1.7.10.4
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
