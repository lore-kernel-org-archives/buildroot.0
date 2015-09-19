From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:06:19 +0200
Subject: [Buildroot] [PATCH 1/1] target-finalize: remove extra
 /usr/libexec/*.a and *.la files
In-Reply-To: <1442323626-31294-1-git-send-email-Herve.CODINA@celad.com>
References: <1442323626-31294-1-git-send-email-Herve.CODINA@celad.com>
Message-ID: <20150919150619.568b140f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herve,

On Tue, 15 Sep 2015 15:27:06 +0200, Herve Codina wrote:
> Some packages, sudo for instance, install .la files in $(TARGET_DIR)/usr/libexec.
> These files are not needed on target.
> 
> This patch simply removes *.a and *.la files from $(TARGET_DIR)/usr/libexec if it exists

I initially hesitated a bit first, because normally, plugins should be
installed in /usr/lib/<package>/. This can be done with
--with-plugindir, which moves a certain number of files installed by
default in /usr/libexec, but there are still a few libraries here
nonetheless. So your approach seems better.

> @@ -565,6 +565,9 @@ target-finalize: $(PACKAGES)
>  	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
>  	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
>  	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
> +	if test -d $(TARGET_DIR)/usr/libexec; then \
> +		find $(TARGET_DIR)/usr/libexec \( -name '*.a' -o -name '*.la' \) -print0 | \
> +		xargs -0 rm -f; fi

I've simplified that into a single "find" invocation for lib/, usr/lib
and usr/libexec.

See
http://git.buildroot.net/buildroot/commit/?id=87f3edecc65975085982515f3618c81bcfd9c023

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
