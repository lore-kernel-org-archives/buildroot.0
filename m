From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 1 Jun 2020 06:32:06 -0500
Subject: [Buildroot] make sdk - relocate - ccache not working as expected
In-Reply-To: <2b30abbf-41ab-253e-0c91-6bb6cf5e36a5@jcz.nl>
References: <2b30abbf-41ab-253e-0c91-6bb6cf5e36a5@jcz.nl>
Message-ID: <CANQCQpYLf0veHYzjNeYcq3_FdTF+4ig85YbNq5RVJvyaqKL0pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jaap,

On Sat, May 30, 2020 at 11:15 AM Jaap Crezee <jaap@jcz.nl> wrote:
>
> Hello all,
>
>
>
> I am using a Buildroot generated (make sdk; 2020.02) toolchain which I use on different
> computers and I run into a problem where ccache keeps using the orignal temporary location
> for the ccache cache, despite having ran sdk-relocate.sh:
>
>
> Relocating the buildroot SDK from
> /data/work/jcz/git/jidiot/clients/demo_rpi/buildroot_initramfs/output/host to
> /var/lib/jenkins/workspace/argets_Demo_rpi_feature_rpi_zero/toolchain/ext ...
> ...
> ccache: error: Failed to create directory
> /data/work/jcz/git/jidiot/clients/demo_rpi/.cache/cc/tmp: Permission denied
>
>
> Is this a known problem? If not, how to proceed?
>

The ccache callback's path is compiled into the toolchain-wrapper, so
you'd have to disable ccache and do a clean build before doing the
make sdk.  Or set the BR_NO_CCACHE=1 environment variable when using
your sdk.  Something I've done in my sdk exports is adjust the
toolchain wrapper before running make sdk. Here's an untested example
of something you could add to your post build script or adjust the
tarball to have this change after make sdk runs.

       if [ ! -f "${BASE_DIR}/host/bin/buildroot-toolchain-wrapper" ]; then
        cp "${BASE_DIR}/host/bin/toolchain-wrapper"
"${BASE_DIR}/host/bin/buildroot-toolchain-wrapper"
        cat <<-EOF >"${BASE_DIR}/host/bin/toolchain-wrapper"
                #!/bin/bash
                # Disable Buildroot's ccache callback
                dir="\$(dirname "\$0")"
                BR_NO_CCACHE=1 exec -a "\$0"
"\$dir/buildroot-toolchain-wrapper" "\$@"
        EOF
        chmod +x "${BASE_DIR}/host/bin/toolchain-wrapper"
       fi

Best Regards,
Matt
