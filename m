From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2018 00:48:51 +0100
Subject: [Buildroot] [PATCH 1/6 v2] fs: get over the intermediate tarball
In-Reply-To: <db238f7c62336ea63910d42ca249cb82a4e55d12.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
 <db238f7c62336ea63910d42ca249cb82a4e55d12.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <ee49be1b-aed1-8411-c173-e8304a63b528@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/11/2018 18:33, Yann E. MORIN wrote:
> Since 118534fe54b (fs: use a common tarball as base for the other
> filesystems), the filesystem creation is split in two steps, using an
> intermediate tarball to carry the generic, common finalisations to the
> per-filesystem finalisation and image creation.
> 
> However, this intermediate tarball causes an issue with capabilities,
> which are entirely missing in the generated filesystems.
> 
> Capabilties are stored in the extended attribute security.capabilti,
> which tar by default will not store/restore, unless explicitly told to,
> e.g. with --xattrs-include='*', which we don't pass.
> 
> Now, passing this option when creating and extracting the intermediate
> tarball, both done under fakeroot, will cause fakeroot to report an
> invalid filetype for files with capabilities. mksquashfs would report
> such unknown files as a warning, while mkfs.ext2 would fail (with a
> similar error message), e.g.:
> 
>     File [...]/usr/sbin/getcap has unrecognised filetype 0, ignoring
> 
> This is due to a poor interaction between tar and fakeroot; running as
> root the exact same commands we run under fakeroot, works as expected.
> Unfortunately, short of fixing fakeroot (which would first require
> understanding the problem in there), we don't have much options.
> 
> The intermediate tarball was made to avoid redoing the same actions over
> and over again for each filesystem to build. However, most of the time,
> only one or two such filesystems would be enabled [0], and those actions
> are usually pretty lightweight. So, using an intermediate tarball does
> not provide a big optimisation.
> 
> What is interesting in the intermediate tarball, however, is that it
> allowed to postpone per-filesystem finalisations to be applied only for
> the corresponding filesystem, not for all of them.
> 
> So, we get rid of the intermediate tarball, and simply move all of the
> code to run under fakeroot to the per-filesystem fakeroot script.
> Instead of extracting the intermediate tarball, we just rsync the
> original target/ directory, and apply the filesystem finalisations on
> that copy.
> 
> Fixes: #11216

 A full URL is more convenient to find it back. So I changed that, as well as
some spelling fixes, and applied to master, thanks.

 Regards,
 Arnout

> 
> Note: an alternate solution would have been to keep the intermediate
> tarball to keep most of the common finalisations, and move only the
> permissions to each filesystem, but that was getting a bit more complex
> and changed the ordering of permissions and post-fakeroot scripts. Once
> we bite the bullet of having some common finalisation done in each
> filesystem, so move all of them.
> 
> [0] Most probsably, users would enable the real filesystem to put on
> their device, plus the 'tar' filesystem, to be able to easily inspect
> the content on their development machine.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> diff --git a/fs/common.mk b/fs/common.mk
