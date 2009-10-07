From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 20:31:57 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <87ocojkqlh.fsf@macbook.be.48ers.dk>
References: <20091007162422.GI10261@mx.loc>
	<87ocojkqlh.fsf@macbook.be.48ers.dk>
Message-ID: <20091007183157.GD23847@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 07, 2009 at 08:26:34PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard> Hi,
> Bernhard> Currently the clean target (as well as dirclean) does nothing useful.
>
> Bernhard> I propose the following change:
>
> Bernhard> # wipe target
> Bernhard> clean:
> Bernhard> # remove generated files, retain configs
> Bernhard> realclean:
> Bernhard> # remove generated files, including configs (but not DL_DIR!)
> Bernhard> distclean:
> Bernhard> # roll a release tarball, in gz, bz2, xz format
> Bernhard> release:
>
>Sounds sensible. I would prefer to not touch the release target right
>now, as I don't have xz installed, noone else needs it and I already
>have my own release script signing the tarballs and uploading them.

There is no need for xz, if it doesn't exists then no .tar.xz will be
created.
>
> Bernhard> hm, something like this as a base (probably incomplete, but better than
> Bernhard> what we have now)
>
> Bernhard> diff --git a/Makefile b/Makefile
> Bernhard> index bbd49d4..ddd58ec 100644
> Bernhard> --- a/Makefile
> Bernhard> +++ b/Makefile
> Bernhard> @@ -444,19 +444,20 @@ external-deps:
> Bernhard>  # Cleanup and misc junk
> Bernhard>  #
> Bernhard>  #############################################################
> Bernhard> +# wipe target
> Bernhard>  clean: $(TARGETS_CLEAN)
> Bernhard> -	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
> Bernhard> +	$(Q)rm -rf $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
>
>Makes sense. Why would we want to run the -clean targets of all the
>individual packages first? That just tends to take ages (and fails on
>buggy packages), and we're nuking the TARGET_DIR afterwards anyway.

calling the individual targets can be dropped, yes. I just didn't remove
it (yet).
>
> 
> Bernhard> -dirclean: $(TARGETS_DIRCLEAN)
> Bernhard> -	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
> Bernhard> +# remove generated files, retain configs
> Bernhard> +dirclean: clean $(TARGETS_DIRCLEAN)
> Bernhard> +	$(Q)rm -rf $(STAGING_DIR) $(HOST_DIR) $(TOOLCHAIN_DIR)
>
>Same comment about TARGETS_DIRCLEAN.

ack.
>
> 
> Bernhard> -distclean:
> Bernhard> -ifeq ($(DL_DIR),$(TOPDIR)/dl)
> Bernhard> -	rm -rf $(DL_DIR)
> Bernhard> -endif
> Bernhard> -	rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
> Bernhard> -	.config.cmd
> Bernhard> -	$(MAKE) -C $(CONFIG) clean
> Bernhard> +# remove generated files, including configs (but not DL_DIR!)
> Bernhard> +distclean: clean dirclean
> Bernhard> +	$(Q)$(MAKE) -C $(CONFIG) clean
> Bernhard> +	$(Q)rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
>
>dirclean already gets rid of those dirs.

s/those dirs/TOOLCHAIN_DIR/
ack.
>
> Bernhard> +		.config .config.cmd .config.old .auto.deps \
> Bernhard> +		$(BR2_DEPENDS_DIR)
> Bernhard>  release: distclean
> Bernhard> -	OUT=buildroot-$$(grep -A2 BR2_VERSION $(CONFIG_CONFIG_IN)|grep default|cut -f2 -d\"); \
> Bernhard> -	rm -rf ../$$OUT*; cp -al . ../$$OUT; cd ..; \
> Bernhard> -	tar cfz $$OUT.tar.gz --exclude .svn --exclude .git --exclude \*~ $$OUT; \
> Bernhard> -	rm -rf $$OUT
> Bernhard> +	$(Q)BR2_VERSION=$$(grep -A2 BR2_VERSION $(CONFIG_CONFIG_IN)|grep default|cut -f2 -d\"); \
> Bernhard> +	git archive HEAD --format=tar --prefix="buildroot-$$BR2_VERSION/" > ../buildroot-$$BR2_VERSION.tar; \
>
>The git archive part is fine by me, but my script just expects the
>.tar.gz, so I would like to keep it like that (for now atleast).

It would be nice if you could still pick it up and also sign/upload the .bz2
