From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 14 Sep 2014 21:52:40 -0500
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140914121904.0c2ebcbd@free-electrons.com>
References: <20140914063013.2E5D2100F07@stock.ovh.net>
 <20140914121904.0c2ebcbd@free-electrons.com>
Message-ID: <CANQCQpYvy8dao3T_JLdcfdrAT7Vm6fDeA8=Bvk68a3OB1CU8dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Sep 14, 2014 at 5:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,

<snip>

>>         bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/fbe6c722b92fe4ddf7ac36a8fe1be3a3891c11fd/
>
> Weird thread related issue:
>
> /home/peko/autobuild/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include/pthread.h: In static member function ???static omni_thread* omni_thread::self()???:
> /home/peko/autobuild/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include/pthread.h:575: error: too many arguments to function ???void*
>

The code is attempting to handle multi-platform posix API support, but
doesn't have a good failure path to show when it can't detect the OS
(it uses the toolchain prefix).

Here's what's happening......
The assert in the posix.cc is becuase of the PthreadDraftVersion being
set to zero
src/lib/omnithread/posix.cc:602:#if (PthreadDraftVersion <= 6)

The PthreadDraftVersion  is set to zero because the OSVERSION is 0.
-D__OSVERSION__=0

The OSVERSION is 0 because of the configure failing to set the OS
based on the toolchain prefix being uclinux.


I don't have a hardware to adequately test a bfin build with omniorb
(with omni, it usually builds... but when you run it you see the
datatype or threading issues), so for now I'll prepare a patch that
limits omniorb builds to glibc only.

Based on the few discussions I found on the omni mailing list, uclibc
support is experimental and the omniorb codebase hasn't been updated
to support that target.

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber@corp.rockwellcollins.com.
