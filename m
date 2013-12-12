From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Dec 2013 22:48:11 +0100
Subject: [Buildroot] [RFC PATCH] Add a time zones repository
In-Reply-To: <1386605561-7244-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1386605561-7244-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <52AA2F1B.3020606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/13 17:12, Alexandre Belloni wrote:
> This adds a time zones repository as /etc/TZ so that uclibc users can
> have an easy way to select their timezone. This is based on the current
> list from openwrt which seems up to date.
>
> Signed-off-by: Alexandre Belloni<alexandre.belloni@free-electrons.com>

  Maybe I don't understand the purpose of this patch, but why do you 
install a pretty large file in the target which only contains a single 
relevant line? If you want to make use of it, you have to copy it to the 
rootfs-overlay where you can edit it - so there is no longer a need to 
enable BR2_TIMEZONE.

  I would be more inclined to add a string config option that allows the 
user to specify the time zone, where the help text e.g. refers to a 
website that lists all the timezones. This config option would generate 
the TZ file for uClibc, and the timezone file or whatever else is needed 
for glibc.

  Regards,
  Arnout

> ---
>   system/Config.in |   9 +
>   system/TZ        | 793 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   system/system.mk |   8 +
>   3 files changed, 810 insertions(+)
>   create mode 100644 system/TZ
>
> diff --git a/system/Config.in b/system/Config.in
> index 54c196c69e9d..9421c36e651b 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -332,4 +332,13 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
>   	  directory / images directory. The arguments in this option will be
>   	  passed*after*  those.
>
> +config BR2_TIMEZONE
> +	bool "Install timezones"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  Install a repository of known timezones in /etc/TZ.
> +
> +	  Note this only includes current timezones, we don't support past
> +	  timezones.
> +
>   endmenu


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
