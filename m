From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Wed, 25 Feb 2015 12:02:41 +0000
Subject: [Buildroot] [PATCH 2/2] fs: add custom fakeroot script support
In-Reply-To: <20150224213941.GB4783@free.fr>
References: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
 <1424792855-14278-2-git-send-email-stefan.sorensen@spectralink.com>
 <20150224213941.GB4783@free.fr>
Message-ID: <1424865760.2629.14.camel@e37108.spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2015-02-24 at 22:39 +0100, Yann E. MORIN wrote:

> > The scripts can for example be used to invoke a tool that operates on
> > file ownerships,
> 
> For file ownership, we already have BR2_ROOTFS_DEVICE_TABLE: "Path to
> the permission tables". The naming of the option may be a bit
> misleading, indeed, but that's historical...

As you mention yourself, bulk ownership changes are problematic with
device tables. Generating the device table in the post-build script
doesn't seem very elegant to me.

> > or any other custom action that requires
> > root privileges.
> 
> What would be those kind of "custom actions" that are not covered by the
> above?

An example could be changes to files/device nodes that are created
earlier in the script. We use it to remove /dev/console created
by /fs/cpio.mk (our image format doesn't support device nodes).

Creating a manifest file of the whole filesystem, including stuff added
by the fakeroot script, would also need to be done just before image
creation (although here there is no need for being root). 

> > +config BR2_ROOTFS_FAKEROOT_SCRIPT
> > +	string "Custom scripts to run as fake root"
> 
> I'm not very happy with talking about 'fake root' (which is really
> 'fakeroot'). I'd prefer we avoid mentionning fakeroot, which is
> internal implementation details.

I will rewrite it to not mention fakeroot.

> Note also that those scripts would be run once for each filesystem type
> the user has enabled; if tar, squashfs, cramfs and ext2/3/4 are enabled,
> the scripts would be run four times. Thus, those scripts must be
> idempotent (like for the post-build scripts, mind you).

I will add a comment to the help text.

Stefan
