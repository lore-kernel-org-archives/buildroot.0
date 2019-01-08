From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 13:11:20 +0100
Subject: [Buildroot] [PATCH 03/11] support/download: reintroduce
 'source-check' target
In-Reply-To: <CAAXf6LUPg=c2EVEy1XWYaGd-76Lft+msBi8HpHBSmBcRGtn=cA@mail.gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-4-patrickdepinguin@gmail.com>
 <20190103211742.GC5991@scaer> <87tvipo1vq.fsf@dell.be.48ers.dk>
 <CAAXf6LUPg=c2EVEy1XWYaGd-76Lft+msBi8HpHBSmBcRGtn=cA@mail.gmail.com>
Message-ID: <CAAXf6LUsD4DTrmvMtCZP7y6=V-1DdWApuC7_ukUddYG0RJSHnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El vie., 4 ene. 2019 a las 10:07, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
> On Thu, Jan 3, 2019, 22:41 Peter Korsgaard <peter@korsgaard.com wrote:
>>
>> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>
>> Hi,
>>
>>  > But still, at some point, you will want your CI to actually test the
>>  > change, so you will need to have the stuff downloaded... So, why can't
>>  > you simply use 'make source && make' ? It would (mostly) have the actual
>>  > result you are looking for: do the check that everything is available,
>>  > and if it is, then the build can proceed. If something was missing, that
>>  > would have bailed out early.
>>
>>  > The only thing that differs with source-check, is that the network will
>>  > actually be used (boohoo!).
>>
>>  > However, since we added local cache for git, you would not need to fetch
>>  > much. Also, tarballs (from wget et al) were already cached locally. Of
>>  > course, that means you'd have to have BR2_DL_DIR in your envioronment,
>>  > pointing to a dl location that is persistent...
>>
>>  > What is missing (guess it) is a local cache for Hg. I started working on
>>  > it a while ago (rght after the git cache was merged), but dropped it as
>>  > I had no way to throughly test it.
>>
>>  > So, if you are really concerned about not exhausting your internal
>>  > network that much (I know some companies have slow links between remote
>>  > sites, so I understand [0]), what about you provide an Hg caching like
>>  > we have for git instead? ;-)
>>
>>  > So, I am definitely not convinced by the need for source-check...
>>
>> Agreed. Thomas, can you explain in more detail why you think
>> source-check is needed?
>
>
> Okay, give me some time, I will gather some numbers and a well-thought-out response :-)
>

source-check could be used with two different goals in mind:
1. to verify that sources needed for a defconfig are available, either locally
   (in BR2_DL_DIR) or on a remote location (i.e. BR2_PRIMARY_SITE, upstream, or
   BR2_BACKUP_SITE)
2. to verify that sources needed for a defconfig are available in the remote
   location (i.e. BR2_PRIMARY_SITE, upstream, or BR2_BACKUP_SITE).


If you are only interested in goal 1, one could argue that 'source-check' and
'source' are very similar except for the actual download of missing files.
Once you have a (partially) populated download directory, the impact of 'make
source' may be reasonable.

At this point there are two 'buts':
- if you start from an empty download directory, then the 'source'
target is much more
  heavyweight than 'source-check'. This could be e.g. in a CI server with
  multiple executor nodes and the job running 'make source/source-check' can be
  executed on any one of these nodes.

- if the sources of certain packages change a lot, e.g. linux kernel sources,
  then even if you have a populated download directory, there will still be
  large downloads. If these sources reside in a git repository, then repo
  caching will help a lot. For mercurial repositories caching is not currently
  implemented but could be added. For actual tarballs this problem is still
  important.


If you are (also) interested in the second goal (verify the remote presence of
all sources), then things are a bit different. In this case, you don't want to
rely on local presence of files, but exhaustively check that the sources you
need are still downloadable.
A specific variant of this use case is when you want to verify that your
BR2_PRIMARY_SITE is complete, so that you are sure you will be able to make your
builds in 10 years time even if upstream locations disappear. In this case, you
can force-set BR2_BACKUP_SITE to empty, and set an invalid proxy.
In this case, to remove reliance on local files, you would empty your existing
download directory or force a scratch location with BR2_DL_DIR. Here, 'make
source' will download all tarballs, each time you run the test.


Some data from our use case:
- we have 30 defconfigs that need to be tested
- a source-check for all defconfigs, distributed over 8 processes, takes about 3
  to 5 minutes on my machine when connected to the corporate network and forcing
  download from the primary site (which is in the same network).
- a 'make source' in the same environment as above, takes 13-14 minutes. Total
  download size when using separate dl directories per defconfig is 11 GB.
- improving the 'make source' case by sharing one dl directory for all
  defconfigs, brings down the total download size to 3 GB.
  With one process, it takes 24 minutes to handle all 30 defconfigs.
  With 8 processes, it takes 12 minutes.
  With 12 processes, it still takes about 11-12 minutes.
- our 'primary site' is accessed via scp.
- 'hg' downloads are intercepted and changed to download the archive for the
  requested version directly from the scp server, i.e. there is no actual
  clone/pull happening, the server creates the archive.


The 12 minutes do not seem very long, but this is the best-case scenario. When
the verification is done from a network not physically next to the primary site,
the download time will increase significantly.
For example, when working from home, I see an average download speed in this
test of about 500 KB/s, meaning the 3 GB download will take more than 2 hours,
while all I am interested in is the simple fact that everything is there (in
this scenario taking 15 minutes).

Other factors to consider:
- 'make source' will actually touch files on the disk. For SSD this means
  unnecessary write cycles wearing down flash sectors. For spinning hard disk
  this means impact on other hard disk I/O happening at the same time. This
  could be mitigated by using a 'tmpfs' if you have the right to create such
  mounts (which a regular user normally does not have).

- This check may happen on other nodes or in other workspaces than where the
  actual build will happen. So, a real download is not necessarily needed.
  (this is in response to a comment from Yann).

From my point of view, adding source-check does not bring many disadvantages.
It's just an additional thing people could use if it fits their needs, without
hogging network and I/O buses.

From your side, I would like to understand what exactly is causing your
reservations. Are you concerned about additional complexity, lack of testing
(which I could cover in support/testing), ... ?

Thanks,
Thomas
