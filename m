From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 13 Sep 2010 16:45:32 +0100
Subject: [Buildroot] [PATCH 5/8] Use the normal download method for
 Tremor
In-Reply-To: <20100913105520.1a2ed8b8@surf>
References: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
	<91f2599d9b9f069f719f5577ae44d987ccd58649.1284360382.git.thomas.petazzoni@free-electrons.com>
	<1284367351.1742.29.camel@sven>  <20100913105520.1a2ed8b8@surf>
Message-ID: <1284392732.3216.54.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar Luan, 2010-09-13 ag 10:55 +0200, scr?obh Thomas Petazzoni:

> +define DOWNLOAD_GIT
> +	pushd $(DL_DIR) > /dev/null && \
> +	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
> +	pushd $($(PKG)_BASE_NAME) > /dev/null && \
> +	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
> +		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
> +	popd > /dev/null && \
> +	rm -rf $($(PKG)_DL_DIR) && \
> +	popd > /dev/null
> +endef
> 
> Does the git clone and then creates a tarball stored in $(DL_DIR).

Back a few months ago when Maxime (and Luca Ceresoli) first sent his
patches to the list I took them on board and massaged them into
something I could use on a daily basis and have had moderate success (I
will share if anyone's interested).  One of the problems with the above
patch is that if the "git archive" is interrupted (e.g. Ctrl-C) a
half-finished tarball is left in $(DL_DIR).  Off you go again to "make"
and DOWNLOAD sees that it has a "dl/package-version.tar.gz" -> I don't
need to download that -> I'll extract that to "output/build/..." and
then an error occurs when EOF is met unexpectedly.

Anyway, this fixes it: just archive to a tempfile and rename.

+define DOWNLOAD_GIT
+	pushd $(DL_DIR) > /dev/null && \
+	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	pushd $($(PKG)_BASE_NAME) > /dev/null && \
+	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
+		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE).tmp && \ 
+	mv $(DL_DIR)/$($(PKG)_SOURCE).tmp $(DL_DIR)/$($(PKG)_SOURCE) && \ 
+	popd > /dev/null && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null
