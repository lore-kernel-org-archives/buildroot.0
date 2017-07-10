From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 18:02:40 +0200
Subject: [Buildroot] [PATCH 6/7] Makefile: add check that
 $(HOST_DIR)/usr is not a directory
In-Reply-To: <20170709232123.30120-7-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-7-arnout@mind.be>
Message-ID: <20170710180240.43215e1a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 01:21:22 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We create a compatibility symlink for $(HOST_DIR)/usr. However, if
> that exists already as a directory, the link can't be created. Make
> will not even try since it exists already and has no dependencies. If
> it exists as a directory, any post-build script that is still using
> $(HOST_DIR)/usr will fail to find what it needs. Therefore, add a
> check that it is not a directory.
> 
> This check has to be made as part of some PHONY target. We can reuse
> the dirs target, on which all packages depend.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Personally I don't think it's important enough to add such a check.
> If someone ends up in this situation, they'll be motivated to fix
> their post-build scripts :-)

I also don't like very much adding such checks. In which situation can
our users fall into this problem?

They have an existing Buildroot tree, they do "git pull" and do a
partial rebuild ?

> diff --git a/Makefile b/Makefile
> index 188ce9adc7..a94555d130 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -542,6 +542,11 @@ endif
>  .PHONY: dirs
>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  	$(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
> +	@if [ -d "$(HOST_DIR)/usr" -a ! -L "$(HOST_DIR)/usr" ]; then \
> +		printf '%s is not allowed to be a directory\n' "$(HOST_DIR)/usr" 1>&2; \
> +		printf 'Please remove this directory and rebuild\n' 1>&2; \

What about saying "Please run make clean all" ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
