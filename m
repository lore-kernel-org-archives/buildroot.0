From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 29 Aug 2015 20:36:26 +0200
Subject: [Buildroot] [PATCH] package/libnspr: disable for musl toolchains
In-Reply-To: <20150829201841.227bc47d@free-electrons.com>
References: <1440870131-17263-1-git-send-email-romain.naour@openwide.fr>
 <20150829201841.227bc47d@free-electrons.com>
Message-ID: <55E1FBAA.30306@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 29/08/2015 20:18, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sat, 29 Aug 2015 19:42:11 +0200, Romain Naour wrote:
>> libnspr use getprotobyname_r() which is not available on musl.
>>
>> Also there is another error due to missing _PR_HAVE_GETHOSTBYNAME2 define:
>> prnetdb.c: In function ?PR_GetIPNodeByName?:
>> prnetdb.c:898:2: error: #error "Unknown name-to-address translation function"
>>  #error "Unknown name-to-address translation function"
>>
>> _PR_HAVE_GETHOSTBYNAME2 is only set in pr/include/md/_linux.h if __GLIBC__
>> is defined.
>>
>> To conclude, libnspr is not ready for musl.
>> Add reverse dependency on ecryptfs-utils and libnss.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/c75/c756f82dfc49611fa3f650d9cf2a71b59d23c3d0/
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Could you instead give a try to
> http://git.alpinelinux.org/cgit/aports/tree/main/nspr/fix-getproto.patch ?
> 
> Generally speaking, for musl compatibility issues, always look at
> http://git.alpinelinux.org/cgit/aports/tree/main/, it very often
> contains interesting patches.

Ha! thanks.
But for this case it's not enough...

prnetdb.c: In function ?PR_GetIPNodeByName?:
prnetdb.c:895:2: error: #error "Unknown name-to-address translation function"
 #error "Unknown name-to-address translation function"

But the packaging add some define :
http://git.alpinelinux.org/cgit/aports/tree/main/nspr/APKBUILD#n40

# ./nspr/pr/include/md/_linux.h tests only __GLIBC__ version
# to detect c-library features, list musl features here for now.
CFLAGS="$CFLAGS -D_PR_POLL_AVAILABLE -D_PR_HAVE_OFF64_T -D_PR_INET6
-D_PR_HAVE_INET_NTOP -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO
-D_PR_INET6_PROBE

It build fine if (at least) -D_PR_HAVE_GETHOSTBYNAME2 is added to CFLAGS.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
