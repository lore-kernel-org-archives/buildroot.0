From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Nov 2015 23:05:51 +0100
Subject: [Buildroot] [PATCH] readline: install configuration file from
 package recipe
In-Reply-To: <1447780732-21911-1-git-send-email-jezz@sysmic.org>
References: <1447780732-21911-1-git-send-email-jezz@sysmic.org>
Message-ID: <564BA4BF.7020106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-11-15 18:18, J?r?me Pouiller wrote:
> /etc/inputrc is configuration file for readline. However, until now, it
> was provided by skeleton. This patch install /etc/inputrc from readline
> recipe.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/readline/inputrc     | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  package/readline/readline.mk |  6 +++++-
>  system/skeleton/etc/inputrc  | 44 --------------------------------------------

 Please use git format-patch -M or do
git config --global --bool --add format.find-renames true
git config --global --bool --add format.find-copies true

>  3 files changed, 49 insertions(+), 45 deletions(-)
>  create mode 100644 package/readline/inputrc
>  delete mode 100644 system/skeleton/etc/inputrc
> 
> diff --git a/package/readline/inputrc b/package/readline/inputrc
> new file mode 100644
> index 0000000..2f1cb60
> --- /dev/null
> +++ b/package/readline/inputrc
[snip]
> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> index c004899..3d31696 100644
> --- a/package/readline/readline.mk
> +++ b/package/readline/readline.mk
> @@ -17,8 +17,12 @@ READLINE_LICENSE_FILES = COPYING
>  define READLINE_PURGE_EXAMPLES
>  	rm -rf $(TARGET_DIR)/usr/share/readline
>  endef
> -
>  READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
>  
> +define READLINE_INSTALL_INPUTRC
> +	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc

 Please use $(READLINE_PKGDIR) instead of package/readline.

 Otherwise LGTM.

 Regards,
 Arnout

> +endef
> +READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> diff --git a/system/skeleton/etc/inputrc b/system/skeleton/etc/inputrc
> deleted file mode 100644
> index 2f1cb60..0000000
> --- a/system/skeleton/etc/inputrc
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -# /etc/inputrc - global inputrc for libreadline
> -# See readline(3readline) and `info readline' for more information.
> -
> -# Be 8 bit clean.
> -set input-meta on
> -set output-meta on
> -set bell-style visible
> -
> -# To allow the use of 8bit-characters like the german umlauts, comment out
> -# the line below. However this makes the meta key not work as a meta key,
> -# which is annoying to those which don't need to type in 8-bit characters.
> -
> -# set convert-meta off
> -
> -"\e0d": backward-word
> -"\e0c": forward-word
> -"\e[h": beginning-of-line
> -"\e[f": end-of-line
> -"\e[1~": beginning-of-line
> -"\e[4~": end-of-line
> -#"\e[5~": beginning-of-history
> -#"\e[6~": end-of-history
> -"\e[3~": delete-char
> -"\e[2~": quoted-insert
> -
> -# Common standard keypad and cursor
> -# (codes courtsey Werner Fink, <werner@suse.de>)
> -#"\e[1~": history-search-backward
> -"\e[2~": yank
> -"\e[3~": delete-char
> -#"\e[4~": set-mark
> -"\e[5~": history-search-backward
> -"\e[6~": history-search-forward
> -# Normal keypad and cursor of xterm
> -"\e[F": end-of-line
> -"\e[H": beginning-of-line
> -# Application keypad and cursor of xterm
> -"\eOA": previous-history
> -"\eOC": forward-char
> -"\eOB": next-history
> -"\eOD": backward-char
> -"\eOF": end-of-line
> -"\eOH": beginning-of-line
> -
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
