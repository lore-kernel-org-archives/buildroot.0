From: Charles Turner <cturner@igalia.com>
Date: Tue, 10 Mar 2020 13:42:36 +0000
Subject: [Buildroot] [PATCH 2/2] board/raspberrypi: add post-image
 option for VC4 overlay.
In-Reply-To: <20200310135825.1f3caf9b@gmx.net>
References: <20200310112227.16175-1-cturner@igalia.com>
 <20200310112227.16175-2-cturner@igalia.com>
 <20200310135825.1f3caf9b@gmx.net>
Message-ID: <1cfe5fe726340aadd21149cfebcb6b996a34606c.camel@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> On Tue, 10 Mar 2020 11:22:27 +0000, Charlie Turner <
> cturner at igalia.com> wrote:
> 
> > It is often necessary to add a device tree overlay for the VC4 V3D
> > driver. On a Raspberry Pi 4 for example, if you enable the Gallium
> > VC4
> > Mesa driver, you must add dtoverlay=vc4-fkms-v3d to the kernel
> > command
> > line for it to work correctly. There are times when adding vc4-kms-
> > v3d
> > is also required. This option allows post-image scripts to add
> > either
> > option conveniently depending on their specific configuration.
> 
> There where already some attempts for this (or similar) feature
> enhancement
> (see [1], [2]), but maybe it is more stuff for an real custom setup
> (to keep
> the buildroot minimal approach)?

[2] references [a] and [b]. [a] is a series implementing a lot of what
I considered good ideas, and [b] is the review mail which concludes
with,

"Again, my position is that, if one's project/hobby/... needs a custom
linux/uboot/firmware/etc... config file, then one should handle it
locally, using the files in Buildroot as inspiration."
   -- Yann E. MORIN.

In my specific case, I felt buildroot could feasibly deduce from my
selection of the VC4 gallium driver, that on the pi 4 I needed the FKMS
overlay. It took me a lot of research to figure that out, and while I'm
grateful to have learned new things, it does seem a bit unnecessary to
omit its addition.

OTOH, doing this correctly in all possible configurations is an
overwhelming thought for me, so I do sympathise with the approach of
not trying to ship a half-baked solution and instead letting users with
specific needs decide their configuration, which obviously is going to
require expertise with their target platform. The problem is we've
already kinda sorta got defaults logic in the post-image script. If we
took Yann's philosophy more seriously perhaps there should be no
config.txt provided at all...

From the "partial solutions are confusing" line of reason I'm inclined
to withdraw this patch.

[a] 
http://lists.busybox.net/pipermail/buildroot/2019-January/241809.html
[b] 
http://lists.busybox.net/pipermail/buildroot/2019-February/242704.html

> > @@ -36,6 +36,18 @@ __EOF__
> >  		gpu_mem="${arg:2}"
> >  		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i
> > "${BINARIES_DIR}/rpi-firmware/config.txt"
> >  		;;
> > +		--vc4-modesetting-overlay=*)
> 
> Call the option simple add-vc4-fkms-v3d-overlay for 'vc4-fkms-
> v3d.dtb', or make
> it completely generic?

As above I'm inclined to withdraw the patch. If I were to have
continued, after reading your references I would take the approach of
providing a general --config-txt-option=foo=bar option instead of
special casing what I needed in the moment.

B.R
	Charlie.
