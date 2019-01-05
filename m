From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Fri, 4 Jan 2019 17:53:04 -0700
Subject: [Buildroot] [PATCH 1/2 v3] core: make symlinks relative when
 preparing the SDK
In-Reply-To: <20181226222135.4ef03363@windsurf>
References: <cover.1545491919.git.yann.morin.1998@free.fr>
 <9f4825baa7a475b4d8f262925e1ff652b31cd6fb.1545491919.git.yann.morin.1998@free.fr>
 <20181226222135.4ef03363@windsurf>
Message-ID: <CA+1k=2YqfmD2cYMHGTnFjW13A51Ki+2dMp96Y+9HGyo2z4qP+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 26, 2018 at 2:21 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 22 Dec 2018 16:18:51 +0100, Yann E. MORIN wrote:
> > The SDK is supposed to be relocatable, so symlinks must not be
> > absolute.
> >
> > Add a new helper script, that replaces all absolute symlinks with
> > relative ones.
>
> This script is really not trivial. This additional complexity raises a
> simple question: how many packages install such absolute symlinks?

That was actually a good question.  I did a build where I turned on
some 450+ random packages (estimated by counting the folders in build/
other than host-* folders).  I encountered the following absolute
links:
iptables - 1 absolute symlink (sysroot/usr/bin/iptables-xml ->
/usr/sbin/xtables-multi)
ntfs-3g - 2 absolute symlinks (sysroot/sbin/mount.ntfs-3g ->
/usr/bin/ntfs-3g  and  sysroot/sbin/mount.lowntfs-3g ->
/usr/bin/lowntfs-3g)
fontconfig - 16 absolute symlinks (sysroot/etc/fonts/conf.d/* ->
/usr/share/fontconfig/conf.avail/*)
And then not in my build, but pointed out by someone on a previous
email thread, the eudev package produces 1 absolute symlink

I could dump my actual config somewhere if desired.

> Should we instead detect such absolute symlinks, and use that to fix
> the problematic packages ?
>
> I am not saying at all that the approach of fixing all symlinks is
> wrong, but I'd like to see a proper discussion on the balance between
> fixing the problematic packages vs. taking the "brutal" approach of
> this new fix-symlinks script.

So with such a small amount of absolute symlinks so far, and all of
them being for things we generally don't care about in the SDK, then
perhaps just check for absolute symlinks in a whitelist of areas like
/lib (or perhaps blacklist areas like /etc or /usr/bin).  Error out on
an absolute symlink in the spots we care about, and fix that upstream?

The thought behind the whitelist/blacklist as I understand it is
because I tried fixing iptables and eudev, but did it incorrectly.
The discussion on my eudev change [1] makes it sound a bit harder to
solve (relies on ln command supporting "-r" which may not be
everywhere), but being a link we don't care about in the SDK, we could
just ignore it with a whitelist/blacklist.

[1] https://github.com/gentoo/eudev/pull/165




>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
