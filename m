From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 27 Feb 2018 21:56:44 +0000
Subject: [Buildroot] [PATCH] bluez5_utils: Make systemd link correctly
In-Reply-To: <20180227213134.GD11186@scaer>
References: <20180227212131.3142-1-tpiepho@impinj.com>
 <20180227213134.GD11186@scaer>
Message-ID: <1519768604.25567.207.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-02-27 at 22:31 +0100, Yann E. MORIN wrote:
> On 2018-02-27 13:21 -0800, Trent Piepho spake thusly:
> > The link in /etc/systemd/system/, named dbus-org.bluez.service, pointing to
> > ../../../../usr/lib/systemd/system/bluetooth.service has one too many ".." in
> > it.  Likely the target was copied from the other link in
> > /etc/systemd/system/bluetooth.target.wants/, which is one level deeper.
> > 
> > Adjust link to be correct.
> > 
> > Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> However, this should not have any real problem on the target: this
> succession of '..' will eventually reach / which has its own '..'
> pointing back to itself; that is /.. points to / and so everything
> should just work as expected. Only on the build machine does that have
> an impact.
> 
> So, can you confirm that this is not fixing any runtime issue, but just
> making the symlink "less incorrect"?

Yes, it works on the target fs as the link bottoms out at /.  It just
breaks on the build machine to look at the file or if one runs a script
looking for broken symlinks after discovering all the *.wants links are
broken...
