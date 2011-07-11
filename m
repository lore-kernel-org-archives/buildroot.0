From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 12:23:40 +0200
Subject: [Buildroot] [PATCH] busybox: provide /etc/mdev.conf if mdev is
	used
In-Reply-To: <4E1ACBC3.7020806@lucaceresoli.net> (Luca Ceresoli's message of
 "Mon, 11 Jul 2011 12:09:07 +0200")
References: <1310140073-14231-1-git-send-email-luca@lucaceresoli.net>
 <8739igy7e9.fsf@macbook.be.48ers.dk>
 <4E1ACBC3.7020806@lucaceresoli.net>
Message-ID: <8762n9p13n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

 >> Please use install -D, and only install if the file is not already
 >> there in the rootfs.

 Luca> Will do both changes, but I'd like to better understand why this file
 Luca> should not be installed if already present, which differs from how some
 Luca> other files are installed.

 Luca> For example, S10mdev is installed just before mdef.conf (see quoted
 Luca> lined above) without -D and without checking for existence.

 Luca> Is there a general policy about this? I did not find one in the docs,
 Luca> but I might have missed it.

The general idea (which isn't followed everywhere unfortunately) is to
not enforce any policy unless we absolutely have to.

This has to be balanced against us wanting BR to work out of the box. As
an example we force enable devtmpfs if you build a kernel and have
devtmpfs /dev option enabled, as it cannot work with the kernel doesn't
have this enabled. Another example is the ARM EABI selection.

Next to these hard options, that we clearly should enforce we have a
number of places where we provide sensible defaults. This is typically
for configuration files. For those we should make it work out of the box
where possible, but still make it possible to override if the user knows
better. Historically this is done in two ways (the 1st has existed for a
very long time, the 2nd is relatively new):

- Use a custom rootfs skeleton with tweaked configuration files
- Use a post-build script to tweak configuration files

For users of the first option, we should ensure that we don't overwrite
custom configuration files, so we need to check if the file already
exists before installing.

For the init script things are a bit more complicated, as the
format/file name depends on the init implementation used. We so far
only handle this through option 2.

And yes, we should probably add this to the docs somewhere.

 Luca> Additionally, if there is a clear policy, it may be useful to have
 Luca> macros to automate it and make it verifiable, such as:

 Luca>   INSTALL_FILE = $(INSTALL) -D
 Luca>   INSTALL_DIR = $(INSTALL) -d
 Luca>   INSTALL_FOO = $(INSTALL)

 Luca> or, maybe better, macros with parameters that would be easier to use:

 Luca>   $(call install_file, $(@D)/foo.conf, 0640, etc/foo)

Yes, ptxdist does something like that. It might be interesting to do so
as well.

The install -D is just for robustness, in case the destination directory
doesn't exist yet.

-- 
Bye, Peter Korsgaard
