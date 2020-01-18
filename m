From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 17 Jan 2020 22:26:38 -0300
Subject: [Buildroot] [PATCH v4 1/1] package/tar: bump target version to
 1.32 (host is kept at 1.31)
In-Reply-To: <20200116001600.567-1-james.hilliard1@gmail.com>
References: <20200116001600.567-1-james.hilliard1@gmail.com>
Message-ID: <CAJ4jsafJjUjZpVx43E7dQksCGD01A3qAh62FS+XnxjCyaYZ+QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 15, 2020 at 9:16 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> From: Luc Creti <luc.creti@atos.net>
>
> The host tar is used to create the archives in the VCS download backends
> (git, cvs, svn, hg...) and tar 1.30 and forward have changed the way
> they generate the archives.
>
> So, all the archives that have been generated before 1.30 was released
> are not bit-for-bit reproducible (even though the extracted content
> would be), so the hashes we have for those archives would not match.
>
> Hence host-tar requires a patch to restore reproducibility.
>
> Since there is no tar-1.32.cpio.gz available we must keep host-tar at
> version 1.31.

We don't actually need the cpio.gz file. We can use the installed tar,
whatever it is, to extract the tar-1.32.tar.xz:

define HOST_TAR_EXTRACT_CMDS
        mkdir -p $(@D)
        cd $(@D) && \
                $(call suitable-extractor,$(HOST_TAR_SOURCE))
$(TAR_DL_DIR)/$(HOST_TAR_SOURCE) \
                | tar --strip-components=1 -xf -
endef

-- 
Carlos Santos <unixmania@gmail.com>
