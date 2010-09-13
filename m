From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Sep 2010 10:55:20 +0200
Subject: [Buildroot] [PATCH 5/8] Use the normal download method for
 Tremor
In-Reply-To: <1284367351.1742.29.camel@sven>
References: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
	<91f2599d9b9f069f719f5577ae44d987ccd58649.1284360382.git.thomas.petazzoni@free-electrons.com>
	<1284367351.1742.29.camel@sven>
Message-ID: <20100913105520.1a2ed8b8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Mon, 13 Sep 2010 10:42:31 +0200
Sven Neumann <s.neumann@raumfeld.com> wrote:

> will this new code still try to access a tarball in the dl directory and
> then try to get a tarball from the primary mirror before it actually
> tries to get the snapshot from the SVN repository?

Yes, this is exactly what it does. In patch 4/8 :

+define DOWNLOAD_GIT
+	pushd $(DL_DIR) > /dev/null && \
+	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	pushd $($(PKG)_BASE_NAME) > /dev/null && \
+	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
+		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
+	popd > /dev/null && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null
+endef

Does the git clone and then creates a tarball stored in $(DL_DIR).

And then:

 define DOWNLOAD
 	$(Q)test -e $(DL_DIR)/$(2) || \
-	for site in $(call qstrip,$(BR2_PRIMARY_SITE)) $(1) $(call qstrip,$(BR2_BACKUP_SITE)); \
-	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
+	(if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
+		$(call DOWNLOAD_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+	fi ; \
+	if test -n "$(1)" ; then \
+		case "$($(PKG)_SITE_METHOD)" in \
+			git) $(DOWNLOAD_GIT) && exit ;; \
+			svn) $(DOWNLOAD_SVN) && exit ;; \
+			*) $(call DOWNLOAD_WGET,$(1),$(2)) && exit ;; \
+		esac ; \
+	fi ; \
+	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
+		$(call DOWNLOAD_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
+	fi ; \
+	exit 1)
 endef

First checks if BR2_PRIMARY_SITE is set, and if yes, tries to fetch the
tarball from here. Only if it's not available from the primary site, we
go to actually fetching using git, svn or wget from the project
official location.

Does this sounds ok for you ?

> IMO it is very important that it continues to work that way. I don't
> want our nightly builds to pull snapshots from the SVN repository over
> and over again. This wastes bandwidth, slows down the builds and breaks
> the build every so often (if the SVN server is unreachable).

Absolutely, this is why SVN and Git fetch methods have been implemented
to be as similar as the existing tarball download method.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
