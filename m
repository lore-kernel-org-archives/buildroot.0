From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 00:19:04 +0200
Subject: [Buildroot] [PATCH] fs/ext2: further fix to the UUID
In-Reply-To: <1369779097-28915-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 29 May 2013 00:11:37 +0200")
References: <1369779097-28915-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8738t69293.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Turned out that setting a nil-UUID is no better than clearing it.

 Yann> What currently happens is as follows:
 Yann>   - first, genext2fs does not generate a UUID
 Yann>   - then we tune2fs to upgrade the filesystem
 Yann>   - then we run fsck, which generates a random UUID
 Yann>   - then we re-run tune2fs to set a nil-UUID

 Yann> So, on the target, if the file system is improperly unmounted (eg.
 Yann> with a power failure), on next boot, fsck may be run, and a new
 Yann> random UUID will be generated.

 Yann> *However*, fsck improperly updates the filesystem when it adds the
 Yann> UUID, and there are a few group descriptor checksum errors.

 Yann> Those errors will go undetected until the next fsck, which will then
 Yann> block for user input (bad on embedded systems, bad).

 Yann> Fix that by systematically generating a random UUID _before_ we call
 Yann> to fsck.

 Yann> A random UUID is not so bad, after all, since there are already so
 Yann> many sources of unpredictability in the filesystem: files date and
 Yann> ordering, files content (date, paths...) which renders a fixed UUID
 Yann> unneeded.

 Yann> And it is still possible to set the UUID in a post-image script if
 Yann> needed, anyway.

Committed, thanks.

-- 
Bye, Peter Korsgaard
