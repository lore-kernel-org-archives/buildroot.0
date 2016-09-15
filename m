From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 18:19:01 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
 root filesystem removal
In-Reply-To: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <aee7cccd-eb3a-d376-99b0-a9ba3cb950b2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 15-09-16 10:58, Thomas Petazzoni wrote:
> This reverts commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79 and reworks
> the code to fix a major and potentially catastrophic bug when the
> following conditions are met:
[snip]
> Another mistake that caused the bug is commit
> b731dc7bfb9c8ce7be502711f0b44ccab5515f1d ("toolchain-external: make
> extraction idempotent"), which introduce the dangerous call "rm -rf
> $(var)/*", which can be catastrophic if by mistake $(var) is
> empty. Instead, this commit should have just used rm -rf $(var) to
> remove the directory instead: it would have failed without consequences
> if $(var) is empty, and the directory was anyway already re-created
> right after with a mkdir.

 I'm sure I had a reason to add the /*, but I can't remember and the commit
message isn't helpful. The only difference (except for keeping the directory)
that I can think of is that .stamp files are kept, but (a) they should be
removed and (b) there aren't any stamp files in that directory...

[snip]
>  # Normal handling of downloaded toolchain tarball extraction.
> -ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)

 You've just made these two equivalent again. But it's better like that.

>  TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*

 I thought: hey, this can't be right, TOOLCHAIN_EXTERNAL_EXCLUDES should still
be set for non-downloaded toolchains that do have a source. But since those
don't exist, it doesn't matter.

 I'd give it my Rev-by tag but too late now :-)

 Regards,
 Arnout

>  
>  # As a regular package, the toolchain gets extracted in $(@D), but
>  # since it's actually a fairly special package, we need it to be moved
> -# into TOOLCHAIN_EXTERNAL_INSTALL_DIR.
> +# into TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.
>  define TOOLCHAIN_EXTERNAL_MOVE
> -	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/*
> -	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
> -	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
> +	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
> +	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
> +	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
>  endef
>  TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
>  	TOOLCHAIN_EXTERNAL_MOVE
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
