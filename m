From: Frederick Gotham <cauldwell.thomas@gmail.com>
Date: Tue, 7 Jan 2020 08:28:39 +0000
Subject: [Buildroot] Header is nine years old
In-Reply-To: <20200106213317.693ae331@windsurf>
References: <XnsAB3CA67D5979Efgotham@195.159.176.226>
 <20200106213317.693ae331@windsurf>
Message-ID: <CALtZhhMC1gi4ER0CVTAmT1dkkgOXQ_MMrTXxMAxCUPEzCX3+iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:

> "You need to give more details about the Barebox failure you're seeing"


Here's the exact output:

>>> barebox 2019.12.0 Configuring
>>> barebox 2019.12.0 Building
/opt/src/build/output/host/bin/x86_64-buildroot-linux-gnu-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
  -o /opt/src/build/output/build/barebox-2019.12.0/bareboxenv
/opt/src/build/output/build/barebox-2019.12.0/scripts/bareboxenv.c
/opt/src/build/output/build/barebox-2019.12.0/scripts/bareboxenv.c:100:10:
fatal error: linux/list.h: No such file or directory
 #include <linux/list.h>
          ^~~~~~~~~~~~~~
compilation terminated.
package/pkg-generic.mk:238: recipe for target
'/opt/src/build/output/build/barebox-2019.12.0/.stamp_built' failed
make: *** [/opt/src/build/output/build/barebox-2019.12.0/.stamp_built] Error 1


So if I then open up the file "bareboxenv.c", and navigate to line
#100, I see that it includes a load of headers. Here are the lines #93
- 122:

static char *concat_subpath_file(const char *path, const char *f)
{
	if (f && DOT_OR_DOTDOT(f))
		return NULL;
	return concat_path_file(path, f);
}

#include <linux/list.h>
#include <linux/list_sort.h>
#include "../lib/list_sort.c"
#include "../lib/recursive_action.c"
#include "../include/envfs.h"
#include "../crypto/crc32.c"
#include "../lib/make_directory.c"
#include "../common/environment.c"

static void usage(char *prgname)
{
	printf( "Usage : %s [OPTION] DIRECTORY FILE\n"
		"Load a barebox environment sector into a directory or\n"
		"save a directory into a barebox environment sector\n"
		"\n"
		"options:\n"
		"  -s        save (directory -> environment sector)\n"
		"  -z        force the built-in default environment at startup\n"
		"  -l        load (environment sector -> directory)\n"
		"  -p <size> pad output file to given size\n"
		"  -v        verbose\n",
		prgname);
}




On 1/6/20, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Frederick,
>
> On Mon, 6 Jan 2020 16:21:59 -0000 (UTC)
> Frederick Gotham <cauldwell.thomas@gmail.com> wrote:
>
>> The following header file:
>>
>>     #include <linux/list.h>
>>
>> was added to the Github for the Linux kernel in May 2011. That was 9 years
>>
>> ago.
>
> This is an internal kernel header.
>
>> So on my Buildroot setup, I navigate to this directory:
>>
>>
>> build/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux
>
> This only contains the kernel headers exposed to userspace, i.e the
> UAPI (user-space API). There is absolutely no reason for list.h to be
> in there.
>
>> And I check to see if "list.h" is in there. It's not there, and this is
>> why I
>> am unable to build the latest version of Barebox.
>>
>> Anyone got any idea why that header file isn't in there?
>
> You need to give more details about the Barebox failure you're seeing:
> which version you're trying to build, what is the build error. But the
> error is clearly not due to <linux/list.h> being missing from the
> compiler sysroot.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
