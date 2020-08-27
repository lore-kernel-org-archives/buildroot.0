From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:48:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.6
In-Reply-To: <20200706010444.537633-1-james.hilliard1@gmail.com>
References: <20200706010444.537633-1-james.hilliard1@gmail.com>
Message-ID: <20200827234830.534955b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Jul 2020 19:04:44 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add pipewire optional dependencies/configurations.
> 
> Remove BR2_PACKAGE_PIPEWIRE_GSTREAMER config option and enable
> automatically based on dependencies to avoid recursive dependency
> error caused by the gobject-introspection python3 dependency.

Could you give more details about this recursive dependency ?

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Config.in.legacy               |  10 +++
>  package/pipewire/Config.in     |  27 +-------
>  package/pipewire/pipewire.hash |   6 +-
>  package/pipewire/pipewire.mk   | 114 +++++++++++++++++++++++++++------
>  4 files changed, 110 insertions(+), 47 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 7a5435188b..4541acc979 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,16 @@ endif
>  
>  comment "Legacy options removed in 2020.08"
>  
> +config BR2_PACKAGE_PIPEWIRE_GSTREAMER
> +	bool "pipewire gstreamer option removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
> +	select BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE

But isn't that going to cause that circular dependency you're trying to
prevent, since you're selecting BR2_PACKAGE_GOBJECT_INTROSPECTION here ?

Or maybe what you're talking about is not a Kconfig recursive
dependency, but a makefile circular dependency ? But in the later case,
I'm not sure how dropping the Config.in option helps.

Could you clarify ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
