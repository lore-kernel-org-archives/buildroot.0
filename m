From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 13:23:49 +0100
Subject: [Buildroot] [PATCHv2 2/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <1929636.NnvGLL6rO5@aquila>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470100-32657-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <1929636.NnvGLL6rO5@aquila>
Message-ID: <20141202132349.5a02a3a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 02 Dec 2014 12:00:51 +0100, J?r?me Pouiller wrote:

> > +# This hook will be called before the target installation of a
> > +# package. We store in a file named $(1).filelist_before the list of
> > +# files currently installed in the target. Note that the MD5 is also
> > +# stored, in order to identify if the files are overwritten.
> > +define step_pkg_size_start
> > +	(cd $(TARGET_DIR) ; find . -type f | xargs md5sum) | sort > \
> > +		$(BUILD_DIR)/$(1).filelist_before
> > +endef
> I think this does not work if filename contains spaces.

Hum, yes, very possible. But is Buildroot really working fine as a
whole if some file in the target filesystem has some spaces?

> > +# This hook will be called after the target installation of a
> > +# package. We store in a file named $(1).filelist_after the list
> > +# of files (and their MD5) currently installed in the target. We then
> > +# do a diff with the $(1).filelist_before to compute the list of
> > +# files installed by this package.
> > +define step_pkg_size_end
> > +	(cd $(TARGET_DIR); find . -type f | xargs md5sum) | sort > \
> > +		$(BUILD_DIR)/$(1).filelist_after
> > +	comm -13 $(BUILD_DIR)/$(1).filelist_before $(BUILD_DIR)/$(1).filelist_after | \
> > +		while read hash file ; do \
> > +			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
> > +		done
> Does it would make sense if we also record removed lines? We may wrote 
> another script that detect if a file was in conflict between two packages.

I'm not sure to follow you here. We already take care of packages
installing the same file, that's the whole point of storing the MD5 of
each file. By using comm -13, we keep only the lines that are unique in
the second file (compared to the first file). So we keep lines for
either new files added by this package, or files already installed but
overwritten by the package (detected using the MD5).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
