From: Barry Bridges <barry@disignconsultants.com>
Date: Tue, 4 Jan 2011 08:40:33 -0000
Subject: [Buildroot] Patching python to 2.7
In-Reply-To: <mailman.3.1294056002.11239.buildroot@busybox.net>
References: <mailman.3.1294056002.11239.buildroot@busybox.net>
Message-ID: <002a01cbabeb$0d5b69b0$28123d10$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Could anyone tell me if they have been successful in patching python to 2.7
on buildroot.

Many thanks

 

Barry

 

From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of buildroot-request at busybox.net
Sent: 03 January 2011 12:00
To: buildroot at busybox.net
Subject: buildroot Digest, Vol 55, Issue 5

 

Send buildroot mailing list submissions to
        buildroot at busybox.net

To subscribe or unsubscribe via the World Wide Web, visit
        http://lists.busybox.net/mailman/listinfo/buildroot
or, via email, send a message with subject or body 'help' to
        buildroot-request at busybox.net

You can reach the person managing the list at
        buildroot-owner at busybox.net

When replying, please edit your Subject line so it is more specific
than "Re: Contents of buildroot digest..."


Today's Topics:

   1. [git commit master 1/1] toolchain/gcc: fix target-gcc     selects
      (Peter Korsgaard)
   2. Re: commiting patches (Thomas Petazzoni)
   3. Re: commiting patches (Peter Korsgaard)
   4. Re: building mysqlclient fails when using gcc 4.51 :
      do_abi_check needs perl ? (Thomas Petazzoni)
   5. Re: [PATCH 04/10] binutils: make it a proper package
      (Thomas Petazzoni)
   6. Re: [PATCH 04/10] binutils: make it a proper package
      (Gustavo Zacarias)


----------------------------------------------------------------------

Message: 1
Date: Mon, 3 Jan 2011 00:25:38 +0100
From: Peter Korsgaard <jacmet@sunsite.dk>
To: buildroot at busybox.net
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc: fix
        target-gcc      selects
Message-ID: <20110102232606.773598E203@busybox.osuosl.org>


commit:
http://git.buildroot.net/buildroot/commit/?id=6ca4e7ce970447fc5c6312e5f414b9
1b306b9f0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to select BR2_PACKAGE_BINUTILS as well, now
BINUTILS_TARGET depends on it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index 9676fdf..705506b 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GCC_TARGET
        bool "native toolchain in the target filesystem"
        depends on BR2_HAVE_DEVFILES
+       select BR2_PACKAGE_BINUTILS
        select BR2_PACKAGE_BINUTILS_TARGET
        select BR2_PACKAGE_MPC if BR2_GCC_VERSION_4_5_X
        select BR2_PACKAGE_MPFR
--
1.7.2.2



------------------------------

Message: 2
Date: Mon, 3 Jan 2011 09:08:53 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Peter Korsgaard <jacmet@uclibc.org>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] commiting patches
Message-ID: <20110103090853.5168f221@surf>
Content-Type: text/plain; charset=US-ASCII

Hello,

As this is my first message to the list in 2011: happy new year
everybody. Best wishes for 2011, and let's have some good BR
development during this year :-)

On Thu, 30 Dec 2010 21:54:51 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> I'm not following any strict procedure, but I do try to sooner or
> later get around to review all patches. Understand that I do this in
> my spare time, so turnaround time can sometimes be slow.
>
> I mainly try to handle the patches in fifo mode, but I do also skim
> new mails. This is both because sometimes updates are sent, and
> sometimes I see trivial patches that can be handled when I have 5 min
> spare or important bugfixes.

I think there is also one criteria that has an impact of the time it
takes for a patch to be applied: what the patch does. If the patch is a
relatively simple fix to a package, a new package, or something that
doesn't have any major impact of Buildroot's infrastructure, or
Buildroot usage, then this patch is likely to be handled/merged sooner
than something that has broader impact.

For example, Heiko, your patch "Improved initramfs and iso target
support" will take quite a bit of time, because it changes quite a few
things, adds new use cases, we have to think whether we want to handle
those use cases, if they are handled the correct way, etc. Such patches
usually take a bit more time to handle than others.

Regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


------------------------------

Message: 3
Date: Mon, 03 Jan 2011 09:32:50 +0100
From: Peter Korsgaard <jacmet@uclibc.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] commiting patches
Message-ID: <8762u6crpp.fsf@macbook.be.48ers.dk>
Content-Type: text/plain; charset=us-ascii

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
writes:

 Thomas> Hello,
 Thomas> As this is my first message to the list in 2011: happy new year
 Thomas> everybody. Best wishes for 2011, and let's have some good BR
 Thomas> development during this year :-)

