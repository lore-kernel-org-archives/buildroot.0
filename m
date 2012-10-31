From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Oct 2012 23:27:02 +0100
Subject: [Buildroot] [PATCH v2] Add support for custom package patches
In-Reply-To: <1351688107-6194-1-git-send-email-spdawson@gmail.com>
References: <1351688107-6194-1-git-send-email-spdawson@gmail.com>
Message-ID: <5091A5B6.8010609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/12 13:55, spdawson at gmail.com wrote:
> +	$(Q)($(call pkg-apply-patch-directory,$($(PKG)_DIR_PREFIX)/$(RAWNAME)))
> +	$(if $(call qstrip,$(BR2_EXTRA_PACKAGE_PATCH_DIRS)),$(Q)($(foreach patchdir,$(call qstrip,$(BR2_EXTRA_PACKAGE_PATCH_DIRS)),$(call pkg-apply-patch-directory,$(patchdir)))))

  I could be wrong, but I think this would also work:

	$(foreach patchdir,$(call qstrip,$(BR2_EXTRA_PACKAGE_PATCH_DIRS)),$(Q)$(call pkg-apply-patch-directory,$(patchdir))$(sep)))

(and the semicolon at the end of pkg-apply-patch-directory is redundant then).


  Alternatively, you could define:

PACKAGE_PATCH_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_EXTRA_PACKAGE_PATCH_DIRS))
...
	$(Q)$(foreach patchdir,$(PACKAGE_PATCH_DIRS),$(call pkg-apply-patch-directory,$(patchdir)))


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
