From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Mar 2016 00:20:05 +0100
Subject: [Buildroot] [PATCH v7 04/18] core: staging symlink uses a
 relative path when possible
In-Reply-To: <1457564339-27294-5-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20160309232005.GF5634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2016-03-09 23:58 +0100, Samuel Martin spake thusly:
> This change turns the staging/ symlink to a relative one when
> $(STAGING_DIR) points to some location in the Buildroot's output
> directory (i.e.: in $(BASE_DIR)/).
> 
> In any other case, the symlink target remains the absolute path
> to the sysroot location.
> 
> This slight change is a step forward toward a relocatable SDK.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v6->v7:
> - improve commit log (ThomasP)
> 
> changes v5->v6:
> - no changes
> 
> changes v4->v5:
> - add support when BR2_HOST_DIR is set somewhere out of BASE_DIR
> 
> changes v3->v4:
> - no change
> 
> changes v2->v3:
> - no change
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 52a92f6..f1de4ed 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -518,7 +518,11 @@ $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIS
>  # Populating the staging with the base directories is handled by the skeleton package
>  $(STAGING_DIR):
>  	@mkdir -p $(STAGING_DIR)
> +ifeq ($(BASE_DIR)/host/$(STAGING_SUBDIR),$(STAGING_DIR))

I'm not too fond of this. Here, you duplicate the logic used to set
STAGING_DIR, with the assumption that it is a sucbset of host/ . This is
indeed true, but I don;t like duplicating the logic.

What about:

    ifeq ($(patsubst $(BASE_DIR)/%,%,$(STAGING_DIR)),$(STAGING_DIR))
    # Not a subdir, absolute symlink
    else
    # A subdir, relative symlink
    endif

Regards,
Yann E. MORIN.

> +	@ln -snf host/$(STAGING_SUBDIR) $(BASE_DIR)/staging
> +else
>  	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> +endif
>  
>  RSYNC_VCS_EXCLUSIONS = \
>  	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
> -- 
> 2.7.2
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
