From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 21:31:14 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091007183157.GD23847@mx.loc> (Bernhard Reutner-Fischer's
	message of "Wed\, 7 Oct 2009 20\:31\:57 +0200")
References: <20091007162422.GI10261@mx.loc>
	<87ocojkqlh.fsf@macbook.be.48ers.dk> <20091007183157.GD23847@mx.loc>
Message-ID: <87bpkjknlp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> Sounds sensible. I would prefer to not touch the release target right
 >> now, as I don't have xz installed, noone else needs it and I already
 >> have my own release script signing the tarballs and uploading them.

 Bernhard> There is no need for xz, if it doesn't exists then no .tar.xz
 Bernhard> will be created.

Ahh yes, missed the || at the end of the line.

 >> Makes sense. Why would we want to run the -clean targets of all the
 >> individual packages first? That just tends to take ages (and fails on
 >> buggy packages), and we're nuking the TARGET_DIR afterwards anyway.

 Bernhard> calling the individual targets can be dropped, yes. I just
 Bernhard> didn't remove Bernhard> it (yet).

OK. I notice now that your have rm -rf $(IMAGE) instead of
$(BINARIES_DIR). I guess we want the latter, as $(IMAGE) is just a
prefix, not a file name.

 Bernhard> -dirclean: $(TARGETS_DIRCLEAN)
 Bernhard> -	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
 Bernhard> +# remove generated files, retain configs
 Bernhard> +dirclean: clean $(TARGETS_DIRCLEAN)
 Bernhard> +	$(Q)rm -rf $(STAGING_DIR) $(HOST_DIR) $(TOOLCHAIN_DIR)
 >> 
 >> Same comment about TARGETS_DIRCLEAN.

 Bernhard> ack.

OK.

What about $(BUILD_DIR)? I guess we would want to delete that as well?

 >> The git archive part is fine by me, but my script just expects the
 >> .tar.gz, so I would like to keep it like that (for now atleast).

 Bernhard> It would be nice if you could still pick it up and also sign/upload the .bz2

I do already:

ls *.bz2*
buildroot-2009.02-rc1.tar.bz2       buildroot-2009.05-rc3.tar.bz2
buildroot-2009.02-rc1.tar.bz2.sign  buildroot-2009.05-rc3.tar.bz2.sign
buildroot-2009.02-rc2.tar.bz2       buildroot-2009.05.tar.bz2
buildroot-2009.02-rc2.tar.bz2.sign  buildroot-2009.05.tar.bz2.sign
buildroot-2009.02-rc3.tar.bz2       buildroot-2009.08-rc1.tar.bz2
buildroot-2009.02-rc3.tar.bz2.sign  buildroot-2009.08-rc1.tar.bz2.sign
buildroot-2009.02-rc4.tar.bz2       buildroot-2009.08-rc2.tar.bz2
buildroot-2009.02-rc4.tar.bz2.sign  buildroot-2009.08-rc2.tar.bz2.sign
buildroot-2009.02.tar.bz2           buildroot-2009.08-rc3.tar.bz2
buildroot-2009.02.tar.bz2.sign      buildroot-2009.08-rc3.tar.bz2.sign
buildroot-2009.05-rc1.tar.bz2       buildroot-2009.08.tar.bz2
buildroot-2009.05-rc1.tar.bz2.sign  buildroot-2009.08.tar.bz2.sign
buildroot-2009.05-rc2.tar.bz2       buildroot-snapshot.tar.bz2
buildroot-2009.05-rc2.tar.bz2.sign

But the script generates it all from a single .tar.gz - Anyway, that's a
minor detail.

-- 
Bye, Peter Korsgaard
