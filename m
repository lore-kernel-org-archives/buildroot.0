From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 15:55:49 +0200
Subject: [Buildroot] legal-info: multiple licenses separator
In-Reply-To: <52555A15.3030504@lucaceresoli.net>
References: <CAAXf6LXusXB0QSG_EHOv8VpcEY+mpuUeW-pvnXtWNUrFfb_0Kg@mail.gmail.com>
 <52555A15.3030504@lucaceresoli.net>
Message-ID: <CAAXf6LWnzyTKyt-b7qUxY=bJOYyaDkVMN60K9-eqRV6MC7B72g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Wed, Oct 9, 2013 at 3:28 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:

>> I think that if we accept the comma in FOO_LICENSE, we should replace
>> the separator in the manifest with something else, for example a
>> semicolon ; which would not typically appear in any of the other
>> fields.
>
>
> I'm OK with this change. Before that we'll have to fix a few packages
> though.
>
> At a quick analysis it seems we have 7 packages with ';' in their _LICENSE:
>
>   $ git grep -E '_LICENSE[^_].*;' -- package/  | wc -l
>   7
>   $
>
> And one of them has both ';' and ',':
>
>   $ git grep -hE '_LICENSE[^_].*;' -- package/|grep ,
>   NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses
> (Bundled components)
>   $

Damn :)

Here are the ; ones, with a proposed change:

package/lttng-babeltrace/lttng-babeltrace.mk
-LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2 for include/babeltrace/list.h;
GPLv3+ for formats/ctf/metadata/ctf-parser.h
+LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2 (include/babeltrace/list.h),
GPLv3+ (formats/ctf/metadata/ctf-parser.h)

package/nodejs/nodejs.mk
NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses
(Bundled components)

package/redis/redis.mk
REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)

These two are the mixed case, not sure what the best way is. Maybe use -- ?

package/lttng-tools/lttng-tools.mk
-LTTNG_TOOLS_LICENSE = GPLv2; LGPLv2.1 for include/lttng/* and
src/lib/lttng-ctl/*
+LTTNG_TOOLS_LICENSE = GPLv2, LGPLv2.1 (include/lttng/, src/lib/lttng-ctl/)

package/lttng-modules/lttng-modules.mk
-LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for
lib/bitfield.h and lib/prio_heap/*
+LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT
(lib/bitfield.h, lib/prio_heap/)

package/liburcu/liburcu.mk
-LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few
source files listed in LICENSE
+LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (a few source files
listed in LICENSE)

package/lttng-libust/lttng-libust.mk
-LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
+LTTNG_LIBUST_LICENSE = LGPLv2.1, GPLv2 (lttng-gen-tp, ust-ctl)

Best regards,
Thomas
