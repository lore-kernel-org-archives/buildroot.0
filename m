From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 15 Sep 2012 20:18:41 -0400
Subject: [Buildroot] [PATCH 1/2] openssh: add linux-pam support
In-Reply-To: <87txv1osvz.fsf@macbook.be.48ers.dk>
References: <1344790876-27962-1-git-send-email-danomimanchego123@gmail.com>
 <87txv1osvz.fsf@macbook.be.48ers.dk>
Message-ID: <CANxTyt5oV3Dm6r04LY=yWizS0HoNURsOWB6T3YMi39r5qzBh7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> What configurations did you test this with? It seems to break here with
> the internal toolchain because pthread.h somehow gets included:

All my projects use codesourcery toolchains.  Sorry, I don't regularly use
any uclibc
toolchains.  However, I gave it a try, and reproduced the breakdown.  It
appears
that when PAM is enabled, openssh used a local static definition of the
common
pthread functions.  But when a uclibc toolchain is used, somehow pthreads.h
gets
included indirectly.  The exported and static definitions clash, causing
the error.

Googling around, it seems that both the openwrt and the oe people have hit
on this problem.  The oe people elected to simply force openssh to be
configured
with pam disabled when a uclibc toolchain is used.  The openwrt people, on
the other hand, changed all the pthead_*() calls to pthread2_*().  I think
a variant
of the second approach would be best - I added macros above each static
declaration
to map the static definitions (and the subsequent calls) to different,
unique names.

I will resubmit this change as a v2.

Thanks,
Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120915/993a0426/attachment.html>
