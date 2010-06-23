From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 10:46:13 +0200
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <874ogu6vsv.fsf@macbook.be.48ers.dk>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	<87d3vi7qqq.fsf@macbook.be.48ers.dk> <20100623091224.266d1030@surf>
	<874ogu6vsv.fsf@macbook.be.48ers.dk>
Message-ID: <20100623104613.78fe0d97@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2010 09:40:48 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> As mentioned before, the problem with this is that people have
> historically expected that they can just export
> PATH=path/to/staging/usr/bin:$PATH and use the cross compiler outside
> buildroot. If you start installing target binaries into
> staging/usr/bin then this would break horrible.
> 
> (Yes, I know people should atleast append it to the path (export
> PATH=$PATH:path/to/staging/usr/bin), but people will forget and it
> used to work.

As mentionned before, adding $(STAGING_DIR)/usr/bin to the path is just
wrong. The possible solutions to this are :

 * Install the toolchain outside of $(STAGING_DIR) and then re-use what
   we do for external toolchains, and then tell people to not add
   $(STAGING_DIR)/usr/bin to their PATH, but rather the location where
   the toolchain was installed. This has the added benefit that
   $(STAGING_DIR) would not contain binaries compiled for the host,
   mixed with binaries compiled for the target.

 * Keep the toolchain binaries in $(STAGING_DIR), but create shell
   wrappers installed in another directory for the toolchain binaries,
   and tell people to add the directory where these wrappers are
   installed to their PATH.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
