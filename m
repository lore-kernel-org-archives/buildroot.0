From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 23:38:41 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <28274ce277a8bde9abca815749513b2066845497.1329415985.git.alvaro.gamez@hazent.com>
References: <201202160040.17980.arnout@mind.be>
 <28274ce277a8bde9abca815749513b2066845497.1329415985.git.alvaro.gamez@hazent.com>
Message-ID: <201202162338.52454.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 19:15:07 Alvaro G. M wrote:
> @@ -290,11 +295,11 @@ define DOWNLOAD
>                         file) $($(DL_MODE)_LOCALFILES) && exit ;; \
>                         scp) $($(DL_MODE)_SCP) && exit ;; \
>                         hg) $($(DL_MODE)_HG) && exit ;; \
> -                       *) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
> +                       *) if test -n "$(2)" ; then $(call $(DL_MODE)_WGET,$(1)/$(2),$(2)); else $(call $(DL_MODE)_WGET,$(1)); fi && exit ;; \
>                 esac ; \
>         fi ; \
>         if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
> -               $(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
> +               $(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
>         fi ; \
>         exit 1

 No, I still don't like it I'm afraid.  It feels too complicated.  And I
don't think it works for the PRIMARY and BACKUP site if $(2) is empty.

 How about this:

define DOWNLOAD_WGET
	test -e $(DL_DIR)/$(2) || \
	$(WGET) -O $(DL_DIR)/$(2) '$(call qstrip,$(1))'
endef

...

define DOWNLOAD
	$(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
endef

define DOWNLOAD_INNER
	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
		esac ; \
	fi ; \
	if test -n "$(1)" ; then \
		case "$($(PKG)_SITE_METHOD)" in \
			git) $($(DL_MODE)_GIT) && exit ;; \
			svn) $($(DL_MODE)_SVN) && exit ;; \
			bzr) $($(DL_MODE)_BZR) && exit ;; \
			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
			scp) $($(DL_MODE)_SCP) && exit ;; \
			hg) $($(DL_MODE)_HG) && exit ;; \
			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
		esac ; \
	fi ; \
	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
	fi ; \
	exit 1
endef


 Regards,
 Arnout

 PS. If you do take this over, you probably better add my
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
