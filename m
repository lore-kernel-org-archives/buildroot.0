From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 10 Apr 2012 11:06:57 +0200
Subject: [Buildroot] [PATCH] Added the empty package
In-Reply-To: <1334047948-7325-1-git-send-email-spdawson@gmail.com>
References: <1334047948-7325-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAfyv35D5smQx4TXHgSgBTJA18Dg69g5c2tucR5AuAiOr19FBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On Tue, Apr 10, 2012 at 10:52 AM,  <spdawson@gmail.com> wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
> ?package/Config.in ? ? ? | ? ?1 +
> ?package/empty/Config.in | ? ?6 ++++++
> ?package/empty/empty.mk ?| ? 19 +++++++++++++++++++
> ?3 files changed, 26 insertions(+), 0 deletions(-)
> ?create mode 100644 package/empty/Config.in
> ?create mode 100644 package/empty/empty.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 4c6d4d8..205fa8a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -426,6 +426,7 @@ endmenu
> ?endmenu
>
> ?menu "Miscellaneous"
> +source "package/empty/Config.in"
> ?source "package/shared-mime-info/Config.in"
> ?endmenu
>
> diff --git a/package/empty/Config.in b/package/empty/Config.in
> new file mode 100644
> index 0000000..67b09fc
> --- /dev/null
> +++ b/package/empty/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_EMPTY
> + ? ? ? bool "empty"
> + ? ? ? help
> + ? ? ? ? Run processes and applications under pseudo-terminal (PTY) sessions.
> +
> + ? ? ? ? http://empty.sourceforge.net/
> diff --git a/package/empty/empty.mk b/package/empty/empty.mk
> new file mode 100644
> index 0000000..d15a18f
> --- /dev/null
> +++ b/package/empty/empty.mk
> @@ -0,0 +1,19 @@
> +#############################################################
> +#
> +# empty
> +#
> +#############################################################
> +EMPTY_VERSION = 0.6.18b
> +EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
> +EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
> +
> +define EMPTY_BUILD_CMDS
> + ? ? ? $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
Instead CC and LD use $(TARGET_CONFIGURE_OPTS) which does the job.
> +endef
> +
> +define EMPTY_INSTALL_TARGET_CMDS
> + ? ? ? $(INSTALL) -D $(@D)/empty $(TARGET_DIR)/usr/bin
You need to specify name also for target directory so then:
   +       $(INSTALL) -D $(@D)/empty $(TARGET_DIR)/usr/bin/empty

> + ? ? ? -$(STRIPCMP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/empty
> +endef
> +
> +$(eval $(call GENTARGETS,package,empty))
> --
> 1.7.5.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
