From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 14:37:21 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <249443164.1454061.1454678578498.JavaMail.zimbra@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <1851498233.1377552.1454670293384.JavaMail.zimbra@datacom.ind.br>
 <20160205140909.764ff2e6@free-electrons.com>
 <249443164.1454061.1454678578498.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160205143721.5f3fbd72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Please try to avoid top-posting, this is considered bad practice on
most mailing list)

On Fri, 5 Feb 2016 11:22:58 -0200 (BRST), Henrique Marks wrote:
> Yes, once the atomic series enter master branch, we are going to proceed on with this patch:
> 
> - Change protobuf, as you stated.
> - Change Dependent Packages, it is four or five last time i checked out.
> - Build on powerpc these packages, with gcc > 4.8

Sounds good.

There is only one gotcha/limitation introduced by the atomic series:
the fact that building protobuf with gcc 4.7 will not be allowed,
while in fact it seems to be possible.

On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
types are available built-in, without the need for libatomic. This
means that the __atomic_*() built-ins for those sizes are available in
gcc 4.7.

However, the __atomic_*() built-ins for 8-byte types is implemented via
libatomic, so only available since gcc 4.8.

In Buildroot, to simplify things, we've decided to simply require gcc
4.8 as soon as the architectures has at least one __atomic_*() built-in
variant that requires libatomic.

But in fact, protobuf most likely only uses the 1, 2 and 4-byte
variants, so it *could* technically build with gcc 4.7.

But oh, well, it's probably not a big deal, and we can live with
requiring gcc 4.8 on PowerPC to build protobuf. Is that OK for you?

If we want to do a more fine-grained selection, we would have to
introduce multiple BR2_TOOLCHAIN_HAS_ATOMIC_<x> options, like I've done
for the __sync_*() built-ins. It's possible, but a big annoying
especially since gcc 4.8 has everything needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
