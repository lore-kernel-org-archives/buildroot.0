From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Nov 2019 08:07:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: proper fix
 for missing __kernel_fsid_t
In-Reply-To: <20191114213050.GF26360@scaer>
References: <20191114200219.1568-1-petr.vorel@gmail.com>
 <20191114213050.GF26360@scaer>
Message-ID: <20191115070741.GA23489@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> Petr, All,

> On 2019-11-14 21:02 +0100, Petr Vorel spake thusly:
> > Backported 3 fixes from upstream (2 of them require calling autoreconf.

> > Fixes: http://autobuild.buildroot.net/results/7a29e3b767e3d23dd64c130daa735ca6c062baf8

> Sorry, but that does not seem to be enough to properly fix the build
> above. I got this when testing locally:

> In file included from fanotify13.c:28:
> fanotify13.c: In function ?setup_marks?:
> fanotify.h:147:41: error: ?lapi_fsid_t? {aka ?struct <anonymous>?} has no member named ?__val?; did you mean ?val??
>  # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
>                                          ^~~~~
> fanotify13.c:133:7: note: in expansion of macro ?FSID_VAL_MEMBER?
>       !FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
>        ^~~~~~~~~~~~~~~
> fanotify.h:147:41: error: ?lapi_fsid_t? {aka ?struct <anonymous>?} has no member named ?__val?; did you mean ?val??
>  # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
>                                          ^~~~~
> fanotify13.c:134:7: note: in expansion of macro ?FSID_VAL_MEMBER?
>       !FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
>        ^~~~~~~~~~~~~~~

> If you look carefully, I have the exact inverse problem as reported in
> one of the patches, below: confusion between 'val' and '__val'...
Sorry for wrong patch.
I got the same problem testing RISCV on musl.
It's strange, because ./utils/test-pkg didn't report any error.
(br-arm-cortex-a9-musl, br-i386-pentium-mmx-musl and br-x86-64-musl).
Maybe not building dependencies, which can change something? (libtirpc,
musl-fts, musl-compat-headers?) Or is it the build same for in-tree build and
default build via ./utils/test-pkg?

FSID_VAL_MEMBER() was supposed to select right on, through autotools.
Code looks pretty obvious [1], but the detection went wrong (__fsid_t has __val[2]):

include/config.h
/* Define to 1 if `fsid.__val' is a member of `struct
   fanotify_event_info_fid'. */
#define HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL 1

../musl-1.1.24/include/sys/statfs.h
typedef struct __fsid_t {
	int __val[2];
} fsid_t;

config.log
configure:5536: checking for struct fanotify_event_info_fid.fsid.__val
configure:5536: /src/buildroot/output/host/bin/riscv64-buildroot-linux-musl-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -I/src/buildroot/output/host/bin/../riscv64-buildroot-linux-musl/sysroot/usr/include/tirpc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE conftest.c >&5
configure:5536: $? = 0
configure:5536: result: yes

I wonder if the problem is somewhere at tirpc headers, but found just single
typedef.
../host-libtirpc-1.1.4/tirpc/rpc/types.h:typedef __fsid_t fsid_t;

So I need to look into it again.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/commit/0498fc0a812e53040a9527f7343089b8b1aa70a7
