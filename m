From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 28 Dec 2017 19:04:03 +0100
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <87o9mkdlf1.fsf@paral.in>
References: <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de>
 <87po73d1xz.fsf@paral.in>
 <20171225151337.GC27558@waldemar-brodkorb.de>
 <87mv25cg5t.fsf@paral.in> <87shbxq99x.fsf@paral.in>
 <20171227030548.GE27558@waldemar-brodkorb.de>
 <87y3loenlr.fsf@paral.in>
 <20171227080520.GF27558@waldemar-brodkorb.de>
 <87o9mkdlf1.fsf@paral.in>
Message-ID: <20171228180402.GR27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,
Christian Stewart wrote,

> Sure. To make things less ambiguous, here is exactly what I did to produce
> these new results in this email:
> 
>  $ cd ~/Documents
>  $ git clone git://git.busybox.net/buildroot buildroot
>  $ cd buildroot && git checkout 2017.11
>  $ cp ~/Notes/buildroot-pam/defconfig ./defconfig
>  $ make defconfig BR2_DEFCONFIG=defconfig
>  $ make # build fails on systemd
>  $ rm -rf output/build/systemd*
>  $ make V=1 BR2_JOBS=1 &>systemd-fail.log
>  $ tar -cvf systemd-fail.tar.gz ./output/build/systemd*
> 
> > Can you do rm -rf output/build/systemd* && make V=1 &>log
> > And sent me the log and the systemd build directory for post-mortem
> > analysis.
> 
> Attached are defconfig and systemd-fail.log. The archive is too big, so
> I uploaded it to Google Drive, available here:
> 
> https://drive.google.com/a/aperturerobotics.com/file/d/1Sxq-5smjUFntRCe0o9zIYs6_--dxjjGA/view?usp=sharing
> 
> Thank you again for taking the time to debug this, I've had this issue
> early 2017 and have avoided upgrading Buildroot until we find a fix.

Sorry I believe you entered the world of libtool hell.

For the hardcore buildroot hackers, if you create a symlink in /lib
pointing to libpam.so / libpam_misc.so you can reproduce the issue.

By the way, I couldn't reproduce the issue with OpenADK.
Unfortunately I can't point to a specific patch. 
I always pass -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib in
LDFLAGS and I always remove any .la files from staging directory.

I do not patch the package provided ltmain.sh/libtool stuff like
Buildroot, but I always use libtool 2.4.6 with a small patch 
like this when autoreconfing a package:
+++ libtool-2.4.6/m4/libtool.m4
-  _LT_TAGVAR(hardcode_automatic, $1)=no
+  _LT_TAGVAR(hardcode_automatic, $1)=yes
 
So sorry, I can't help you out of the hell.

best regards
 Waldemar