Yeah!

 >> I mainly try to handle the patches in fifo mode, but I do also skim
 >> new mails. This is both because sometimes updates are sent, and
 >> sometimes I see trivial patches that can be handled when I have 5
 >> min spare or important bugfixes.

 Thomas> I think there is also one criteria that has an impact of the
 Thomas> time it takes for a patch to be applied: what the patch
 Thomas> does. If the patch is a relatively simple fix to a package, a
 Thomas> new package, or something that doesn't have any major impact of
 Thomas> Buildroot's infrastructure, or Buildroot usage, then this patch
 Thomas> is likely to be handled/merged sooner than something that has
 Thomas> broader impact.

Indeed, that's what I meant when I wrote about trivial patches.

--
Bye, Peter Korsgaard


------------------------------

Message: 4
Date: Mon, 3 Jan 2011 10:10:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: buildroot at busybox.net
Subject: Re: [Buildroot] building mysqlclient fails when using gcc
        4.51 : do_abi_check needs perl ?
Message-ID: <20110103101003.0c08d839@surf>
Content-Type: text/plain; charset=US-ASCII

Hello,

On Wed, 29 Dec 2010 20:52:31 +0100
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> This build seems to fail on do_abi_check when using GCC 451 (EABI or
> OABI selection in buildroot does not matter):
>
> I have no idea if this is a GCC 4.5 issue or something with mysql
> client or some other reason.
>
> Maybe do_abi_check needs perl (see the PATH below) but i do not have
> any perl stuff enabled in buildroot ?

The ABI check issue has been fixed in later versions of MySQL, and the
mysql_client package in Buildroot Git has been bumped to 5.1.53, which
does not have this problem.

See 24b27158cf103b15b3dd518bbb1b6301a3b0449d

Regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


------------------------------

Message: 5
Date: Mon, 3 Jan 2011 10:14:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH 04/10] binutils: make it a proper
        package
Message-ID: <20110103101458.61270f4a@surf>
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Dec 2010 17:41:58 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> >  Gustavo>  $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
> >  Gustavo>   mkdir -p $(GCC_BUILD_DIR2)
> >  Gustavo> - -rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
> >  Gustavo> - mkdir -p $(STAGING_DIR)/lib
> >  Gustavo> - ln -snf ../../lib
$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
> >  Gustavo> - $(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
> >  Gustavo> - $(if $(BR2_ARCH_IS_64),ln -snf ../../lib64
$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
> >
> > Why remove this ARCH_IS_64 stuff?
>
> This is from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb which does
> a symlink trick to make libstdc++ available. It's simpler to just copy
> libstdc++ (and libgcj/libgcc while at it) to the sysroot which is fixed
> in patch #5 from my series.

I am not sure about this justification, since I don't see what change
in the toolchain build procedure removes the need for this symbolic
link. Have you actually tested building WebKit on x86_64 for example ?

Thanks,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


------------------------------

Message: 6
Date: Mon, 03 Jan 2011 07:13:03 -0300
From: Gustavo Zacarias <gustavo@zacarias.com.ar>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH 04/10] binutils: make it a proper
        package
Message-ID: <4D21A12F.9010201@zacarias.com.ar>
Content-Type: text/plain; charset=ISO-8859-1

On 01/03/2011 06:14 AM, Thomas Petazzoni wrote:

>>> Why remove this ARCH_IS_64 stuff?
>>
>> This is from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb which does
>> a symlink trick to make libstdc++ available. It's simpler to just copy
>> libstdc++ (and libgcj/libgcc while at it) to the sysroot which is fixed
>> in patch #5 from my series.
>
> I am not sure about this justification, since I don't see what change
> in the toolchain build procedure removes the need for this symbolic
> link. Have you actually tested building WebKit on x86_64 for example ?
>
> Thanks,
>
> Thomas

Yes, tested on an x86_64 host building an x86_64 target (full midori).
First test was removing all the symlink stuff which in fact broke
webkit, then i added my lib* in staging patch. Everything was built from
scratch.
To throw in some extra testing i did the same with an arm target for
both runs with the same result.


------------------------------

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 55, Issue 5
**************************************** 

  _____  

No virus found in this message.
Checked by AVG - www.avg.com
Version: 10.0.1191 / Virus Database: 1435/3356 - Release Date: 01/03/11

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110104/7bdf0e18/attachment-0001.html>
