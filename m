From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 19 Mar 2014 12:10:23 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: do not add the toolchain
 target to the TARGETS variable
In-Reply-To: <5326A778.7070507@mind.be>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
 <5326A778.7070507@mind.be>
Message-ID: <CAHkwnC8+MsDLUd5XMU1GDmfNBCVU0p9JTaUmpWiYReTrSsAnKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 17, 2014 at 8:42 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/11/14 13:17, Fabio Porcedda wrote:
>> Do not add the toolchain target to the TARGETS variable because now the
>> toolchain target is a dependency added automatically so it is not
>> necessary to add it anymore.
>
>  I disagree with this one. When you run make, you expect buildroot to
> build the toolchain even if no target package is selected. One use case I
> can think of: when preparing an internal toolchain for use as an external
> toolchain in later builds.

Take in account that the "toolchain" target is always built because is
a dependency of the "busybox" package that is always build and cannot
be disabled and
the "toolchain-buildroot" and "toolchain-external" are always enabled
in the Config.in.

I was thinking that the "toolchain" target is a package that uses tha
package infrastructure, what about using the Config.in:

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 44f3ac6..94a0c7d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -1,5 +1,9 @@
 menu "Toolchain"

+config BR2_TOOLCHAIN
+       bool
+       default y
+
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
        bool
diff --git a/Makefile b/Makefile
index 384693a..3df9144 100644
--- a/Makefile
+++ b/Makefile
@@ -299,7 +299,7 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 #
 ################################################################################

-TARGETS:= toolchain
+TARGETS :=

 # silent mode requested?
 QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)


I think this is more coherent to other always enabled packages like
busybox and toolchain-*.

Best regards
-- 
Fabio Porcedda
