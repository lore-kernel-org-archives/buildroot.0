From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sat, 11 Apr 2020 09:41:47 -0400
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <20200411103950.4a21b23e@windsurf.home>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
 <20200411103950.4a21b23e@windsurf.home>
Message-ID: <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 11, 2020 at 4:39 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 11 Apr 2020 10:12:32 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > People (and scritps) who want to report on the build progress, now know
> > where and what to look for (build directory and stampfiles), but they
> > also need to know the ordering of those stampfiles.
> >
> > The stampfiles item is a dictionary; dictionaries are guaranteed to not
> > be ordered, so even if we output the stampfiles in order, we can expect
> > users of that dictionary to get them back in order.
> >
> > Expose the build steps in a list, which is guaranteed to be ordered.
> >
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Vadim Kochan <vadim4j@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: eeppeliteloop at gmail.com
> > ---
> >  package/pkg-utils.mk | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
>
> Meh, just like PATCH 6/8, I'm not sure. This is going to be a lot of
> additional information in the JSON, almost duplicated for every
> package, and there is really nothing bad in the "progress showing" tool
> to have knowledge about these steps. It's not like they are changing
> all the time.

Replying for patch 6/8 and this one.

Is the `show-info` target considered a public API? If so, without a
version, it means it can never break. So let me suggest another layout
which breaks `show-info` (name it `show-info-2` if you will).

Output example (using YAML only for clarity here):

    version: 2
    build_steps:
      target:
        - name: download
          stamp_file: .stamp_downloaded
        - name: extract
          stamp_file: .stamp_extracted
        - name: patch
          stamp_file: .stamp_patched
        - name: build
          stamp_file: .stamp_configured
        - name: configure
          stamp_file: .stamp_built
        - name: install_staging
          stamp_file: .stamp_staging_installed
        - name: install_target
          stamp_file: .stamp_target_installed
        - name: install_image
          stamp_file: .stamp_image_installed
        ...
      host:
        - ...
      rootfs:
        - ...
    packages:
      target:
        libglib2:
          virtual: false
          version: 2.64.1
          licenses: LGPL-2.1+
          dl_dir: libglib2
          downloads:
            - source: glib-2.64.1.tar.xz
              uris:
                - http+http://ftp.gnome.org/pub/gnome/sources/glib/2.64
                - http|urlencode+http://sources.buildroot.net/libglib2
                - http|urlencode+http://sources.buildroot.net
          overriden: false
          build_dir: build/libglib2-2.64.1/
          build_steps:
            - download
            - extract
            - patch
            - build
            - configure
            - install_staging
            - install_target
          dependencies:
            - host-libglib2
            - host-meson
            - host-pkgconf
            - host-skeleton
            - host-tar
            - libffi
            - pcre
            - skeleton
            - toolchain
            - zlib
          reverse_dependencies:
            - cairo
        ...
      host:
        ...
      rootfs:
        ...

So, changes:

* A root `version` entry indicates the API version.

* The root `build_steps` object indicates all the _possible_ (sorted)
  build steps for each package type.

  Each build step in the array has its name and its corresponding
  stamp file to indicate when it's completed.

  As Yann wrote:

  > However, the names of those stamp files are purely an implementation
  > detail (even if they are very unlikely to ever change).

* The root `packages` object contains the package information for each
  package type.

  Not strictly related to this patch or the previous one, but instead
  of repeating the type in each object, you can just group packages
  by type.

* For each package object, the `build_steps` array indicate what are the
  build steps for this package.

  Each item is the name of a build step in the corresponding root
  `build_steps` object's array.

* For a target package, the `install_staging`, `install_target`, and
  `install_images` entries are removed.

  They are not needed anymore because `build_steps` offers the same
  information.

  I understand some build steps could be implicit and not listed here,
  but with my suggestion, you already have what's needed for any build
  monitoring tool to watch a specific package build process if:

  * Some of the implicit build steps become optional in the future for
    any reason that you don't know now.

  * You add new types of build steps: simply describe them in the
    `build_steps` root arrays.

  Both scenarios won't require an API version bump.

If you're not willing to break `show-info` and don't want `show-info-2`,
then you can:

* Keep `show-info` as is:

  * Augment a package information with `build_steps` (like above).

  * Keep the `install_*` entries which become redundant.

* Have another make target, say `show-build-steps`, which only prints
  the root `build_steps` object above.

What do you think?

Phil

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
