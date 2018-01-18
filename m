From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 18 Jan 2018 10:34:14 -0800
Subject: [Buildroot] [PATCH] xen: bump to version 4.9.1
In-Reply-To: <CANQCQpZgh5MVL98xyPtv6wArQ0J=BwybXFj0qOBKBf_8CpLH2Q@mail.gmail.com>
References: <20180114224711.25133-1-peter@korsgaard.com>
 <CANQCQpayJkVAxWQS_42y+o3b-TJ5P5EVFzoz5cOcwmcsLTZJYA@mail.gmail.com>
 <87po69yf9e.fsf@dell.be.48ers.dk>
 <CANQCQpaWOWy86JmBYgaooiOmwhh_+nHVU=roOV6-jfOmu8qhKA@mail.gmail.com>
 <87bmhrdspx.fsf@dell.be.48ers.dk>
 <CAKmqyKPg=e5TPN20nCe4kkqv1nt=CnRcR2qTBq_0Hm5FasX26w@mail.gmail.com>
 <CANQCQpZgh5MVL98xyPtv6wArQ0J=BwybXFj0qOBKBf_8CpLH2Q@mail.gmail.com>
Message-ID: <CAKmqyKNfq6W5HfE3z_YE+g=rEUmpaBuFfiCbJdAh-=Ang3WAhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 18, 2018 at 10:09 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Alistair,
>
> On Thu, Jan 18, 2018 at 12:04 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Thu, Jan 18, 2018 at 8:42 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>>>
>>> Hi,
>>>
>>>  >> Hmm, it looks like the embedded qemu copy picks up sdl2, which it
>>>  >> probably shouldn't (or we should atleast handle the dependencies
>>>  >> correctly).
>>>  >>
>>>
>>>  > Should we by default force SDL to be turned on for xen tools,
>>>  > explicitly disable or make it optional?  I can see some additional
>>>  > patches to make their --disable-sdl work vs fixing the include paths
>>>  > to formally --enable-sdl.
>>>
>>> As long as it is optional, it shouldn't be forced on - So we should
>>> atleast explicitly disable it, but it would naturally be nicer to enable
>>> support if sdl2 is enabled.
>>
>> I dug into this a bit as well.
>>
>> A simple "--disable-sdl" in the QEMU config fixes the issue for 4.9.1
>> and 4.10.0 Xen release. As QEMU isn't used for Xen on ARM I think this
>> is a suitable fix.
>>
>
> I tested that with a build where the SDL2 headers were already
> installed and the disable didn't seem to work when I added it after
> the build had failed.  I'll try with a fresh build.

This diff fixes it for me:

commit 923f627733569952791edffb83eca0d587ff5f9c (HEAD -> alistair/xen-fixes)
Author: Alistair Francis <alistair.francis@xilinx.com>
Date:   Thu Jan 18 10:22:51 2018 -0800

    package/xen: Force disable SDL for xen-qemu build

    Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

diff --git a/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch
b/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch
new file mode 100644
index 0000000000..fbb096a96d
--- /dev/null
+++ b/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch
@@ -0,0 +1,25 @@
+From 2ee22ddc26d2153aece1793dc70e344ab051c4bc Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Thu, 18 Jan 2018 09:51:35 -0800
+Subject: [PATCH] tools/Makefile: Force disable SDL QEMU build
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index ab7a01ee1b..de8d44c035 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -274,6 +274,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
+               --datadir=$(SHAREDIR)/qemu-xen \
+               --localstatedir=$(localstatedir) \
+               --disable-kvm \
++              --disable-sdl \
+               --disable-docs \
+               --disable-guest-agent \
+               --python=$(PYTHON) \
+--
+2.14.1
+


Alistair

>
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
