From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:30:50 +0100
Subject: [Buildroot] [git commit] fs: don't use an intermediate tarball
In-Reply-To: <20181112234504.546AF82767@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 13 Nov 2018 00:47:36 +0100")
References: <20181112234504.546AF82767@busybox.osuosl.org>
Message-ID: <87in0k23j9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=409d4c3fe9949f01b009712a1a731baf597e0f8d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since 118534fe54b (fs: use a common tarball as base for the other
 > filesystems), the filesystem creation is split in two steps, using an
 > intermediate tarball to carry the generic, common finalisations to the
 > per-filesystem finalisation and image creation.

 > However, this intermediate tarball causes an issue with capabilities:
 > they are entirely missing in the generated filesystems.

 > Capabilities are stored in the extended attribute security.capability,
 > which tar by default will not store/restore, unless explicitly told to,
 > e.g. with --xattrs-include='*', which we don't pass.

 > Now, passing this option when creating and extracting the intermediate
 > tarball, both done under fakeroot, will cause fakeroot to report an
 > invalid filetype for files with capabilities. mksquashfs would report
 > such unknown files as a warning, while mkfs.ext2 would fail (with a
 > similar error message), e.g.:

 >     File [...]/usr/sbin/getcap has unrecognised filetype 0, ignoring

 > This is due to a poor interaction between tar and fakeroot; running as
 > root the exact same commands we run under fakeroot, works as expected.
 > Unfortunately, short of fixing fakeroot (which would first require
 > understanding the problem in there), we don't have much options.

 > The intermediate tarball was made to avoid redoing the same actions over
 > and over again for each filesystem to build. However, most of the time,
 > only one or two such filesystems would be enabled [0], and those actions
 > are usually pretty lightweight. So, using an intermediate tarball does
 > not provide a big optimisation.

 > The main reason to introduce the intermediate tarball, however, is that
 > it allows to postpone per-filesystem finalisations to be applied only
 > for the corresponding filesystem, not for all of them.

 > So, we get rid of the intermediate tarball, and simply move all of the
 > code to run under fakeroot to the per-filesystem fakeroot script.
 > Instead of extracting the intermediate tarball, we just rsync the
 > original target/ directory, and apply the filesystem finalisations on
 > that copy. The only thing still done in the rootfs-common step is to
 > generate the intermediate files (users file, devices file) that are used
 > in the fakeroot script.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=11216

 > Note: an alternate solution would have been to keep the intermediate
 > tarball to keep most of the common finalisations, and move only the
 > permissions to each filesystem, but that was getting a bit more complex
 > and changed the ordering of permissions and post-fakeroot scripts. Once
 > we bite the bullet of having some common finalisation done in each
 > filesystem, it's easier to just move all of them.

 > [0] Most probsably, users would enable the real filesystem to put on
 > their device, plus the 'tar' filesystem, to be able to easily inspect
 > the content on their development machine.

 > Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
