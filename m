From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:14:13 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/uftrace: new package
In-Reply-To: <20210423172601.127205-1-asafka7@gmail.com>
References: <20210423172601.127205-1-asafka7@gmail.com>
Message-ID: <20210423231413.69bd2a16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Fri, 23 Apr 2021 20:26:01 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The uftrace tool is to trace and analyze execution of a
> program written in C/C++.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> --
> v3->v4:
> * define unsupported options exlicitly
> * Use TARGET_MAKE_ENV instead of TARGET_CONFIGURE_OPTS
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/uftrace/Config.in    | 19 ++++++++++++++++
>  package/uftrace/uftrace.hash |  3 +++
>  package/uftrace/uftrace.mk   | 43 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 67 insertions(+)
>  create mode 100644 package/uftrace/Config.in
>  create mode 100644 package/uftrace/uftrace.hash
>  create mode 100644 package/uftrace/uftrace.mk

So I've applied, but there were a number of issues left:

 - It didn't build with uClibc or musl, due to the use of argp, which
   is a glibc-only feature. I had to add a dependency on
   argp-standalone and pass -largp in the linker flags on musl ||
   uclibc configurations.

 - On uClibc, it still wasn't building due to a <personality.h> value
   missing, and another <elf.h> value missing.

 - The --without-libstdc++ was not really appropriate, as we do have
   C++ support in Buildroot obviously.

Do not hesitate to check the final commit to make sure I didn't mess up
anything. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
