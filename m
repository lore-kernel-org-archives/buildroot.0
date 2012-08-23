From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Aug 2012 23:22:02 +0200
Subject: [Buildroot] [PATCH 2/2] Provide PAM default configuration files
 when building linux-pam package
In-Reply-To: <1345001603-16774-2-git-send-email-golubovsky@gmail.com>
References: <1345001603-16774-1-git-send-email-golubovsky@gmail.com>
 <1345001603-16774-2-git-send-email-golubovsky@gmail.com>
Message-ID: <50369EFA.5010708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/15/12 05:33, Dmitry wrote:
> +define LINUX_PAM_CONFFILES
> +	mkdir -p $(TARGET_DIR)/etc/pam.d
> +	cp $($(PKG)_DIR_PREFIX)/$(RAWNAME)/default $(TARGET_DIR)/etc/pam.d
> +	cp $($(PKG)_DIR_PREFIX)/$(RAWNAME)/login $(TARGET_DIR)/etc/pam.d
> +endef

  We normally hard-code the directory name: the build is always executed from
the buildroot directory, and the package directory normally doesn't change.
So:
	cp package/linux-pam/default $(TARGET_DIR)/etc/pam.d
This will also allow you to do it in the post-install hook.

  Also, I would use $(INSTALL) instead of cp (but that's personal preference,
cp is used in other places as well):
	$(INSTALL) -D -m 0644 package/linux-pam/default $(TARGET_DIR)/etc/pam.d/default
(since it uses -D, the mkdir can be removed).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
