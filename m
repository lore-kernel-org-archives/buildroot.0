From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 12 Jun 2019 10:39:18 +0200
Subject: [Buildroot] [PATCH 0/4] Sanetize packages version
In-Reply-To: <20190612092624.1ca7836d@windsurf>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612092624.1ca7836d@windsurf>
Message-ID: <627e16bb-a937-a00e-7d03-7373c69433ca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jun 2019 09:26 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I guess an example of this is the "at" package, which has:
> 
> AT_VERSION = release/3.1.23
> AT_SITE = https://salsa.debian.org/debian/at.git
> AT_SITE_METHOD = git
> 
> but we would probably want the version to be just "3.1.23", like is
> tracked at https://release-monitoring.org/project/127/.
> 
> So indeed, I see two possible directions here:
> 
>  (1) Keep the <pkg>_VERSION semantic as it is today, and add a separate
>      <pkg>_UPSTREAM_VERSION variable (or some other name) that holds the
>      upstream version. This would give:
> 
>      AT_UPSTREAM_VERSION = 3.1.23
>      AT_VERSION = release/$(AT_UPSTREAM_VERSION)
> 
>      With this, no need to change anything in the package
>      infrastructure, we just need <pkg>_UPSTREAM_VERSION be extracted
>      by support/scripts/pkg-stats, which is can trivially do instead of
>      extracting <pkg>_VERSION.
> 
>      This approach also has the advantage that the name of the tarballs
>      stored on disk doesn't change, which means all the DL_DIR contents
>      + sources.b.o content remain identical.
> 
>      Of course, the package infrastructure defines
>      <pkg>_UPSTREAM_VERSION to <pkg>_VERSION if there's no
>      <pkg>_UPSTREAM_VERSION value defined for a given package.
> 
>  (2) As suggested by Victor, add a separate variable that tells the Git
>      download logic what is the actual tag/version to fetch, i.e:
> 
>     AT_VERSION = 3.1.23
>     AT_GIT_COMMIT = release/$(AT_UPSTREAM_VERSION)
> 
> Perhaps option (1) is the easiest ? But it has the drawback that
> <pkg>_VERSION doesn't contain just the actual version, but like we do
> today, some possibly semi-random stuff in addition to the version (like
> "release/1.2.3" or "foo-1.2.3).

Changing the version variable does not impact the archive name inside
the DL_DIR. For these packages the tarball name is the one specify in
the <pkg>_SOURCE variable which stay the same after the patch.

In contrast, all github fetched packages are impacted by changing the
<pkg>_VERSION variable and as you point out, this cause a re-download on
client side (on the server side we could use hardlinks so the disk-space
is not impacted). I would add that it also impact the hash file that
needs to match the new archive name.

>> Also, there are a few packages that use the <pkg>_VERSION variable to store
>> more than just the version. For example gap-madam-bin-maxi have a suffix
> 
> I don't see a gap-madam-bin-maxi package in Buildroot. I am missing
> something ?

Oupsy, I don't know what appended here, I meant the gpu-amd-bin-mx51
subpackage of freescale-imx which is suffixed by either "-fb" or "-x11".

>> A last case I found is the case of Kodi. Kodi's major versions have a
>> codename in addition to the version number (eg. 18.2 "Leia" or 17.3 "Krypton").
>> This codename may or not be consider as an inherent part of the version. I
>> would tend to consider this as part of the version and keep it as a version
>> suffix for all kodi-related packages as it is currently.
> 
> Kodi has two different entries in release-monitoring.org:
> 
>  https://release-monitoring.org/project/5511/, which has only the
>  version, but seems to be outdated
> 
>   https://release-monitoring.org/project/20547/, which has the version
>   + codename, and seems to be updated
> 
> So it looks like we should use the second one, and therefore keep the
> code name ?

The second entry was not originally present. I added it myself because
as you say the first one is pretty outdated. I preferred add a new entry
rather than edit the existing one because the version scheme changed
(this is now using the github repo) and could break one of the multiple
disto that already map kodi.


Best regards,
Victor

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
