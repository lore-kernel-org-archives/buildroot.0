From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Dec 2014 13:44:41 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-download: check hasahes for locally
 cached files
In-Reply-To: <20141203185157.GG4152@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <e1cc728a60b6a250ea395ee429dba7f470b1f8a8.1417475935.git.yann.morin.1998@free.fr>
 <20141202093148.1a1f7db7@free-electrons.com>
 <20141203185157.GG4152@free.fr>
Message-ID: <20141206124441.GC9544@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-03 19:51 +0100, Yann E. MORIN spake thusly:
> On 2014-12-02 09:31 +0100, Thomas Petazzoni spake thusly:
> > On Tue,  2 Dec 2014 00:24:09 +0100, Yann E. MORIN wrote:
> > > In some cases, upstream just update their releases in-place, without
> > > renaming them. When that package is updated in Buildroot, a new hash to
> > > match the new upstream release is included in the corresponding .hash
> > > file.
> > > 
> > > As a consequence, users who previously downloaded that package's tarball
> > > with an older version of Buildroot, will get stuck with an old archive
> > > for that package, and after updating their Buildroot copy, will be greeted
> > > with a failed download, due to the local file not matching the new
> > > hashes.
> > > 
> > > So, to avoid this situation, check the hashes prior to doing the
> > > download. If the hashes match, consider the locally cached file genuine,
> > > and do not download it. However, if the locally cached file does not
> > > match the known hashes we have for it, it is promptly removed, and a
> > > download is re-attempted.
> > 
> > So in essence, from now on, at each build, we are re-checking the
> > hashes, while previously they were checked only when the file was
> > downloaded. Not that great for build time, but well, again maybe the
> > time to check the hashes is negligible compared to the build time. And
> > we can assume that a big tarball, which takes a certain time to hash,
> > will also contain a lot of source code to build, so the time to
> > calculate the hash is proportional to the build time of the package. So
> > if you're ready to spend several minutes to build Qt, you're probably
> > ready to wait a few more seconds to calculate the hash of the Qt
> > tarball each time.
> 
> I just hashed a 231MiB tarball (qt-everywhere-opensource-src-4.8.6.tar.gz)
> and it takes (wall-clock time, core-i5 @2.5GHz):
>   - cache-cold sha1  : 1.914s
>   - cache-hot  sha1  : 0.762s
>   - cache-hot  sha256: 1.270s
> 
> (cache-cold sha256 is not easily done, I'd have to either umount /home
> or reboot...)
> 
> Needless to say this is negligible when compared to the build time of Qt
> (I do not have the numbers available for now, but I doubt it would be
> less than 30 seconds on my machine).
> 
> I will add those numbers in the commit log next time I respin.

Please also note that this in fact does not change the current
behaviour. Even today, we are checking the hashes for locally cached
files, so this solution adds no overhead.

To understand why, here's a summary of what happened before and after
thise series:

    before:                         after:

    check if file is cached         check if the file is cached
    if not cached,                  if cached,
        download the file               check the hashes
    check the hashes                    if match,
                                            stop
                                        rm cached file
                                    downlaod file
                                    check hashes

So, as you can see, in case the file is already cached locally, and the
hashes match, we don't do much more than today, except the checks are
not done in the same order, which allows us to attempt a re-download in
case of hash mismatch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
