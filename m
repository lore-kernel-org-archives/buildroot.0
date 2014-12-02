From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 09:31:48 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-download: check hasahes for locally
 cached files
In-Reply-To: <e1cc728a60b6a250ea395ee429dba7f470b1f8a8.1417475935.git.yann.morin.1998@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <e1cc728a60b6a250ea395ee429dba7f470b1f8a8.1417475935.git.yann.morin.1998@free.fr>
Message-ID: <20141202093148.1a1f7db7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  2 Dec 2014 00:24:09 +0100, Yann E. MORIN wrote:
> In some cases, upstream just update their releases in-place, without
> renaming them. When that package is updated in Buildroot, a new hash to
> match the new upstream release is included in the corresponding .hash
> file.
> 
> As a consequence, users who previously downloaded that package's tarball
> with an older version of Buildroot, will get stuck with an old archive
> for that package, and after updating their Buildroot copy, will be greeted
> with a failed download, due to the local file not matching the new
> hashes.
> 
> So, to avoid this situation, check the hashes prior to doing the
> download. If the hashes match, consider the locally cached file genuine,
> and do not download it. However, if the locally cached file does not
> match the known hashes we have for it, it is promptly removed, and a
> download is re-attempted.

So in essence, from now on, at each build, we are re-checking the
hashes, while previously they were checked only when the file was
downloaded. Not that great for build time, but well, again maybe the
time to check the hashes is negligible compared to the build time. And
we can assume that a big tarball, which takes a certain time to hash,
will also contain a lot of source code to build, so the time to
calculate the hash is proportional to the build time of the package. So
if you're ready to spend several minutes to build Qt, you're probably
ready to wait a few more seconds to calculate the hash of the Qt
tarball each time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
