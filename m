From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 18:05:55 +0100
Subject: [Buildroot] [PATCH 2 of 2 v3-resend] build: add option to
	exclude executables/dirs from being stripped
In-Reply-To: <e7da4f66d46091f4f0e8.1328818170@beantl019720>
References: <patchbomb.1328818168@beantl019720>
 <e7da4f66d46091f4f0e8.1328818170@beantl019720>
Message-ID: <201202111805.55613.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 09 February 2012 21:09:30 Thomas De Schampheleire wrote:
> Sometimes it may be desirable to keep debug symbols for some binaries and
> libraries on the target. This commit introduces the config option
> BR2_STRIP_EXCLUDE_FILES, which is interpreted as a list of such binaries
> and libraries, and the option BR2_STRIP_EXCLUDE_DIRS, which indicates
> directories excluded from stripping entirely.
> These exclusions are passed to the find command in the target-finalize step.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


[snip]
> +STRIP_FIND_CMD=find $(TARGET_DIR)
> +ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
> +STRIP_FIND_CMD+=\( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
> +endif
> +STRIP_FIND_CMD+=-type f -perm +111 -not \( $(call findfileclauses,libthread_db*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print

 If for whatever reason this patch has to go through another cycle, I'd
like the following whitespace changes:

- space before and after the =

- split up the last line in two, e.g.

STRIP_FIND_CMD += -type f -perm +111 
STRIP_FIND_CMD += -not \( $(call findfileclauses,libthread_db*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print

 (still 120 columns wide, but better already).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
