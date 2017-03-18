From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 16:15:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-17
In-Reply-To: <20170318072841.AF04B20775@mail.free-electrons.com>
References: <20170318072841.AF04B20775@mail.free-electrons.com>
Message-ID: <124f5fc5-6307-f72f-f1be-8f2139dffced@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-03-17 08:28, Thomas Petazzoni wrote:
> microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/240cfb0497b1dd7b5b33b8f64635cca435d49f05

 I looked at this one and I'm a bit stumped. This is the error:
.../sysroot/usr/lib/libc.a(clnt_simple.os): In function `callrpc':
(.text+0x0): multiple definition of `callrpc'
.../sysroot/usr/lib/libtirpc.a(libtirpc_la-rpc_soc.o):(.text+0x784): first
defined here
(and many more like that).

 It's a bit weird that this object file from the C library even gets linked in.
The Map file says:

.../sysroot/usr/lib/libc.a(rpc_thread.os)
	.../sysroot/usr/lib/libc.a(cancel.os) (__rpc_thread_destroy)
(skipping a few levels of indirection here).

 So somehow the pthread library is pulling in the RPC support from uClibc, which
obviously conflicts with tirpc.

 The weird thing is that other packages using libtirpc *don't* fail, e.g. argus.
Hm, looks like that one links against libtirpc but doesn't actually use any of
its symbols...

 Waldemar, any idea?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
