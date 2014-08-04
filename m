From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 4 Aug 2014 11:17:56 +0200
Subject: [Buildroot] [PATCH 1/1] openssh: replace individual ssh-keygen
 calls with a single call
In-Reply-To: <20140804102456.774bcea3@free-electrons.com>
References: <1407028879-2004-1-git-send-email-danomimanchego123@gmail.com>
 <20140803073726.GB4052@free.fr>
 <CANxTyt70cnBy56QgMjGSMc092fEx9O-yWwegcL6S2kRtR0dSzQ@mail.gmail.com>
 <20140804102456.774bcea3@free-electrons.com>
Message-ID: <20140804091755.GL32743@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Dear Danomi Manchego,
> 
> On Sun, 3 Aug 2014 09:25:13 -0400, Danomi Manchego wrote:
> 
> > I think this issue is not limited to openssh - there's other things
> > that want to occasionally save stuff to /etc, /var, even /root (e.g.
> > gstreamer plugins cache).  I suppose that efforts could be made to try
> > to patch/configure these locations to all be in one place (/var ?),
> > but that still assumes a writable directory.  So, unless we direct all
> > attempts to save state to a tmpfs, I think it always come back to
> > being the user's responsibility.
> > 
> > So for now I'm content to keep openssh as it is, rather than hunt down
> > all the places that might try to write to etc (, var, $HOME, ...).
> 
> Buildroot is normally supposed to support a read-only root filesystem,
> and there are already several things being done to make this possible:
> 
>  * /etc/resolv.conf is a symbolic link to /tmp/resolv.conf
>  * Most of the /var/<foo> directories are symbolic links to /tmp.
>    Only /var/lib is not.
>  * /tmp is mounted as tmpfs, so that it's read/write even if the rootfs
>    is read only.

In OpenADK is use cfgfs - configuration filesystem. It maintains
a tmpfs based /etc and let the user commit any changes via a
commandline tool to a partition on a block/mtd device.

Only changes are compressed via LZO and written to the maximum
16 MB cfgfs partition.
http://www.openadk.org/docs/html/manual.html#_cfgfs_configuration_file_system

It allows smooth updates without loosing device configuration data.

Any interest in porting it to buildroot?

best regards
 Waldemar
