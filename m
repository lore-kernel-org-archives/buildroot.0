From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:04:53 +0100
Subject: [Buildroot] [PATCH 1/1] apr: fix size of pid_t
In-Reply-To: <20170321132356.16093-1-julien.beraud@spectracom.orolia.com>
References: <20170321132356.16093-1-julien.beraud@spectracom.orolia.com>
Message-ID: <20170321230453.6165e76d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 14:23:56 +0100, Julien Beraud wrote:
> pid_t is a signed 32bits integer on both 32bits and 64bits
> architectures.
> This fixes an issue with apache server which causes bad pid
> to be written in PidFile
> 
> Signed-off-by: Julien Beraud <julien.beraud@spectracom.orolia.com>
> ---
>  package/apr/apr.mk | 1 +
>  1 file changed, 1 insertion(+)

I've applied to our master branch, thanks! Peter, I believe this is a
good candidate for the LTS branch.

However, a few comments:

 * It is strange that their configure script does:

   APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], pid_t, 8)

   which means "assume size is 8 bytes" if cross-compiling when pid_t
   is always 4 bytes.

 * There are other sizeof that are probably bogus:

   APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], ssize_t, 8)
   APR_CHECK_SIZEOF_EXTENDED([#include <stddef.h>], size_t, 8)
   APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)

   Indeed on 32 bit systems, ssize_t, size_t are 4 bytes. off_t is an
   even more complicated beast: it's 8 bytes on 64 bits platform, but
   on 32 bits platform, it depends if large file support is enabled or
   not.

See (executed on x86-64) :

$ cat toto.c 
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>

int main(void)
{
	printf("pid_t = %ld\n", sizeof(pid_t));
	printf("size_t = %ld\n", sizeof(size_t));
	printf("ssize_t = %ld\n", sizeof(ssize_t));
	printf("off_t = %ld\n", sizeof(off_t));
	return 0;
}
$ gcc -o toto toto.c
$ ./toto
pid_t = 4
size_t = 8
ssize_t = 8
off_t = 8
$ gcc -m32 -o toto toto.c
$ ./toto 
pid_t = 4
size_t = 4
ssize_t = 4
off_t = 4
$ gcc -m32 -D_FILE_OFFSET_BITS=64 -o toto toto.c
$ ./toto 
pid_t = 4
size_t = 4
ssize_t = 4
off_t = 8

I really wonder why they are not using the regular AC_CHECK_SIZEOF()
for those types.

So I believe there's more stuff to fix in there.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
