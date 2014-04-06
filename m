From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 06 Apr 2014 14:37:05 +0200
Subject: [Buildroot] [PATCH 2/2] util-linux: define mkostemp for uClibc
In-Reply-To: <20140406114505.3446f546@skate>
References: <1396776553-7064-1-git-send-email-romain.naour@openwide.fr>	<1396776553-7064-2-git-send-email-romain.naour@openwide.fr>
 <20140406114505.3446f546@skate>
Message-ID: <53414A71.5090404@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 06/04/2014 11:45, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Sun,  6 Apr 2014 11:29:13 +0200, Romain Naour wrote:
>
>> diff --git a/package/util-linux/util-linux-004-define-mkostemp-for-uClibc.patch b/package/util-linux/util-linux-004-define-mkostemp-for-uClibc.patch
>> new file mode 100644
>> index 0000000..7b49d37
>> --- /dev/null
>> +++ b/package/util-linux/util-linux-004-define-mkostemp-for-uClibc.patch
>> @@ -0,0 +1,29 @@
>> +From d339af8fdc4b28175d6986d870f6735a9c2e90a3 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@openwide.fr>
>> +Date: Sun, 6 Apr 2014 01:48:58 +0200
>> +Subject: [PATCH 1/1] c.h: define mkostemp for uClibc
>> +
>> +uclibc does not implement mkostemp GNU extension
>> +
>> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> +---
>> + include/c.h | 5 +++++
>> + 1 file changed, 5 insertions(+)
>> +
>> +diff --git a/include/c.h b/include/c.h
>> +index 4a9bf3d..3ba51c1 100644
>> +--- a/include/c.h
>> ++++ b/include/c.h
>> +@@ -300,4 +300,9 @@ static inline int usleep(useconds_t usec)
>> + # define SEEK_HOLE	4
>> + #endif
>> +
>> ++#ifdef __UCLIBC__
>> ++/* uclibc does not implement mkostemp GNU extension */
>> ++#define mkostemp(x,y) mkstemp(x)
>> ++#endif
> Thanks for the patch. However, I believe there are two problems here:
>
>   1/ mkostemp() *can* exist with uClibc: the master branch of uClibc,
>      which we use for some architectures (ARC and Xtensa) do have
>      mkostemp(). Therefore, there should instead be a test in
>      configure.ac like AC_CHECK_FUNCS([mkostemp]) and then make your
>      code conditional on #ifndef HAVE_MKOSTEMP.

Ok, I didn't notice that mkostemp() is available with latest uClibc, thanks.

>
>   2/ The other problem is that in util-linux, mkostemp is used as
>      follows:
>
>       fd = mkostemp(n, O_RDWR|O_CREAT|O_EXCL|O_CLOEXEC);
>
>      In your implementation, you discard the flags entirely, by using
>      mkstemp(). mkstemp() will pass O_RDWR|O_CREAT|O_EXCL, but not
>      O_CLOEXEC, which means that the file descriptor will no longer be
>      closed automatically upon exec(). Though, looking at
>      http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=b1fa3e2234fab95960eaa8499384000f189def13,
>      they have switched to using O_CLOEXEC with no specific reason.
>      Maybe I'm just worrying too much. But a solution might be to do
>      something like:
>
> #ifndef HAVE_MKOSTEMP
> static inline int mkostemp(char *template, int flags)
> {
> 	int fd;
> 	fd = mkstemp(template);
> 	if (flags & O_CLOEXEC && fd >= 0)
> 		fcntl(fd, F_SETFD, FD_CLOEXEC);
> 	return fd;
> }
> #endif
>
> (Completely untested, not even compiled)
>
> Don't know if we want to worry about this though.
>

I had a build failure with the toolchain used by the autobuilder:
ctng-i386-pentium4-uclibc.tar.bz2
That why I added this patch.

Patch is on the way.

Best regards,
Romain
