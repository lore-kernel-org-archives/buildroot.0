From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 15:46:17 +0200
Subject: [Buildroot] [PATCHv5 1/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <55F02FEC.7080703@imgtec.com>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441228505-23235-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <55F02FEC.7080703@imgtec.com>
Message-ID: <20150909154617.4c91d847@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 9 Sep 2015 14:11:08 +0100, Vicente Olivert Riera wrote:

> > +# This hook will be called before the target installation of a
> > +# package. We store in a file named .br_filelist_before the list of
> > +# files currently installed in the target. Note that the MD5 is also
> > +# stored, in order to identify if the files are overwritten.
> > +define step_pkg_size_start
> > +	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
> 
> why only "-type f"? Packages can also install other type of files such
> as links, for instance. Don't you want to track them as well?

It doesn't make sense to "md5sum" a symbolic link: what you will md5 is
the target of the link, i.e another file of the file system that is
already taken into account by the size statistics mechanism.

We are really only interested in calculating the size of the
filesystem, so the only thing of interest are real file. We assume that
the size of things like device files, directories or symbolic links is
negligible and not relevant for our analysis.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
