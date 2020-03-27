From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:15:27 +0100
Subject: [Buildroot] [PATCH] fs/initramfs: fix show-info
In-Reply-To: <20200316215536.22090-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 16 Mar 2020 22:55:36 +0100")
References: <20200316215536.22090-1-yann.morin.1998@free.fr>
Message-ID: <877dz5fnr4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The initramfs is not a reall filesystem, so it does not use the
 > $(rootfs) infrastructure.

 > As a consequence, the usual rootfs-related variables are not set,
 > especially the name, type, and dependencies of the (non-)filesystem.

 > Yet, it is present in the list of rootfs to build, and thus we end
 > up including it in the output of show-info. But the missing variables
 > yield an incorrect json:

 >     "": {
 >         "type": "",
 >         "virtual": false,
 >         "version": "",
 >         "licenses": "",
 >         "dl_dir": "",
 >         "install_target": ,
 >         "install_staging": ,
 >         "install_images": ,
 >         "downloads": [ ],
 >         "dependencies": [ ],
 >         "reverse_dependencies": [ ]
 >     },

 > First, the object key is empty; second, the install_target,
 > install_staging, and install_images values are empty, which is not
 > valid (if they were null, that be OK though). Third, this is clearly
 > the layout of a 'package' entry, not that of a 'rootfs' entry.

 > An option to fix that would be to actually make use of the rootfs
 > infra. However, that would mean doing a lot of work for nothing
 > (there is actually nothing to do, yet the infra would still do a lot
 > of preparatory and clean up work).

 > The alternative is pretty simple: declare and set the variables as if
 > it were a real filesystem, so that show-info can filter it to the
 > proper layout and can spit out appropriate content (even if fake).

 > The third option would be to teach show-info (and its internal
 > implementation, the macro json-info) to ignore specific cases, like
 > no-name items, or replace empty values with null, or whatnots. This
 > again would be quite a lot of work for a single occurence.

 > So we go for the simple faked variables.

 > We add linux as a dependency, so that the graph-depends also properly
 > represent the dependency chain, which ends up with something liKe:

 >               ALL
 >                |
 >                v
 >         rootfs-initramfs
 >          |            |
 >          v            v
 >        linux     rootfs-cpio

 > which is pretty fitting in the end.

 > Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
