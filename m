From: Brendan Heading <brendanheading@gmail.com>
Date: Fri, 31 Jul 2015 17:03:13 +0100
Subject: [Buildroot] SPARC atomic fun (and libtirpc)
Message-ID: <CA+BsyQ5NnVF1a3vigL7UrCcCsDpsaKtcrE1ERCQ5W5ks+8cyOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, Thomas,

Back to the old atomic issue again. I've found that libtirpc uses
__sync_add_and_fetch without checking whether or not it is supported
in the architecture (it has done so since 2011). This in turn breaks 9
other packages on SPARCv8 - some of them important, especially
busybox, but also rpcbind, quota, xinetd, nfsutils and so on. In
addition there are other packages expecting the atomic intrinsics to
be present.

I think we need to look at the suggestion you made last week Thomas,
to add intelligence in configure.ac and push this to the upstream
packages. In the case of libtirpc I guess we should be able to detect
the absence of the intrinsics and, based on that, add -latomic to the
LDFLAGS which are exported by the pkgconfig .pc file.

I am happy enough to do this (it will probably be next week at this
stage), but I'm curious if there is much interest in trying to keep
SPARCv8 running. This package has been broken for 4 years and nobody
so far has noticed it. Are there people out there using buildroot with
this configuration; and if not should we talk about deprecating it ? I
 don't have hardware to try it on which means we need to be
extra-careful.

That said, even if we do deprecate SPARC we still need to have a fix
for those arches which definitely do not supply those functions.

regards

Brendan
