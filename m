From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2013 08:44:31 +0200
Subject: [Buildroot] legal-info: multiple licenses separator
In-Reply-To: <CAAXf6LWnzyTKyt-b7qUxY=bJOYyaDkVMN60K9-eqRV6MC7B72g@mail.gmail.com>
References: <CAAXf6LXusXB0QSG_EHOv8VpcEY+mpuUeW-pvnXtWNUrFfb_0Kg@mail.gmail.com>
 <52555A15.3030504@lucaceresoli.net>
 <CAAXf6LWnzyTKyt-b7qUxY=bJOYyaDkVMN60K9-eqRV6MC7B72g@mail.gmail.com>
Message-ID: <52564CCF.4000609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 15:55, Thomas De Schampheleire wrote:
> Hi Luca,
>
> On Wed, Oct 9, 2013 at 3:28 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
>>> I think that if we accept the comma in FOO_LICENSE, we should replace
>>> the separator in the manifest with something else, for example a
>>> semicolon ; which would not typically appear in any of the other
>>> fields.
>>
>>
>> I'm OK with this change. Before that we'll have to fix a few packages
>> though.
>>
>> At a quick analysis it seems we have 7 packages with ';' in their _LICENSE:
>>
>>    $ git grep -E '_LICENSE[^_].*;' -- package/  | wc -l
>>    7
>>    $
>>
>> And one of them has both ';' and ',':
>>
>>    $ git grep -hE '_LICENSE[^_].*;' -- package/|grep ,
>>    NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses
>> (Bundled components)
>>    $
>
> Damn :)
>
> Here are the ; ones, with a proposed change:
>
> package/lttng-babeltrace/lttng-babeltrace.mk
> -LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2 for include/babeltrace/list.h;
> GPLv3+ for formats/ctf/metadata/ctf-parser.h
> +LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2 (include/babeltrace/list.h),
> GPLv3+ (formats/ctf/metadata/ctf-parser.h)
>
> package/nodejs/nodejs.mk
> NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses
> (Bundled components)
>
> package/redis/redis.mk
> REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
>
> These two are the mixed case, not sure what the best way is. Maybe use -- ?
>
> package/lttng-tools/lttng-tools.mk
> -LTTNG_TOOLS_LICENSE = GPLv2; LGPLv2.1 for include/lttng/* and
> src/lib/lttng-ctl/*
> +LTTNG_TOOLS_LICENSE = GPLv2, LGPLv2.1 (include/lttng/, src/lib/lttng-ctl/)
>
> package/lttng-modules/lttng-modules.mk
> -LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for
> lib/bitfield.h and lib/prio_heap/*
> +LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT
> (lib/bitfield.h, lib/prio_heap/)
>
> package/liburcu/liburcu.mk
> -LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few
> source files listed in LICENSE
> +LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (a few source files
> listed in LICENSE)
>
> package/lttng-libust/lttng-libust.mk
> -LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
> +LTTNG_LIBUST_LICENSE = LGPLv2.1, GPLv2 (lttng-gen-tp, ust-ctl)

  I thought you wanted to avoid commas? :-)  Anyway, I disagree with your 
cut argument: cut -d \" -f 6 should do the trick for you.

  If we are formalizing this more, then I'd like to point out that we in 
fact need three types of separators:

* between different components (e.g. core vs. bundled components in the 
nodejs example above);

* between different licenses that all apply to a single component 
(usually because they reuse source code from different sources, cfr. 
tcpdump);

* between different licenses that the user can choose for a single component.


  The distinction between the first two is a little bit vague. I think 
for buildroot, the important aspect is if they can still be part of 
separate programs once we've installed the package on the target. 
Concretely: it's a separate component if it's installed as a separate 
library in staging.


  However, perhaps we should take a step back on the legal info ofr a 
minute. Considering the number of corrections we have to make to it, and 
taking into account that we never check if it's still valid after version 
bumps, I wonder how useful our license manifest really is. In the end, 
your legal department will still need to check the correctness of the 
license information... Collecting the sources and the LICENSE_FILES _is_ 
really useful, but the specified licenses are only indicative. So I 
wouldn't spend too much time on formalizing it.


  Also, if we're going to formalize it more, perhaps we should consider 
moving to a real formal specification, e.g. spdx. That may make if 
possible in the future that a tool can at least verify the license 
information we provide.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
