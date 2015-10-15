From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Oct 2015 23:36:53 +0200
Subject: [Buildroot] [PATCH] ccache: allow for BR2_CCACHE_DIR
 environment override
In-Reply-To: <1444915479-7871-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1444915479-7871-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <56201C75.10300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-10-15 15:24, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Allow the BR2_CCACHE_DIR .config option to be overriden by the
> BR2_CCACHE_DIR env variable.
> This is useful for big projects where in some cases the developers home
> directory might be a NFS mount (slow) and real production builds aren't.
> 
> Update documentation accordingly as well.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

 I initially thought: why not set the default in the .config file based on the
environment. However, this approach is really a lot simpler, so:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 One more remark below.

> ---
>  Makefile                     | 6 ++++--
>  docs/manual/common-usage.txt | 3 +++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 181d446..5bf1538 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -183,7 +183,9 @@ endif
>  ifneq ($(BR2_DL_DIR),)
>  DL_DIR := $(BR2_DL_DIR)
>  endif
> -
> +ifneq ($(BR2_CCACHE_DIR),)
> +BR_CACHE_DIR := $(BR2_CCACHE_DIR)
> +endif
>  
>  # Need that early, before we scan packages
>  # Avoids doing the $(or...) everytime
> @@ -371,7 +373,7 @@ TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
>  
>  ifeq ($(BR2_CCACHE),y)
>  CCACHE := $(HOST_DIR)/usr/bin/ccache
> -BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
> +BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
>  export BR_CACHE_DIR
>  HOSTCC := $(CCACHE) $(HOSTCC)
>  HOSTCXX := $(CCACHE) $(HOSTCXX)
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index 5b27b1f..51b6a3e 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -84,6 +84,9 @@ to +make+ or set in the environment:
>    configuration interface, so through the Buildroot +.config+ file; this
>    is the recommended way of setting it.
>    +
> +* +BR2_CCACHE_DIR+ to override the directory where
> +  Buildroot stores the cached files when using ccache.
> +  +

 It could be useful to add this to ccache-support.txt as well.

 Regards,
 Arnout

>  * +BR2_DL_DIR+ to override the directory in which
>    Buildroot stores/retrieves downloaded files
>    +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
