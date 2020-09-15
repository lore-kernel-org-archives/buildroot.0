From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 15 Sep 2020 16:15:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-10
In-Reply-To: <20200911212322.GC10548@scaer>
References: <20200911070826.658B8868D9@whitealder.osuosl.org>
 <38c1b78d-82f6-2d50-a60f-eb6a161d22f8@heine.tech>
 <20200911101547.77832bc9@windsurf.hq.k.grp> <20200911122734.GY14354@scaer>
 <1f704b79-d506-698e-38c3-8d4ee1146802@heine.tech>
 <20200911142131.GA10548@scaer>
 <5136b645-f8c9-36f5-5dbc-eeba060cba30@heine.tech>
 <20200911212322.GC10548@scaer>
Message-ID: <7d7c68e8-4562-ed9d-fb61-b96ad67af2ff@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All
On 11.09.2020 23:23, Yann E. MORIN wrote:
> Micheal, All,
> 
> On 2020-09-11 23:12 +0200, Michael Nosthoff spake thusly:
>>>>>>> On 11.09.2020 09:08, Thomas Petazzoni wrote:
>>>>>>>>   mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e |

>>
>> When I change the compiler flag to -pthread I suddenly get a working program
>> on ubuntu.
> 
> Whoa! Great investigation! ?

The short version. This patch fixes the issue building on ubuntu 14.04:

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 2114f98e40..ef76bc1ae2 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -70,7 +70,8 @@ HOST_GRPC_CONF_OPTS = \
        -DgRPC_RE2_PROVIDER=package \
        -DgRPC_SSL_PROVIDER=package \
        -DgRPC_ZLIB_PROVIDER=package \
-       -DgRPC_ABSL_PROVIDER=package
+       -DgRPC_ABSL_PROVIDER=package \
+       -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS) -Wl,--no-as-needed
-pthread"

 $(eval $(cmake-package))
 $(eval $(host-cmake-package))


Long answer:

Basically one of the issues you sent me already contains the explanation
and the fix [0]. LTO throws away the linked pthreads and the internal,
(in gcc 4.8) broken threading stubs are used.

So additionally to what I already found out last week the flag
-Wl,--no-as-needed needs to be passed to the linker before -pthread to
disable LTO.


Remaining question: is there a sensible way to limit this patch to
failing gcc versions/distributions? How do we go further with this?


Regards,
Michael

[0]
https://github.com/protocolbuffers/protobuf/issues/5923#issuecomment-633734600
